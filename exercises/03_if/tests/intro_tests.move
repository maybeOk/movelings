#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_is_even() {
        assert!(intro::is_even(4) == true, 1);
        assert!(intro::is_even(5) == false, 2);
        assert!(intro::is_even(0) == true, 3);
        assert!(intro::is_even(1) == false, 4);
    }

    #[test]
    fun test_absolute_value() {
        assert!(intro::absolute_value(10, false) == 10, 5);
        assert!(intro::absolute_value(10, true) == 0, 6);
        assert!(intro::absolute_value(0, false) == 0, 7);
    }
    
    #[test]
    fun test_max_of_two() {
        assert!(intro::max_of_two(5, 3) == 5, 8);
        assert!(intro::max_of_two(3, 5) == 5, 9);
        assert!(intro::max_of_two(7, 7) == 7, 10);
    }
    
    #[test]
    fun test_grade_to_letter() {
        assert!(intro::grade_to_letter(95) == b"A", 11);
        assert!(intro::grade_to_letter(85) == b"B", 12);
        assert!(intro::grade_to_letter(75) == b"C", 13);
        assert!(intro::grade_to_letter(65) == b"D", 14);
        assert!(intro::grade_to_letter(55) == b"F", 15);
        assert!(intro::grade_to_letter(90) == b"A", 16);
        assert!(intro::grade_to_letter(80) == b"B", 17);
    }
    
    #[test]
    fun test_is_valid_age() {
        assert!(intro::is_valid_age(25) == true, 18);
        assert!(intro::is_valid_age(18) == true, 19);
        assert!(intro::is_valid_age(100) == true, 20);
        assert!(intro::is_valid_age(17) == false, 21);
        assert!(intro::is_valid_age(101) == false, 22);
    }
    
    #[test]
    fun test_is_weekend() {
        assert!(intro::is_weekend(6) == true, 23);  // 周六
        assert!(intro::is_weekend(7) == true, 24);  // 周日
        assert!(intro::is_weekend(1) == false, 25); // 周一
        assert!(intro::is_weekend(5) == false, 26); // 周五
    }
    
    #[test]
    fun test_categorize_number() {
        assert!(intro::categorize_number(0) == b"zero", 27);
        assert!(intro::categorize_number(4) == b"small_even", 28);
        assert!(intro::categorize_number(3) == b"small_odd", 29);
        assert!(intro::categorize_number(12) == b"large_even", 30);
        assert!(intro::categorize_number(13) == b"large_odd", 31);
    }
    
    #[test]
    fun test_describe_number() {
        assert!(intro::describe_number(4) == b"even", 32);
        assert!(intro::describe_number(7) == b"odd", 33);
        assert!(intro::describe_number(0) == b"even", 34);
        assert!(intro::describe_number(1) == b"odd", 35);
    }
    
    #[test]
    fun test_simple_sign() {
        assert!(intro::simple_sign(10, 5) == b"positive", 36);
        assert!(intro::simple_sign(3, 5) == b"zero_or_negative", 37);
        assert!(intro::simple_sign(5, 5) == b"zero_or_negative", 38);
    }
    
    #[test]
    fun test_is_in_range() {
        assert!(intro::is_in_range(5, 1, 10) == true, 39);
        assert!(intro::is_in_range(1, 1, 10) == true, 40);
        assert!(intro::is_in_range(10, 1, 10) == true, 41);
        assert!(intro::is_in_range(0, 1, 10) == false, 42);
        assert!(intro::is_in_range(11, 1, 10) == false, 43);
    }
    
    #[test]
    fun test_combined_logic() {
        // 综合测试
        let num = 8;
        let is_even_result = intro::is_even(num);
        let max_result = intro::max_of_two(num, 10);
        let grade = intro::grade_to_letter(88);
        
        assert!(is_even_result == true, 44);
        assert!(max_result == 10, 45);
        assert!(grade == b"B", 46);
    }
}