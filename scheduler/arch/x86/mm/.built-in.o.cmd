cmd_arch/x86/mm/built-in.o :=  ld -m elf_i386 -m elf_i386   -r -o arch/x86/mm/built-in.o arch/x86/mm/init_32.o arch/x86/mm/pgtable_32.o arch/x86/mm/fault_32.o arch/x86/mm/ioremap_32.o arch/x86/mm/extable_32.o arch/x86/mm/pageattr_32.o arch/x86/mm/mmap_32.o arch/x86/mm/highmem_32.o arch/x86/mm/boot_ioremap_32.o
