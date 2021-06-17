/*
 Two Sum
 =======
 https://leetcode.com/problems/two-sum/

 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

 Example 1:
 ----------

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].

 Example 2:
 ----------

 Input: nums = [3,2,4], target = 6
 Output: [1,2]

 Example 3:
 ----------

 Input: nums = [3,3], target = 6
 Output: [0,1]


 Constraints:
 2 <= nums.length <= 10^4
 -10^9 <= nums[i] <= 10^9
 -10^9 <= target <= 10^9
 Only one valid answer exists.


 Follow-up: Can you come up with an algorithm that is less than O(n^2) time complexity?
 */

/**
 Returns the indices corresponding to the sum of the `target` that is found within `nums`.

 The algorithm iterates through the `nums` array, adding the difference between the target and value at position `n` to a dictionary.
 Thereafter, if the current difference of said iteration is found within the dictionary, then we have found the sum and return the indices stored within the dictionary.

 - Parameters:
    - nums: a collection of integer values
    - target: the target sum to look for
 - returns: an array of indices that correspond to the target sum
 - Complexity: This algorithm take O(n) time complexity and O(n) space complexity.
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict: [Int:Int] = [:]
    var currIndex = 0
    for value in nums {
        // get the difference from the target and previous item
        let diff = target - value
        // if item exists in dictionary, then we have a sum
        if let matchIndex = dict[value] {
            // return corresponding indices
            let result = [matchIndex,currIndex]
            return result
        }
        // if it is a new element, add to dictionary
        dict[diff] = currIndex
        // increment current index position
        currIndex += 1
    }
    return []
}

// Test Cases
var nums = [2,7,11,15], target = 9
print(twoSum(nums,target))

nums = [3,2,4]; target = 6
print(twoSum(nums, target))

nums = [3,3]; target = 6
print(twoSum(nums, target))
