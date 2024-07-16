module ALU (
    input [3:0] A,      // Operando A de 4 bits
    input [3:0] B,      // Operando B de 4 bits
    input [2:0] ALU_Sel, // Selección de la operación de 3 bits
    output reg [3:0] ALU_Result, // Resultado de 4 bits
    output Zero       // Indicador de cero
);

always @(*) begin
    case(ALU_Sel)
        3'b000: ALU_Result = A + B;      // Suma
        3'b001: ALU_Result = A - B;      // Resta
        3'b010: ALU_Result = A & B;      // AND bit a bit
        3'b011: ALU_Result = A | B;      // OR bit a bit
        3'b100: ALU_Result = A ^ B;      // XOR bit a bit
        3'b101: ALU_Result = ~(A | B);   // NOR bit a bit
        3'b110: ALU_Result = A << 1;     // Desplazamiento a la izquierda
        3'b111: ALU_Result = A >> 1;     // Desplazamiento a la derecha
        default: ALU_Result = 4'b0000;   // Valor por defecto
    endcase
end

assign Zero = (ALU_Result == 4'b0000) ? 1 : 0;

endmodule
