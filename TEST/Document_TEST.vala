public class Document_TEST {
    public void run() {
         // Create a document
        Document document1 = new Document("Document 1");
        Document document2 = new Document("Document 2");

        // Create some entries
        Entry entry1 = new Entry();
        Entry entry2 = new Entry();
        Entry entry3 = new Entry();

        // Add entries to the documents
        document1.add(entry1);
        document1.add(entry2);
        document2.add(entry3);

        // Print information about the documents and entries
        stdout.printf("Document 1 ID: %d\n", document1.get_id());
        document1.print_entry();
        
        stdout.printf("Document 2 ID: %d\n", document2.get_id());
        document2.print_entry();
    }
}
