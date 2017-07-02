# Introduction

Balancing a broomstick in an upright position requires coordinated horizontal movement of hand based on the visual queues. This nonlinear and inherently unstable control problem is often considered to be a primary benchmark for evaluating the performance and response of new control methods because of its structural simplicities. The same problem is also known as an inverted pendulum. A two-dimensional inverted pendulum consists of a vertical pole freely hinged to a platform which can be driven in the horizontal direction using a belt or cart system.

---

## Experiment 1

The objective of this experiment was to develop inference systems for balancing and positioning separately. Secondly, to develop a switching system which decides which control to switch-off based on the pole angle. Both the fuzzy controllers, have two set input input variables ([θ, ˙θ] and [x, x˙]). Both sets of fuzzy inferences share the same output functions. To design the fuzzy controllers, 5 membership functions are assigned to each input and output state variables. Triangular membership functions are used for all membership functions. "Center of Gravity" (COG) defuzzification method is used to combine the rules represented in table below.

|        |  NB | NM | ZE | PM  | PB |
|--------|-----|----|----|-----|----|
| **PB** | ZE  | PM | PM | PB  | PB |
| **PM** | NM  | Z  | PM |  PM | PB |
| **ZE** | NM  | NM | ZE | PM  | PM |
| **NM** | NB  | NM | NM | ZE  | PM |
| **NB** | NB  | NB | NM | NM  | ZE |

For [θ,˙θ] controller, Suppose the cart was stationary (not moving horizontally) and inclined towards the left. Intuitively, the cart should be moved left. Furthermore, the speed by which the cart should be moved is based on its membership of ˙θ. For instance, if θ was NB and ˙θ was NM, then a large amount of force is needed in the negative/left direction. Therefore, the output is NB. For [x, x˙] controller, Suppose x is right and x˙ is positive (i.e the cart is moving towards right), then the applied force should be right so that the pendulum moves to the left thus stabilizing the system. A similar rule would work when the x is left and x˙ is negative (i.e. the cart is moving towards the left).

Using these insights, all others rules can also be derived. In the initial experiments, it was found that the cart kept oscillating even when the desired position had reached. This was because of two reasons. Firstly, due to no overlapping regions in the memberships of NM and PM Figure below . Secondly, due to lack of a membership function for a stable position. To resolve this issue, either an overlap
was needed between NM and PM or a stable state membership function. A ZE membership function was introduced (a design choice).

![alt text](https://github.com/Asheeshkrsharma/IAS/blob/master/images/dab-1.png "Memberships of separate inputs for Experiment 1")



## Conclusions
It was generally observed that large oscillation occurred when the position and angle control alternated to totally opposite outputs. Furthermore, it was harder to determine what was affecting the system due to too many governing rules and membership functions. Thus a simpler and more effective control was developed which inferences the output based on the angle and position in a single fuzzy inference system.

---


## Experiment 2

To combine the individual knowledge base of the separate control systems, new membership functions were constructed (as shown in th figure) based on the following key observations.

1. From the aforementioned initial experiments, it was understood that the out of the two inference systems, the degree of importance of balancing has to be larger than positioning in order to stabilize the whole pendulum system. At the same time, the importance degree of the pendulum angle when the pendulum angle is big should almost be the same as the importance degree of the angular velocity when the angular velocity is big.  The same fact also applies to cart position and speed. That is, the importance degree of the cart position when the positive is big should almost be the same as the importance degree of the cart velocity when the velocity is big. 

![alt text](https://github.com/Asheeshkrsharma/IAS/blob/master/images/mrmbership_surf-1.png "Surface of rule base")

To achieve this bias, the position control share only the most contrasting membership functions (NL and PL) in the output (observe the flat surfaces in figure below). It was found that having no overlap between these NL and PL in the output introduced a constant time lag in the response to target position. It was also found that the time lag was directly proportional to an overlap between NL and PL in the output. Therefore a small overlapping region has been introduced. This also serves the purpose of having a decaying control over the position as the angle control needs to be more dominating. Table 2 shows the three rules employed in achieving the position control.

