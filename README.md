# uxpec

a testing tool for [uxn](https://100r.co/site/uxn.html)

***WARNING***: This is a very new venture and, as such, is changing a lot.
Consider this when using it!

## Usage

uxpec provides a tal-based DSL for testing your code. Namely, `describe`,
`context` and `it` functions that are used to *describe* what is being tested
and what *it* is supposed to behave like in a specific *context*. Further, it
provides assertions to be performed on the stack after your code under test has
run:

* `assert/true`: checks for a non-zero byte on the stack
* `assert/false`: checks for a zero byte on the stack
* `assert/stack-empty`: checks for the working stack being empty
* `assert/equ`: asserts that `EQU` is true
* `assert/equ2`: asserts that `EQU2` is true

A simple example:

```
describe "my 20 "code 00
  context "when 20 "this 20 "happens 00
    it "does 20 "stuff 00
      my-code ( leaves a result on the stack )
      assert/true ( checks that the result is a non-zero byte )
    end
  end
end

!uxpec-exit ( exit the test program with an appropriate exit code )
```

If the assertions are successful, the output on the terminal will look like
this:

```
my code
  when this happens
    does stuff 👌
```

if they failed, it will look like this:

```
my code
  when this happens
    does stuff 🔥
```

and it will return with a non-zero exit code.

`describe`, `context` and `it`, together with `end`, work sort of as a closure,
where the stack, set up in the outer *block* is the same within every enclosed
*block*, no matter what happens in the neighboring *blocks*.

```
describe "my 20 "test 00
	#01
	context "when 20 "there 20 "is 20 "something 20 "on 20 "the 20 "stack 00
		#02
		it "is 20 "visible 00
			#0102 assert/equ2
			#03
		end

		it "is 20 "still 20 "visible 00
			#0102 assert/equ2
		end
	end
end
```

See `etc/demo.tal` for a complete example.

Run the demo with `make demo`.

