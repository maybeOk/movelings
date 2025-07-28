/*
这是您的第四个 Move 练习 - 学习条件语句！

// HINT: Move 中使用 `if` 进行条件判断
// HINT: 条件表达式必须是 bool 类型
// HINT: if 可以有返回值，也可以没有返回值
// TODO: 实现基本的 if 语句
// TODO: 实现 if-else 语句
// TODO: 实现 if-else if-else 链
// TODO: 使用条件表达式返回值
// 1. 学习 if 语句的基本语法
// 2. 理解布尔表达式的使用
// 3. 掌握条件分支的逻辑
// 4. 了解 if 表达式的返回值
*/

/// Module: intro
module intro::intro {
    
    /// 基本的条件判断函数
    public fun is_even(num: u64): bool {
        // TODO: 判断数字是否为偶数
        // 提示：使用 % 运算符取模，偶数对2取模等于0

    }
    
    /// 使用 if-else 返回不同的值
    public fun absolute_value(num: u64, is_negative: bool): u64 {
        // TODO: 如果 is_negative 为 true，返回 0（因为u64不能为负数）
        // TODO: 如果 is_negative 为 false，返回原始数字
  
    }
    
    /// 比较两个数字的大小
    public fun max_of_two(a: u64, b: u64): u64 {
        // TODO: 返回两个数字中较大的一个

    }
    
    /// 多重条件判断
    public fun grade_to_letter(score: u64): vector<u8> {
        // TODO: 根据分数返回等级
        // 90-100: "A", 80-89: "B", 70-79: "C", 60-69: "D", 0-59: "F"

    }
    
    /// 复杂的布尔逻辑
    public fun is_valid_age(age: u64): bool {
        // TODO: 检查年龄是否在有效范围内 (18 <= age <= 100)
        // 提示：使用逻辑运算符 && (AND)

    }
    
    /// 使用逻辑或运算符
    public fun is_weekend(day: u64): bool {
        // TODO: 检查是否为周末 (假设1=周一，7=周日)
        // 周六(6)或周日(7)为周末
        // 提示：使用逻辑运算符 || (OR)

    }
    
    /// 嵌套的条件语句
    public fun categorize_number(num: u64): vector<u8> {
        // TODO: 根据数字特性分类
        // 如果是0，返回 "zero"
        // 如果是偶数且小于10，返回 "small_even"
        // 如果是奇数且小于10，返回 "small_odd"
        // 如果是偶数且大于等于10，返回 "large_even"
        // 如果是奇数且大于等于10，返回 "large_odd"

    }
    
    /// 条件语句中的函数调用
    public fun describe_number(num: u64): vector<u8> {
        // TODO: 使用之前定义的 is_even 函数
        // 如果是偶数，返回 "even"
        // 如果是奇数，返回 "odd"

    }
    
    /// 三元条件表达式风格
    public fun simple_sign(num: u64, zero_threshold: u64): vector<u8> {
        // TODO: 简单的符号判断
        // 如果 num > zero_threshold，返回 "positive"
        // 否则返回 "zero_or_negative"

    }
    
    /// 布尔值的直接返回
    public fun is_in_range(value: u64, min: u64, max: u64): bool {
        // TODO: 检查值是否在指定范围内 [min, max]

    }
}