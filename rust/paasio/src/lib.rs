use std::io::{Read, Result, Write};

pub struct ReadStats<R>{
    wrapped: R,
    byte_count: usize,
    read_count: usize,
}

impl<R: Read> ReadStats<R> {
    pub fn new(wrapped: R) -> ReadStats<R> {
        ReadStats{
            wrapped: wrapped,
            byte_count: 0,
            read_count: 0,
        }
    }

    pub fn get_ref(&self) -> &R {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.byte_count
    }

    pub fn reads(&self) -> usize {
        self.read_count
    }
}

impl<R: Read> Read for ReadStats<R> {
    fn read(&mut self, buf: &mut [u8]) -> Result<usize> {
        self.wrapped.read(buf).map(|size| {
            self.byte_count += size;
            self.read_count += 1;
            size
        })
    }
}

pub struct WriteStats<R>{
    wrapped: R,
    byte_count: usize,
    read_count: usize,
}

impl<W: Write> WriteStats<W> {
    // _wrapped is ignored because W is not bounded on Debug or Display and therefore
    // can't be passed through format!(). For actual implementation you will likely
    // wish to remove the leading underscore so the variable is not ignored.
    pub fn new(wrapped: W) -> WriteStats<W> {
        WriteStats{
            wrapped: wrapped,
            byte_count: 0,
            read_count: 0,
        }
    }

    pub fn get_ref(&self) -> &W {
        &self.wrapped
    }

    pub fn bytes_through(&self) -> usize {
        self.byte_count
    }

    pub fn writes(&self) -> usize {
        self.read_count
    }
}

impl<W: Write> Write for WriteStats<W> {
    fn write(&mut self, buf: &[u8]) -> Result<usize> {
        self.wrapped.write(buf).map(|size| {
            self.byte_count += size;
            self.read_count += 1;
            size
        })
    }

    fn flush(&mut self) -> Result<()> {
        Ok(())
    }
}
