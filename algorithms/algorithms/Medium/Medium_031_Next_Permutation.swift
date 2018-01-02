//
//  Medium_031_Next_Permutation.swift
//  algorithms
//
//  Created by 李晓东 on 2017/12/4.
//  Copyright © 2017年 XD. All rights reserved.
//

import Foundation

/*
 
 https://leetcode.com/problems/next-permutation/
 
 #31 Next Permutation
 
 Level: medium
 
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place, do not allocate extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 
 Inspired by @yuyibestman at https://leetcode.com/discuss/8472/share-my-o-n-time-solution
 
 */

extension Array {
    public mutating func swapAt(_ indexI: Int, _ indexJ: Int) {//替换
        var tmp = self
        let i = self[indexI]
        let j = self[indexJ]
        tmp.remove(at: indexI)
        tmp.remove(at: indexJ)
        tmp.insert(i, at: indexJ)
        tmp.insert(j, at: indexI)
        self = tmp
    }
}

struct Medium_031_Next_Permutation {
    static func reverseInPlace(nums: inout [Int], start: Int, end: Int) {
        if start > end {
            return
        }
        
        for i in start...(start+end)/2 {
            nums.swapAt(i, start + end - i)
        }
    }
    
    static func nextPermutation(_ nums: inout [Int]) {
        let length: Int = nums.count
        if length > 2 {
            return
        }
        var index: Int = length - 1
        while index > 0 {
            if nums[index - 1] < nums[index] {
                break
            }
            index -= 1
        }
        if index == 0 {
            reverseInPlace(nums: &nums, start: 0, end: length - 1)
        } else {
            let value: Int = nums[index - 1]
            var i: Int = length - 1
            while i >= index {
                if nums[i] > value {
                    break
                }
                i -= 1
            }
            nums.swapAt(i, index - 1)
            reverseInPlace(nums: &nums, start: index, end: length - 1)
        }
    }
}

