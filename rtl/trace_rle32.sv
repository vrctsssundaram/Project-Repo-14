module trace_rle32 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] s_data,
    input  wire        s_last,
    input  wire        s_valid,
    output wire        s_ready,
    output wire [31:0] m_data,
    output wire [7:0]  m_count,
    output wire        m_last,
    output wire        m_valid,
    input  wire        m_ready,
    output reg  [31:0] input_samples,
    output reg  [31:0] output_runs
);
    localparam COLLECT=1'b0, EMIT=1'b1;
    reg state;
    reg have_run;
    reg [31:0] run_data;
    reg [7:0] run_count;
    reg run_last;
    wire extend_run = have_run && s_data==run_data && run_count!=8'hff;
    assign s_ready = (state==COLLECT) && (!have_run || extend_run);
    assign m_data = run_data;
    assign m_count = run_count;
    assign m_last = run_last;
    assign m_valid = (state==EMIT);

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= COLLECT;
            have_run <= 0;
            run_data <= 0;
            run_count <= 0;
            run_last <= 0;
            input_samples <= 0;
            output_runs <= 0;
        end else begin
            if(state==COLLECT) begin
                if(s_valid && !s_ready) state <= EMIT;
                else if(s_valid && s_ready) begin
                    input_samples <= input_samples + 1'b1;
                    if(!have_run) begin
                        run_data <= s_data;
                        run_count <= 1;
                        have_run <= 1;
                    end else run_count <= run_count + 1'b1;
                    if(s_last) begin
                        run_last <= 1;
                        state <= EMIT;
                    end
                end
            end else if(m_ready) begin
                output_runs <= output_runs + 1'b1;
                state <= COLLECT;
                have_run <= 0;
                run_count <= 0;
                run_last <= 0;
            end
        end
    end
endmodule
