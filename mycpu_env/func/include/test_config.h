// ==========================================================================================================================
// exp6         : n1~n20  SHORT_TEST1 1 NOP_INSERT 0 TEST1 1 TEST2 0 TEST3 0 TEST4 0 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp7         : n1~n20  SHORT_TEST1 0 NOP_INSERT 1 TEST1 1 TEST2 0 TEST3 0 TEST4 0 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp8~9       : n1~n20  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 0 TEST3 0 TEST4 0 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp10        : n1~n36  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 0 TEST4 0 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp11        : n1~n46  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 0 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp12        : n1~n47  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 1 TEST5 0 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp13~16     : n1~n58  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 1 TEST5 1 TEST6 0 TEST7 0 TEST8 0 TEST9 0
// exp18        : n1~n70  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 1 TEST5 1 TEST6 1 TEST7 0 TEST8 0 TEST9 0
// exp19, 21~22 : n1~n72  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 1 TEST5 1 TEST6 1 TEST7 1 TEST8 0 TEST9 0 
// exp23        : n1~n79  SHORT_TEST1 0 NOP_INSERT 0 TEST1 1 TEST2 1 TEST3 1 TEST4 1 TEST5 1 TEST6 1 TEST7 1 TEST8 1 TEST9 0
// ==========================================================================================================================

//==================================================================
//SHORT_TEST1: less test case for n1~n20.
//             Only set for exp6.
//==================================================================
#define SHORT_TEST1 0

//==================================================================
//NOP_INSERT: Insert 4 nop insts between every alu operation.
//            Only set for exp7.
//==================================================================
#define NOP_INSERT 0

#define TEST1 1
#define TEST2 1
#define TEST3 1
#define TEST4 1
#define TEST5 1
#define TEST6 1
#define TEST7 1
#define TEST8 1
#define TEST9 1

