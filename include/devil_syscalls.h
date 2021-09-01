#ifndef __SYSCALLS_H__
#define __SYSCALLS_H__

extern void exit(int status);
extern long write(unsigned int fd, char* data, long count);

#endif
