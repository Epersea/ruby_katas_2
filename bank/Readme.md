This kata implements a very basic bank system, with deposit, withdraw and statement functionalities. The problem description can be found here: [Bank Kata at Codurance](https://www.codurance.com/katas/bank)

This kata describes a public class interface and an acceptance test, and the coder has to build it from here by working with outside-in TDD. My process was as follows:
- First, I created the full acceptance test, following the kata's description. To simulate transactions done at different times, I used the timecop gem.
- To further subdivide the problem, I "cheated" by creating a couple unit tests, following a more classicist approach. However, this meant altering the class' public interface described in the kata. To solve this, I implemented a test double (a subclass of the Bank production class with getters to check the class internals)
- These unit tests helped me see that the process was fairly straightforward, so after implementing the deposit method, I switched back to working with the main acceptance test.
- Finally, since the kata specifies spacing and indentation are irrelevant, I used the .strip method in my assertion.