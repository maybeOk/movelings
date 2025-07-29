/*
这是您的第七个 Move 练习 - 学习 Move 语义学！

// HINT: Move 是基于所有权的语言，值只能有一个所有者
// HINT: 使用 & 创建不可变引用，使用 &mut 创建可变引用
// HINT: 值可以被移动（move）到新的所有者
// HINT: 复制语义只适用于简单类型（u8, u64, bool等）
// HINT: 复杂类型（vector, struct）使用移动语义
// TODO: 理解所有权转移
// TODO: 学习引用和借用
// TODO: 掌握移动语义 vs 复制语义
// TODO: 了解可变性和不可变性
// 1. 学习 Move 的所有权模型
// 2. 理解值的移动和复制
// 3. 掌握引用的使用
// 4. 了解可变性规则
*/

/// Module: intro
module intro::intro {
    
    /// === 基本值的复制语义 ===
    
    /// 简单类型的复制
    public fun copy_number(x: u64): (u64, u64) {
        // TODO: 返回 (x, x) - 简单类型可以被复制
        // HINT: u64 等基本类型实现了 copy trait
        // HINT: 可以多次使用同一个值
        
        (x, x)
    }
    
    /// 简单类型的传递
    public fun pass_and_return(x: u64): u64 {
        // TODO: 调用 helper_function 并返回结果
        // HINT: x 会被复制传递给函数
        
        helper_function(x)
    }
    
    fun helper_function(y: u64): u64 {
        y + 1
    }
    
    /// === 复杂类型的移动语义 ===
    
    /// 向量的移动
    public fun move_vector(vec: vector<u64>): vector<u64> {
        // TODO: 直接返回向量
        // HINT: 向量使用移动语义，所有权转移给返回值
        
        vec
    }
    
    /// 向量的所有权转移
    public fun transfer_ownership(vec: vector<u64>): u64 {
        // TODO: 获取向量长度并返回
        // HINT: 向量被移动到这个函数，可以直接使用
        // HINT: 函数结束时向量被销毁
        
        vector::length(&vec)
    }
    
    /// === 引用和借用 ===
    
    /// 不可变引用
    public fun borrow_immutable(vec: &vector<u64>): u64 {
        // TODO: 通过不可变引用获取向量长度
        // HINT: 使用 &vector<u64> 参数类型
        // HINT: 可以读取但不能修改
        
        vector::length(vec)
    }
    
    /// 可变引用
    public fun borrow_mutable(vec: &mut vector<u64>, value: u64) {
        // TODO: 向向量添加一个元素
        // HINT: 使用 &mut vector<u64> 参数类型
        // HINT: 可以修改向量内容
        
        vector::push_back(vec, value);
    }
    
    /// 同时使用值和引用
    public fun use_value_and_reference(mut vec: vector<u64>): (u64, vector<u64>) {
        // TODO: 获取长度，添加元素，返回 (原长度, 修改后的向量)
        // HINT: 先通过引用获取长度
        // HINT: 然后修改向量
        // HINT: 最后移动向量到返回值
        
        let original_length = vector::length(&vec);
        vector::push_back(&mut vec, 100);
        (original_length, vec)
    }
    
    /// === 多重引用 ===
    
    /// 多个不可变引用
    public fun multiple_immutable_borrows(vec: &vector<u64>): (u64, u64) {
        // TODO: 创建两个不可变引用并使用
        // HINT: 可以有多个不可变引用同时存在
        
        let len1 = vector::length(vec);
        let len2 = vector::length(vec);
        (len1, len2)
    }
    
    /// === 引用的生命周期 ===
    
    /// 引用不能比原值活得更久
    public fun reference_lifetime(vec: vector<u64>): u64 {
        // TODO: 在作用域内使用引用
        // HINT: 引用的生命周期不能超过被引用值的生命周期
        
        let len = {
            let vec_ref = &vec;
            vector::length(vec_ref)
        }; // vec_ref 在这里结束生命周期
        len
    }
    
    /// === 可变性规则 ===
    
    /// 不可变值的引用
    public fun immutable_value_reference(vec: vector<u64>): u64 {
        // TODO: 对不可变值创建不可变引用
        // HINT: 不可变值只能创建不可变引用
        
        vector::length(&vec)
    }
    
    /// 可变值的引用
    public fun mutable_value_references(mut vec: vector<u64>): (u64, vector<u64>) {
        // TODO: 对可变值创建不同类型的引用
        // HINT: 可变值可以创建不可变引用或可变引用
        // HINT: 但不能同时存在可变和不可变引用
        
        let len = vector::length(&vec); // 不可变引用
        vector::push_back(&mut vec, 42); // 可变引用
        (len, vec)
    }
    
    /// === 所有权模式 ===
    
    /// 值的消费
    public fun consume_value(vec: vector<u64>): bool {
        // TODO: 消费向量并返回是否为空
        // HINT: 向量被移动到函数内，函数结束时被销毁
        
        vector::is_empty(&vec)
    }
    
    /// 条件性移动
    public fun conditional_move(vec: vector<u64>, should_move: bool): vector<u64> {
        // TODO: 根据条件决定是否移动向量
        // HINT: if 表达式中的移动语义
        
        if (should_move) {
            vec // 移动向量
        } else {
            vector::empty<u64>() // 返回新的空向量
        }
    }
    
    /// === 复杂的所有权场景 ===
    
    /// 向量的分解
    public fun destructure_vector(mut vec: vector<u64>): (u64, vector<u64>) {
        // TODO: 取出第一个元素，返回 (第一个元素, 剩余向量)
        // HINT: 使用 vector::remove 取出元素
        // HINT: 如果向量为空，返回 (0, 空向量)
        
        if (vector::is_empty(&vec)) {
            (0, vec)
        } else {
            let first = vector::remove(&mut vec, 0);
            (first, vec)
        }
    }
    
    /// 向量的重建
    public fun rebuild_vector(elements: vector<u64>, additional: u64): vector<u64> {
        // TODO: 将 additional 添加到 elements 并返回
        // HINT: 需要修改向量，所以需要 mut
        
        let mut result = elements; // 移动所有权
        vector::push_back(&mut result, additional);
        result
    }
    
    /// === 错误示例（注释掉的错误代码） ===
    
    /// 演示常见的所有权错误
    public fun ownership_examples(vec: vector<u64>): vector<u64> {
        // 错误示例1：使用移动后的值
        // let vec2 = vec;           // vec 被移动
        // let len = vector::length(&vec); // 错误！vec 已被移动
        
        // 错误示例2：同时可变和不可变借用
        // let len = vector::length(&vec);     // 不可变借用
        // vector::push_back(&mut vec, 1);     // 错误！不能同时可变借用
        
        // 正确的做法：
        vec // 直接返回，移动所有权
    }
    
    /// 演示引用规则
    public fun reference_rules_demo(mut vec: vector<u64>): u64 {
        // 可以有多个不可变引用
        let _ref1 = &vec;
        let _ref2 = &vec;
        let len = vector::length(_ref1);
        
        // 不可变引用结束后，可以创建可变引用
        vector::push_back(&mut vec, 999);
        
        len
    }
}