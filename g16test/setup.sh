echo "This file provides the command 'g16test'."
echo "To run the test again, you can just type 'g16test'."

export MODULEPATH="/opt/modulefiles:/usr/local/ur/modulefiles"
export PATH="/usr/local/anaconda/anaconda3/bin:$PATH"
export output="g16test.out"

function record
{
    echo "`date` :: $1" | tee -a "$output"
}

function g16test 
{
    test_input=${1:-H_boat-boat_Ge_N.com}
    command cd $HOME/g16test
    touch $output
    command rm -f $output
    module load gaussian/16
    if [ ! $? ]; then
        echo "gaussian/16 module not available. aborting test."
        return
    fi
    g16=$(which g16)
    record "running code from $g16" 
    g16 < "$test_input" 2>&1 | tee -a "$output"
    if [ $? ]; then
        record "g16test succeeded."
    else
        record "g16test FAILED." 
    fi
}

g16test
