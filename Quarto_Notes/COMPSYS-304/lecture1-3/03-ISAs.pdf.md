# Instruction set Architecture (ISA)

ISA is the interface between hardware and low-level software

::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=Some modern instruction set architectures:, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
[**80x86**]{color=red}, Itanium, PowerPC, [**MIPS**]{color=red}, SPARC, HP, [**ARM**]{color=red}, [**RISC-V**]{color=red}
:::

:::: {.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=Issues with a fixed ISA:, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
- [**advantage**]{color=red}: different implementations of the same architecture
:::{.tcolorbox options="colback=boxbodycol, colframe=boxheadcol, title=Example, coltitle=boxtitlecol, colbacktitle=boxheadcol"}
- AMD and Intel chips use the same ISA, while their implementations are different
- Pentium II and Celeron have different memory systems and different clock rates,
- Core i7, Core i5, Core i3, and Atom are different implementations of the same ISA (ignoring some ISA extensions)
:::
- [**disadvantage**]{color=red}: sometimes prevents using new innovations
::::