// Módulo de 1 bit: Full Adder (Sumador Completo)
module full_adder (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

// Módulo principal: Sumador estructural de 4 bits
module adder (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [4:0] sum
);
    // Cables internos para la propagación del acarreo
    logic c1, c2, c3;

    // Instanciación del bit 0 (acarreo inicial cin = 0)
    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),
        .sum(sum[0]),
        .cout(c1)
    );

    // Instanciación del bit 1
    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    // Instanciación del bit 2
    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    // Instanciación del bit 3 (el acarreo final cout va al bit 4 de sum)
    full_adder fa3 (
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(sum[4])
    );

endmodule