#[derive(Debug, Default)]
pub struct BowlingGame {
    frames: Vec<Frame>,
    half_frame: Option<u16>,
}

impl BowlingGame {
    const MAX_FRAMES: usize = 10;

    pub fn new() -> Self {
        Self::default()
    }

    pub fn roll(&mut self, pins: u16) -> Result<(), Error> {
        if self.frames.len() > BowlingGame::MAX_FRAMES - 1
            && self.rolls_iter(BowlingGame::MAX_FRAMES).count()
                >= self.frames[BowlingGame::MAX_FRAMES - 1].extra_rolls()
        {
            return Err(Error::GameComplete);
        }

        use std::cmp::Ordering;
        match self.half_frame {
            None => match pins.cmp(&Frame::PINS) {
                Ordering::Greater => return Err(Error::NotEnoughPinsLeft),
                Ordering::Equal => self.frames.push(Frame::Strike),
                Ordering::Less => self.half_frame = Some(pins),
            },
            Some(prev_pins) => {
                self.half_frame = None;
                match (prev_pins + pins).cmp(&Frame::PINS) {
                    Ordering::Greater => return Err(Error::NotEnoughPinsLeft),
                    Ordering::Equal => self.frames.push(Frame::Spare(prev_pins, pins)),
                    Ordering::Less => self.frames.push(Frame::Open(prev_pins, pins)),
                }
            }
        }
        Ok(())
    }

    fn rolls_iter<'a>(&'a self, frame: usize) -> impl Iterator<Item = u16> + 'a {
        self.frames[frame..]
            .iter()
            .flat_map(|&frame| match frame {
                Frame::Spare(a, b) => vec![a, b],
                Frame::Strike => vec![Frame::PINS],
                Frame::Open(a, b) => vec![a, b],
            })
            .chain(self.half_frame.into_iter())
    }

    pub fn score(&self) -> Option<u16> {
        if self.frames.len() < BowlingGame::MAX_FRAMES
            || self.rolls_iter(BowlingGame::MAX_FRAMES).count()
                != self.frames[BowlingGame::MAX_FRAMES - 1].extra_rolls()
        {
            return None;
        }
        Some(
            self.frames[..BowlingGame::MAX_FRAMES]
                .iter()
                .enumerate()
                .flat_map(|(frame_number, frame)| {
                    self.rolls_iter(frame_number + 1)
                        .take(frame.extra_rolls())
                        .chain(std::iter::once(frame.base_points()))
                })
                .sum(),
        )
    }
}

#[derive(Debug, PartialEq)]
pub enum Error {
    NotEnoughPinsLeft,
    GameComplete,
}

#[derive(Debug, PartialEq, Clone, Copy)]
enum Frame {
    Strike,
    Spare(u16, u16),
    Open(u16, u16),
}

impl Frame {
    const PINS: u16 = 10;

    fn extra_rolls(self) -> usize {
        match self {
            Frame::Strike => 2,
            Frame::Spare(_, _) => 1,
            Frame::Open(_, _) => 0,
        }
    }
    fn base_points(self) -> u16 {
        match self {
            Frame::Strike => Frame::PINS,
            Frame::Spare(_, _) => Frame::PINS,
            Frame::Open(a, b) => a + b,
        }
    }
}
