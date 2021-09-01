#include "../include/devilibc.h"

int main(int argc, char** argv, char** envp) {
	int i;
	println("ARGV:");
	for (i = 0; i < argc; i++) {
		println(argv[i]);
	}
	
	println("ENVP:");
	for(i = 0; envp[i]; i++) {
		println(envp[i]);
	}
	
	return 0;
}
