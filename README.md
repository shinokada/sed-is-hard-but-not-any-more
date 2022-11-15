# Sed is hard but not any more

Sed is hard but not any more is a sed function library to make your sed life easier.

## How to use it

Copy [sed_function_library](https://github.com/shinokada/sed-function-library/blob/main/lib/sed_function_library.sh) to your Bash project.

```
self=$(readlink -f "$0")
script_dir=${self%/*}
. "${script_dir}/path/to/sed_function_library.sh"
```

## Examples

You can see how to use all the functions in [this page.](https://github.com/shinokada/sed-function-library/blob/main/src/sed_scripts.sh).

## See the results

You can see [inputs](https://github.com/shinokada/sed-function-library/tree/main/inputs) and [outputs](https://github.com/shinokada/sed-function-library/tree/main/outputs) in those directories.

## Functions

You can guess what each funcion do from the function names. See more details in each function.

## Credit

- [git_snippets.sh by r2k0](https://gist.github.com/r2k0/1152840)