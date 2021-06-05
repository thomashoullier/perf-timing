# Performance timing
`perf-timing` is a simple and unoriginal utility for timing execution and real
time performance in Common Lisp.

## Usage
We can time either real time or runtime.

**time-real** *fun* &key *mult* *ret-type* => *real-timing*

**time-run** *fun* &key *mult* *ret-type* => *runtime*

We measure the time elapsed when performing a call of *fun*. `time-real`
measures real time, `time-run` measures runtime.

* The time is returned in seconds per *fun* call.
* *mult* is the number of calls to perform in order to accurately measure
  fast functions. Default `1`.
* *ret-type* coerces the type of the returned value. Default `'real`.

```common-lisp
(perf-timing:time-run (lambda () (floor 45)) :mult 10000000 
                                             :ret-type 'double-float)
;;=> 9.1046d-9
```

## Dependencies
None.

## References
1. https://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node232.html
