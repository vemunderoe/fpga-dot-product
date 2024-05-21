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

### 1. Test bench of Element-wise multiplication using Icarus Verilog
#### 1.1 Move into element-wise multiplication module
```sh
cd element-wise_multiplcation
```

#### 1.2 Compile code
```sh
iverilog -o testbench.vvp element-wise_multiplication.v tb_element-wise_multiplication.v
```

#### 1.3 Run the test bench
```sh
vvp testbench.vvp
```

### 2. Test bench of dot product using Icarus Verilog
#### 2.1 Move into dot product module
```sh
cd dot_product
```

#### 2.2 Compile code
```sh
iverilog -o testbench.vvp tb_dot_product.v dot_product.v element-wise_multiplication.v reduction_tree.v
```

#### 2.3 Run the test bench
```sh
vvp testbench.vvp
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details. 
