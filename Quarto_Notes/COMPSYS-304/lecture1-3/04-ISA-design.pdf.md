# Instruction Set Architecture Design

## [Comparing different Instruction Set Architectures.]{color="red"}

[**Which one is the best? (for our example: C = A + B)**]{color="red"}

::: {.cell execution_count=1}

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

::: {layout="[30,70]"}

::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}
balls
:::
:::

::: {layout="[30,70]"}

::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}
balls
:::
:::

::: {layout="[30,70]"}

::: {#first-column}
<!-- ! PLACEHOLDER ! -->





{{< placeholder >}}









:::

::: {#second-column}

:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\underline{\\textbf{Execution}}}"}

:::
:::
:::

