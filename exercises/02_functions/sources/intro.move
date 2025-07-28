/*
这是您的第三个 Move 练习 - 学习函数！

// HINT: Move 中使用 `fun` 关键字定义函数
// HINT: 函数参数需要指定类型，返回值也需要指定类型
// HINT: 公共函数使用 `public fun`，模块内函数使用 `fun`
// TODO: 实现无参数函数
// TODO: 实现带参数的函数
// TODO: 实现有返回值的函数
// TODO: 实现多参数函数
// 1. 学习函数定义语法
// 2. 理解参数类型声明
// 3. 掌握返回值类型
// 4. 了解公共函数与私有函数的区别
*/

/// Module: intro
module intro::intro {
    
    /// 无参数、无返回值的简单函数
    public fun say_hello() {
        // TODO: 这个函数什么都不做，只是演示最基本的函数定义
        // 函数体可以为空，表示什么都不做
    }
    
    /// 带一个参数的函数
    public fun greet(_name: vector<u8>): vector<u8> {
        // TODO: 返回 "Hello, " + name + "!"
        // 提示：使用 b"Hello, " 表示字节字符串
        // 提示：可以先返回简单的值，如 b"Hello, World!"
        
        b"" // 临时返回值，需要替换
    }
    
    /// 带数字参数并返回计算结果的函数
    public fun add(a: u64, b: u64): u64 {
        // TODO: 返回 a + b 的结果
        // ?
        
        0 // 临时返回值，需要替换
    }
    
    /// 带多个参数的函数
    public fun calculate(x: u64, y: u64, z: u64): u64 {
        // TODO: 返回 (x + y) * z 的结果
        // ?
        
        0 // 临时返回值，需要替换
    }
    
    /// 条件判断函数
    public fun is_positive(num: u64): bool {
        // TODO: 如果 num > 0 返回 true，否则返回 false
        // ?
        
        false // 临时返回值，需要替换
    }
    
    /// 私有函数（模块内部使用）
    fun private_multiply(a: u64, b: u64): u64 {
        // TODO: 返回 a * b 的结果
        // 注意：这是私有函数，只能在模块内部调用
        // ?
        
        0 // 临时返回值，需要替换
    }
    
    /// 调用私有函数的公共函数
    public fun use_private_function(x: u64, y: u64): u64 {
        // TODO: 调用上面的 private_multiply 函数
        // private_multiply(?, ?)
        
        0 // 临时返回值，需要替换
    }
    
    /// 返回多个值的函数（使用多个返回值而不是元组）
    public fun get_pair(): (u64, bool) {
        // TODO: 返回两个值 42 和 true
        // (?, ?)
        
        (0, false) // 临时返回值，需要替换
    }
    
    /// 获取数字和布尔值的单独函数
    public fun get_number(): u64 {
        // TODO: 返回数字 42
        // ?
        
        0 // 临时返回值，需要替换
    }
    
    public fun get_flag(): bool {
        // TODO: 返回布尔值 true
        // ?
        
        false // 临时返回值，需要替换
    }
    
    /// 简单的数字处理函数
    public fun process_number(num: u64): u64 {
        // TODO: 直接返回传入的数字
        // ?
        
        0 // 临时返回值，需要替换
    }
}