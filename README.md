# Birthday app

## To run it

1. Clone the repo
2. `bundle install`
3. `rackup -p 4567`
4. Navigate to `localhost:4567`

## Things I think I did well

### TDD

I think I used a good TDD process on this project. I started by breaking the instructions down into user stories and writing feature tests for the user stories. Then when it became clear that some logic was going to be required in processing the birthday date I TDDed a module to do that processing, incrementing unit tests and the code to pass those test until the module was complete. At that point I returned to the higher level and carried on iterating my feature tests until all the functionality was implemented.

I also included the edge cases I thought of in my TDD process - leap years, and not including an "s" on the end of "day" in "your birthday is in 1 day", bad user input, so that these cases are included in the documentation.

All RSpec tests are passing, and test coverage is 100%.

### Separation of concerns

I tried to keep my model, view and controller layers separate. My controller (`app.rb`) handles requests/responses, the logic for calculating the number of days until the user's birthday is separated out into a module (`lib/date_stuff.rb`), and almost all logic is kept out of the views.

The only bit of logic in the views is the part where the app decides whether the number of "days" until your birthday needs an "s" on the end ([see this commit](https://github.com/Hives/birthday-app/commit/0a7d20246eb765906cbefb32c0f499e05f39dda2)). Since that is light logic and presentational, I think it belongs more in the view than anywhere else. The tests I'd written meant that it was very easy for me to move this behaviour between layers and be confident my app was still working as desired.

## Things I might have done differently

My `DateStuff.countdown` method requires a month and a day as an input, which is a bit weird and specific. Maybe a better approach would have been to make it a class, and do something like `Date.parse(input_string)` in the `initialize` method, that would make it more flexible.

I think also that `DateStuff` is not a great name for my module...

The CSS is pretty slapdash lol.
