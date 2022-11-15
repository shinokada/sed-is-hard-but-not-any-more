double_space(){
  # double space a file which already has blank lines in it. Output file
  # should contain no more than one blank line between lines of text.
  file=$1
  sed '/^$/d;G' $file
}

triple_space(){
  # triple space a file
  file=$1
  sed 'G;G' $file
}

insert_blank_above(){
  # insert a blank line above every line which matches e.g. "regex"
  file=$1
  if [ "$#" -ge 2 ];then 
    match=$2
  else 
    echo "You must provide a match."
    exit 1
  fi
  sed "/${match}/{x;p;x;}" $file
}

insert_blank_below(){
  # insert a blank line below every line which matches "regex"
  file=$1
  if [ "$#" -ge 2 ];then 
    match=$2
  else 
    echo "You must provide a match."
    exit 1
  fi
  sed "/${match}/G" $file
 }

insert_blank_above_below(){
  # insert a blank line above and below every line which matches "regex"
  file=$1
  if [ "$#" -ge 2 ];then 
    match=$2
  else 
    echo "Specify the matching patter."
    exit 1 
  fi
  sed "/${match}/{x;p;x;G;}" $file
}

number(){
  # number each line of a file (simple left alignment). Using a tab (see
  file=$1
  # note on '\t' at end of file) instead of space will preserve margins.
  sed =  $file | sed 'N;s/\n/\t/'
 }

number_aligned(){
  # number each line of a file (number on left, right-aligned)
  file=$1
  sed = $file | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1  /'
}

number_not_blank(){
  # number each line of file, but only print numbers if line is not blank
  file=$1
  sed '/./=' $file | sed '/./N; s/\n/ /'
}

count_lines(){
  # count lines (emulates "wc -l")
  file=$1
  sed -n '$=' $file
}

trim_front(){
  # delete leading whitespace (spaces, tabs) from front of each line
  # aligns all text flush left
  file=$1
  # see note on '\t' at end of file
  sed 's/^[ \t]*//' $file                   
}

trim_end(){
  # delete trailing whitespace (spaces, tabs) from end of each line
  file=$1
  # see note on '\t' at end of file
  sed 's/[ \t]*$//' $file     
}

trim_both(){
  # delete BOTH leading and trailing whitespace from each line
  file=$1
  sed 's/^[ \t]*//;s/[ \t]*$//' $file
}

insert_5spaces(){
  # insert 5 blank spaces at beginning of each line (make page offset)
  file=$1
  sed 's/^/     /' $file
}

align_right(){
  # align all text flush right on a 79-column width
  # set at 78 plus 1 space
  file="$1"
  if [ "$#" -ge 2 ];then 
    column=$2
  else 
    column=78 
  fi
  sed -e :a -e "s/^.\{1,${column}\}$/ &/;ta" $file
}

align_center(){
  # center all text in the middle of 79-column width. In method 1,
  # spaces at the beginning of the line are significant, and trailing
  # spaces are appended at the end of the line. 
  file="$1"
  if [ "$#" -ge 2 ];then 
    column=$2
  else 
    column=78 
  fi
  # method 1
  sed  -e :a -e "s/^.\{1,${column}\}$/ & /;ta" $file
}

align_center2(){
  # center all text in the middle of 79-column width. 
  # In method 2, spaces at
  # the beginning of the line are discarded in centering the line, and
  # no trailing spaces appear at the end of lines.
  file="$1"
  if [ "$#" -ge 2 ];then 
    column=$2
  else 
    column=78 
  fi
  # method 2                    
  sed  -e :a -e "s/^.\{1,${column}\}$/ &/;ta" -e 's/\( *\)\1/\1/' $file
}

replace_a_with_b_at(){
  # substitute (find and replace) "foo" with "bar" on each line
  file="$1"
  search="$2"
  if [ "$#" -ge 4 ];then 
    position=$4
  else
    position=''
  fi
  if [ "$#" -ge 3 ];then 
    replace="$3"
  else 
    echo "You must provide at least three args."
    exit 1 
  fi
  # replaces only 1st instance in a line
  #  sed 's/foo/bar/'
  # replaces only 4th instance in a line             
  #  sed 's/foo/bar/4'            
  sed "s/${search}/${replace}/${position}"  $file 
}

replace_second_last_a_with_b(){
  # replace the next-to-last case
  file="$1"
  search="$2"
  if [ "$#" -ge 3 ];then 
    replace="$3"
  else 
    echo "You must provide at least three args."
    exit 1 
  fi
  sed "s/\(.*\)${search}\(.*${search}\)/\1${replace}\2/" $file
}

