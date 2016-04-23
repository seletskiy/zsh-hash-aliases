Useful global aliases started with `#`

| alias | command |
| --- | --- |
| `#`             | `2>&1 less` |
| `# blah`        | `2>&1 grep blah` |
| `##`            | `2>&1` |
| `#s /1/2/`      | `sed -r 's/1/2/'` |
| `#sd /1/`       | `sed -r '/1/{d}'` |
| `#f 2`          | `awk '{print $2}'` |
| `#t`            | `tail` |
| `#t 10`         | `tail -n 10` |
| `#tt`           | `tail -f` |
| `#h`            | `head` |
| `#h 10`         | `head -n 10` |
| `#c 7`          | `cut -f 7` |
| `#c ' ' 7`      | `cut -d" " -f 7` |
| `#x`            | `xargs -n1 -I{}` |
| `#wc`           | `wc -l` |
| `#uc`           | `unic -c` |
| `#sn`           | `sort -n` |
| `#sr`           | `sort -nr` |

| on start of cmdline | command |
| --- | --- |
| `$ # a.go`        | `less a.go` |
| `$ # a.go blah`   | `grep blah a.go` |
| `$ #s /1/2/ a.go` | `sed -rs/1/2/g a.go` |
