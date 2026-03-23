library ieee;
use ieee.std_logic_1164.all;

entity tg68kdotc_verilog_wrapper is
  port (
      clk            : in std_logic;
      nReset         : in std_logic:='1';
      clkena_in      : in std_logic:='1';
      data_in        : in std_logic_vector(15 downto 0);
      IPL            : in std_logic_vector(2 downto 0):="111";
      IPL_autovector : in std_logic:='0';
      addr_out       : out std_logic_vector(31 downto 0);
      berr           : in std_logic:='0';
      FC             : out std_logic_vector(2 downto 0);
      data_write     : out std_logic_vector(15 downto 0);
      busstate       : out std_logic_vector(1 downto 0);
      nWr            : out std_logic;
      nUDS, nLDS     : out std_logic;
      nResetOut      : out std_logic;
      skipFetch      : out std_logic;
      d0					: out std_logic_vector(31 downto 0);
      d1					: out std_logic_vector(31 downto 0);
      d2					: out std_logic_vector(31 downto 0);
      d3					: out std_logic_vector(31 downto 0);
      d4					: out std_logic_vector(31 downto 0);
      d5					: out std_logic_vector(31 downto 0);
      d6					: out std_logic_vector(31 downto 0);
      d7					: out std_logic_vector(31 downto 0);
      a0					: out std_logic_vector(31 downto 0);
      a1					: out std_logic_vector(31 downto 0);
      a2					: out std_logic_vector(31 downto 0);
      a3					: out std_logic_vector(31 downto 0);
      a4					: out std_logic_vector(31 downto 0);
      a5					: out std_logic_vector(31 downto 0);
      a6					: out std_logic_vector(31 downto 0);
      a7					: out std_logic_vector(31 downto 0)
  );
end entity;

architecture themagic of tg68kdotc_verilog_wrapper is
begin

  tg68kdotcinst: entity work.TG68KdotC_Kernel
    port map (
      CPU => "01",
      clk => clk,
      clkena_in => clkena_in,
      nReset => nReset,
      data_in => data_in,
      IPL => IPL,
      IPL_autovector => IPL_autovector,
      addr_out => addr_out,
      berr => berr,
      FC => FC,
      data_write => data_write,
      busstate => busstate,
      nWr => nWr,
      nUDS => nUDS,
      nLDS => nLDS,
      nResetOut => nResetOut,
      skipFetch => skipFetch,
      d0 => d0,
      d1 => d1,
      d2 => d2,
      d3 => d3,
      d4 => d4,
      d5 => d5,
      d6 => d6,
      d7 => d7,
      a0 => a0,
      a1 => a1,
      a2 => a2,
      a3 => a3,
      a4 => a4,
      a5 => a5,
      a6 => a6,
      a7 => a7
    );

end architecture;
