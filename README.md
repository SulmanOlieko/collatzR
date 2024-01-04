# collatzR
<a href="https://www.codefactor.io/repository/github/sulmanolieko/collatzr"><img src="https://www.codefactor.io/repository/github/sulmanolieko/collatzr/badge" alt="CodeFactor" /></a>
# Description
A package for exploring and visualizing the Collatz conjecture, a fascinating mathematical sequence. It provides functions for: 
<ol>
  <li>determining if a number is whole, even, or odd, </li>
<li>performing the Collatz operation on the selected number,</li> 
<li>generating Collatz sequences for various starting numbers,</li> 
<li>generating the maximum value in the Collatz sequence for various starting numbers, </li>
<li>generating the total number of steps in the Collatz sequence required to reach 1 for various starting numbers,and </li>
<li>visualizing the seguence for the selected number.</li>
</ol>

#The problem
Consider an arbitrary positive integer <strong>n</strong>:
      <ul>
        <li>If <strong>n</strong> is even, divide it by 2.</li>
        <li>Else, if <strong>n</strong> is odd, multiply it by 3 and add 1 to the product.</li>
      </ul>
     <p>Therefore, we can define a function f<sup>i</sup>(n) such that: </p>
       <p><span class="math"> \( f(n) = \begin{cases} n/2 & \text{if } n \equiv 0 \mod 2, \\ 3n+1 & \text{if } n \equiv 1 \mod 2. \end{cases} \)</span></p>
      <p>Subsequently, we need to loop the above equation sequencially by taking the result at the previous step as the starting value at the next such that:</p>
      <p><span class="math"> \( k_i = \begin{cases}
      n & \text{for } i = 0, \\
      f(k_{i-1}) & \text{for } i > 0
    \end{cases} \)</span></p>
    
      <p>The conjecture states that this process will eventually reach the number 1, regardless of which arbitrary positive integer is chosen as the starting (initial) value <strong>n</strong>. Once the process reaches unity, a perpetual loop is reached: 4,3,2,1,4,3,2,1... Therefore, we stop the loop once we reach 1.</p>
      <p>Currently, the highest arbitrary integer that has been officially proven to concur with this behaviour is 2<sup>100,000</sup> - 1. Can this 3n + 1 hold for bigger integers beyond this?</p>
  
      <p><strong>Note: </strong>Currently, R does not consider values past 2<sup>1024</sup> as integers, hence the program cannot compute (or visualize) conjucture sequences for starting integers beyond this value.</p>
    <div class="article-tags badge-light">
      <h3>Installing the CollatzR package into R</h3>
      <p>To install the <strong>CollatzR</strong> package into R, you can follow the following procedure:</p>
      <ol>
        <li>Ensure you are connected to the internet.</li>
        <li>Open your R software and open a new Rscript. Install <strong>devtools</strong> package into your library. This can be done by typing (or copy-pasting) this code into your R script and running it:
          <pre><code>
            install.packages("devtools")# you need devtools package for the installation of packages from Github
            library(devtools)#load the devtools package ito your library</code></pre>
        </li>
          <li>Use <strong>devtools</strong> to install the <strong>CollatzR</strong> package into R.
          <pre><code>
            install_github("SulmanOlieko/collatzR")#Install CollatzR
            library(collatzR)#load the CollatzR package into R</code></pre>
        </li>
      </ol>
#
    <p>That's it!</p>

      <h3>Usage</h3>
      <h4>Generate hailstone sequences</h4>
    <p>You can now generate the hailstone sequences of any arbitrary integer between 1 - 2<sup>1024</sup>. To do this, simply type <code>collatz_sequence()</code> and input your integer inside the parentheses and run it. For instance, if I want to see the Collatz sequence for 123456789, i would: </p>
   <pre><code>collatz_sequence(3732423)</code></pre>
      <h4>Visualize the plot</h4>
      <p>To view the plot for this number:</p>
      <pre><code> visualize_collatz(3732423)</code></pre>
      <h4>How many steps or stopping times are there for this number before reaching 1?</h4>
     <pre><code>
       collatz(3732423)
       #alternatively:
       collatz_sequence(3732423)$step</code></pre>
      <h4>Identify the maximum value in the sequence:</h4>
      <pre><code>
        max_collatz(3732423)
        #alternatively:
        collatz_sequence(3732423)$max_value</code></pre>
      <h4>Other operations</h4>
      <p>The <strong>CollatzR</strong> package can also perform operations such as:</p>
      <ol>
        <li>
          Determining if a number is odd or even:
       <pre><code>is.even(3732423)</code></pre> 
        </li>
        <li>
          Determining if a number is whole:
       <pre><code>is.wholenumber(3732423)</code></pre> 
        </li>
      </ol>
      <p>Happy interacting with the tool!</p>
