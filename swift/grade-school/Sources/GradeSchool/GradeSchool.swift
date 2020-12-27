struct GradeSchool {
    var roster: [Int: [String]] = [:]
    var sortedRoster: [Int: [String]] {
        roster.mapValues { $0.sorted() }
    }

    mutating func addStudent(_ name: String, grade: Int) {
        roster[grade, default: []].append(name)
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return self.roster[grade] ?? []
    }
}
