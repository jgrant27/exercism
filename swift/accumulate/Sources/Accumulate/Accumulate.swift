extension Array  {
    func accumulate<T>(_ af: (Element) -> T) -> [T] { return map(af) }
}
