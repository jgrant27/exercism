struct GradeSchool {
    private var _roster: Dictionary<Int, Array<String>> = [:]
    var roster: Dictionary<Int, Array<String>> {
        return _roster
    }
    private var _sortedRoster: Dictionary<Int, Array<String>> = [:]
    var sortedRoster: Dictionary<Int, Array<String>> {
        return _sortedRoster
    }

    mutating func addStudent(_ name: String, grade: Int) {
        if _roster.keys.contains(grade) {
            _roster[grade]?.append(name)
        } else {
            _roster[grade] = [name]
        }
        for key in roster.keys {
            _sortedRoster[key] = roster[key]?.sorted()
        }
    }

    func studentsInGrade(_ grade: Int) -> Array<String> {
        return _roster[grade] ?? []
    }
}
