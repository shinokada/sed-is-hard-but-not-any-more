# Sed is hard but not any more

Sed is hard but not any more is a sed function library to make your sed life easier. (a little bit)

## How to use it

Copy [sed_function_library](https://github.com/shinokada/sed-function-library/blob/main/lib/sed_function_library.sh) to your Bash project.

```
self=$(readlink -f "$0")
script_dir=${self%/*}
. "${script_dir}/path/to/sed_function_library.sh"
```

## Examples

See how to use all the functions in [this page.](https://github.com/shinokada/sed-function-library/blob/main/src/sed_scripts.sh).

## See the results

See [inputs](https://github.com/shinokada/sed-function-library/tree/main/inputs) and [outputs](https://github.com/shinokada/sed-function-library/tree/main/outputs) in those directories.

## Function names

You can guess what each funcion do from the function names. See more details in each function.
If you know better descriptive names, please let me know in the issue section.
If you know sed commands that are not in this library, please let me know in the comment section.

## Credit

- [git_snippets.sh by r2k0](https://gist.github.com/r2k0/1152840)
- [50 sed command examples](https://linuxhint.com/50_sed_command_examples)