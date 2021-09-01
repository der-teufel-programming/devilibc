.section .text
.extern main
.extern exit

.globl _start

_start:
	# set base stack frame
	xorl %ebp, %ebp

	# setup argc, argv and envp
	# calculate envp address
	movl (%esp), %edx
	shl $2, %edx
	addl $8, %edx
	addl %esp, %edx
	
	# load argv and argc
	leal 4(%esp), %ecx
	movl (%esp), %eax 

	pushl %edx
	pushl %ecx
	pushl %eax
	
	# call main function
	call main
	
	# push exit code and call exit (sys_exit)
	pushl %eax
	call exit
