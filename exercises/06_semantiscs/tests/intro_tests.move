#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_copy_semantics() {
        let x = 42u64;
        let (y, z) = intro::copy_number(x);
        assert!(y == 42, 1);
        assert!(z == 42, 2);
        assert!(x == 42, 3); // x 仍然可用（复制语义）
    }

    #[test]
    fun test_pass_and_return() {
        let result = intro::pass_and_return(10);
        assert!(result == 11, 4);
    }
    
    #[test]
    fun test_move_semantics() {
        let vec = vector[1, 2, 3];
        let moved_vec = intro::move_vector(vec);
        // vec 现在不可用（移动语义）
        assert!(vector::length(&moved_vec) == 3, 5);
    }
    
    #[test]
    fun test_ownership_transfer() {
        let vec = vector[1, 2, 3, 4];
        let len = intro::transfer_ownership(vec);
        // vec 现在不可用
        assert!(len == 4, 6);
    }
    
    #[test]
    fun test_immutable_borrow() {
        let vec = vector[1, 2, 3];
        let len = intro::borrow_immutable(&vec);
        assert!(len == 3, 7);
        assert!(vector::length(&vec) == 3, 8); // vec 仍然可用
    }
    
    #[test]
    fun test_mutable_borrow() {
        let mut vec = vector[1, 2];
        intro::borrow_mutable(&mut vec, 3);
        assert!(vector::length(&vec) == 3, 9);
        assert!(*vector::borrow(&vec, 2) == 3, 10);
    }
    
    #[test]
    fun test_value_and_reference() {
        let vec = vector[1, 2];
        let (original_len, new_vec) = intro::use_value_and_reference(vec);
        assert!(original_len == 2, 11);
        assert!(vector::length(&new_vec) == 3, 12);
        assert!(*vector::borrow(&new_vec, 2) == 100, 13);
    }
    
    #[test]
    fun test_multiple_immutable_borrows() {
        let vec = vector[1, 2, 3, 4];
        let (len1, len2) = intro::multiple_immutable_borrows(&vec);
        assert!(len1 == 4, 14);
        assert!(len2 == 4, 15);
    }
    
    #[test]
    fun test_reference_lifetime() {
        let vec = vector[1, 2, 3];
        let len = intro::reference_lifetime(vec);
        assert!(len == 3, 16);
    }
    
    #[test]
    fun test_immutable_value_reference() {
        let vec = vector[1, 2];
        let len = intro::immutable_value_reference(vec);
        assert!(len == 2, 17);
    }
    
    #[test]
    fun test_mutable_value_references() {
        let vec = vector[1, 2];
        let (len, new_vec) = intro::mutable_value_references(vec);
        assert!(len == 2, 18);
        assert!(vector::length(&new_vec) == 3, 19);
        assert!(*vector::borrow(&new_vec, 2) == 42, 20);
    }
    
    #[test]
    fun test_consume_value() {
        let empty_vec = vector::empty<u64>();
        let non_empty_vec = vector[1];
        
        assert!(intro::consume_value(empty_vec) == true, 21);
        assert!(intro::consume_value(non_empty_vec) == false, 22);
    }
    
    #[test]
    fun test_conditional_move() {
        let vec1 = vector[1, 2, 3];
        let vec2 = vector[4, 5, 6];
        
        let result1 = intro::conditional_move(vec1, true);
        let result2 = intro::conditional_move(vec2, false);
        
        assert!(vector::length(&result1) == 3, 23);
        assert!(vector::length(&result2) == 0, 24);
    }
    
    #[test]
    fun test_destructure_vector() {
        let empty_vec = vector::empty<u64>();
        let (first1, rest1) = intro::destructure_vector(empty_vec);
        assert!(first1 == 0, 25);
        assert!(vector::length(&rest1) == 0, 26);
        
        let vec = vector[10, 20, 30];
        let (first2, rest2) = intro::destructure_vector(vec);
        assert!(first2 == 10, 27);
        assert!(vector::length(&rest2) == 2, 28);
        assert!(*vector::borrow(&rest2, 0) == 20, 29);
    }
    
    #[test]
    fun test_rebuild_vector() {
        let vec = vector[1, 2, 3];
        let result = intro::rebuild_vector(vec, 4);
        assert!(vector::length(&result) == 4, 30);
        assert!(*vector::borrow(&result, 3) == 4, 31);
    }
    
    #[test]
    fun test_ownership_examples() {
        let vec = vector[1, 2, 3];
        let result = intro::ownership_examples(vec);
        assert!(vector::length(&result) == 3, 32);
    }
    
    #[test]
    fun test_reference_rules_demo() {
        let vec = vector[1, 2];
        let len = intro::reference_rules_demo(vec);
        assert!(len == 2, 33);
    }
}