# d-rlib
![Build Status](https://circleci.com/gh/htfy96/d-rlib.png?circle-token=3e02dc78ebf903509690215f7c2a7ce9013f526e)

A dependency-free library of `memcpy/memcmp/memset` in D.

This project aims to be a foundation for those libc-free project, since with `-betterC` the compiler still require these symbols to work.

Currently tested with dmd and ldc. However with `dmd` the visibility of exported symbols is not correctly marked as "hidden".
