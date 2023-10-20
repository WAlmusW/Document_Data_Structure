public class KeyValue_TEST {
    public void run() {
    // Test the constructor with a non-empty key
    Val val1 = new Val("username", "Alice");
    val1.print();

    // Test the constructor with an empty key (should use the default key)
    Val val2 = new Val("", "Bob");
    val2.print();

    // Test the constructor with an empty key (should use the default key)
    Val val3 = new Val("", 42);
    val3.print();

    // Update the value of val1
    val1.update_value(69);

    // Print val1 after updating its value
    val1.print();
    }
}