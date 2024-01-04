
# collatzR
[![CodeFactor](https://www.codefactor.io/repository/github/sulmanolieko/collatzr/badge)](https://www.codefactor.io/repository/github/sulmanolieko/collatzr)

```markdown
## Description
A package for exploring and visualizing the Collatz conjecture, a fascinating mathematical sequence. It provides functions for:
- Determining if a number is whole, even, or odd,
- Performing the Collatz operation on the selected number,
- Generating Collatz sequences for various starting numbers,
- Generating the maximum value in the Collatz sequence for various starting numbers,
- Generating the total number of steps in the Collatz sequence required to reach 1 for various starting numbers, and
- Visualizing the sequence for the selected number.

## The Problem
Consider an arbitrary positive integer **n**:
- If **n** is even, divide it by 2.
- Else, if **n** is odd, multiply it by 3 and add 1 to the product.

Therefore, we can define a function f^i(n) such that:
\[ f(n) = \begin{cases} n/2 & \text{if } n \equiv 0 \mod 2, \\ 3n+1 & \text{if } n \equiv 1 \mod 2. \end{cases} \]

Subsequently, we need to loop the above equation sequentially by taking the result at the previous step as the starting value at the next, such that:
\[ k_i = \begin{cases} n & \text{for } i = 0, \\ f(k_{i-1}) & \text{for } i > 0 \end{cases} \]

The conjecture states that this process will eventually reach the number 1, regardless of which arbitrary positive integer is chosen as the starting (initial) value **n**. Once the process reaches unity, a perpetual loop is reached: 4,3,2,1,4,3,2,1... Therefore, we stop the loop once we reach 1.

Currently, the highest arbitrary integer that has been officially proven to concur with this behavior is 2^100,000 - 1. Can this 3n + 1 hold for bigger integers beyond this?

**Note:** Currently, R does not consider values past 2^1024 as integers, hence the program cannot compute (or visualize) conjecture sequences for starting integers beyond this value.

### Installing the CollatzR package into R
To install the **CollatzR** package into R, you can follow the following procedure:
1. Ensure you are connected to the internet.
2. Open your R software and open a new Rscript. Install **devtools** package into your library. This can be done by typing (or copy-pasting) this code into your R script and running it:
   ```R
   install.packages("devtools") # You need devtools package for the installation of packages from Github
   library(devtools) # Load the devtools package into your library
   ```
3. Use **devtools** to install the **CollatzR** package into R.
   ```R
   install_github("SulmanOlieko/collatzR") # Install CollatzR
   library(collatzR) # Load the CollatzR package into R
   ```

That's it!

## Usage
### Generate hailstone sequences
You can now generate the hailstone sequences of any arbitrary integer between 1 - 2^1024. To do this, simply type `collatz_sequence()` and input your integer inside the parentheses and run it. For instance, if I want to see the Collatz sequence for 123456789, I would:
```R
collatz_sequence(3732423)
```

### Visualize the plot
To view the plot for this number:
```R
visualize_collatz(3732423)
```

### How many steps or stopping times are there for this number before reaching 1?
```R
collatz(3732423)
# Alternatively:
collatz_sequence(3732423)$step
```

### Identify the maximum value in the sequence:
```R
max_collatz(3732423)
# Alternatively:
collatz_sequence(3732423)$max_value
```

### Other operations
The **CollatzR** package can also perform operations such as:
- Determining if a number is odd or even:
  ```R
  is.even(3732423)
  ```

- Determining if a number is whole:
  ```R
  is.wholenumber(3732423)
  ```

Happy interacting with the tool!
```
