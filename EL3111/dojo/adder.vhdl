entity adder is
    port(i0, i1: in bit; ci: in bit; s: out bit; co: out bit);
end adder;

architecture rtl of adder is
begin
  --computing sum
  s <= i0 xor i1 xor ci;
  --computing carry
  co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end rtl;
