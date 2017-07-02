# IAS

Balancing a broomstick in an upright position requires coordinated horizontal movement of hand based on the visual queues. This nonlinear and inherently unstable control problem is often considered to be a primary benchmark for evaluating the performance and response of new control methods because of its structural simplicities. The same problem is also known as an inverted pendulum. A two-dimensional inverted pendulum consists of a vertical pole freely hinged to a platform which can be driven in the horizontal direction using a belt or cart system.

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

## Conclusions
It was generally observed that large oscillation occurred when the position and angle control alternated to totally opposite outputs. Furthermore, it was harder to determine what was affecting the system due to too many governing rules and membership functions. Thus a simpler and more effective control was developed which inferences the output based on the angle and position in a single fuzzy inference system.
