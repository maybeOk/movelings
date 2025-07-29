
#[test_only]
module intro::intro_tests {
    use intro::intro::hello_move;

    #[test]
    fun test_hello_world() {
        let result = hello_move();
        assert!(result == b"Hello, Move!", 0);
    }
}

