/*
 Maximum Subarray
 ================
 https://leetcode.com/problems/maximum-subarray/

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example 1:
 ----------
 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.

 Example 2:
 ----------
 Input: nums = [1]
 Output: 1

 Example 3:
 ----------
 Input: nums = [5,4,-1,7,8]
 Output: 23

 Constraints:
 ------------
 1 ≤ nums.length ≤ 3 * 10^4
 -10^5 ≤ nums[i] ≤ 10^5

 Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

 NOTES
 =====
 Solution 2 (Linear Approach)
 ----------------------------
 The algorithm uses Kadane's algorithm.

 formula: max(curr,prevMax + curr)

 - set maxSum as first element
 - set prevMax as first element
 - start from the 2nd position of the array and loop the following until the end:
    - find the current max (assigned as prevMax to reduce space): prevMax = max(curr,prevMax + curr)
    - if the current max > maxSum, then update the maxSum as the new max
 - return maxSum

 Time complexity: O(n)
 Space complexity: O(1)

 EXAMPLE
 -------
 IN:  [5,4,-1,7,8]

 max: [5]
 max: [5,9]
 max: [5,9,8]
 max: [5,9,8,15]
 max: [5,9,8,15,23]

 maxSum = 23

*/

/**
 Returns the largest sum from a contiguous subarray.
 - Parameter nums: an array of numbers
 - Complexity: This algorithm provides an efficient O(n) time complexity and O(1) space complexity.

*/
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums.first! }
    if nums.isEmpty { return 0 }
    var maxSum = nums[0]
    var prevMax = maxSum

    for i in 1 ..< nums.count {
        prevMax = max(nums[i],prevMax+nums[i])
        if prevMax > maxSum { maxSum = prevMax }
    }

    return maxSum
}

// TEST CASES
let ex1 = [-2,1,-3,4,-1,2,1,-5,4]
print(maxSubArray(ex1))

let ex2 = [1]
print(maxSubArray(ex2))

let ex3 = [5,4,-1,7,8]
print(maxSubArray(ex3))

print(maxSubArray([]))
