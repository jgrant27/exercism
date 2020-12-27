import Foundation

struct Gigasecond {

    let description: String
    let df = DateFormatter()

    init?(from: String) {
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(secondsFromGMT: 0)
        guard var date = df.date(from: from) else {
            exit(0)
        }
        date.addTimeInterval(pow(10.0,9.0))
        self.description = df.string(from: date)
    }

}
