using Gee;

public class Entry_TEST {
    public void run() {
        // Create an Entry
        Entry entry1 = new Entry();
    
        // Create Val objects and add them to the Entry
        Val val1 = new Val("username", "Alice");
        Val val2 = new Val("domisili", 10540);
        Val val3 = new Val("phone", 87777);
    
        entry1.add(val1);
        entry1.add(val2);
        entry1.add(val3);
    
        // Print the Entry's values
        entry1.print_values();
    
        // Get a specific value by key
        Val retrievedVal = entry1.get_value("domisili");
    
        // Check if a key exists in the Entry
        entry1.has_key("phone");
    
        // Remove a key from the Entry
        entry1.remove_key("username");
    
        // Check if the key was removed
        entry1.has_key("username");
    
        // Create a list of keys to retrieve
        UnrolledLinkedList<string> keysToRetrieve = new UnrolledLinkedList<string>();
        keysToRetrieve.add("domisili");
        keysToRetrieve.add("phone");
    
        // Get values by a list of keys
        UnrolledLinkedList<Val> retrievedValues = entry1.get_value_by_keys(keysToRetrieve);
    
        // Set a UID for the Entry
        uint8[] uid = { 0xAA, 0xBB, 0xCC, 0xDD };
        entry1.set_uid(uid);
    
        // Get and print the UID
        entry1.get_uid();
    }
    
}