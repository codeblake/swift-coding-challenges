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
