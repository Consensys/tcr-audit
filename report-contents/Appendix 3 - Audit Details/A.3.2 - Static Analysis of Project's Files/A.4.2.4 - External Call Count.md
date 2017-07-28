How many external calls are there in the project?

```
<command output>
```

NIX command used for the statistic:

```
egrep '\.\w*\(.*\)' contracts/* -nr
```