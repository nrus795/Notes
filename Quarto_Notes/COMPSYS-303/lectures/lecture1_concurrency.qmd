<!-- lecture1_concurrency.qmd -->

# Concurrency

## Introduction to Embedded Systems and Concurrency

Embedded systems are a specialized class of computers designed to continuously interact with their environment in a real-time, often reactive manner. Unlike general-purpose computers, embedded systems are purpose-built to handle specific tasks under stringent conditions, including timing constraints. These systems are embedded as integral parts of larger devices and must operate dependably, often without human intervention. Examples include automotive control systems, medical devices like pacemakers, and consumer electronics such as washing machines.

When deadlines must be met without exception, the system is termed a **hard real-time system**; otherwise, it is a **soft real-time system**. In hard real-time systems, any missed deadline could result in catastrophic failure, such as in medical devices or automotive safety features. In contrast, soft real-time systems can tolerate occasional missed deadlines, although they may affect performance.

The concept of **concurrency** is crucial in embedded systems because these systems often involve multiple processes interacting simultaneously, such as a pacemaker continuously monitoring the heart and delivering pulses when needed. Concurrency enables these systems to effectively manage different tasks that need to be performed either synchronously or asynchronously. For example, while monitoring the heart, a pacemaker must also manage pulse delivery in real-time, demonstrating the need for concurrent tasks.

## Key Concepts in Concurrency

**Concurrency** refers to multiple components or processes operating at the same time within a system. In embedded systems like pacemakers, various components (controllers, sensors, and timers) work concurrently to ensure precise timing between events. Concurrency becomes especially challenging when different tasks access shared resources simultaneously, potentially leading to issues such as **race conditions**, **deadlocks**, and **livelocks**.

-   **Race Conditions:** These occur when two or more processes access shared data concurrently, and the final result depends on the timing of their access. A typical example is the producer-consumer problem, where one process generates data while another consumes it. If these processes do not manage shared data properly, inconsistencies may arise. For instance, if two processes increment a shared counter without proper synchronization, the final value of the counter may be incorrect due to overlapping access. This issue is exacerbated in systems with multiple cores or processors, where different threads can execute simultaneously.

-   **Critical Sections and Mutual Exclusion:** A **critical section** is a part of a program that should only be executed by one process at a time to avoid data corruption. Ensuring **mutual exclusion**, where no two processes are in their critical sections simultaneously, is essential for preventing race conditions. Mutual exclusion can be achieved using synchronization mechanisms like **locks**, which ensure that only one process can access the critical section at any given time. Common techniques include **mutexes** and **binary semaphores**, both of which can lock shared resources to ensure orderly access. It is also important to minimize the time a process spends in a critical section to reduce the chances of blocking other processes.

**Deadlocks and Livelocks:**

-   **Deadlocks** occur when processes are waiting on each other indefinitely, leading to a situation where no progress can be made. This typically happens in resource allocation scenarios where two or more processes form a circular chain of dependencies. A classic example is two processes holding a resource that the other needs to proceed, resulting in a stalemate.

-   **Livelocks** are similar to deadlocks but differ in that processes keep changing state in response to each other without making any actual progress. Both issues are critical in concurrent systems and need to be addressed through careful design, such as avoiding circular waiting conditions, implementing resource hierarchies, or using **deadlock detection algorithms** that can detect and break deadlocks. Timeout mechanisms can also be used to release resources if a process waits too long.

## Approaches to Manage Concurrency

Concurrency in embedded systems is managed through a combination of hardware and software synchronization mechanisms. Some of the methods discussed include:

**Busy Waiting and Non-Busy Waiting:**

-   **Busy waiting** occurs when a process remains in the ready state, actively checking for a condition to be satisfied. This approach is inefficient in terms of CPU utilization, as the CPU is occupied with checking instead of performing useful work.

-   **Non-busy waiting** solutions, such as putting a process in the blocked state while waiting for a resource, are more efficient for embedded systems where CPU resources are limited. Busy waiting is often used in systems where the wait time is expected to be very short, whereas non-busy waiting is preferred for longer wait times to free up CPU resources. In embedded systems, avoiding busy waiting is crucial because the CPU often needs to manage multiple tasks under strict timing constraints.

-   **Test and Set Instruction:** The **Test and Set** instruction is an atomic operation used to achieve mutual exclusion by using a global variable to indicate whether a critical section is occupied. By using Test and Set, embedded systems can ensure that processes access shared resources in a predictable and coordinated manner. The atomicity of this instruction prevents race conditions by ensuring that the check-and-set operation is performed without interruption. However, Test and Set can lead to **busy waiting**, which may not be suitable for all embedded applications. In systems with limited processing power or battery life, busy waiting can degrade performance and reduce efficiency.

**Semaphores and Mutex Locks:**

