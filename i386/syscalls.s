.globl write, exit
# sys_write wrapper
# see `man write`
.type write, @function
write:
	pushl %ebx	
	movl $4, %eax
	movl 8(%esp), %ebx # fd
	movl 12(%esp), %ecx # buf
	movl 16(%esp), %edx # count
	int $0x80
	popl %ebx
	leave
	ret

.type exit,@function
exit:
	pushl %ebx
	movl 8(%esp), %ebx
	#sys_exit
	movl $1, %eax
	int $0x80
	popl %ebx
	ret
