/*
这是您的第六个 Move 练习 - 学习向量（Vector）！

// HINT: Move 中的向量是动态数组，使用 vector<T> 声明
// HINT: 使用 vector::empty<T>() 创建空向量
// HINT: 使用 vector::push_back() 添加元素
// HINT: 使用 vector::length() 获取长度
// HINT: 使用 vector::borrow() 获取元素引用
// HINT: 可变引用用 &mut，不可变引用用 &
// HINT: 解引用使用 * 操作符，如 *vector::borrow()
// TODO: 学习向量的创建和初始化
// TODO: 掌握向量的基本操作（添加、删除、访问）
// TODO: 理解向量的可变性和引用
// 1. 学习向量的创建方法
// 2. 掌握向量的增删改查操作
// 3. 理解向量的引用和所有权
// 4. 学习向量的实用操作
*/

/// Module: intro
module intro::intro {
    
    /// 创建空向量
    public fun create_empty_vector(): vector<u64> {
        // TODO: 创建一个空的 u64 向量
        // HINT: 使用 vector::empty<u64>()
        // HINT: 语法格式：vector::empty<类型>()
        
    }
    
    /// 创建包含初始值的向量
    public fun create_vector_with_values(): vector<u64> {
        // TODO: 创建包含 [1, 2, 3, 4, 5] 的向量
        // HINT: 使用向量字面量语法：vector[element1, element2, ...]
        // HINT: 例如：vector[1, 2, 3] 创建包含三个元素的向量
        
    }
    
    /// 向向量添加元素
    public fun add_element(vec: &mut vector<u64>, value: u64) {
        // TODO: 向向量末尾添加一个元素
        // HINT: 使用 vector::push_back(向量的可变引用, 要添加的值)
        // HINT: 注意第一个参数需要是可变引用 &mut
        
    }
    
    /// 获取向量长度
    public fun get_length(vec: &vector<u64>): u64 {
        // TODO: 返回向量的长度
        // HINT: 使用 vector::length(向量的引用)
        // HINT: 参数是不可变引用 &vector<T>
        
    }
    
    /// 获取向量中的元素
    public fun get_element(vec: &vector<u64>, index: u64): u64 {
        // TODO: 获取指定索引的元素
        // HINT: 使用 vector::borrow(向量引用, 索引) 获取元素引用
        // HINT: 需要用 * 解引用来获取实际值
        // HINT: 语法：*vector::borrow(vec, index)
        
    }
    
    /// 移除向量末尾的元素
    public fun remove_last_element(vec: &mut vector<u64>): u64 {
        // TODO: 移除并返回向量末尾的元素
        // HINT: 使用 vector::pop_back(可变向量引用)
        // HINT: 这个函数会移除最后一个元素并返回它
        
    }
    
    /// 检查向量是否为空
    public fun is_empty(vec: &vector<u64>): bool {
        // TODO: 检查向量是否为空
        // HINT: 使用 vector::is_empty(向量引用)
        // HINT: 返回 true 如果向量为空，false 否则
        
    }
    
    /// 查找元素在向量中的索引
    public fun find_index(vec: &vector<u64>, value: u64): u64 {
        // TODO: 查找元素的索引，如果不存在返回向量长度
        // HINT: 需要使用循环遍历向量
        // HINT: 使用 while 循环：while (条件) { ... }
        // HINT: 声明可变变量：let mut i = 0;
        // HINT: 比较元素：*vector::borrow(vec, i) == value
        // HINT: 如果找到，使用 return 提前返回索引

    }
    
    /// 检查向量是否包含某个值
    public fun contains(vec: &vector<u64>, value: u64): bool {
        // TODO: 检查向量是否包含指定值
        // HINT: 使用 vector::contains(向量引用, 值的引用)
        // HINT: 注意第二个参数需要传递值的引用：&value
        

    }
    
    /// 计算向量中所有元素的和
    public fun sum_elements(vec: &vector<u64>): u64 {
        // TODO: 计算向量中所有元素的和
        // HINT: 声明累加器变量：let mut sum = 0;
        // HINT: 遍历所有元素，每次将元素值加到 sum 上
        // HINT: 使用 while 循环遍历每个索引
        
    }
    
