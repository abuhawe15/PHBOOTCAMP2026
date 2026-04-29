`default_nettype none

module gradient_rom(
    input  wire [5:0] c,     // Character index
    input  wire [3:0] y,     // Row index 0-11
    input  wire [2:0] x,     // Column index 0-7
    output reg        pixel
);

    reg [7:0] rb;

    always @(*) begin
        case (c % 12)

            // =====================
            // AARON BUHAWE
            // =====================

            0, 1, 9: begin // A
                case (y)
                    2:       rb = 8'h3C;
                    3, 4, 5: rb = 8'h66;
                    6, 7:    rb = 8'hFF;
                    8, 9, 10:rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            2: begin // R
                case (y)
                    2, 6:    rb = 8'hFC;
                    3, 4, 5: rb = 8'hC6;
                    7:       rb = 8'hD8;
                    8:       rb = 8'hCC;
                    9, 10:   rb = 8'hC6;
                    default: rb = 8'h00;
                endcase
            end

            3: begin // O
                case (y)
                    2, 10:   rb = 8'h3C;
                    3, 9:    rb = 8'h66;
                    4, 5, 6, 7, 8:
                             rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            4: begin // N
                case (y)
                    2, 3:    rb = 8'hC6;
                    4:       rb = 8'hE6;
                    5:       rb = 8'hF6;
                    6:       rb = 8'hDE;
                    7:       rb = 8'hCE;
                    8, 9, 10:rb = 8'hC6;
                    default: rb = 8'h00;
                endcase
            end

            5: begin // Space
                rb = 8'h00;
            end

            6: begin // B
                case (y)
                    2, 6, 10:rb = 8'hFC;
                    3, 4, 5: rb = 8'hC6;
                    7, 8, 9: rb = 8'hC6;
                    default: rb = 8'h00;
                endcase
            end

            7: begin // U
                case (y)
                    2, 3, 4, 5, 6, 7, 8, 9:
                             rb = 8'hC3;
                    10:      rb = 8'h7E;
                    default: rb = 8'h00;
                endcase
            end

            8: begin // H
                case (y)
                    2, 3, 4, 5:
                             rb = 8'hC3;
                    6, 7:    rb = 8'hFF;
                    8, 9, 10:rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            10: begin // W
                case (y)
                    2, 3, 4, 5, 6:
                             rb = 8'hC3;
                    7:       rb = 8'hDB;
                    8:       rb = 8'hFF;
                    9:       rb = 8'hE7;
                    10:      rb = 8'hC3;
                    default: rb = 8'h00;
                endcase
            end

            11: begin // E
                case (y)
                    2, 3:    rb = 8'hFC;
                    4, 5:    rb = 8'hC0;
                    6, 7:    rb = 8'hF8;
                    8, 9:    rb = 8'hC0;
                    10:      rb = 8'hFC;
                    default: rb = 8'h00;
                endcase
            end

            default: begin
                rb = 8'h00;
            end

        endcase

        pixel = rb[7 - x];
    end

endmodule
