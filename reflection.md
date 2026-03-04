QR1. Which concept was hardest to understand: lists and loops, classes and methods,
exception handling, or async/await? Walk through the specific moment of confusion and
explain how you eventually understood it. 

The hardest concept for me was async/await. At first, I didn’t really understand why I needed await everywhere — I thought just marking a function as async was enough. The moment of confusion came when I forgot to await inside my computeChained() method. The delay didn’t actually happen, and the program returned the result instantly, which made me think something was broken. I eventually understood it by testing step by step and realizing that await is what actually pauses execution until the future completes. Once I saw the difference between printing a Future versus the actual result, it finally clicked.
 
QR2. Look at your Task 1 solution. If you had to change your code to analyze a list of
floating-point numbers (List<double>) instead of integers, how many places in your code
would need to change? What does this tell you about the importance of thinking about
data types during design? 

If I had to change Task 1 to use List<double>, I would need to update the list declaration and maybe adjust some of the calculations to make sure they handle decimals correctly. It wouldn’t be a huge change, but it would touch multiple places in the code. This shows me how important it is to think about data types during design — choosing the right type early can save a lot of refactoring later. If I had designed it with flexibility in mind, I could have avoided those changes.

QR3. In Task 2, you simulated a network delay using Future.delayed(). Describe a real
Flutter app feature where you would need to actually await a real asynchronous operation
— not just a simulated delay. What would the Future resolve to, and what would happen
to the UI while the user was waiting? 

A real example would be loading data from an API, like fetching a list of products in a shopping app. The async function would make a network request, and the Future would resolve to the JSON data that gets converted into Dart objects. While the user is waiting, the UI could show a loading spinner or a “please wait” message. This way, the app doesn’t freeze — it stays responsive while the data is being fetched in the background.

QR4. If a colleague asked you: 'Why not just use a single function that takes the operation
name as a parameter, rather than writing separate add(), subtract(), multiply(), and divide()
methods?' — what would you say? Are there advantages to both approaches? 
 
I would say that having separate methods makes the code easier to read and test. Each method has a clear purpose and can be reused independently. It also follows the principle of single responsibility — each function does one thing well. On the other hand, a single function with an operation parameter could reduce repetition and make the code shorter. Both approaches have advantages, but for learning and clarity, I think separate methods are better because they make the structure of the calculator more obvious.