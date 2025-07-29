#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_vectors() {
        let empty_vec = intro::create_empty_vector();
        assert!(intro::get_length(&empty_vec) == 0, 1);
        assert!(intro::is_empty(&empty_vec) == true, 2);
        
        let values_vec = intro::create_vector_with_values();
        assert!(intro::get_length(&values_vec) == 5, 3);
        assert!(intro::is_empty(&values_vec) == false, 4);
    }

    #[test]
    fun test_add_and_access_elements() {
        let mut vec = intro::create_empty_vector();
        intro::add_element(&mut vec, 10);
        intro::add_element(&mut vec, 20);
        intro::add_element(&mut vec, 30);
        
        assert!(intro::get_length(&vec) == 3, 5);
        assert!(intro::get_element(&vec, 0) == 10, 6);
        assert!(intro::get_element(&vec, 1) == 20, 7);
        assert!(intro::get_element(&vec, 2) == 30, 8);
    }
    
    #[test]
    fun test_remove_elements() {
        let mut vec = intro::create_vector_with_values();
        let last = intro::remove_last_element(&mut vec);
        
        assert!(last == 5, 9);
        assert!(intro::get_length(&vec) == 4, 10);
        assert!(intro::get_element(&vec, 3) == 4, 11);
    }
    
    #[test]
    fun test_find_and_contains() {
        let vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        
        assert!(intro::find_index(&vec, 3) == 2, 12);
        assert!(intro::find_index(&vec, 10) == 5, 13); // 不存在返回长度
        
        assert!(intro::contains(&vec, 4) == true, 14);
        assert!(intro::contains(&vec, 10) == false, 15);
    }
    
    #[test]
    fun test_sum_and_max() {
        let vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        
        assert!(intro::sum_elements(&vec) == 15, 16); // 1+2+3+4+5=15
        assert!(intro::get_max(&vec) == 5, 17);
    }
    
    #[test]
    fun test_reverse() {
        let mut vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        intro::reverse_vector(&mut vec);
        
        assert!(intro::get_element(&vec, 0) == 5, 18);
        assert!(intro::get_element(&vec, 1) == 4, 19);
        assert!(intro::get_element(&vec, 4) == 1, 20);
    }
    
    #[test]
    fun test_string_vector() {
        let str_vec = intro::create_string_vector();
        assert!(vector::length(&str_vec) == 3, 21);
    }
    
    #[test]
    fun test_append_vectors() {
        let mut vec1 = vector[1, 2];
        let vec2 = vector[3, 4, 5];
        intro::append_vectors(&mut vec1, vec2);
        
        assert!(intro::get_length(&vec1) == 5, 22);
        assert!(intro::get_element(&vec1, 4) == 5, 23);
    }
    
    #[test]
    fun test_create_with_size() {
        let vec = intro::create_vector_with_size(3, 42);
        assert!(intro::get_length(&vec) == 3, 24);
        assert!(intro::get_element(&vec, 0) == 42, 25);
        assert!(intro::get_element(&vec, 2) == 42, 26);
    }
    
    #[test]
    fun test_remove_and_insert() {
        let mut vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        let removed = intro::remove_at_index(&mut vec, 2); // 移除索引2的元素(3)
        
        assert!(removed == 3, 27);
        assert!(intro::get_length(&vec) == 4, 28);
        assert!(intro::get_element(&vec, 2) == 4, 29); // 原来的4现在在索引2
        
        intro::insert_at_index(&mut vec, 1, 99); // 在索引1插入99
        assert!(intro::get_element(&vec, 1) == 99, 30);
        assert!(intro::get_length(&vec) == 5, 31);
    }
    
    #[test]
    fun test_swap_elements() {
        let mut vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        intro::swap_elements(&mut vec, 0, 4); // 交换第0和第4个元素
        
        assert!(intro::get_element(&vec, 0) == 5, 32);
        assert!(intro::get_element(&vec, 4) == 1, 33);
    }
    
    #[test]
    fun test_slice_vector() {
        let vec = intro::create_vector_with_values(); // [1, 2, 3, 4, 5]
        let slice = intro::slice_vector(&vec, 1, 3); // 从索引1开始取3个元素
        
        assert!(intro::get_length(&slice) == 3, 34);
        assert!(intro::get_element(&slice, 0) == 2, 35);
        assert!(intro::get_element(&slice, 1) == 3, 36);
        assert!(intro::get_element(&slice, 2) == 4, 37);
    }
    
    #[test]
    fun test_deduplicate() {
        let mut vec = vector[1, 2, 2, 3, 2, 4, 3];
        intro::deduplicate(&mut vec);
        
        // 应该剩下 [1, 2, 3, 4]
        assert!(intro::get_length(&vec) == 4, 38);
        assert!(intro::contains(&vec, 1) == true, 39);
        assert!(intro::contains(&vec, 2) == true, 40);
        assert!(intro::contains(&vec, 3) == true, 41);
        assert!(intro::contains(&vec, 4) == true, 42);
    }
}