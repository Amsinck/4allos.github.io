#include "memory_manager.h"
#include "process_manager.h"
#include <stdio.h>

// Função principal de inicialização do Kernel
void kernel_init() {
    printf("Inicializando o kernel...\n");

    // Inicializa o gerenciador de memória
    init_memory_manager();

    // Inicializa o gerenciador de processos
    init_process_manager();

    // Exibe mensagem de sucesso
    printf("Kernel iniciado com sucesso.\n");
}

int main() {
    kernel_init();

    // Aqui iniciamos o sistema operacional (módulos adicionais)
    return 0;
}
