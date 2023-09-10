module Parity (
    input [31:0] pattern,
    output parity
);

    assign parity = ^ pattern;
endmodule