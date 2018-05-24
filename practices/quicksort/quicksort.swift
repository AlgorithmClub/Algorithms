// QuickSort
// Author: Doliant

// QuickSort
// Author: Doliant

func quicksort<T: Comparable> (_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    // used high-order function
    let leftArray = a.filter { $0 < pivot }
    let rightArray = a.filter { $0 > pivot }
    var resultArray = [T]()
    resultArray.append(contentsOf: quicksort(leftArray))
    resultArray.append(pivot)
    resultArray.append(contentsOf: quicksort(rightArray))
    return resultArray
}

