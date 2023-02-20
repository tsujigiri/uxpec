# uxpec

a testing tool for [uxn](https://100r.co/site/uxn.html)

## Usage

uxpec provides a tal-based DSL for testing your code. Namely, `describe` and
`it` functions that are used to *describe* what is being tested and what *it* is
supposed to behave like. Further, it provides assertions to be performed on the
stack after your code under test has run. So far there is one assertion,
`;assert/true`, which checks whether the value to be tested is a non-zero byte:

```
;describe JSR2 "my 20 "code 00
  ;it JSR2 "does 20 "stuff 00
    ;my-code JSR2 ( leaves a result on the stack )
    ;assert/true JSR2 ( checks that the result is a non-zero byte )

;uxpec-exit JMP2` ( exit the test program with an appropriate exit code )
```

If the assertions are successful, the output on the terminal will look like
this:

```
my code
  does stuff 👌
```

if they failed, it will look like this:

```
my code
  does stuff 🔥
```

and it will return with a non-zero exit code.

See `etc/demo.tal` for a complete example.

Run the demo with `make demo`.

