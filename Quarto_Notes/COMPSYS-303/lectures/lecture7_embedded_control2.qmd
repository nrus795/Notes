<!-- lecture7_embedded_control2.qmd -->

# Lecture 7: Embedded Control Systems 2

## Peripherals: PWM, Stepper Motors, A2D Conversion
- **Interaction with Real World**: Embedded systems use sensors (e.g., ADC for temperature, sound, light) and actuators (e.g., motors) to interact with the environment.
- **Pulse Width Modulation (PWM)**: A simple type of Digital to Analog Converter (DAC) used to control devices like DC motors by adjusting the duty cycle.
- **Stepper Motors**: Rotates a fixed number of degrees when given a step signal, making them more precise compared to DC motors. Stepper motor controllers simplify the control by providing specific voltage sequences to coils.

## Analog to Digital Conversion (ADC)
- **Resolution**: Defined by the number of bits in the ADC. Higher resolution provides greater accuracy but requires more bits.
- **Quantization Levels**: The range of an ADC is determined by the reference voltage, divided by the number of levels (e.g., an 8-level ADC with a range of 3.5V has a resolution of 0.4375V).