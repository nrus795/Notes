# Basics of Computer Architecture

This chapter begins the journey into the content of this course.

## What is Computer Architecture?

<!-- !Mermaid diagram showing same figure from notes! -->




{{< placeholder >}}







-   **ISA:** The programmer-visible instructions — ISA serves as the boundary between the hardware and software.

-   **Organization:** high-level aspects of computer design (e.g. the internal design of the CPU, the memory system, the interconnection structure, ...)

-   **Hardware:** detailed logic design, circuit-level design, packaging technology, etc.

## Review: Memory Organization

<!-- !Memory Diagram to left of list! -->




{{< placeholder >}}








-   Memory is viewed as a large, one-dimensional array, which has an address range.

-   A memory address is an index into the array

-   The index usually points to a byte of memory.

-   To access a larger word (e.g., a 32-bit word or 4 bytes), four consecutive memory locations are accessed.

*Memory access time* is the amount of time required to read (usually one byte) or write data (usually one byte) from/to memory.

## An Overview of Memory Speed vs. CPU Speed

The rate of memory speed increase has been less than processors speed increase

<!-- !CPU-Z memory access latency graph align left! -->




{{< placeholder >}}








Fast memory is more expensive per bit than slow memory, so a **memory hierarchy** is often used to give a performance close to the fastest memory with a lower average cost per bit.

## Processor and Memory Hierarchy

::: {layout="[40,60]" fig-pos="H"}
::: {#first-column}
![][1]
:::

::: {#second-column}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\emph{Processor Registers: }}\\textcolor{blue}{The smallest and fastest memory for CPU.}"}
Typically, 32 to 64 registers, each of them may be 32 or 64 bits with typical access time of [*nanoseconds or less*]{color=blue}
:::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\emph{Cache Memory: }}\\textcolor{blue}{Slower than registers.}"}
Typically 8 to 256 Kbytes with an access time about a [*few nanoseconds or less*]{color=blue}
:::

::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\emph{Main Memory: }}\\textcolor{blue}{Slower than cache memory.}"}
Hundreds of Mega bytes with an access time about [*tens of nanoseconds*]{color=blue}
:::
:::
:::

  [1]: images/processorhierarchy.png

## Example of Intel Processors

::: {layout="[[1,1],[1,1]]" fig-pos="H"}
::: {#r1c1}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\emph{Pentium Processor Architecture (simplified) }}"}
An example of architectural innovations made by processor designers (to improve computer systems performance) [(Source: Intel)]{color=red}
:::
:::

::: {#r1c2}
![][2]
:::

::: {#r2c1}
::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, colbacktitle=boxheadcol, title=\\textcolor{red}{\\emph{Intel Core i7}}"}
The Core i7 die and major components. (more than 700 million transistors in a die with area \qty{263}{\mm\squared} in \qty{45}{\nm} technology). [(Source: Intel)]{color=red}
:::
:::

::: {#r2c2}
![][3]
:::
:::

  [2]: images/22pentium.png {width="8cm" height="4cm"}
  [3]: images/corei7diagram.png {width="8cm" height="4cm"}