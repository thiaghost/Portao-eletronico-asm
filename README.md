# README

## Visão Geral
Este código em Assembly para um microcontrolador AVR implementa um sistema de controle para abrir e fechar um dispositivo, como uma porta ou um portão, utilizando entradas e saídas digitais. O funcionamento é baseado em leituras de sensores que detectam a posição do dispositivo, alternando entre os estados "fechado", "abrindo", "aberto" e "fechando".

## Requisitos de Hardware
- Microcontrolador AVR (ex: ATmega328)
- Sensores de posição (ex: interruptores de limite)
- Atuador (ex: motor ou servo motor)
- Fonte de alimentação adequada
- Fios de conexão

## Funcionalidades
- **Controle de Estados**: O código controla os estados do dispositivo (fechado, abrindo, aberto e fechando) com base nas leituras dos sensores.
- **Leitura de Sensores**: Utiliza entradas digitais para detectar se o dispositivo está aberto ou fechado.
- **Delay Configurável**: Implementa um atraso durante o estado "aberto" para garantir a operação correta do dispositivo.

## Estrutura do Código

### Reset e Inicialização
- **`RESET`**: Inicializa o ponteiro da pilha (Stack Pointer) para o final da memória RAM.
- **`INIT`**: Configura as portas de entrada e saída:
  - Define o pino PD2 como saída (para controle do atuador).
  - Define os pinos PB1, PD5, PD6 e PC5 como entradas para leitura dos sensores.

### Loop Principal (`MAIN`)
- O loop principal gerencia os estados do dispositivo:
  - **FECHADO**: Aguarda até que o sensor (PC5) indique que o dispositivo está fechado.
  - **ABRINDO**: Ativa o atuador (pino PD2) para abrir o dispositivo e aguarda a confirmação do sensor (PD5).
  - **ABERTO**: Desativa o atuador e executa um atraso configurável (3.000.000 ciclos).
  - **FECHANDO**: Ativa o atuador para fechar o dispositivo e aguarda a confirmação do sensor (PB3).

### Função de Delay (`DELAY`)
- Implementa um atraso utilizando um loop baseado em contagem. O tempo de atraso é determinado pelos valores carregados nos registradores R16, R17 e R18.

## Como Funciona
1. **Inicialização**: O microcontrolador é inicializado, configurando os pinos de entrada e saída.
2. **Controle de Estados**: O sistema verifica continuamente o estado do dispositivo usando sensores, alternando entre abrir e fechar conforme necessário.
3. **Atraso Durante Abertura**: Quando o dispositivo está aberto, um atraso é implementado para garantir que ele permaneça nesse estado por um tempo predefinido.

## Compilação e Uso
- Para compilar e carregar o código, utilize um ambiente de desenvolvimento compatível com AVR, como AVR-GCC, e um programador (ex: USBasp).
- Conecte o microcontrolador aos sensores e ao atuador.
- Após programar o microcontrolador, o sistema começará a operar automaticamente, controlando a abertura e o fechamento do dispositivo conforme as leituras dos sensores.

## Notas
- Certifique-se de que as conexões estão corretas e que a fonte de alimentação é adequada para o atuador.
- Os valores de delay podem ser ajustados conforme necessário para diferentes aplicações.
- Este código assume que os sensores estão funcionando corretamente e que estão posicionados adequadamente para detectar as posições do dispositivo.
