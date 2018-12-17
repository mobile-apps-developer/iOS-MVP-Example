MVP solves the problem of Massive View Controller. Instead of putting all the responsibility in a subclass of UIViewController we can create a presenter which will contain all the functional logic and the subclass of UIViewController will only perform UI related tasks.

All the required modification on the data and computational work will de done by the presenter e.g. validating the usre input and returnig the status whether the inputs are valid or not?

Putting all the logical in a presenter make it easy to test.