    /// 获取向量中的最大值
    public fun get_max(vec: &vector<u64>): u64 {
        // TODO: 找到向量中的最大值（假设向量非空）
        // HINT: 初始化最大值为第一个元素：let mut max = *vector::borrow(vec, 0);
        // HINT: 从索引 1 开始遍历，比较每个元素与当前最大值
        // HINT: 如果找到更大的值，更新 max
        
    }
    
    /// 反转向量
    public fun reverse_vector(vec: &mut vector<u64>) {
        // TODO: 反转向量中元素的顺序
        // HINT: 使用 vector::reverse(可变向量引用)
        // HINT: 这会就地修改向量，不返回值
        
    }
    
    /// 创建字符串向量
    public fun create_string_vector(): vector<vector<u8>> {
        // TODO: 创建包含多个字符串的向量
        // HINT: 字符串在 Move 中是 vector<u8> 类型
        // HINT: 使用 b"字符串" 语法创建字节字符串
        // HINT: 返回类型是 vector<vector<u8>>，即字符串的向量
        
    }
    
    /// 连接两个向量
    public fun append_vectors(vec1: &mut vector<u64>, vec2: vector<u64>) {
        // TODO: 将 vec2 的所有元素添加到 vec1
        // HINT: 使用 vector::append(目标向量的可变引用, 源向量)
        // HINT: 这会将 vec2 的所有元素移动到 vec1 末尾
        // HINT: vec2 会被消耗（moved）
        
    }
    
    /// 创建指定大小的向量
    public fun create_vector_with_size(size: u64, default_value: u64): vector<u64> {
        // TODO: 创建指定大小的向量，所有元素都是默认值
        // HINT: 先创建空向量：let mut vec = vector::empty<u64>();
        // HINT: 使用循环添加 size 个 default_value
        // HINT: 循环 size 次，每次 push_back 默认值
        
    }
    
    /// 移除指定索引的元素
    public fun remove_at_index(vec: &mut vector<u64>, index: u64): u64 {
        // TODO: 移除指定索引的元素并返回
        // HINT: 使用 vector::remove(可变向量引用, 索引)
        // HINT: 这会移除指定位置的元素并返回其值
        // HINT: 后面的元素会向前移动填补空隙
        
    }
    
    /// 在指定位置插入元素
    public fun insert_at_index(vec: &mut vector<u64>, index: u64, value: u64) {
        // TODO: 在指定位置插入元素
        // HINT: 使用 vector::insert(可变向量引用, 值, 索引)
        // HINT: 注意参数顺序：向量、值、索引
        // HINT: 原有元素会向后移动为新元素腾出空间
        
    }
    
    /// 交换两个位置的元素
    public fun swap_elements(vec: &mut vector<u64>, index1: u64, index2: u64) {
        // TODO: 交换两个位置的元素
        // HINT: 使用 vector::swap(可变向量引用, 索引1, 索引2)
        // HINT: 这会交换两个位置的元素值
        
    }
    
    /// 复制向量的一部分
    public fun slice_vector(vec: &vector<u64>, start: u64, length: u64): vector<u64> {
        // TODO: 复制向量从 start 开始的 length 个元素
        // HINT: 创建新的空向量来存储结果
        // HINT: 使用循环复制指定范围的元素
        // HINT: 检查边界：start + i < vector::length(vec)
        // HINT: 循环 length 次，每次复制一个元素
        
    }
    
    /// 向量去重
    public fun deduplicate(vec: &mut vector<u64>) {
        // TODO: 移除向量中的重复元素（保留第一次出现的）
        // HINT: 使用嵌套循环：外层遍历每个元素
        // HINT: 内层检查后面是否有重复元素
        // HINT: 如果找到重复元素，使用 vector::remove 移除
        // HINT: 移除元素后不要增加内层索引，因为元素位置变了
        
    }
}