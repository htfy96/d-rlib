module main;
import testutil.write;
import rlib;

@nogc:
nothrow:

@safe
extern(C)
void main(int argc, char** argv) {
    ubyte[365] buf = 2;
    for (size_t i=0; i<365; ++i)
        assert(buf[i] == 2);
    {
        // should set 1:11 to 3
        auto ret = memset(&buf[1], 3, 10);
        assert(buf[1] == 3);
        assert(buf[10] == 3);
        assert(buf[5] == 3);
        assert(buf[0] == 2);
        assert(buf[11] == 2);
        assert(ret == &buf[1]);
    }

    {
        // 51 should be 2
        // 52:61 should be 3
        auto ret = memcpy(&buf[51], &buf[0], 10);
        assert(buf[51] == 2);
        assert(buf[52] == 3);
        assert(buf[53] == 3);
        assert(buf[60] == 3);
        assert(buf[61] == 2);
        assert(&buf[51] == ret);
    }

    {
        assert(0 == memcmp(&buf[70], &buf[75], 10));
        assert(1 == memcmp(&buf[0], &buf[50], 10)); // 23333 vs 22333
        assert(-1 == memcmp(&buf[0], &buf[1], 2)); // 23333 vs 33333
    }
    print("Test OK!\n");
}
