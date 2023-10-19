using GLib;
using Gee;

public class Document {
    private static int counter = 0;
    private int id;
    public string name;
    public int64 created_at;
    public int64 updated_at;
    public UnrolledLinkedList<Entry> entries;

    private UniqueID uid_gen = new UniqueID();

    public Document(string name) {
        this.name = name;
        this.id = counter++;
        this.entries = new UnrolledLinkedList<Entry>();
        this.created_at = get_real_time() / 1000000;
        this.updated_at = get_real_time() / 1000000;
    }

    public int get_id() {
        return id;
    }

    public void add(Entry entry) {
        entry.set_uid(uid_gen.uid_generator());
        this.entries.add(entry);
        this.updated_at = get_real_time() / 1000000;
    }

    public void print_entry() {
        stdout.printf("Created At: %lld \n", this.created_at);
        stdout.printf("Updated At: %lld \n", this.updated_at);
        foreach(Entry item in this.entries) {
            item.print_values();
        }
    }
}
