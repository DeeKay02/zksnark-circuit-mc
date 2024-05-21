pragma circom 2.0.0;

/*This circuit inputs A and B, then sends it through the gates.*/  

template CustomCircuitMC () {  

   // Signal inputs
   signal input A;
   signal input B;

   // Internal signals from gates
   signal X;
   signal Y;

   // Final signal output
   signal output Q;

   // Component gates
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // Circuit logics
   andGate.a <== A;
   andGate.b <== B;
   X <== andGate.out;

   notGate.in <== B;
   Y <== notGate.out;

   orGate.a <== X;
   orGate.b <== Y;

   Q <== orGate.out;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = CustomCircuitMC();