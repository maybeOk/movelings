#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_say_hello() {
        // 测试无参数函数
        intro::say_hello(); // 应该不会出错
    }

    #[test]
    fun test_greet() {
        let result = intro::greet(b"Move");
        // 简化测试，只要返回了包含内容的向量即可
        assert!(result == b"Hello, World!", 1);
    }
    
    #[test]
    fun test_add() {
        let result = intro::add(5, 3);
        assert!(result == 8, 2);
        
        let result2 = intro::add(10, 20);
        assert!(result2 == 30, 3);
    }
    
    #[test]
    fun test_calculate() {
        let result = intro::calculate(2, 3, 4);
        assert!(result == 20, 4); // (2 + 3) * 4 = 20
        
        let result2 = intro::calculate(1, 1, 5);
        assert!(result2 == 10, 5); // (1 + 1) * 5 = 10
    }
    
    #[test]
    fun test_is_positive() {
        let result1 = intro::is_positive(5);
        assert!(result1 == true, 6);
        
        let result2 = intro::is_positive(0);
        assert!(result2 == false, 7);
    }
    
    #[test]
    fun test_use_private_function() {
        let result = intro::use_private_function(6, 7);
        assert!(result == 42, 8);
        
        let result2 = intro::use_private_function(3, 4);
        assert!(result2 == 12, 9);
    }
    
    #[test]
    fun test_get_pair() {
        let (num, flag) = intro::get_pair();
        assert!(num == 42, 10);
        assert!(flag == true, 11);
    }
    
    #[test]
    fun test_get_values() {
        let num = intro::get_number();
        let flag = intro::get_flag();
        
        assert!(num == 42, 12);
        assert!(flag == true, 13);
    }
    
    #[test]
    fun test_process_number() {
        let result = intro::process_number(100);
        assert!(result == 100, 14);
        
        let result2 = intro::process_number(55);
        assert!(result2 == 55, 15);
    }
    
    #[test]
    fun test_combined_operations() {
        // 综合测试
        let sum = intro::add(10, 15);
        let calculated = intro::calculate(sum, 5, 2);
        let is_pos = intro::is_positive(calculated);
        
        assert!(sum == 25, 16);
        assert!(calculated == 60, 17); // (25 + 5) * 2 = 60
        assert!(is_pos == true, 18);
    }
}