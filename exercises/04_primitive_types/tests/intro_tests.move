#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_integer_types() {
        assert!(intro::get_u8_max() == 255u8, 1);
        assert!(intro::get_u64_value() == 1000000u64, 2);
        assert!(intro::get_u128_value() == 1000000000000000000u128, 3);
    }

    #[test]
    fun test_boolean_operations() {
        assert!(intro::get_boolean_and(true, true) == true, 4);
        assert!(intro::get_boolean_and(true, false) == false, 5);
        assert!(intro::get_boolean_and(false, false) == false, 6);
    }
    
    #[test]
    fun test_address_operations() {
        assert!(intro::get_zero_address() == @0x0, 7);
        assert!(intro::compare_addresses(@0x1, @0x1) == true, 8);
        assert!(intro::compare_addresses(@0x1, @0x2) == false, 9);
    }
    
    #[test]
    fun test_type_conversion() {
        assert!(intro::convert_u8_to_u64(100u8) == 100u64, 10);
        assert!(intro::add_different_types(10u8, 20u64) == 30u64, 11);
    }
    
    #[test]
    fun test_vector_operations() {
        let v = intro::create_number_vector();
        assert!(intro::get_vector_length(&v) == 3, 12);
        assert!(intro::get_first_element(&v) == 1u64, 13);
    }
    
    #[test]
    fun test_byte_operations() {
        let hello = intro::create_hello_bytes();
        assert!(hello == b"Move", 14);
        
        let hex = intro::create_hex_bytes();
        assert!(hex == x"4D6F7665", 15);
        assert!(hex == b"Move", 16); // 应该相等
    }
    
    #[test]
    fun test_type_logic() {
        assert!(intro::fits_in_u8(100u64) == true, 17);
        assert!(intro::fits_in_u8(300u64) == false, 18);
    }
    
    #[test]
    fun test_complex_calculation() {
        let result = intro::calculate_with_types(10u8, 100u64, 1000u128);
        assert!(result == 1110u128, 19); // 10 + 100 + 1000
    }
}