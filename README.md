# installation

Gemfile:
```
gem 'errorspray'
```

# running specs
```
rbenv exec bundle exec rspec spec/errorspray_spec.rb
```

# purpose

This Ruby gem makes it simple to append contextual information to error messages, providing a "semantic backtrace" alongside the normal backtrace.

The `raise_append` method takes a string and a block, and if all goes well, returns the result of the block:
```
> raise_append('here goes nothing') { 1 + 2 }
=> 3
```

However, if an exception occurs in the block, the string is appended to that exception's message:
```
> raise_append('how could I have foreseen this?') { 1 / 0 }
ZeroDivisionError: divided by 0
	how could I have foreseen this?
```

This becomes more useful when the error condition is not obvious:
```
> (0..10).map { |n| raise_append("for input: #{n.inspect}") { 1 / ((2 * n) - 4) } }
ZeroDivisionError: divided by 0
	for input: 2
```
