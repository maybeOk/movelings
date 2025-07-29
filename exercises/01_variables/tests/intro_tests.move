#[test_only]
module intro::intro_test {
    use intro::intro;
    
    #[test]
    fun test_get_number() {
        let result = intro::get_number();
        assert!(result == 42, 0);
    }
    
    #[test] 
    fun test_increment_number() {
        let result = intro::increment_number(5);
        assert!(result == 15, 1);
        
        let result2 = intro::increment_number(100);
        assert!(result2 == 110, 2);
    }
    
    #[test]
    fun test_get_flag() {
        let result = intro::get_flag();
        assert!(result == true, 3);
    }
    
    #[test]
    fun test_get_bytes() {
        let result = intro::get_bytes();
        assert!(result == b"Move", 4);
    }
    
    #[test]
    fun test_shadow_variable() {
        let result = intro::shadow_variable();
        assert!(result == 11, 5); // 5 * 2 + 1 = 11
    }
    
    #[test]
    fun test_multiple_operations() {
        // 测试组合使用
        let num = intro::get_number();
        let incremented = intro::increment_number(num);
        let flag = intro::get_flag();
        
        assert!(num == 42, 6);
        assert!(incremented == 52, 7); // 42 + 10
        assert!(flag == true, 8);
    }
}