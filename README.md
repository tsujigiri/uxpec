# uxpec

a testing tool for [uxn](https://100r.co/site/uxn.html)

## Usage

uxpec provides assertions to be performed on the stack, prints a description of
the assertion provided by you in your test, and sets the exit code depending on
whether any of the assertions in your testing rom failed or not.

All assertions consume an absolute address to a null-terminated string in
memory from the stack first and then check the next value on the stack
according to the assertion used.

So far there is one assertion, `;assert/true`, which checks whether the value
to be tested is a non-zero byte:

```
#01 #02 EQU
;description ;assert/true JSR2
```

End your testing rom with `;uxpec-exit JMP2` to exit the program with the
appropriate exit code.

See `etc/demo.tal` for a complete example.

Run the demo with `make demo`.

