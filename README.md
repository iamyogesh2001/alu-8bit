# 8-Bit ALU Readme


## Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU) using Vivaldi Xilinx. The ALU is designed to perform various functions, including addition, subtraction, comparison (less than), and several logical operations such as OR. The implementation incorporates five primary functions.


## Xilinx Installation

To use and simulate this 8-bit ALU project:

1. **Download Xilinx Vivado**: Visit the official Xilinx website and download the Vivado Design Suite.

2. **Installation**: Follow the installation instructions provided by Xilinx for your operating system.

3. **License Configuration**: Ensure proper licensing for Vivado to unlock all features.

4. **Project Setup**: Open Vivado and create a new project. Import the project files and set up the simulation environment.

5. **Simulation**: Run the simulation to validate the ALU functionality, keeping an eye on the subtraction function for any anomalies.

Now you are ready to explore and simulate the 8-bit ALU using Xilinx Vivado.


## Functions

1. **Addition**: The ALU successfully performs addition operations, generating accurate results.

2. **Subtraction**: While the ALU successfully handles addition, there seems to be an issue with subtraction. Further investigation is required to address this issue and obtain correct results.

3. **Comparison (Less Than)**: The ALU compares inputs and outputs a signal indicating whether the first input is less than the second.

4. **Logical OR**: The ALU performs logical OR operations with precision, providing accurate results.

5. **Additional Logical Functions**: The ALU includes other logical operations to enhance functionality.


## Output

The output netlist diagram is included, showcasing the connections and components of the designed ALU. Please refer to the provided diagram to visualize the architecture.


## Known Issues

- **Subtraction Output Issue**: The subtraction function is currently experiencing issues, and the correct output is not obtained. Future updates will address and resolve this problem.


## How to Use

1. **Inputs**: Provide two 8-bit binary numbers as input to the ALU.

2. **Function Selection**: Choose the desired operation by configuring the ALU for addition, subtraction, comparison, or logical operations.

3. **Output**: Review the output to ensure correct results for all operations except subtraction.


## Contact and Support

For inquiries, Please contact Psund@uic.edu, yrethi2@uic.edu, bjenip2@uic.edu.

## Citation
https://eater.net/8bit/alu

https://vlsimaster.wordpress.com/2013/01/26/verilog-code-for-8-bit-ripple-carry-ad der-and-testbench/

https://www.linkedin.com/in/christinediembui/

Thank you for using our 8-bit ALU implementation. We appreciate your feedback and contributions.
