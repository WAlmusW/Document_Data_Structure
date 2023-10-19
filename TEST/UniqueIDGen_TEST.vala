public class UniqueIDGenerator_TEST {
    public void run() {
        // Create Val objects and add them to Entry objects
        Val val1 = new Val("username", 1);
        Val val2 = new Val("domisili", 10540);
        Val val3 = new Val("phone", 87777);
        Val val4 = new Val("asal", 62);
        Val val5 = new Val("prodi", 13136);

        Entry entry1 = new Entry();
        entry1.add(val1);
        entry1.add(val2);
        entry1.add(val3);
        entry1.add(val4);
        entry1.add(val5);

        // Create more Val objects and add them to another Entry
        Val val6 = new Val("username", 2);
        Val val7 = new Val("domisili", 20000);
        Val val8 = new Val("phone", 88888);
        Val val9 = new Val("asal", 63);
        Val val10 = new Val("prodi", 13137);

        Entry entry2 = new Entry();
        entry2.add(val6);
        entry2.add(val7);
        entry2.add(val8);
        entry2.add(val9);
        entry2.add(val10);

        // Create more Val objects and add them to another Entry
        Val val11 = new Val("username", 3);
        Val val12 = new Val("domisili", 30000);
        Val val13 = new Val("phone", 99999);
        Val val14 = new Val("asal", 64);
        Val val15 = new Val("prodi", 13138);

        Entry entry3 = new Entry();
        entry3.add(val11);
        entry3.add(val12);
        entry3.add(val13);
        entry3.add(val14);
        entry3.add(val15);

        // Create more Val objects and add them to another Entry
        Val val16 = new Val("username", 4);
        Val val17 = new Val("domisili", 40000);
        Val val18 = new Val("phone", 12345);
        Val val19 = new Val("asal", 65);
        Val val20 = new Val("prodi", 13139);

        Entry entry4 = new Entry();
        entry4.add(val16);
        entry4.add(val17);
        entry4.add(val18);
        entry4.add(val19);
        entry4.add(val20);

        // Create Document objects and add Entry objects to them
        Document doc1 = new Document("doc1");
        doc1.add(entry1);

        Document doc2 = new Document("doc2");
        doc2.add(entry2);

        doc1.add(entry4);
        doc2.add(entry3);

        // Print information and test the uid generation
        print("DOC1\n");
        int counter = 0;
        foreach (Entry item in doc1.entries) {
            stdout.printf("%d", counter);
            item.get_uid();
            counter++;
        }
        print("DOC2\n");
        counter = 0;
        foreach (Entry item in doc2.entries) {
            stdout.printf("%d", counter);
            item.get_uid();
            counter++;
        }
    }
}
