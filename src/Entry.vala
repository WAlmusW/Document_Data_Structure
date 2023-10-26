using GLib;
using Gee;

public class Entry {
    private uint8[] uid;
    public UnrolledLinkedList<Val> values;
    public int64 created_at;
    public int64 updated_at;

    public Entry() {
        this.values = new UnrolledLinkedList<Val>();
        this.created_at = get_real_time() / 1000000;
        this.updated_at = get_real_time() / 1000000;
    }

    // The entry will only given a uid, when the entry enter a document
    public void set_uid(uint8[] uid_gen) {
        this.uid = uid_gen;
    }

    public void get_uid() {
        print("Unique Identifier: ");
        for (int i = 0; i < this.uid.length; i++) {
            stdout.printf("%02X ", this.uid[i]);
        }
        print("\n");
    }

    public void add(Val val) {
        this.values.add(val);
        this.updated_at = get_real_time() / 1000000;
    }

    public void print_values() {
        stdout.printf("Created At: %lld \n", this.created_at);
        stdout.printf("Updated At: %lld \n", this.updated_at);
        foreach(Val item in this.values) {
            item.print();
        }
        print("\n");
    }

    public Val get_value(string key) {
        foreach(Val item in this.values) {
            if(item.key == key) {
                stdout.printf("%s: %s \n", item.key, item.value.print(true));
                return item;
            }
        }
        
        print("Value not Found");
        return null;
    }

    public UnrolledLinkedList<Val> get_value_by_keys(UnrolledLinkedList<string> keys) {
        UnrolledLinkedList<Val> result = new UnrolledLinkedList<Val>();
        foreach(string key in keys) {
            foreach(Val item in this.values) {
                if(item.key == key) {
                    stdout.printf("%s: %s \n", item.key, item.value.print(true));
                    result.add(item);
                    break;
                }
            }
        }

        return result;
    }

    public bool has_key(string key) {
        foreach(Val item in this.values) {
            if(item.key == key) {
                stdout.printf("%s exist in this entry \n", key);
                return true;
            }
        }

        stdout.printf("%s doesn't exist in this entry \n", key);
        return false;
    }

    public void merge(Entry otherEntry) {
        foreach(Val item in otherEntry.values) {
            if(this.has_key(item.key)) {
                this.remove_key(item.key);
                this.add(item);
            } else {
                this.add(item);
            }
        }
    }

    public void remove_key(string key) {
        for(int i = 0; i < this.values.size; i++) {
            if(this.values[i].key == key) {
                this.values.remove_at(i);
                break;
            }
        }
    }
    
    public bool compare(Entry entry) {
        if(this.uid == entry.uid) {
            print("Entry is the same obj");
            return true;
        } 
        
        print("Entry is different");
        return false;
    }

    public void update_value(Val item) {
        if(this.has_key(item.key)) {
            this.remove_key(item.key);
            this.add(item);
        }
    }
}