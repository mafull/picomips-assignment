package cpuConfig;
    
    // Uncomment to enable 7-seg displays and clock LED
    `define DEMO_MODE


    // CPU parameters
    parameter N      = 8;   // Data bus width 
    parameter A_SIZE = 2;   // ALU function width
    parameter O_SIZE = 3;   // OpCode width
    parameter P_SIZE = 4;   // Program memory address width
    parameter R_SIZE = 2;   // GPR address width


    // OpCodes
    typedef enum logic [(O_SIZE-1):0] {
        LDI,    // 000 Load immediate
        LDS,    // 001 Load from switches
        ADD,    // 010 Add
        ADDI,   // 011 Add immediate
        MUL,    // 100 Multiply
        MULI,   // 101 Multiply immediate
        WAIT0,  // 110 Wait for SW8 to be 0
        WAIT1   // 111 Wait for SW8 to be 1
    } opCode_t;


    // ALU functions
    typedef enum logic [(A_SIZE-1):0] {
        ALU_A,      // 00
        ALU_B,      // 01
        ALU_ADD,    // 10
        ALU_MUL     // 11
    } aluFunc_t;

    
endpackage
