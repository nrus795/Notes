<!-- lecture8_embedded_control3.qmd -->

# Embedded Control Systems 3

## Introduction to Control Systems

In this lecture, we delve deeper into **control systems**, focusing on both **open-loop** and **closed-loop** configurations, as well as the terminology, benefits, and challenges associated with each approach (Slide 3). Control systems are used to ensure that the output of a physical system tracks a desired reference value by manipulating the inputs to the system. This lecture also highlighted the importance of stability, performance, and disturbance rejection in control systems.

::: {.callout-important title="Important Note"}

## **THIS IS NOT THE SAME AS ELECTENG 332. THIS IS A DIFFERENT COURSE.** {.unnumbered .unlisted}

:::

## Open-Loop vs Closed-Loop Control Systems

### Open-Loop Control Systems

- **Definition**: In an **open-loop control system**, the controller adjusts the inputs to the plant without considering the actual output (Slide 14). It does not measure how well the output matches the desired reference.

- **Components**:

  - **Plant**: The physical system to be controlled (e.g., a car, a disk drive, or a heater) (Slide 12).

  - **Actuator**: A device that changes the parameters of the system, such as a throttle or motor.

  - **Reference**: The desired value of the output, such as speed or temperature.

- **Characteristics**:

  - **No Feedback**: Open-loop systems do not use feedback to correct their actions.

  - **Feed-Forward Control**: There may be delays in actual output changes.

  - **Predictable Output**: Open-loop systems are suitable when the plant output responds predictably to inputs and disturbances are minimal (Slide 14).

### Closed-Loop Control Systems

- **Definition**: In a **closed-loop control system**, the controller continuously adjusts the inputs based on the difference between the measured output and the desired reference (Slides 15, 27).

- **Components**:

  - **Sensor**: Measures the plant output and provides feedback.

  - **Error Detector**: Calculates the error by comparing the output with the reference value.

  - **Feedback Loop**: This helps to adjust inputs to minimize the error.

- **Benefits**:

  - **Error Minimization**: By using feedback, the closed-loop system reduces tracking errors.

  - **Adaptation to Disturbances**: The system can react to changes, such as disturbances, to maintain desired performance.

  - **Stability**: Ensures that all control variables remain bounded, ideally making the error converge to zero over time (Slide 9).

### Performance Metrics of Control Systems

- **Rise Time**: The time taken for the output to go from 10% to 90% of the desired value (Slide 10).

- **Peak Time**: The time taken to reach the first peak of the response.

- **Overshoot**: The percentage by which the output exceeds the final value.

- **Settling Time**: The time it takes for the output to reach and stay within 1% of the final value.

- These metrics help assess how well the output tracks changes in the reference input and how the system responds to disturbances.

## Designing Control Systems

### Open-Loop Control Design
- **Plant Modeling**: The plant model represents how the output changes based on inputs and the current state. Having a model helps in designing a better controller, although experimentation can be useful (Slide 18).

  - Example: In a car model, the speed is a function of the current speed and throttle position. The model can help predict how changes in the throttle angle affect the speed.

- **Controller Design**: A simple proportional controller can be used to manipulate the plant input. However, achieving the desired output requires tuning and careful consideration of system dynamics.

### Closed-Loop Control Design

- **Proportional (P) Controller**: A proportional controller applies control by multiplying the tracking error by a gain value (Slide 28).

  - **Effects**: Adjusting the gain value (Κ) affects transient response, steady-state tracking, and disturbance rejection. However, increasing the gain can lead to oscillations (Slides 29-31).

- **Derivative (D) Controller**: Adds a control action based on the rate of change of the error, helping reduce overshoot and speed up convergence to the desired output (Slides 44-45).

- **Integral (I) Controller**: Addresses steady-state error by accumulating the error over time, ensuring that the output reaches the desired value eventually. However, it may introduce oscillations if not carefully tuned (Slides 49-50).

- **PID Controller**: A combination of Proportional, Integral, and Derivative components, the PID controller offers good steady-state performance, minimizes oscillations, and improves disturbance rejection (Slide 52).

## Example Analysis of Controllers

- **Open-Loop vs Closed-Loop Performance**: Open-loop controllers struggle to handle disturbances, whereas closed-loop controllers can mitigate the effects of changes in the environment (Slide 42).

- **PD Controller**: By incorporating derivative action, the PD controller improves transient response, but does not change steady-state error (Slide 46).

- **PI Controller**: Useful for eliminating steady-state error by continually adjusting based on accumulated error (Slide 49).

- **PID Controller**: The combined PID control offers comprehensive benefits by balancing response time, minimizing steady-state error, and controlling oscillations.

## Stability and Oscillation

- **Stability**: The stability of the control system is a critical objective, ensuring all control variables remain bounded (Slide 32).

  - The rate of decay of the effect of initial speed is controlled by the gain value ($\alpha$). Setting a suitable gain is essential to avoid unbounded growth or excessive oscillations (Slides 33-34).

  - **Oscillation**: Negative values of the rate of decay parameter ($\alpha$) can lead to oscillatory behavior, which must be avoided in most practical control applications (Slide 38).

## Trade-Offs in Controller Design

- **Proportional Gain (Κ)**: Higher values can improve response time but lead to increased oscillations.
- **Disturbance Rejection**: To effectively reject disturbances, the proportional gain must be balanced to avoid compromising system stability (Slide 34).
- **Performance Objectives**: Reducing oscillation, achieving faster convergence, and minimizing steady-state error are often conflicting objectives, requiring careful tuning and consideration of the application requirements (Slide 40).

## Conclusion

This lecture provided an overview of **open-loop** and **closed-loop control systems**, the key components involved, and the trade-offs between stability, response time, and error minimization. Understanding these concepts is crucial for designing robust and efficient control systems, whether using simple proportional control or more advanced **PID controllers**. Future discussions will explore more advanced control techniques, such as **state-space models** and **model predictive control (MPC)**, which are particularly useful for managing complex, multi-variable systems.

