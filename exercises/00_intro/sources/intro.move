/*
这是您的第一个 Move 练习！

// HINT: 这是您的第一个 Move 练习！
// HINT: 取消注释下面的模块定义
// TODO: 取消注释并实现 hello_world 函数
// TODO: 取消注释并完成测试
// 1. 理解模块的基本结构
// 2. 学习函数定义语法
// 3. 了解测试的编写方法
*/

/// Module: intro
module intro::intro {
    public fun hello_world(): vector<u8> {
        b"Hello, Move!"
    }

    #[test]
    fun test_hello_world() {
        let result = hello_world();
        assert!(result == b"Hello, Move!", 0);
    }
}