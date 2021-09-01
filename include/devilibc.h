#ifndef __DEVILIBC_H__
#define __DEVILIBC_H__

//print
extern int print(char* str);
extern int println(char* str);

// syscalls wrappers
#include "devil_syscalls.h"

// string operations
#include "devil_string.h"

#endif
