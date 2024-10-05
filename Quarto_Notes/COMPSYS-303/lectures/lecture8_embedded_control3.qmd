<!-- lecture8_embedded_control3.qmd -->

# Lecture 8: Embedded Control Systems 3

## Control of Physical Processes
- **Control Systems**: Aim to make the physical system's output track a desired reference input by setting the system's inputs.
  - **Open Loop**: No feedback from the output; relies on an accurate model of the plant.
  - **Closed Loop**: Utilizes feedback to adjust the output to the desired reference, improving accuracy.

## Key Metrics in Control Systems
- **Performance Metrics**: Rise time, peak time, overshoot, and settling time are critical in evaluating control systems.
- **Disturbance Rejection**: A control system must minimize the impact of external disturbances to maintain stability and performance.
- **Stability**: Ensuring that all control variables remain bounded is a primary objective. A stable system should have minimal oscillations and rapid convergence to the desired state.

## Example: Cruise Control
- **Open Loop Control**: A cruise control system adjusts throttle to maintain speed. The model describes how speed changes based on throttle position and current speed, with no feedback mechanism.
- **Closed Loop Control**: Adding sensors to detect actual speed and adjust throttle accordingly helps maintain speed despite disturbances like wind or road conditions.