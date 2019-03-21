# Birthday app

## To run it

1. Clone the repo
2. `bundle install`
3. `rackup -p 4567`
4. Navigate to `localhost:4567`

## Thoughts etc.

My `BirthdayCalc.countdown` method requires a month and a day as an input, which is a bit weird and specific. Maybe a better approach would have been to make it a class, and do something like `Date.parse(input_string)` in the `initialize` method, that would make it more flexible.

The CSS is pretty slapdash too lol
