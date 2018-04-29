package cpuConfig;

    // CPU parameters
    parameter N      = 8;   // Data bus width 
    parameter A_SIZE = 2;   // ALU function width
    parameter O_SIZE = 4;   // OpCode width
    parameter P_SIZE = 5;   // Program memory address width
    parameter R_SIZE = 4;   // GPR address width


    // OpCodes
    typedef enum logic [(O_SIZE-1):0] {
        NOP,    // 0000
        LDI,    // 0001
        ADD,    // 0010
        ADDI,   // 0011
        MUL     // 0100
    } opCode_t;


    // ALU functions
    typedef enum logic [(A_SIZE-1):0] {
        ALU_A,      // 00
        ALU_B,      // 01
        ALU_ADD,    // 10
        ALU_MUL     // 11
    } aluFunc_t;

    
endpackage