replace_last_a_with_b(){
  # replace only the last case
  # The \1 refers to the characters captured by the escaped parentheses.
  file="$1"
  search="$2"
  if [ "$#" -ge 3 ];then 
    replace="$3"
  else 
    echo "You must provide at least three args."
    exit 1 
  fi
  sed "s/\(.*\)${search}/\1${replace}/" $file        
}

replace_a_with_b_contain(){
  # substitute "foo" with "bar" ONLY for lines which contain "baz"
  file="$1"
  search="$2"
  replace="$3"
  if [ "$#" -ge 4 ];then 
    contain="$4"
  else 
    echo "You must provide four args."
    exit 1 
  fi
  sed "/${contain}/s/${search}/${replace}/g" $file
}

replace_a_with_b_not_contain(){
  # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
  file="$1"
  search="$2"
  replace="$3"
  if [ "$#" -ge 4 ];then 
    contain="$4"
  else 
    echo "You must provide four args."
    exit 1 
  fi
  sed "/${contain}/!s/${search}/${replace}/g" $file
}

replace_between_a_and_b_with_c(){
  file=$1
  char1=$2
  char2=$3
  if [ "$#" -ge 4 ];then 
  replacewith=$4
  else 
    echo "You must provide four args."
    exit 1 
  fi
  sed "s/${char1}.*${char2}/${char1} ${replacewith} ${char2}/" $file
}

replace_a_b_c_with_d(){
  # change "scarlet" or "ruby" or "puce" to "red"
  file=$1
  scarlet=$2
  ruby=$3
  puce=$4
  if [ "$#" -ge 5 ];then 
  red=$5
  else 
    echo "You must provide five args."
    exit 1 
  fi
  # most seds
  sed "s/${scarlet}/${red}/g;s/${ruby}/${red}/g;s/${puce}/${red}/g" $file
  # GNU sed only
  #  gsed 's/scarlet\|ruby\|puce/red/g'                
}

reverse_line_order(){
# reverse order of lines (emulates "tac")
# bug/feature in HHsed v1.5 causes blank lines to be deleted
  file=$1
# method 1
 sed '1!G;h;$!d' $file
# method 2               
#  sed -n '1!G;h;$p'             
}

# reverse each character on the line (emulates "rev")
#  sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'

# join pairs of lines side-by-side (like "paste")
#  sed '$!N;s/\n/ /'

append_after_backslash(){
  # if a line ends with a backslash, append the next line to it
  file="$1"
  sed -e :a -e '/\\$/N; s/\\\n//; ta' $file
}

append_after_equal(){
  # if a line begins with an equal sign, append it to the previous line
  # and replace the "=" with a single space
  file="$1"
  sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D' $file
}

add_commas_to_nums(){
  # add commas to numeric strings, changing "1234567" to "1,234,567"
  # GNU sed
  #  gsed ':a;s/\B[0-9]\{3\}\>/,&/;ta'                     
  # other seds
  file=$1
  sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta' $file 
}

add_commas_to_decimal(){
  # add commas to numbers with decimal points and minus signs (GNU sed)
  file=$1
  gsed -r ':a;s/(^|[^0-9.])([0-9]+)([0-9]{3})/\1\2,\3/g;ta' $file
}

add_blank_lines(){
  # add a blank line every 5 lines (after lines 5, 10, 15, 20, etc.)
  file=$1
  if [ "$#" -ge 2 ];then 
    every=$2
  else 
    # default
    every=2
  fi
  # GNU sed only
  gsed "0~${every}G" $file   
  # other seds            
  #  sed 'n;n;n;n;G;'             
}

# SELECTIVE PRINTING OF CERTAIN LINES:

# print first 10 lines of file (emulates behavior of "head")
#  sed 10q

# print first line of file (emulates "head -1")
#  sed q

# print the last 10 lines of a file (emulates "tail")
#  sed -e :a -e '$q;N;11,$D;ba'

# print the last 2 lines of a file (emulates "tail -2")
#  sed '$!N;$!D'

# print the last line of a file (emulates "tail -1")
#  sed '$!d'                    # method 1
#  sed -n '$p'                  # method 2

print_second_last_line(){
  # for 1-line files, print blank line
  file=$1
  sed -e '$!{h;d;}' -e x  $file           
  #  sed -e '1{$q;}' -e '$!{h;d;}' -e x  # for 1-line files, print the line
  #  sed -e '1{$d;}' -e '$!{h;d;}' -e x  # for 1-line files, print nothing
}

# print only lines which match regular expression (emulates "grep")
#  sed -n '/regexp/p'           # method 1
#  sed '/regexp/!d'             # method 2

