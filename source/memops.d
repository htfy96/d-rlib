module rlib;

import core.stdc.stdint: uintptr_t;
@nogc:
nothrow:
@trusted:

private void* _memset_impl(void *dest, int ch, size_t count)
{
    immutable c_char = cast(immutable ubyte)ch;
    auto b_dest = cast(ubyte*)dest;
    for (size_t i=0; i<count; ++i) {
        b_dest[i] = c_char;
    }
    return dest;
}

private void* _memmove_impl(void* dest, const void* src, size_t count)
{
    immutable dest_n = cast(uintptr_t)dest;
    immutable src_n = cast(uintptr_t)src;
    auto p_dst = cast(ubyte*)dest, p_src = cast(ubyte*)src;
    if (src_n < dest_n) {
        while (count > 1) {
            --count;
            p_dst[count] = p_src[count];
        }
    } else {
        for (size_t i=0; i<count; ++i) {
            p_dst[i] = p_src[i];
        }
    }
    return dest;
}

private void* _memcpy_impl(void* dest, const void* src, size_t count)
{
    auto p_dst = cast(ubyte*)dest;
    auto p_src = cast(ubyte*)src;
    for (size_t i=0; i<count; ++i) {
        p_dst[i] = p_src[i];
    }
    return dest;
}

private int _memcmp_impl(const void* p1, const void* p2, size_t count)
{
    immutable b1 = cast(immutable ubyte*)p1, b2 = cast(immutable ubyte*)p2;
    for (size_t i=0; i<count; ++i)
        if (b1[i] != b2[i])
            return (b1[i] - b2[i]);
    return 0;
}

extern(C):

version(LDC) {
    import ldc.attributes;
    @weak void* memset(void *dest, int ch, size_t count) {
        return _memset_impl(dest, ch, count);
    }
    @weak void* memmove(void* dest, const void* src, size_t count) {
        return _memmove_impl(dest, src, count);
    }
    @weak void* memcpy(void* dest, const void* src, size_t count) {
        return _memcpy_impl(dest, src, count);
    }
    @weak int memcmp(const void* p1, const void* p2, size_t count) {
        return _memcmp_impl(p1, p2, count);
    }
} else {
    void* memset(void *dest, int ch, size_t count) {
        return _memset_impl(dest, ch, count);
    }
    void* memmove(void* dest, const void* src, size_t count) {
        return _memmove_impl(dest, src, count);
    }
    void* memcpy(void* dest, const void* src, size_t count) {
        return _memcpy_impl(dest, src, count);
    }
    int memcmp(const void* p1, const void* p2, size_t count) {
        return _memcmp_impl(p1, p2, count);
    }
}

