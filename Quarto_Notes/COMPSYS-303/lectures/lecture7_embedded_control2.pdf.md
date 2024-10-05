<!-- lecture7_embedded_control2.qmd -->

# Embedded Control Systems 2

## Introduction to Embedded Control Systems

In this lecture, we focused on advanced topics in **embedded control systems**, including **PWM control**, **stepper motors**, **PID control**, and **ADC technologies**. These components play a critical role in achieving accurate and efficient control in real-time embedded applications (Slide 2).

## Pulse-Width Modulation (PWM)

**Pulse-Width Modulation (PWM)** is a technique used to simulate an analog signal using digital means by varying the duty cycle of a digital pulse (Slide 5).

-   **Duty Cycle**: The percentage of time the signal remains high during a cycle determines the average voltage output. A higher duty cycle implies higher average power delivered, which is crucial in controlling actuators like DC motors and LEDs (Slide 7).

-   **Fast PWM vs Phase-Correct PWM**: There are different types of PWM modes. **Fast PWM** operates at a higher frequency to minimize flickering, while **Phase-Correct PWM** maintains symmetry in the signal waveform, which is often better for controlling motors with less noise (Slide 8).

## DC and Stepper Motors

### DC Motors

**DC Motors** are widely used for their simplicity and ease of control. Speed control is achieved by modulating the voltage applied to the motor, which is often implemented through PWM. The relationship between PWM duty cycle and motor speed is usually non-linear, requiring careful tuning to achieve precise control (Slide 10).

**Motor Driver Circuitry**: To drive DC motors, **H-bridges** are commonly used. An H-bridge allows for directional control by reversing the current flow through the motor, enabling forward and reverse motion (Slide 11).

### Stepper Motors

**Stepper Motors** are used when precise control of angular position is required. Each pulse sent to the motor corresponds to a fixed angular movement, allowing fine control over its rotation (Slide 12).

-   **Types of Stepper Motors**: Two main types include **unipolar** and **bipolar** stepper motors, each with distinct wiring configurations and driving requirements (Slide 13).

-   **Stepper Motor Control**: To control the stepper motor, sequences of pulses must be sent in the correct order to energize the windings and produce the desired stepping motion. This is typically achieved using a **stepper motor driver**, which abstracts the complexity of pulse timing (Slide 14).

## PID Control

**Proportional-Integral-Derivative (PID) Control** is a control loop mechanism widely used in industrial control systems to achieve desired system behavior.

-   **Proportional Control (P)**: The **proportional** term produces an output value proportional to the current error value. If the error is large, the control response is also large. This helps in reducing the response time but may lead to instability if used alone (Slide 17).

-   **Integral Control (I)**: The **integral** term sums the error over time, addressing the **steady-state error** by accumulating corrections until the desired setpoint is achieved. This component helps eliminate any residual error that remains after the proportional action has been applied (Slide 18).

-   **Derivative Control (D)**: The **derivative** term considers the rate of change of the error, providing a damping effect that reduces overshoot. It predicts future error and helps the system respond more smoothly, avoiding large fluctuations (Slide 19).

**Tuning PID Parameters**: Tuning the PID parameters ($K_p$, $K_i$, and $K_d$) is crucial for optimal system performance. Methods like **Ziegler-Nichols** can be used to empirically determine the ideal values, balancing response speed, stability, and accuracy (Slide 20).

## Analog-to-Digital Conversion (ADC)

**Analog-to-Digital Converters (ADC)** are used to digitize analog signals so that they can be processed by digital controllers. ADCs are critical in embedded control systems where signals like temperature, pressure, or speed need to be sampled and processed (Slide 22).

**Quantization and Resolution**: The resolution of an ADC refers to the number of discrete levels used to represent the analog input. A higher resolution means better accuracy but increased cost and complexity. For instance, a 12-bit ADC provides $2^{12}$ quantization levels, which significantly improves signal representation over an 8-bit ADC (Slide 23).

**Sampling Rate**: The sampling rate must be at least twice the highest frequency of the input signal to prevent **aliasing** (Nyquist criterion). If the sampling rate is insufficient, aliasing can lead to distorted signals that compromise control accuracy (Slide 24).

-   **Types of ADC Technologies**:

    -   **Successive Approximation Register (SAR)**: A commonly used ADC type that offers a good balance between speed and accuracy. The SAR ADC works by iteratively approximating the input signal, which makes it suitable for medium-speed applications (Slide 25).

    -   **Sigma-Delta ADC**: Provides very high resolution but at the cost of slower conversion speed, often used in applications where precision is more critical than speed, such as audio signal processing (Slide 26).

    -   **Flash ADC**: The fastest type of ADC, using a parallel set of comparators to convert the analog signal in a single step. However, it requires a large number of comparators, making it expensive and power-hungry, suitable for high-speed applications (Slide 27).

## Practical Considerations in Embedded Control Systems

**Noise Handling**: Analog signals are often susceptible to noise. Techniques such as **filtering** and **shielded cabling** are used to mitigate noise effects, ensuring that the ADC accurately captures the intended signal without distortion (Slide 29).

**Anti-Aliasing Filters**: To prevent aliasing, **low-pass filters** are often used before the ADC to remove high-frequency components that could interfere with accurate sampling (Slide 30).

## Case Study: Motor Speed Control

**Objective**: The case study presented a practical example of motor speed control using a combination of PWM and PID control (Slide 32).

**Implementation**: The motor speed is monitored using an **optical encoder**, which provides feedback to the PID controller. The PID controller adjusts the PWM duty cycle to minimize the speed error and maintain the desired speed despite varying load conditions (Slide 33).

**Challenges**: Tuning the PID parameters was a challenge due to the non-linearities in motor response and the presence of external disturbances. Real-world control systems often require iterative tuning to balance response time, overshoot, and stability (Slide 34).

## Conclusion

This lecture expanded on the foundational knowledge of embedded control systems by introducing practical components like **PWM**, **stepper motors**, **PID controllers**, and **ADCs**. Understanding these components and their interactions is essential for designing robust and efficient control systems. Future lectures will focus on more advanced topics such as **real-time operating systems (RTOS)**, **sensor fusion**, and **model predictive control (MPC)**, which are critical for modern, complex embedded control applications.