# print only lines which do NOT match regexp (emulates "grep -v")
#  sed -n '/regexp/!p'          # method 1, corresponds to above
#  sed '/regexp/d'              # method 2, simpler syntax

print_line_before_a(){
  # print the line immediately before a regexp, but not the line
  # containing the regexp
  file=$1
  if [ "$#" -ge 2 ];then 
    regexp=$2
  else 
    echo "You must provide two args."
    exit 1 
  fi
  sed -n "/${regexp}/{g;1!p;};h" $file
}

print_line_after_a(){
  # print the line immediately after a regexp, but not the line
  # containing the regexp
  file=$1
  if [ "$#" -ge 2 ];then 
    regexp=$2
  else 
    echo "You must provide two args."
    exit 1 
  fi
  sed -n "/${regexp}/{n;p;}" $file
}

# print 1 line of context before and after regexp, with line number
# indicating where the regexp occurred (similar to "grep -A1 -B1")
#  sed -n -e '/regexp/{=;x;1!p;g;$!N;p;D;}' -e h

grep_line_with_a(){
  # not working
  file=$1
  if [ "$#" -ge 2 ];then 
    AAA=$2
  else 
    echo "You must provide two args."
    exit 1 
  fi
  # grep for AAA 
 sed "/${AAA}/!d" $file
}


# grep for AAA and BBB and CCC (in that order)
#  sed '/AAA.*BBB.*CCC/!d'

# grep for AAA or BBB or CCC (emulates "egrep")
#  sed -e '/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d    # most seds
#  gsed '/AAA\|BBB\|CCC/!d'                        # GNU sed only

# print paragraph if it contains AAA (blank lines separate paragraphs)
# HHsed v1.5 must insert a 'G;' after 'x;' in the next 3 scripts below
#  sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;'

# print paragraph if it contains AAA and BBB and CCC (in any order)
#  sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;/BBB/!d;/CCC/!d'

# print paragraph if it contains AAA or BBB or CCC
#  sed -e '/./{H;$!d;}' -e 'x;/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d
#  gsed '/./{H;$!d;};x;/AAA\|BBB\|CCC/b;d'         # GNU sed only

# print only lines of 65 characters or longer
#  sed -n '/^.\{65\}/p'

# print only lines of less than 65 characters
#  sed -n '/^.\{65\}/!p'        # method 1, corresponds to above
#  sed '/^.\{65\}/d'            # method 2, simpler syntax

# print section of file from regular expression to end of file
#  sed -n '/regexp/,$p'

# print section of file based on line numbers (lines 8-12, inclusive)
#  sed -n '8,12p'               # method 1
#  sed '8,12!d'                 # method 2

print_line_num(){
  # print line number 52
  file=$1
  if [ "$#" -ge 2 ];then 
    num=$2
  else 
    echo "You must provide two args."
    exit 1 
  fi
  # method 1
  #  sed -n '52p' 
  # method 2                
  #  sed '52!d'                   
  # method 3, efficient on large files
  sed "${num}q;d" $file              
}
# beginning at line 3, print every 7th line
#  gsed -n '3~7p'               # GNU sed only
#  sed -n '3,${p;n;n;n;n;n;n;}' # other seds

# print section of file between two regular expressions (inclusive)
#  sed -n '/Iowa/,/Montana/p'             # case sensitive

# SELECTIVE DELETION OF CERTAIN LINES:

# print all of file EXCEPT section between 2 regular expressions
#  sed '/Iowa/,/Montana/d'

# delete duplicate, consecutive lines from a file (emulates "uniq").
# First line in a set of duplicate lines is kept, rest are deleted.
#  sed '$!N; /^\(.*\)\n\1$/!P; D'

# delete duplicate, nonconsecutive lines from a file. Beware not to
# overflow the buffer size of the hold space, or else use GNU sed.
#  sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P'

# delete all lines except duplicate lines (emulates "uniq -d").
#  sed '$!N; s/^\(.*\)\n\1$/\1/; t; D'

# delete the first 10 lines of a file
#  sed '1,10d'
delete_last_line(){
  # delete the last line of a file
  file=$1
  sed '$d' $file
}
# delete the last 2 lines of a file
#  sed 'N;$!P;$!D;$d'

delete_last_n_lines(){
  # delete the last 10 lines of a file
  file=$1
  if [ "$#" -ge 2 ];then 
    num=$2
  else 
    # default
    num=5
  fi
  # method 1
  # sed -e :a -e "$d;N;2,${num}ba" -e 'P;D' $file 
  # method 2 
   sed -n -e :a -e "1,${num}!{P;N;D;};N;ba" $file
}

