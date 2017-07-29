# Audit Report Template

## Usage

Just run:

```
$ ./compiler_report.sh
```

and don't forget to fill out `compiler.cfg` before you do it! :)

## Rationale

The _raison d'être_ of this repo is to be structured in a way that a permits a small/medium team to collaborate easily in an asynchronnous fashion on Github and, at the same time, lower time-to-assembly and decrease merging problems.

## Structure

The assembly structure/rules are simple:

* Every folder level corresponds to a deeper-leveled title
* A file title also corresponds to a deeper-leveled title
* File contents are concatenated "as is"
* Final report file is going to be a Github-Flavoured Markdown [_.md_] file (so you can use github-flavoured markdown syntax inside any of the files)
* Files that produce no new title but instead only output their contents should be named exactly "0 - no_title.md"

## Assembler

The assembler is pretty simple. Just a bash script and another bash file with some config variables.