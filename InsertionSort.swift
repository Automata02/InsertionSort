import Foundation

class Sorting {
    var array: [Int] = []
    var times: [Double] = []
    var count: Int

    init(count: Int) {
        self.count = count
    }

    func generateRandomArray() -> [Int] {
        var array = [Int]()
        for _ in 0..<count {
            let randomNum = Int.random(in: 0...count)
            array.append(randomNum)
        }
        return array
    }

    func insertionSort(_ array: [Int]) -> [Int] {
        var arr = array
        for x in 1..<arr.count {
            var y = x
            let temp = arr[y]
            while y > 0 && temp < arr[y - 1] {
                arr[y] = arr[y - 1]
                y -= 1
            }
            arr[y] = temp
        }
        return arr
    }

    func timedSort() -> Double {
        self.array = generateRandomArray()

        let start = DispatchTime.now()
        _ = insertionSort(self.array)
        let end = DispatchTime.now()

        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000

        return timeInterval
    }

    func runTests() {
        for _ in 0..<10 {
            let timeInterval = timedSort()
            times.append(timeInterval)
            print("Time to sort array: \(timeInterval) seconds")
        }

        let sum = times.reduce(0, +)
        let average = sum / Double(times.count)
        print("Average time to sort array with \(count) Elements: \(average) seconds")
    }
}


/*
 let testingWith100Elements = UnitTest(count: 100)
 testingWith100Elements.runTests()
 
Prints to console:
 Time to sort array: 0.00094881 seconds
 Time to sort array: 0.000829145 seconds
 Time to sort array: 0.000846065 seconds
 Time to sort array: 0.000731513 seconds
 Time to sort array: 0.000690834 seconds
 Time to sort array: 0.000752676 seconds
 Time to sort array: 0.000727487 seconds
 Time to sort array: 0.000751963 seconds
 Time to sort array: 0.00072596 seconds
 Time to sort array: 0.000698107 seconds
 Average time to sort array with 300 Elements: 0.000770256 seconds
 */

func startTesting() {
    let testingWithElements = Sorting(count: 300)
    testingWithElements.runTests()
}
