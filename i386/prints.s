.globl print, println
.type print, @function
# write string to stdout
# assume byte 0 ends the string
print:
	# prologue: callee saving
	pushl %ebx
	pushl %edi

	# load argument into edi for length calc
	movl 12(%esp), %edi
	# set eax and ecx to -1
	xorl %eax, %eax
	xorl %ecx, %ecx
	notl %ecx
	# determine string length
	cld
	repne scasb
	notl %ecx
	dec %ecx
	# write to stdout
	movl $4, %eax
	movl $1, %ebx
	movl %ecx, %edx
	movl 12(%esp), %ecx
	int $0x80
	
	# epilogue: cleanup
	popl %edi
	popl %ebx
	
	ret

.type println, @function
# write string followed by newline to stdout
# assume byte 0 ends the string
println:
	# prologue: callee saving
	pushl %ebx

	# call print
	pushl 8(%esp)
	call print
	# write newline to stdout
	pushl $10
	movl $4, %eax
	movl $1, %ebx
	movl %esp, %ecx
	movl $1, %edx
	int $0x80
	# epilogue: cleanup
	addl $8, %esp
	popl %ebx
	
	ret
