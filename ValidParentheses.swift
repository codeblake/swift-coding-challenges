/*
 Valid Parentheses
 =================
 https://leetcode.com/problems/valid-parentheses/

 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:
 1. Open brackets must be closed by the same type of brackets.
 2. Open brackets must be closed in the correct order.

 Example 1:
 ----------
 Input: s = "()"
 Output: true

 Example 2:
 ----------
 Input: s = "()[]{}"
 Output: true

 Example 3:
 ----------
 Input: s = "(]"
 Output: false

 Example 4:
 ----------
 Input: s = "([)]"
 Output: false

 Example 5:
 ----------
 Input: s = "{[]}"
 Output: true

 Constraints:
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.

 */

/**
 Check a string to see if it contains a collection of valid parentheses.

 The algorithm iterates through each parentheses in the string and if it is an opening bracket, then append its matching bracket to the stack. If the currently checking parentheses is a closing bracket, peek the stack for a matching closing bracket. If a match does not exists, then the string is invalid, otherwise pop the bracket from stack and continue.

 - Parameters
 - s: the string to check for valid parentheses
 - returns: a Boolean to indicate if the string is valid
 - Complexity: O(n) time complexity and O(n) space complexity
 */
func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    for c in s {
        switch c {
        case "{": stack.append("}")
        case "[": stack.append("]")
        case "(": stack.append(")")
        default:
            if c == stack.last {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    if !stack.isEmpty { return false }
    return true
}

// Test Cases

let ex1 = "()"
print(isValid(ex1))

let ex2 = "()[]{}"
print(isValid(ex2))

let ex3 = "(]"
print(isValid(ex3))

let ex4 = "([)]"
print(isValid(ex4))

let ex5 = "{[]}"
print(isValid(ex5))
