fn_sed() {
  # remove all files in outputs
  rm ${script_dir}/outputs/*

  double_space "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/double.txt"

  triple_space "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/triple.txt"
  
  insert_blank_above "${script_dir}/inputs/sample.txt" "regex" > "${script_dir}/outputs/insert_above.txt"
  
  insert_blank_below "${script_dir}/inputs/sample.txt" "regex" > "${script_dir}/outputs/insert_below.txt"
  
  insert_blank_above_below "${script_dir}/inputs/sample.txt" "regex" > "${script_dir}/outputs/insert_above_below.txt"
  
  number "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/number.txt"
  
  number_aligned "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/number_aligned.txt"
  
  number_not_blank "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/number_not_blank.txt"

  count_lines "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/count_lines.txt"

  trim_front "${script_dir}/inputs/sample2.txt" > "${script_dir}/outputs/trim_front.txt"

  trim_end "${script_dir}/inputs/sample2.txt" > "${script_dir}/outputs/trim_end.txt"

  trim_both "${script_dir}/inputs/sample2.txt" > "${script_dir}/outputs/trim_both.txt"

  insert_5spaces "${script_dir}/inputs/sample2.txt" > "${script_dir}/outputs/insert_5spaces.txt"

  align_right "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/align_right.txt"
  
  align_right "${script_dir}/inputs/sample.txt" 50 > "${script_dir}/outputs/align_right2.txt"

  align_center "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/align_center.txt"
  
  align_center2 "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/align_center2.txt"

  # substitute the first e
  replace_a_with_b_at "${script_dir}/inputs/sample.txt" e E > "${script_dir}/outputs/replace_a_with_b_at.txt"
  
  # substitute the second e
  replace_a_with_b_at "${script_dir}/inputs/sample.txt" e E 2 > "${script_dir}/outputs/replace_a_with_b_at.txt"
  
  # substitue all e
  replace_a_with_b_at "${script_dir}/inputs/sample.txt" e E g > "${script_dir}/outputs/replace_a_with_b_at.txt"

  replace_second_last_a_with_b "${script_dir}/inputs/sample.txt" e E > "${script_dir}/outputs/replace_second_last_a_with_b.txt"

  replace_last_a_with_b "${script_dir}/inputs/sample.txt" e E > "${script_dir}/outputs/replace_last_a_with_b.txt"
  
  # substitute if line contains gex
  replace_a_with_b_contain "${script_dir}/inputs/sample.txt" e E gex> "${script_dir}/outputs/replace_a_with_b_contain.txt"

  # substitute if line not containing gex
  replace_a_with_b_not_contain "${script_dir}/inputs/sample.txt" e E gex > "${script_dir}/outputs/replace_a_with_b_not_contain.txt"

  replace_between_a_and_b_with_c "${script_dir}/inputs/sample.txt" there under "inserted text here" > "${script_dir}/outputs/replace_between_a_and_b_with_c.txt"

  replace_a_b_c_with_d "${script_dir}/inputs/sample.txt" there under this "you changed" > "${script_dir}/outputs/replace_a_b_c_with_d.txt"

  reverse_line_order "${script_dir}/inputs/sample5.txt" > "${script_dir}/outputs/reverse_line_order.txt"

  append_after_backslash "${script_dir}/inputs/sample3.txt" > "${script_dir}/outputs/backslash.txt"
  
  append_equal_to_previous "${script_dir}/inputs/sample4.txt" > "${script_dir}/outputs/append_equal_to_previous.txt"

  add_commas_to_nums "${script_dir}/inputs/sample_numbers.txt" > "${script_dir}/outputs/add_commas_to_num.txt"

  add_commas_to_decimal "${script_dir}/inputs/sample_decimals.txt" > "${script_dir}/outputs/add_commas_to_decimal.txt"

  add_blank_lines "${script_dir}/inputs/sample5.txt" 3 > "${script_dir}/outputs/add_blank_lines.txt"

  print_second_last_line "${script_dir}/inputs/sample5.txt" 3 > "${script_dir}/outputs/print_second_last_line.txt"

  print_line_before_a "${script_dir}/inputs/sample5.txt" "line 5" > "${script_dir}/outputs/print_line_before_a.txt"

  print_line_after_a "${script_dir}/inputs/sample5.txt" "line 5" > "${script_dir}/outputs/print_line_after_a.txt"

  grep_line_with_a "${script_dir}/inputs/sample5.txt" "2" > "${script_dir}/outputs/grep_line_with_a.txt"

  print_line_num "${script_dir}/inputs/sample5.txt" 4 > "${script_dir}/outputs/print_line_num.txt"




  delete_last_line "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/delete_last_line.txt"

  delete_last_n_lines "${script_dir}/inputs/sample.txt" 5 > "${script_dir}/outputs/delete_last_n_lines.txt"

  delete_every_n_line "${script_dir}/inputs/sample.txt" 3 > "${script_dir}/outputs/delete_every_n_line.txt"

  delete_line_with_pattern "${script_dir}/inputs/sample.txt" 'line' > "${script_dir}/outputs/delete_line_with_pattern.txt"

  delete_all_blank_lines "${script_dir}/inputs/sample5.txt" > "${script_dir}/outputs/delete_all_blank_lines.txt"

  delete_all_consecutive_blank_lines "${script_dir}/inputs/sample5.txt"> "${script_dir}/outputs/delete_all_consecutive_blank_lines.txt"

  delete_leading_blank_lines "${script_dir}/inputs/sample5.txt"> "${script_dir}/outputs/delete_leading_blank_lines.txt"

  delete_trailing_blank_lines "${script_dir}/inputs/sample5.txt"> "${script_dir}/outputs/delete_trailing_blank_lines.txt"

  delete_last_line_from_paragraph "${script_dir}/inputs/sample6.txt" > "${script_dir}/outputs/delete_last_line_from_paragraph.txt"

  get_value_from_key "${script_dir}/inputs/sample6.txt" "Subject:" > "${script_dir}/outputs/get_value_from_key.txt"

  insert_a_to_front "${script_dir}/inputs/sample.txt" "> " > "${script_dir}/outputs/insert_a_at_front.txt"

  insert_a_to_front "${script_dir}/inputs/sample.txt" > "${script_dir}/outputs/insert_a_at_front.txt"
  insert_a_to_front "${script_dir}/inputs/sample.txt" "> " > "${script_dir}/outputs/insert_a_at_front2.txt"

  delete_a_from_front "${script_dir}/inputs/sample7.txt" > "${script_dir}/outputs/delete_a_from_front.txt"
  delete_a_from_front "${script_dir}/inputs/sample7.txt" "# " > "${script_dir}/outputs/delete_a_from_front2.txt"

  delete_html_tags "${script_dir}/inputs/sample8.html" > "${script_dir}/outputs/delete_html_tags.html"
}
