How many functions are there in the project's contracts? (please see _Notes_ below)

```
<matching command output>
```

How many state-changing functions are there in the project?

```
<matching command output>
```

NIX command used to generate these statistic:

```
**output the ABI to a file using solc**
$ solc --abi contracts/*.sol > abi.json

**how many functions are there?**
$ cat abi.json | grep -o \"type\":\"function\" | wc -l

**how many functions are state changing?**
$ cat abi.json | grep -o \"constant\":false | wc -l
```