delete_every_n_line(){
  # delete every n-th line
  file=$1
  if [ "$#" -ge 2 ];then 
    num=$2
  else 
    # default
    num=5
  fi
  # GNU sed only
   gsed "0~${num}d"  $file                         
  #  sed 'n;n;n;n;n;n;n;d;'                # other seds
}

delete_line_with_pattern(){
  # delete lines matching pattern
  file=$1
  if [ "$#" -ge 2 ];then 
    pattern=$2
  else 
    echo "You must provide a pattern."
    exit 1
  fi
  sed "/${pattern}/d" $file
}

delete_all_blank_lines(){
  # delete ALL blank lines from a file (same as "grep '.' ")
  file=$1
  # method 1
  sed '/^$/d' $file
  # method 2                         
  #  sed '/./!d'                           
}

# delete all CONSECUTIVE blank lines from file except the first; also
# deletes all blank lines from top and end of file (emulates "cat -s")
#  sed '/./,/^$/!d'          # method 1, allows 0 blanks at top, 1 at EOF
#  sed '/^$/N;/\n$/D'        # method 2, allows 1 blank at top, 0 at EOF

delete_all_consecutive_blank_lines(){
  # delete all CONSECUTIVE blank lines from file except the first 2:
  file=$1
  sed '/^$/N;/\n$/N;//D' $file
}

delete_leading_blank_lines(){
  file=$1
# delete all leading blank lines at top of file
  sed '/./,$!d' $file
}
delete_trailing_blank_lines(){
  file=$1
  # delete all trailing blank lines at end of file
  # works on all seds
  sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'  $file 
  # ditto, except for gsed 3.02.*
  # sed -e :a -e '/^\n*$/N;/\n$/ba'        
}

delete_last_line_from_paragraph(){
  file=$1
  # delete the last line of each paragraph
  sed -n '/^$/{p;h;};/./{x;/./p;}' $file
}

# SPECIAL APPLICATIONS:

# remove nroff overstrikes (char, backspace) from man pages. The 'echo'
# command may need an -e switch if you use Unix System V or bash shell.
#  sed "s/.`echo \\\b`//g"    # double quotes required for Unix environment
#  sed 's/.^H//g'             # in bash/tcsh, press Ctrl-V and then Ctrl-H
#  sed 's/.\x08//g'           # hex expression for sed 1.5, GNU sed, ssed

# get Usenet/e-mail message header
#  sed '/^$/q'                # deletes everything after first blank line

# get Usenet/e-mail message body
#  sed '1,/^$/d'              # deletes everything up to first blank line

get_value_from_key(){
  file=$1
  if [ "$#" -ge 2 ];then 
    key=$2
  else 
    echo "You must provide a key."
    exit 1
  fi
  # get Subject header, but remove initial "Subject: " portion
  sed "/^${key} */!d; s///;q" $file
}

# get return address header
#  sed '/^Reply-To:/q; /^From:/h; /./d;g;q'

# parse out the address proper. Pulls out the e-mail address by itself
# from the 1-line return address header (see preceding script)
#  sed 's/ *(.*)//; s/>.*//; s/.*[:<] *//'

insert_a_to_front(){
  file=$1
  if [ "$#" -ge 2 ];then 
    insert=$2
  else 
    insert="> "
  fi
  
  # add a leading angle bracket and space to each line (quote a message)
  sed "s/^/${insert}/" $file
}

delete_a_from_front(){
  file=$1
  if [ "$#" -ge 2 ];then 
    remove=$2
  else 
    remove="> " 
  fi
  
  # delete leading angle bracket & space from each line (unquote a message)
  sed "s/^${remove}//" $file
}

delete_html_tags(){
  file=$1
  # remove most HTML tags (accommodates multiple-line tags)
  sed -e :a -e 's/<[^>]*>//g;/</N;//ba' $file
}

# extract multi-part uuencoded binaries, removing extraneous header
# info, so that only the uuencoded portion remains. Files passed to
# sed must be passed in the proper order. Version 1 can be entered
# from the command line; version 2 can be made into an executable
# Unix shell script. (Modified from a script by Rahul Dhesi.)
#  sed '/^end/,/^begin/d' file1 file2 ... fileX | uudecode   # vers. 1
#  sed '/^end/,/^begin/d' "$@" | uudecode                    # vers. 2

# sort paragraphs of file alphabetically. Paragraphs are separated by blank
# lines. GNU sed uses \v for vertical tab, or any unique char will do.
#  sed '/./{H;d;};x;s/\n/={NL}=/g' file | sort | sed '1s/={NL}=//;s/={NL}=/\n/g'
#  gsed '/./{H;d};x;y/\n/\v/' file | sort | sed '1s/\v//;y/\v/\n/'