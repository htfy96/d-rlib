# d-rlib
A dependency-free library of `memcpy/memcmp/memset` in D.

This project aims to be a foundation for those libc-free project, since with `-betterC` the compiler still require these symbols to work.

Currently tested with dmd and ldc. However with `dmd` the visibility of exported symbols is not correctly marked as "hidden".
