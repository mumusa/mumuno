//
//  Medium_089_Gray_Code.swift
//  algorithms
//
//  Created by null on 2018/5/17.
//  Copyright © 2018年 XD. All rights reserved.
//


/*
 
 https://leetcode.com/problems/gray-code/
 
 #89 Gray Code
 
 Level: medium
 
 The gray code is a binary numeral system where two successive values differ in only one bit.
 
 Given a non-negative integer n representing the total number of bits in the code, print the sequence of gray code. A gray code sequence must begin with 0.
 
 For example, given n = 2, return [0,1,3,2]. Its gray code sequence is:
 
 00 - 0
 01 - 1
 11 - 3
 10 - 2
 
 Note:
 For a given n, a gray code sequence is not uniquely defined.
 
 For example, [0,2,3,1] is also a valid gray code sequence according to the above definition.
 
 For now, the judge is able to judge based on one instance of gray code sequence. Sorry about that.
 
 Inspired by @mike3 at https://leetcode.com/discuss/2978/what-solution-gray-code-problem-extra-space-used-recursion
 
 */
import Foundation

struct Medium_089_Gray_Code {
    static func grayCode(_ n: Int) -> [Int] {
        var arr: [Int] = []
        arr.append(0)
        for i in 0..<n {
            let tmp = 1<<i
            for j in (0 ... arr.count-1).reversed() {
                arr.append(arr[j] + tmp)
            }
        }
        return arr
    }
}
