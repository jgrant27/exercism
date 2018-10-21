import Foundation

struct Gigasecond {

    let description: String

    init?(from: String) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(secondsFromGMT: 0)
        if var date = df.date(from: from) {
            date.addTimeInterval(pow(10.0,9.0))
            self.description = df.string(from: date)
        } else {
            return nil
        }
    }

}
