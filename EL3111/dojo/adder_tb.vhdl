entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
  --Component declarations
  component adder
    port (i0, i1: in bit; ci: in bit; s: out bit; co: out bit);
  end component;

  --specify which entity is bound with the component
  for adder_0: adder use entity work.adder;
  signal i0, i1, ci, s, co : bit;

begin
  --Component instantiation
  adder_0: adder port map (i0=>i0,i1=>i1,ci=>ci,s=>s,co=>co);

  --Real work by this process
  process
    type pattern_type is record
      i0,i1,ci:bit;
      s,co: bit;
    end record;
    --the patterns to apply
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
      (('0', '0', '0', '0', '0'),
      ('0', '0', '1', '1', '0'),
      ('0', '1', '0', '1', '0'),
      ('0', '1', '1', '0', '1'),
      ('1', '0', '0', '1', '0'),
      ('1', '0', '1', '0', '1'),
      ('1', '1', '0', '0', '1'),
      ('1', '1', '1', '1', '1'));
  begin
    --check each pattern
    for i in patterns'range loop
      --set inputs
      i0 <= patterns(i).i0;
      i1 <= patterns(i).i1;
      ci <= patterns(i).ci;

      --wait for results
      wait for 1 ns;

      --check the outputs
      assert s = patterns(i).s
        report "bad sum value" severity error;
      assert co = patterns(i).co
        report "bad carry out value" severity error;
    end loop;
    assert false report "end of test" severity note;

    --wait forever to finish simulation
    wait;
  end process;
end behav;
