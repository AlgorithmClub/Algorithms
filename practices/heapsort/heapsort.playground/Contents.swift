import Foundation
/**
 Heap sort
 
 平均时间复杂度: O(nlogn)
 
 最佳时间复杂度: O(nlogn)
 
 最差时间复杂度: O(nlogn)
 
 空间复杂度: O(1)
 
 排序方式: In-Place
 
 稳定度: 不稳定
 
**/

// TODO: 1. 输入可以泛型化； 2.sort方式(从小到大、从大到小)可以参数化。
struct Heap {
    
    var elements: [Int] = []
    
    init(elements: [Int] = []) {
        self.elements = elements
        
        if elements.isEmpty {
            return
        }
        // 下沉操作实际上是根据了index同时操作了左右节点，只需要长度的一半操作即可。
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            print("first build heap times:\(i)")
            sink(i, upTo: elements.count)
            print("first build heap: \(elements)")
        }
    }
    
    // 1.树形关系描述
    func leftNodeIndex(ofParentAt index: Int) -> Int {
        return (index * 2) + 1
    }
    
    func rightNodeIndex(ofParentAt index: Int) -> Int {
        return (index * 2) + 2
    }
    
    // 2.下沉操作
    mutating func sink(_ index: Int, upTo size: Int) {
        var parentIndex = index
        while true {
            let leftIndex = leftNodeIndex(ofParentAt: parentIndex)
            let rightIndex = rightNodeIndex(ofParentAt: parentIndex)
            var candidateIndex = parentIndex
            if leftIndex < size && rightIndex < size {
                print("leftIndex:\(leftIndex), rightIndex:\(rightIndex), parentIndex: \(parentIndex)")
                print("leftNodeValue:\(elements[leftIndex]), rightNodeValue:\(elements[rightIndex]), parentNodeValue:\(elements[candidateIndex])")
            }
        
            if leftIndex < size && elements[leftIndex] > elements[candidateIndex] {
               candidateIndex = leftIndex
            }
            
            if rightIndex < size && elements[rightIndex] > elements[candidateIndex] {
                candidateIndex = rightIndex
            }
            
            if candidateIndex == parentIndex {
                return
            }
            elements.swapAt(parentIndex, candidateIndex)
            print("elements's value: \(elements)")
            parentIndex = candidateIndex
        }
    }
}

extension Heap {
    
    func sorted() -> [Int] {
        for index in self.elements.indices.reversed() {
            // 1.交换根节点和最后一个叶节点
            heap.elements.swapAt(0, index)
            // 2.下沉将堆顶元素取出放在数组最后
            heap.sink(0, upTo: index)
        }
        return heap.elements
    }
}

var heap = Heap(elements: [16, 14, 10, 8, 7, 9, 3, 2, 4, 1])
print(heap.sorted())
