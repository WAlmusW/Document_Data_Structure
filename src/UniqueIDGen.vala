using GLib;

public class UniqueID {
    private uint32 timestamp;
    private uint8[] random_data = new uint8[5];
    
    private uint8 counter_1 = 0;
    private uint8 counter_2 = 0;
    private uint8 counter_3 = 0;

    public uint8[] uid = new uint8[12]; // Unique identifier, 12 bytes

    public uint8[] uid_generator() {
        // Generate a 4-byte timestamp (assuming it's a Unix timestamp)
        this.timestamp = (uint32) new DateTime.now().to_unix();

        // Generate 5 bytes of random data
        for (int i = 0; i < 5; i++) {
            this.random_data[i] = (uint8)Random.int_range(0, 256);
        }

        // Combine the components into a 12-byte unique identifier
        uid[0] = (uint8)((this.timestamp >> 0) & 0xFF);
        uid[1] = (uint8)((this.timestamp >> 8) & 0xFF);
        uid[2] = (uint8)((this.timestamp >> 16) & 0xFF);
        uid[3] = (uint8)((this.timestamp >> 24) & 0xFF);

        for (int i = 0; i < 5; i++) {
            uid[4 + i] = this.random_data[i];
        }

        // The counter is based on document, each document have different counter 
        uid[11] = counter_1;
        uid[10] = counter_2;
        uid[9] = counter_3;

        this.increment_uniqueid();

        return uid;
    }

    private void increment_uniqueid() {
        // Increment the counters independently
        counter_1 = (counter_1 + 1) % 256;
        if (counter_1 == 0) {
            counter_2 = (counter_2 + 1) % 256;
            if (counter_2 == 0) {
                counter_3 = (counter_3 + 1) % 256;
            }
        }
    }
}