# Feedback from Katerina
*Mon 5 Mar*  
*via Slack (obv)*

**Katerina Georgiou [9:41 AM]**

Good morning Paul!  

My first initial thoughts on your date_stuff_spec are that I’m finding it hard to understand what *behaviour* you’re actually trying to test

I really like that you’re using context too but I think it’s distracting you from the most descriptive part part if your test the “it” line

I should be able to read through those and know exactly what the test is for

A good warning sign of your test names not being clear enough is that you have two tests with identical names:

```ruby
it ‘should handle it’ do
```

With the context, the way I would normally use it is more as a way of grouping tests which test of similar things. Then I would make the actual “it” line the most descriptive part.

Does that make sense? :slightly_smiling_face:

**Paul Martin [9:46 AM]**

totally

**Katerina Georgiou [9:46 AM]**

I’m still reviewing so I’ll get back with more 

:slightly_smiling_face:

**Paul Martin [9:46 AM]**

thank you

**Katerina Georgiou [9:46 AM]**

Super pleased with your README overview though :celebrate: (edited) 

In your feature tests, at some point I think you’re using Date.today + 5 but surely at one point in a year the test on line 62 will pass? :slightly_smiling_face:

*scenario “should not wish me a happy birthday” do*

**Paul Martin [9:49 AM]**

whoops!

uh…

**Katerina Georgiou [9:49 AM]**

It’s better to be explicit and just pick a date for your tests that you know won’t ever be affected?

**Paul Martin [9:49 AM]**

ok

that makes sense

**Katerina Georgiou [9:49 AM]**

but an easy mistake to make

Cool :thumbsup_all:

Also, just out of interest for these 2 tests, how come you’re expected this and not content of the page?

```ruby
scenario “should ask for the month of my birthday” do
  visit “/”
  expect(page.find(‘select[name=“month”]’))
end

scenario “should ask for the day of my birthday” do*
  visit “/”
  expect(page.find(‘input[name=“day”]’))
end (edited) 
```

**Paul Martin [9:51 AM]**

ummm because i’m not really sure what i should be testing for with these feature tests

if the exact form element isn’t there then the app won’t work
but are you saying i should be testing for text on the page?
i’m not sure what i should be testing for on the front end of my app

**Katerina Georgiou [9:53 AM]**

Hmmm I’m just thinking that at the moment, you’re tightly coupling your tests to the way you’ve chosen to implement your program, so if that ever changed this test would fail. It depends on what you’re trying to actually text for

**Paul Martin [9:53 AM]**

yeah

**Katerina Georgiou [9:53 AM]**

If you test names are accurate than surely just testing that those things show up on the page is fine?

If you want to test that data is captured as you expect then it’s a slightly different test

**Paul Martin [9:54 AM]**

but if i was testing for text on the page then it would be tightly coupled to the views layer? so is it a case of swings and roundabouts?

or deciding what’s the most important thing to test for, as you said

i think i understand. a period of reflection on this issue is required

and thinking about testing the behaviour, not the implementation

**Katerina Georgiou [10:22 AM]**

Aside from the above, in the controller, the route `post ‘/is_it_your_birthday’ do` is doing a lot (edited) 

**Paul Martin [10:28 AM]**

i’ll take a look

thanks a lot for all this katerina

this is really helpful

**Katerina Georgiou [10:40 AM]**

You’re very welcome

Also, on reflection I think that actually those 2 tests I mentioned where you’re doing `expect(page.find(‘select[name=“month”]’))` are actually ok, as like you said, my suggested change is still pretty much testing the same thing

but in general thinking about not tightly coupling tests to implementation is a good rule of thumb :thumbsup::skin-tone-4: (edited) 

:slightly_smiling_face:
