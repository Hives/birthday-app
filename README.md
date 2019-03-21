# Birthday app

## To run it

1. Clone the repo
2. `bundle install`
3. `rackup -p 4567`
4. Navigate to `localhost:4567`

## Thoughts etc.

My `BirthdayCalc.countdown` method requires a month and a day as an input, which is a bit weird and specific. It would be more flexible if it could take a `Date` object as input. I was trying to take as much logic as possible out of the controller as possible though, and that would require constructing the `Date` in the controller and passing it to `BirthdayCalc`.

Maybe a better approach would have been to make it a class, and do something like `Date.parse(input_string)` in the `initialize` method, that would make it more flexible.
