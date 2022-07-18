/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 *
 * https://leetcode.cn/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (53.79%)
 * Likes:    2498
 * Dislikes: 0
 * Total Accepted:    873K
 * Total Submissions: 1.6M
 * Testcase Example:  '2'
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：n = 2
 * 输出：2
 * 解释：有两种方法可以爬到楼顶。
 * 1. 1 阶 + 1 阶
 * 2. 2 阶
 * 
 * 示例 2：
 * 
 * 
 * 输入：n = 3
 * 输出：3
 * 解释：有三种方法可以爬到楼顶。
 * 1. 1 阶 + 1 阶 + 1 阶
 * 2. 1 阶 + 2 阶
 * 3. 2 阶 + 1 阶
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= n <= 45
 * 
 * 
 */

// @lc code=start
class Solution {
    // 思路：f(n) = f(n - 1) + f(n - 2)

    // 1、递归法 时间复杂度O(2^n)
    // 会有大量重复计算，可将算的值使用数组保存一下，时间复杂度可降为O(n)
    // func climbStairs(_ n: Int) -> Int {
    //     if (n == 1 || n == 2) {
    //         return n;
    //     }
    //     return climbStairs(n - 1) + climbStairs(n - 2);
    // }

    // 2、动态规划 时间复杂度O(n)，空间复杂度O(n)
    // 记录了每一级阶梯需要的方法数
    // func climbStairs(_ n: Int) -> Int {
    //     var dpArr = [Int](repeating: 0, count: n + 1)
    //     if n == 1 || n == 2 {
    //         return n
    //     }
    //     dpArr[1] = 1
    //     dpArr[2] = 2
    //     for i in 3...n {
    //         dpArr[i] = dpArr[i - 1] + dpArr[i - 2]
    //     }
    //     return dpArr[n]
    // }

    // 3、动态规划（滚动数组）时间复杂度O(n) 空间复杂度O(1)
    // 只记录两个状态，前一个和后一个，降低空间复杂度
    func climbStairs(_ n: Int) -> Int {
        if (n == 1 || n == 2) {
            return n
        }
        var prev = 0, post = 1, total = 0
        for _ in 1...n {
            total = prev + post

            prev = post
            post = total
        }
        return total
    }
}
// @lc code=end

