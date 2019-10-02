import Foundation

// Sunni's BinarySearch
func sunniBinarySearch<T: Comparable>(arr: [T], target: T, range: Range<Int>? = nil, numberOfOperations: Int = 1) -> Bool {
    
    let searchRange: Range<Int>
    if let range = range {
        searchRange = range
    } else {
        searchRange = (0..<arr.endIndex)
    }
    
    // Base Case
    if searchRange.lowerBound >= searchRange.upperBound {
        print("Binary search")
        print("Didn't find \(target) in \(numberOfOperations) operations")
        return false
    }
    
    // Recursive Call
    let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
    
    if target == arr[middleIndex] {
        print("Binary search:")
        print("Found \(target) in \(numberOfOperations) operations")
        return true
    } else if target < arr[middleIndex] {
        return sunniBinarySearch(arr: arr, target: target, range: searchRange.lowerBound..<middleIndex, numberOfOperations: numberOfOperations + 1)
    } else {
        return sunniBinarySearch(arr: arr, target: target, range: (middleIndex + 1)..<searchRange.upperBound, numberOfOperations: numberOfOperations + 1)
    }
}

// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.

func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    var lowerBound = 0
    var upperBound = arr.count - 1
    
    while lowerBound <= upperBound {
        let middleIndex = (lowerBound + upperBound) / 2
        
        if target == arr[middleIndex] {
            return true
        } else if arr[middleIndex] > target {
            upperBound = middleIndex - 1
        } else {
            lowerBound = middleIndex + 1
        }
    }
    return false
}

// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.

func recursiveBinarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    
    var newArr = arr
    
    let middleIndex = (newArr.endIndex - 1) / 2
    
    while newArr.count >= 2 {
        
        if target == arr[middleIndex] {
            return true
        } else if target < arr[middleIndex] {
            newArr = Array(arr[0..<middleIndex])
            return recursiveBinarySearch(arr: newArr, target: target)
        } else {
            newArr = Array(arr[middleIndex..<arr.endIndex])
            return recursiveBinarySearch(arr: newArr, target: target)
        }
    }
    return false
}

// https://www.interviewbit.com/problems/matrix-search/

// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:

// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.

func contains(value: Int, in arr: [[Int]]) -> Bool {
    var minRowIndex = 0
    var maxRowIndex = arr.count - 1
    
    while minRowIndex < maxRowIndex {
        let middleRowIndex = (minRowIndex + maxRowIndex) / 2
        
        if arr[middleRowIndex][0] == value {
            return true
        } else if arr[middleRowIndex][0] > value {
            maxRowIndex = middleRowIndex - 1
        } else if arr[minRowIndex][0] < value {
            minRowIndex = middleRowIndex + 1
        }
    }
    
    let targetArr = arr[minRowIndex] //minRowIndex should be same as maxRowIndex after while loop
    
    return sunniBinarySearch(arr: targetArr, target: value)
}



// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time

func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
    var index: Int?
    
    if arr.count == 0 {
        return nil
    }
    
    var lowerBound = 0
    var upperBound = arr.count - 1
    
    while lowerBound <= upperBound {
        let middleIndex = (lowerBound + upperBound) / 2
        
        if arr[middleIndex] == value {
            index = middleIndex
            lowerBound = middleIndex + 1
        } else if arr[middleIndex] > value {
            upperBound = middleIndex - 1
        } else {
            lowerBound = middleIndex + 1
        }
    }
    return index
}

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time

func smallestMissingNumber(in arr: [Int]) -> Int {
    return -1
}
