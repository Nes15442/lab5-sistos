cmd_arch/x86/kernel/vsyscall-syms.o := gcc -m32 -m elf_i386 -nostdlib -r -Wl,-T,arch/x86/kernel/vsyscall_32.lds arch/x86/kernel/vsyscall-sysenter_32.o arch/x86/kernel/vsyscall-note_32.o -o arch/x86/kernel/vsyscall-syms.o
