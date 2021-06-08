/*
 Next Permutation
 ================
 https://leetcode.com/problems/next-permutation/

 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).
 The replacement must be in place and use only constant extra memory.

 Example 1:
 Input: nums = [1,2,3]
 Output: [1,3,2]

 Example 2:
 Input: nums = [3,2,1]
 Output: [1,2,3]

 Example 3:
 Input: nums = [1,1,5]
 Output: [1,5,1]

 Example 4:
 Input: nums = [1]
 Output: [1]

 NOTES
 =====
 INPUT: [1,2,3]
 NEXT PERMUTATION: [1,3,2]
 PERMUTATIONS: [1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], [3,2,1]
 NUMBER OF PERMUTATIONS: 3! = 6

 Solution 1 (Naive Approach)
 ---------------------------
 Generate a list of all permutations for input and find the next.

 Time complexity: O(n!)
 Space complexity: O(n)

 Solution 2 (Linear Approach)
 ----------------------------
 1. To find the next permutation iterate from right to left of the array to find the longest decreasing suffix.
 2. Find smallest element in the suffix (i.e position l) that is greater than the LSB of the prefix k
 3. Swap k and l
 4. Reverse the suffix to find the smallest permutation of the suffix

 (Note: as the suffix was in descending order it became the last permutation and therefore reversing returned it to the first permutation)

 Time complexity: O(n)
 Space complexity: O(1)

 EXAMPLE
 =======

 INPUT: [6,2,1,5,4,3,0]
 Find the longest decreasing suffix...
 From right to left of the suffix find the 1st value l, larger than k...

         k        l
 [ 6, 2, 1, 5, 4, 3, 0 ]
  |--------|---------|
    prefix    suffix

                  *     *
 SWAP k & l: [6,2,3,5,4,1,0]

                        + + + +
 REVERSE SUFFIX: [6,2,3,0,1,4,5]

 ANSWER: [6,2,3,0,1,4,5]
*/

/**
 Modifies an array of numbers to the next permutation.
 - Parameter nums: an array of numbers that represent a permutation
 - Complexity: This algorithm provides an efficient O(n) time complexity and O(1) space complexity
*/
func nextPermutation(_ nums: inout [Int]) {
    if nums.count == 1 { return }
    let length = nums.count - 1

    // set the longest decreasing suffix (lds) as the last index
    var lds = length

    // find the lds
    for i in (1...length).reversed() {
        if nums[i-1] < nums[lds] { break }
        lds -= 1
    }

    // swap the LSB of the prefix (k) with the LSB of the suffix (l) where l > k
    // if the lds is the first index, theres no need to swap
    if lds > 0 {
        for j in (lds...length).reversed() {
            if nums[j] > nums[lds-1] {
                nums.swapAt(lds-1, j)
                break
            }
        }
    }

    // no need to reverse the suffix if it is of length 1
    if lds == length { return }

    // reverse suffix
    var right = length
    for left in lds...length {
        if left > right { break }
        nums.swapAt(left, right)
        right -= 1
    }
}

// TEST CASES
var array = [6,2,1,5,4,3,0]
nextPermutation(&array)
print("array: \(array)")

var ex1 = [1,2,3]
nextPermutation(&ex1)
print("ex1: \(ex1)")

var ex2 = [3,2,1]
nextPermutation(&ex2)
print("ex2: \(ex2)")

var ex3 = [1,1,5]
nextPermutation(&ex3)
print("ex3: \(ex3)")

var ex4 = [1]
nextPermutation(&ex4)
print("ex4: \(ex4)")
