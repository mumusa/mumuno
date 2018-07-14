//
//  Hard_052_N_Queens_II.swift
//  algorithms
//
//  Created by null on 2018/7/14.
//  Copyright © 2018年 XD. All rights reserved.
//

/*
 
 https://leetcode.com/problems/n-queens-ii/
 
 #52 N-Queens II
 
 Follow up for N-Queens problem.
 
 Now, instead outputting board configurations, return the total number of distinct solutions.
 
 Inspired by @qiqjiao at https://leetcode.com/discuss/743/whats-your-solution
 
 */

import Foundation

struct Hard_052_N_Queens_II {
    private static func dfs(h: Int, r: Int, l: Int, answer: inout Int, limit: inout Int) {
        if h == limit {
            answer += 1
            return
        }
        var position = limit & (~(h|r|l))
        while position > 0 {
            let p = position & (-position)
            position -= p
            
            dfs(h: h+p, r: (r+p)<<1, l: (l+p)>>1, answer: &answer, limit: &limit)
        }
    }
    
    static func totalNQueens(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var answer = 0
        var limit = (1<<n) - 1
        dfs(h: 0, r: 0, l: 0, answer: &answer, limit: &limit)
        return answer
    }
}
