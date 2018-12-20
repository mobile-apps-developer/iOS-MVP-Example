MVP solves the problem of Massive View Controller. Instead of putting all the responsibility in a subclass of UIViewController we can create a presenter which will contain all the functional logic and the subclass of UIViewController will only perform UI related tasks.

All the required modifications on the data and computational work will be done by the presenter e.g. validating the user inputs and returning the status whether the inputs are valid or not?

Putting all the logic in a presenter makes it easy to test and more reusable.