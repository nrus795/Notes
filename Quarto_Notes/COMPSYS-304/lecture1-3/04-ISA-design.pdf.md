# Instruction Set Architecture Design

## [Comparing different Instruction Set Architectures.]{color="red"}

[**Which one is the best? (for our example: C = A + B)**]{color="red"}

::: {.cell cache='false' execution_count=1}

::: {.cell-output .cell-output-display}
![](04-ISA-design_files/figure-pdf/isa-table-output-1.pdf){#isa-table fig-align='center'}
:::
:::


:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, coltitle=boxtitlecol, colbacktitle=boxheadcol, title=Basic ISA Classes"}
Instruction set architectures (ISA) are generally classified based on:
- the instruction word size (how many bytes for encoding each instruction)
- the number of different instructions in the ISA
- the number of clock cycles required to complete each instruction (which can be implementation dependent)
:::

:::{.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Based on that, the following have been specified as different ISA classes:

- [**RISC**]{color=red} (Reduced Instruction Set Computers): where the size of the instruction word for all instructions are the same. This may lead to simpler decoding hardware. For example, **MIPS** (or RISC-V) processors use this type of ISA.

- [**CISC**]{color=red} (Complex Instruction Set Computers): where the size of the instruction word may be different for different instructions. This results in more complex decoding hardware but the code footprint (binary code size of the program) can be less. for example, **Intel X86** based processors are based on this type of ISA.

- [**EPIC**]{color=red} (Explicitly Parallel Instruction Computers): In this case, parallel operations are explicitly encoded in the instruction. The compiler plays a more important role in EPIC architectures. For example, **Intel Itanium** is based on this type of ISA.
:::

## Different levels of abstraction [(Software)]{color="red"}

<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









<!-- TODO: implement the diagram from notes -->

:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol"}
An abstraction removes unnecessary detail, helps us cope with the complexity. More hardware details are considered in programming through moving from [**High-Level Language**]{color=red} to [**Machine Language**]{color=red}.
:::

## [Basic steps in a CPU]{color=red} for \underline{Instruction Processing}

::: {layout="[30,70]" fig-pos="H"}
::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}
:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\underline{\\textbf{Fetching}}}"}
\underline{\textbf{Access memory to get the next instruction:}}
Activate memory read signal, place the right memory address on address lines, read the content of memory pointed by the address.
:::
:::
:::

::: {layout="[30,70]" fig-pos="H"}
::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}
:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\underline{\\textbf{Decoding}}}"}
\underline{\textbf{Interpret the bits of the instruction word:}} to identify the operation and its data (which might be taken from memory or registers)
:::
:::
:::

::: {layout="[30,70]" fig-pos="H"}
::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}
:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\underline{\\textbf{Execution}}}"}
\underline{\textbf{Perform that specific operation:}} Use the processor resources to perform the operation and write the result to memory or register if necessary
:::
:::
:::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
- What type of operations are needed?
:::

<!-- ! bloody table... -->

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
- How operands (data) are provided in each instruction?
:::
[**through registers except for \underline{\textit{load}} and \underline{\textit{store}} instructions which will access memory too.**]{color="red"}

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
- Size of Instruction word and Data word?
:::
[**32 bits**]{color=red}

## [\underline{Summary of Our Design Decisions:}]{color=red}
:::{.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
- \underline{\textbf{RISC ISA:}} All instructions have the same size
    - **load/store architecture** (only [*load*]{color=red} and [*store*]{color=red} instructions can access memory).
    - Other instructions use registers
- [**Data word:**]{color=red} 32 bits (4 bytes)
- [**Instruction word:**]{color=red} 32 bits (4 bytes)
- [**Registers**]{color=red} 32 general purpose 32-bit registers
- [**Size of Addressable Memory:**]{color=red} $ 2^32 $ (each memory address is 32 bits)
- [**Operands:**]{color=red} Signed, unsigned, immediate

*To make the implementation simpler and faster, the number of instructions in the ISA should be reduced as much as possible*

ALU operations are performed on:
- data from registers, or
- immediate value (data encoded into the instruction word)
:::

:::{.tcolorbox options="colback=boxbodycol2, colframe=boxheadcol2, title=\\underline{\\textbf{ALU operations}}, coltitle=boxtitlecol2, colbacktitle=boxheadcol2"}
- [**addition**]{color=red}\
**Both input data from registers (signed)** [**add**]{color=red} [***add, Rd, Rs, Rt***]{color=blue}\
**Both input data from registers (unsigned)** [**addu**]{color=red} [***addu, Rd, Rs, Rt***]{color=blue}\
**One input data as immediate value** [**addi**]{color=red} [***addi, Rt, Rs, immed.***]{color=blue}
- [**subtraction**]{color=red}\
**Both input data from registers (signed)** [**sub**]{color=red} [***sub, Rd, Rs, Rt***]{color=blue}\
**Both input data from registers (unsigned)** [**subu**]{color=red} [***subu, Rd, Rs, Rt***]{color=blue}
- [**AND**]{color=red}\
**Both input data from registers (signed)** [**and**]{color=red} [***and, Rd, Rs, Rt***]{color=blue}\
**One input data as immediate value** [**andi**]{color=red} [***andi, Rt, Rs, immed.***]{color=blue}
- [**OR**]{color=red} [**or, ori**]{color=red} 
:::

:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=Shift operations, coltitle=boxtitlecol"}





{{< placeholder >}}









:::{.tcolorbox options="oversize, left=11pt, right=11pt, colback=boxbodycol2, colframe=boxheadcol2, title=Example, coltitle=boxtitlecol2, colbacktitle=boxheadcol2"}
Assume that the contents of register R1 is as follows:\
[**1000 0000 1100 1010 0001 0111 0001 1110**]{color=red}\
After shifting two times to the left the following number is in register R1:\
[**0000 0011 0010 1000 0101 1100 0111 1000**]{color=red}
:::
:::

:::{.tcolorbox options="colback=boxbodycol3, colframe=boxbodycol3"}
[**sll, sllv**]{color=blue} shift left logical [***sllv Rd, Rs, Rt***]{color=red}\
[**srl, srlv**]{color=blue} shift right logical [***srl Rd, Rs, immediate***]{color=red}\
[**sra, srav**]{color=blue} shift right arithmetic [***srav Rd, Rs, Rt***]{color=red}
:::






{{< placeholder >}}









:::{.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Shift instructions can be used in arithmetic operations (multiplying or dividing by a number which is a power of 2). The number of bits to be shifted can be given as a constant value or the contents of the second source register can be used to determine how many bits to be shifted.
:::





{{< pagebreak >}}









[***\underline{A few points to remember:}***]{color=red}

:::{.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
- In the instruction representation (in our case), always the [*destination register*]{color=red} is written first and then the [*source registers*]{color=red} (this convention may be different for other processors).
- Registers in the instructions are represented using \ $reg_num. (for example, register 1 is [\$1]{color=red} and register 15 is [\$15]{color=red}).
- In our ISA (MIPS ISA) the contents of Register 0 (\$0) is 0000 0000 0000 0000 0000 0000 0000 0000 and register \$ cannot be written. (It is hardwired to 0)
:::

## [\underline{\textit{Examples of the MIPS ALU Instructions:}}]{color=red}

:::{.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}

:::
