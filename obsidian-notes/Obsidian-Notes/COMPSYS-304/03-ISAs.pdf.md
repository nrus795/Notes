# [Instruction Set Architecture (ISA)]{color=red}

An ISA is the **interface between hardware and low-level software**

::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=Some modern instruction set architectures:, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
[**80x86**]{color=red}, Itanium, PowerPC, [**MIPS**]{color=red}, SPARC, HP, [**ARM**]{color=red}, [**\underline{RISC-V}**]{color=red}
:::

:::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=Issues with a fixed ISA:, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
-   [**advantage:**]{color=red} different implementations of the same architecture

::: {.tcolorbox options="oversize, left=11pt, right=11pt, colback=boxbodycol2, colframe=boxheadcol2, title=Example, coltitle=boxtitlecol2, colbacktitle=boxheadcol2"}
-   AMD and Intel chips use the same ISA, while their implementations are different.
-   Pentium II and Celeron have different memory systems and different clock rates.
-   Core i7, Core i5, Core i3, and Atom are different implementations of the same ISA (ignoring some ISA extensions).
:::

-   [**disadvantage:**]{color=red} sometimes prevents using new innovations.

::::

[**\underline{ISA design:}**]{color=red} [\textbf{What is needed to be included in each \textit{\underline{machine instruction?}}}]{color=blue}

1.  What operation is to be performed by the CPU.

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
arithmetic/logic operations, data transfer, control transfer, etc.
:::

2.  How data for the operation can be provided.

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
through memory, through CPU registers, encoded in the instruction word
:::

3.  How the result is to be stored.

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
in memory or register
:::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=\\textcolor{red}{\\textbf{Therefore, the ISA must define:}}, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
-   The operation to be performed (***opcode***)
-   Data type and size of operands
-   Location of operands and results
-   Instruction format or Encoding
:::





{{< pagebreak >}}








## Classifying Instruction Set Architectures

Each instruction has (an) [**opcode**]{color=red} which defines the type of operation and may have zero to three [**operands**]{color=red} for input data and the result destination.

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
The type storage used for operands is the most basic differentiation among different types of Instruction Set Architectures (ISA).

-   operands from/to memory
-   operands from/to registers
-   operands from memory/to register or vice versa
:::

### [\underline{Stack-based Architecture}]{color=red}

::::::: {layout="[40,60]" fig-pos="H"}

::: {#first-column}
<!-- ! placeholder ! -->




{{< placeholder >}}







:::

::::: {#second-column}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
The pointer to the ***top of the stack*** will be adjusted properly after completing the ALU (**A**rithmetic / **L**ogic **U**nit) operation to point to the result.
:::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
**\underline{Instruction:}**\
[**ADD**]{color=red}\
[**ADD**]{color=blue} has three implicit operands, which are from/to the **stack**.
:::
:::::
:::::::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Two special instructions [**PUSH**]{color=red} and [**POP**]{color=red} are used to write into the top of the stack or read from the top of the stack respectively. The ***stack pointer*** will be adjusted properly after completing these operations.
:::

### [\underline{Accumulator-based Architecture}]{color=red}

:::::: {layout="[40,60]" fig-pos="H"}

:::{#first-column}
<!-- ! placeholder ! -->




{{< placeholder >}}







:::

::::{#second-column}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
**\underline{Instruction:}**\
[**ADD**]{color=red}    ***mem_address***\
[**ADD**]{color=blue} has two implicit operands (Accumulator register) and one explicit operand (memory).
:::
::::
::::::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Two special instructions [**LOAD**]{color=red} and [**STORE**]{color=red} are used to read from the memory (i.e. copy the contents of the given memory location into accumulator register), and write into memory (i.e. copy the contents of the accumulator into given memory location) respectively.
:::

### [\underline{Register-Memory Architecture}]{color=red}

:::::: {layout="[40,60]" fig-pos="H"}

:::{#first-column}
<!-- ! placeholder ! -->




{{< placeholder >}}







:::

::::{#second-column}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
**\underline{Instruction:}**\
[**ADD**]{color=red} **Rs**, **Rd** ***mem_address***\
[**ADD**]{color=blue} has three operands. [Rd]{color=red} and [Rs]{color=red} represent the destination and source registers respectively. The other source operand is provided through memory.
:::
::::
::::::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Two special instructions [**LOAD**]{color=red} and [**STORE**]{color=red} are used to read from the memory (i.e. copy the contents of the given memory location into a given register), and write into memory (i.e. copy the contents of the specified register into given memory location) respectively.
:::


### [\underline{Register-Register (load/store) Architecture}]{color=red}

:::::: {layout="[40,60]" fig-pos="H"}

:::{#first-column}
<!-- ! placeholder ! -->




{{< placeholder >}}







:::

::::{#second-column}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
**\underline{Instruction:}**\
[**ADD**]{color=red} **Rs, Rd, Rt**\
[**ADD**]{color=blue} has three operands. [Rd]{color=red}, [Rs]{color=red}, and [Rt]{color=red} represent the destination and source registers respectively. 
:::
::::
::::::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxbodycol"}
Two special instructions [**LOAD**]{color=red} and [**STORE**]{color=red} are used to read from the memory (i.e. copy the contents of the given memory location into a given register), and write into memory (i.e. copy the contents of the specified register into given memory location) respectively.
:::