-   **Semaphores** are synchronization mechanisms used to manage concurrent access to shared resources. They allow processes to signal and wait for access, ensuring a controlled flow of execution. Semaphores can be **binary** (acting like a mutex) or **counting**, allowing a specified number of processes to access a resource concurrently. For example, counting semaphores are often used in producer-consumer scenarios where multiple producers or consumers need access to a shared buffer.

-   **Mutex locks** are similar but are typically used to protect access to a particular data structure or variable, providing mutual exclusion in critical sections. Mutexes are often simpler to implement but are limited to binary states (locked or unlocked), whereas semaphores offer more flexibility for resource management.

**Priority Inversion and Solutions:**

-   **Priority inversion** occurs when a higher-priority task is waiting for a resource held by a lower-priority task, which can lead to missed deadlines in real-time systems. A well-known example is the **Mars Pathfinder mission**, where a low-priority task holding a shared resource caused a higher-priority task to miss its deadline, resulting in system resets.

-   **Solutions** to priority inversion include **priority inheritance**, where the lower-priority task temporarily inherits the higher priority to complete its task and release the resource. Another approach is **priority ceiling**, where a resource is assigned a priority equal to the highest priority of any task that may lock it, thus preventing priority inversion.

## Examples and Applications

The lecture provided various examples of where concurrency is critical, including the automotive industry and robotics. For instance, the **2010 Toyota recall** was attributed to software issues in their anti-lock braking systems, highlighting the importance of deterministic behavior in safety-critical systems. This incident shows how improperly managed concurrency can lead to life-threatening failures. Similarly, **Tesla's accidents** were referenced, emphasizing the challenges of building reliable autonomous systems. These examples underscore the need for proper concurrency management to ensure system reliability and safety.

In embedded systems such as a **pacemaker**, concurrency is an intrinsic characteristic. The pacemaker must concurrently monitor the heart and trigger electrical pulses without delay, thus operating as a real-time reactive system. Concurrency, in this context, is about ensuring different components work seamlessly together to meet life-critical deadlines. The pacemaker example illustrates how timing constraints and concurrent interactions must be carefully managed to avoid potentially fatal outcomes. The system must ensure that sensing, decision-making, and actuation are carried out with precise timing to maintain patient safety.

## Problems with Concurrency and Solutions

Concurrency can lead to serious issues if not properly managed. (Haha, kieler go brrrrr)

**Deadlocks**

-   **Deadlocks** occur when concurrent processes are waiting on each other to release resources, resulting in a state where no process can proceed. To prevent deadlocks, proper scheduling mechanisms must be implemented to ensure that resource allocation does not lead to circular waiting. **Deadlock prevention techniques** include resource ordering, where resources are always requested in a specific order, and **deadlock detection algorithms** that periodically check for cycles in the resource allocation graph. Another approach is **deadlock avoidance**, such as using the **Banker's algorithm**, which allocates resources in a way that ensures a safe state is always maintained.

**Fairness and Scheduling**

-   **Fairness** in resource allocation means that every process eventually gets a chance to execute. Embedded systems often use a **scheduler** to manage processes, ensuring tasks are completed in a timely and fair manner. The role of the scheduler is critical to prevent **starvation**, where some tasks never get executed due to others continuously consuming resources.

-   Common **scheduling** algorithms include **round-robin**, **priority-based**, and **rate-monotonic scheduling**, each with its own advantages and trade-offs depending on the system requirements. **Round-robin scheduling** is simple and ensures fairness by giving each process a fixed time slice, while **priority-based scheduling** allows more critical tasks to execute first but can lead to starvation without priority aging.

**Starvation**

-   **Starvation** occurs when a process is perpetually denied the resources it needs to execute, often because other higher-priority processes continuously take precedence. To mitigate starvation, **priority aging** can be used, where the priority of a waiting process is gradually increased over time to ensure it eventually gets the necessary resources. This technique ensures that lower-priority processes are not starved indefinitely, especially in systems with many competing processes.

## Conclusion

Concurrency is an essential aspect of embedded systems, particularly for reactive, real-time applications. This lecture emphasized the importance of understanding the mechanisms—such as **mutual exclusion**, **semaphores**, and **scheduling**—that help manage concurrent processes effectively. For embedded systems like automotive controls, pacemakers, or industrial automation, **deterministic behavior** and avoiding race conditions are paramount. Properly handling concurrency ensures that embedded systems can meet their timing constraints, maintain data consistency, and operate safely under all conditions.

Next steps in the lecture will involve exploring **reactive systems** and how **synchronous concurrency** can be implemented to further ensure the reliability of embedded systems. Understanding these concepts is vital for designing embedded systems that are safe, reliable, and efficient. Future topics will also cover specific synchronization protocols and **real-time operating system (RTOS)** features that support concurrency in embedded environments. Additionally, understanding how to leverage hardware features, such as **interrupt controllers** and **timers**, will be crucial for achieving precise control over concurrent tasks in embedded systems.