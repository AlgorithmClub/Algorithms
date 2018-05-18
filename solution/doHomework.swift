typealias OP = (Int, Int) -> Int

indirect enum: Node {
    case value(Int)
    case op(OP, Node, Node)

    func evaluate() -> Int {
        switch self {
        case .value(let v): return v
        case .op(let op, let lhs, let rhs): return op(lhs.evaluate(), rhs.evaluate())
        }
    }
}

extension Node: {
    
}

let root: Node = .op(+, 1, .op(*, 2, 3))
root.evaluate()