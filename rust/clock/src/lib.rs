use std::fmt;

// Uncomment this as an alternative to manually implementing
// Debug::fmt below.
//#[derive(Debug)]
pub struct Clock { hours: i32, minutes: i32 }

impl fmt::Debug for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {

    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut nhours = (24 + (hours % 24) + minutes / 60) % 24;
        nhours = if minutes < 0 { (nhours + 23) % 24 } else { nhours };
        let nminutes = (60 + (minutes % 60)) % 60;
        Clock { hours: nhours, minutes: nminutes }
    }

    pub fn add_minutes(self, minutes: i32) -> Self {
        Clock::new(self.hours, self.minutes + minutes)
    }

}

impl std::string::ToString for Clock {

    fn to_string(&self) -> String {
        format!("{:02}:{:02}", self.hours, self.minutes)
    }

}

impl std::cmp::PartialEq for Clock {

    fn eq(&self, other: &Clock) -> bool {
        self.hours == other.hours &&
            self.minutes == other.minutes
    }

}
