library verilog;
use verilog.vl_types.all;
entity Register_file is
    port(
        WrData          : in     vl_logic_vector(15 downto 0);
        Address         : in     vl_logic_vector(3 downto 0);
        WrEn            : in     vl_logic;
        RdEn            : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        RdData          : out    vl_logic_vector(15 downto 0)
    );
end Register_file;
