/*
这是您的第二个 Move 练习 - 学习变量！

// HINT: Move 中使用 `let` 关键字声明变量
// HINT: 默认情况下变量是不可变的，使用 `mut` 使其可变
// HINT: Move 有强类型系统，但通常可以推断类型
// TODO: 完成下面的函数实现
// TODO: 学习不同的数据类型和变量声明方式
// 1. 学习 let 绑定语法
// 2. 理解可变性概念 (mut)
// 3. 探索基本数据类型
// 4. 了解类型推断和显式类型注解
*/
module intro::intro {
    
    /// 返回一个简单的整数值
    public fun get_number(): u64 {
        // TODO: 声明一个变量 x，值为 42，然后返回它
        // let x = ?;
        // x
        
        //0 // 临时返回值，需要替换
    }
    
    /// 演示可变变量的使用
    public fun increment_number(start: u64): u64 {
        // TODO: 声明一个可变变量，初始值为 start
        // TODO: 将这个变量增加 10
        // TODO: 返回最终的值
        // let mut num = ?;
        // num = num + ?;
        // num
        
        start // 临时返回值，需要替换
    }
    
    /// 演示不同数据类型
    public fun get_flag(): bool {
        // TODO: 声明一个布尔变量并返回 true
        // let flag: bool = ?;
        // flag
        
        false // 临时返回值，需要替换
    }
    
    /// 演示向量类型
    public fun get_bytes(): vector<u8> {
        // TODO: 声明一个字节向量变量，内容为 "Move"
        // let bytes = ?;
        // bytes
        
        b"" // 临时返回值，需要替换
    }
    
    /// 演示变量遮蔽
    public fun shadow_variable(): u64 {
        // TODO: 声明变量 x，值为 5
        // TODO: 重新定义 x，值为原来的 x * 2
        // TODO: 再次重新定义 x，值为 x + 1
        // let x = ?;
        // let x = x * ?;
        // let x = x + ?;
        // x
        
        0 // 临时返回值，需要替换
    }
}

