This kata implements a very basic bank system, with deposit, withdraw and statement functionalities. The problem description can be found here: [Bank Kata at Codurance](https://www.codurance.com/katas/bank)

This kata describes a public class interface and an acceptance test, and the coder has to build it from here by working with outside-in TDD. My process was as follows:

### First iteration: naive implementation
- First, I created the full acceptance test, following the kata's description. To simulate transactions done at different times, I used the timecop gem.
- To further subdivide the problem, I "cheated" by creating a couple unit tests, following a more classicist approach. However, this meant altering the class' public interface described in the kata. To solve this, I implemented a test double (a subclass of the Bank production class with getters to check the class internals, in this case, the balance and the transactions).
- These unit tests helped me see that the process was fairly straightforward, so after implementing the deposit method, I switched back to working with the main acceptance test.
- Finally, since the kata specifies spacing and indentation are irrelevant, I used the .strip method in my assertion.

## Second iteration: a more outside-in approach
After finishing the first iteration, I kept learning about outside-in TDD and realized my first approach was too simple –basically, the Account class was doing all the work. So I tried a second iteration relying on a couple collaborators and testing the calls between them.
- First, I redid the Account unit tests for the deposit and withdrawal methods –now, the transactions are stored in a TransactionRepository (which would likely be some kind of database in real life) and the Account-level tests just check that the repository methods are called with the right arguments. I kept the @balance property and the test double, since it makes sense to me than an Account should know its own balance.
- Then, I tested and implemented the TranslationRepository itself.
- After that, I moved on to the print_statement method. Instead of handling the printing itself, now Account relies on its collaborators to obtain a list of all translations from the repository and send it to the printer.
- Finally, after moving the printing functionality to the corresponding class, the acceptance test passed and the kata was complete.
