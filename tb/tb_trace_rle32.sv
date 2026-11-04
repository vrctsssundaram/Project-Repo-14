module tb_trace_rle32;
    reg clk=0; always #5 clk=~clk;
    reg rst_n=0,s_valid=0,s_last=0,m_ready=0;
    reg [31:0] s_data=0;
    wire s_ready,m_last,m_valid;
    wire [31:0] m_data,input_samples,output_runs;
    wire [7:0] m_count;
    integer got=0;
    trace_rle32 dut(.*);
    always @(posedge clk) if(rst_n && m_valid && m_ready) begin
        case(got)
            0: if(m_data!==32'h55aa || m_count!==3 || m_last) $fatal(1,"Run A");
            1: if(m_data!==32'hddcc || m_count!==2 || m_last) $fatal(1,"Run B");
            2: if(m_data!==32'h1234 || m_count!==1 || !m_last) $fatal(1,"Final run");
            default: $fatal(1,"Unexpected run");
        endcase
        got=got+1;
    end
    task sample(input [31:0] d,input last);
        begin
            @(negedge clk);
            s_data=d;s_last=last;s_valid=1;
            @(posedge clk);
            while(!s_ready) @(posedge clk);
            @(negedge clk);s_valid=0;s_last=0;
        end
    endtask
    initial begin
        repeat(3) @(negedge clk);rst_n=1;
        sample(32'h55aa,0);
        sample(32'h55aa,0);
        sample(32'h55aa,0);
        fork
            begin
                sample(32'hddcc,0);
                sample(32'hddcc,0);
                sample(32'h1234,1);
            end
            begin
                wait(m_valid);
                repeat(3) begin
                    @(negedge clk);
                    if(!m_valid || m_data!==32'h55aa || m_count!==3 || m_last)
                        $fatal(1,"Compressed output changed under stall");
                end
                m_ready=1;
            end
        join
        wait(got==3);
        @(negedge clk);
        if(input_samples!==6 || output_runs!==3) $fatal(1,"Compression counters");
        $display("PASS: lossless RLE runs, packet marker, input stall and output backpressure");
        $finish;
    end
    initial begin #100000;$fatal(1,"Watchdog");end
endmodule
