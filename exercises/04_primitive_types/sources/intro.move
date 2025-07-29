/*
这是您的第五个 Move 练习 - 学习基本数据类型！

// HINT: Move 有多种基本数据类型：u8, u16, u32, u64, u128, u256, bool, address
// HINT: 使用类型后缀来指定数字类型，如 100u8, 1000u64
// HINT: 地址类型使用 @0x... 语法
// TODO: 了解不同整数类型的范围和使用场景
// TODO: 学习布尔类型和地址类型
// TODO: 掌握向量和类型转换
// 1. 学习基本整数类型 (u8, u64, u128)
// 2. 理解布尔类型和地址类型
// 3. 掌握向量的基本操作
// 4. 学习类型转换
*/

/// Module: intro
module intro::intro {
    
    /// 返回不同的整数类型
    public fun get_u8_max(): u8 {
        // TODO: 返回 u8 的最大值 255
    }
    
    public fun get_u64_value(): u64 {
        // TODO: 返回一个 u64 类型的值
    }
    
    public fun get_u128_value(): u128 {
        // TODO: 返回一个大的 u128 值
    }
    
    /// 布尔类型
    public fun get_boolean_and(a: bool, b: bool): bool {
        // TODO: 返回 a && b
    }
    
    /// 地址类型
    public fun get_zero_address(): address {
        // TODO: 返回零地址 @0x0
    }
    
    public fun compare_addresses(addr1: address, addr2: address): bool {
        // TODO: 比较两个地址是否相等
    }
    
    /// 类型转换
    public fun convert_u8_to_u64(value: u8): u64 {
        // TODO: 将 u8 转换为 u64
        // HINT：使用 (value as u64)
    }
    
    /// 数字运算
    public fun add_different_types(a: u8, b: u64): u64 {
        // TODO: 将 u8 转换为 u64 后相加
    }
    
    /// 向量基础操作
    public fun create_number_vector(): vector<u64> {
        // TODO: 创建包含 [1, 2, 3] 的向量
    }
    
    public fun get_vector_length(v: &vector<u64>): u64 {
        // TODO: 返回向量的长度
    }
    
    public fun get_first_element(v: &vector<u64>): u64 {
        // TODO: 返回向量的第一个元素
    }
    
    /// 字节向量
    public fun create_hello_bytes(): vector<u8> {
        // TODO: 创建字节字符串 "Move"
    }
    
    public fun create_hex_bytes(): vector<u8> {
        // TODO: 创建十六进制字节 [0x4D, 0x6F, 0x76, 0x65] (对应 "Move")
    }
    
    /// 类型判断逻辑
    public fun fits_in_u8(value: u64): bool {
        // TODO: 判断 u64 值是否能放入 u8 (value <= 255)
    }
    
    /// 综合运算
    public fun calculate_with_types(small: u8, medium: u64, large: u128): u128 {
        // TODO: 将所有类型转换为 u128 后相加
    }
}