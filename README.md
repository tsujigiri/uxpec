# uxpec

a testing tool for [uxn](https://100r.co/site/uxn.html)

***WARNING***: This is a very new venture and, as such, is changing a lot.
Consider this when using it!

## Usage

uxpec provides a tal-based DSL for testing your code. Namely, `describe`,
`context` and `it` functions that are used to *describe* what is being tested
and what *it* is supposed to behave like in a specific *context*. Further, it
provides assertions to be performed on the stack after your code under test has
run. So far there are two assertions, `assert/true` and `assert/false`, which
check whether the value on the stack is a non-zero or zero byte, respectively:

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

See `etc/demo.tal` for a complete example.

Run the demo with `make demo`.

