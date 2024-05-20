# FPGA Vector Math

This project contains Verilog code for performing vector math operations on FPGA. It includes modules for dot product calculation and element-wise multiplication.

## Project Structure

The project is organized into two main directories:

- `dot_product/`: Contains the Verilog code for calculating the dot product of two vectors. It includes the following files:
  - `dot_product.v`: The main module for the dot product calculation.
  - `element-wise_multiplication.v`: A helper module used in the dot product calculation.
  - `reduction_tree.v`: Another helper module used in the dot product calculation.
  - `tb_dot_product.v`: The testbench for the dot product module.
  - `dot_product_tb`: Contains additional testbench information.

- `element-wise_multiplication/`: Contains the Verilog code for performing element-wise multiplication of two vectors. It includes the following files:
  - `element-wise_multiplication.v`: The main module for the element-wise multiplication.
  - `tb_element-wise_multiplication.v`: The testbench for the element-wise multiplication module.
  - `element-wise_multiplication_tb`: Contains additional testbench information.

## Getting Started

To run the testbenches, you will need a Verilog simulator such as Icarus Verilog. Once you have that installed, you can run a testbench using the following command:

### 1. Compile the code
```sh
iverilog -o testbench.vvp tb_dot_product.v dot_product.v element-wise_multiplication.v reduction_tree.v
```

### 2. Run the test bench
```sh
vvp testbench.vvp
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details. 
