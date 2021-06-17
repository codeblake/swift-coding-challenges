/*
 Implement Queue using Stacks
 ============================
 https://leetcode.com/problems/implement-queue-using-stacks/

 Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (push, peek, pop, and empty).

 Implement the MyQueue class:

 void push(int x) Pushes element x to the back of the queue.
 int pop() Removes the element from the front of the queue and returns it.
 int peek() Returns the element at the front of the queue.
 boolean empty() Returns true if the queue is empty, false otherwise.

 Notes:
 ------
 You must use only standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
 Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.

 Follow-up: Can you implement the queue such that each operation is amortized O(1) time complexity? In other words, performing n operations will take overall O(n) time even if one of those operations may take longer.


 Example 1:
 ----------
 INPUT:
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]

 OUTPUT:
 [null, null, null, 1, 1, false]

 Explanation
 -----------
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false

 Constraints:
 - 1 ≤ x ≤ 9
 - At most 100 calls will be made to push, pop, peek, and empty.
 - All the calls to pop and peek are valid.

 */

// ===========
// ALGORITHM 1
// ===========

/**
 Queue implementation using Stacks.
 - Complexity:
 - `push`: O(n)
 - `pop`: O(1)
 - `peek`: O(1)
 - `empty`: O(1)
 */
class MyQueue {
    var a: [Int]
    var b: [Int]

    /** Initialize your data structure here. */
    init() {
        a = []
        b = []
    }

    // AKA Enqueue
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        if !b.isEmpty {
            for _ in b {
                a.append(b.popLast()!)
            }
        }
        a.append(x)
        for _ in a {
            b.append(a.popLast()!)
        }
    }

    // AKA Dequeue
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return b.popLast() ?? -1
    }

    /** Get the front element. */
    func peek() -> Int {
        return b.last ?? -1
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        b.count == 0
    }
}

// ===========
// ALGORITHM 2
// ===========

/**
 Queue implementation using stacks.

 This algorithm optimises the fact that there is a second stack and uses the second stack to `pop` (i.e. dequeue) in most cases. It only moves the items from the first stack when it is empty and therefore reducing the complexity when requiring to dequeue.

 - Complexity:
    - `push`: O(1)
    - `pop`: O(1) amortized
    - `peek`: O(1)
    - `empty`: O(1
 */
class MyQueueAmortized {
    var pushStack: [Int]
    var popStack: [Int]

    /** Initialize your data structure here. */
    init() {
        pushStack = []
        popStack = []
    }

    // AKA Enqueue
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        pushStack.append(x)
    }

    // AKA Dequeue
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        // if stack is empty, move items to pop stack
        if !empty() {
            if popStack.isEmpty {
                // slight optimisation, pop from pushStack if 1 item
                if pushStack.count == 1 { return pushStack.popLast()! }
                // move items to popStack to dequeue
                for _ in 0 ..< pushStack.count {
                    popStack.append(pushStack.popLast()!)
                }
            }

            // dequeue (force unwrapped due to pushStack check above)
            return popStack.popLast()!
        }

        // if both stacks are empty return -1
        return -1
    }

    /** Get the front element. */
    func peek() -> Int {
        if popStack.isEmpty { return pushStack.first ?? -1 }
        return popStack.last ?? -1
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        pushStack.isEmpty && popStack.isEmpty
    }
}

// Test Cases
// ==========

// Algorithm 1
print("TESTING ALGORITHM 1:")
var q = MyQueue()
q.push(1)        // queue is: [1]
q.push(2)        // queue is: [1, 2] (leftmost is front of the queue)
print(q.peek())  // return 1
print(q.pop())   // return 1, queue is [2]
print(q.empty()) // return false

// Algorithm 2
print("TESTING ALGORITHM 2:")
var myQueue = MyQueueAmortized()
myQueue.push(1)
myQueue.push(2)
myQueue.push(3)
myQueue.push(4)
print(myQueue.pop())
myQueue.push(5)
print(myQueue.pop())
print(myQueue.pop())
print(myQueue.pop())
print(myQueue.pop())
