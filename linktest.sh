#!/bin/bash
cc -nostdlib -nodefaultlibs -lgcc -nostdinc -o "$DUB_TARGET_PATH/lib$DUB_TARGET_NAME.a" -o "$DUB_TARGET_PATH/$DUB_TARGET_NAME"
