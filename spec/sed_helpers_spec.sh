#shellcheck shell=sh

Describe 'Evaluating shell_helplers functions: '
    Include lib/sed_helpers.sh

    Describe 'The double_space function'
        It 'double space a file which already has blank lines in it.'
            When call double_space "
            line 1
            line 2
            line 3 
            "
            The output should eq "
            line 1


            line 2
            
            
            line 3 
            "
        End
    End

End