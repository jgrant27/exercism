//Solution goes in Sources

struct ListOps {

    static func append<T>(_ a: [T], _ b: [T]) -> [T] {
        var c = [T]()
        a.forEach { c.append($0) }
        b.forEach { c.append($0) }
        return c
    }

    static func concat<T>(_ a: [T]...) -> [T] {
        var c = [T]()
        a.forEach { $0.forEach { c.append($0) } }
        return c
    }

    static func map<T>(_ a: [T], f: ((_ b: T) -> T)) -> [T] {
        var c = [T]()
        a.forEach { c.append(f($0)) }
        return c
    }

    static func filter<T>(_ a: [T], f: (T) -> Bool) -> [T] {
        var c = [T]()
        a.forEach { if f($0) { c.append($0) } }
        return c
    }

    static func foldLeft<T>(_ a: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var c  = accumulated
        a.forEach { c = combine(c, $0) }
        return c
    }

    static func foldRight<T>(_ a: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var c  = accumulated
        a.reversed().forEach { c = combine($0, c) }
        return c
    }

    static func reverse<T>(_ a: [T]) -> [T] {
        var c = [T]()
        a.forEach { c.insert($0, at: 0) }
        return c
    }

    static func length<T>(_ a: [T]) -> Int {
        var cnt = 0
        a.forEach { _ in cnt += 1 }
        return cnt
    }

}
