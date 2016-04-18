Useful global aliases started with `#`

| alias | command |
| --- | --- |
| #             | &#124; 2>&1 less |
| #             | &#124; 2>&1 less |
| # blah        | &#124; 2>&1 grep blah |
| ##            | 2>&1 |
| #s /1/2/      | &#124; sed -r 's/1/2/'' |
| #sd /1/       | &#124; sed -r '/1/{d}' |
| #f 2          | &#124; awk '{print $2}' |
| #t            | &#124; tail -n 1 |
| #t 10         | &#124; tail -n 10 |
| #tt           | &#124; tail -f |
| #h            | &#124; head -n 20 |
| #h 10         | &#124; head -n 10 |
| #c 7          | &#124; cut -f 7 |
| #cs 7         | &#124; cut -d" " -f 7 |
| #w            | &#124; wc -l |
| #x            | &#124; xargs -n1 -I{} |
| $ # a.go      | less a.go |
| $ # a.go blah | grep blah a.go |
