using GLib;
using Gee;

public class Val {
    public string key;
    public Variant value;
    private static int Vcounter = 0;

    public Val(string key, Variant value) {
        if (key.length == 0) {
            stdout.printf("Error: Key cannot be empty\n");
            this.key = "DefaultKey_%d".printf(Vcounter++); // Key cannot be empty and must be different
        } else {
            this.key = key;
        }
        this.value = value;
    }

    public void update_value(Variant value) {
        this.value = value;
    }

    public void print() {
        stdout.printf("%s: %s \n", this.key, this.value.print(true));
    }
}