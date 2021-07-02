/*
 Climbing Stairs
 ===============
 https://leetcode.com/problems/climbing-stairs/

 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Example 1:
 ----------
 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps

 Example 2:
 ----------
 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step

 Constraints:
 1 ≤ n ≤ 45

 */

/*
 Recursive Naive Solution
 ========================
 This algorithm finds the return by calculating the two previous sub-problems.

 - Complexity: O(2^n) time and space complexity.
 */
func climbStairsRecursive(_ n: Int) -> Int {
    if n < 0 { return 0 }
    else if n == 0 { return 1 }
    return climbStairsRecursive(n-1) + climbStairsRecursive(n-2)
}

/*
 Recursive Memoization Solution
 ==============================
 A more optimum solution to the naive approach using memoization.
 Results are formed by finding the sum of the two previous sub-problems which are cached into a dictionary to prevent repeated computation.

 - Complexity: The time and space complexity of this algorithm is O(n).
 */
func climbStairsRecursiveMemo(_ n: Int, _ memo: inout [Int:Int]) -> Int {
    if n < 0 {
        if memo[-1] == nil { memo[-1] = 0 }
        return 0
    }
    else if n == 0 {
        if memo[0] == nil { memo[0] = 1 }
        return 1
    }

    if let m = memo[n] { return m }

    memo[n] = climbStairsRecursiveMemo(n-1, &memo) + climbStairsRecursiveMemo(n-2, &memo)
    return memo[n]!
}

func climbStairsMemo(_ n: Int) -> Int {
    var memo = [Int:Int]()
    return climbStairsRecursiveMemo(n, &memo)
}

/*
 Iterative Bottom Up Solution
 ============================
 This algorithm improves the space complexity of the recursive memoization algorithm by using an iterative bottom up approach and local variables rather than caching the results.
 - Complexity: O(n) time complexity and O(1) space complexity.
 */
func climbStairsBottomUp(_ n: Int) -> Int {
    if n < 1 { return 0 }
    else if n == 1 { return 1 }

    var prev = 1
    var prevprev = 1
    var curr = prev + prevprev

    if n == 2 { return curr }

    for _ in 3...n {
        prevprev = prev
        prev = curr
        curr = prev + prevprev
    }
    return curr
}

// Test Cases
print("RECURSIVE APPROACH")
print(climbStairsRecursive(-2))
print(climbStairsRecursive(1))
print(climbStairsRecursive(2))
print(climbStairsRecursive(3))
print(climbStairsRecursive(6))

print("MEMOIZATION APPROACH")
print(climbStairsMemo(-2))
print(climbStairsMemo(1))
print(climbStairsMemo(2))
print(climbStairsMemo(3))
print(climbStairsMemo(6))

print("BOTTOM UP APPROACH:")
print(climbStairsBottomUp(-2))
print(climbStairsBottomUp(1))
print(climbStairsBottomUp(2))
print(climbStairsBottomUp(3))
print(climbStairsBottomUp(6))
