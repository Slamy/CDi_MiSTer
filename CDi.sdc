derive_pll_clocks
derive_clock_uncertainty

# core specific constraints

set_false_path -from {*|flag_cross_domain*|flagtoggle_clk_a*} -to {*|flag_cross_domain*|synca_clk_b*}
