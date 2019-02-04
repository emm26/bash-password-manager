#!/bin/bash
if [ $# -ne 1 ];
then
    echo ""
    echo "      > ERROR: Correct use: ./$0 [account] "
    echo "      > FUNCTION: Copies account's password to clipboard "
    echo ""
    exit 1
else
    #animation - {delete this block for fastest response time}
        echo ""
        echo -ne 'LOADING: ##########                          (33%)\r'
        sleep .40
        echo -ne 'LOADING: ####################                (66%)\r'
        sleep .40
        echo -ne 'LOADING: ##############################      (100%)\r'
        echo -ne '\n'
    #end of animation

    account_to_find=$1
    #converts $1 to lowercase - as all accounts will have the 'account_name' attribute defined in lowercase format
    account_to_find=$(echo "$account_to_find" | tr '[:upper:]' '[:lower:]')


    #desencripts encripted password file and saves it into a .txt file
    #ATTENTION: REPLACE desired PATHS according to where your encripted file is located and where you want your temporary desencripted file
    openssl des3 -d -salt -in /Users/yourUserHere/psw_encripted.txt >> /Users/yourUserHere/psw_decripted.txt
    passwds_decripted="/Users/yourUser/psw_decripted.txt"

    #reads Line by Line of new desencripted passwords file, its line format is described as follows: account_name=username=password
    while IFS= read -r line
    do
        current=$line
        current_account="${current%%=*}"

        if [[ $account_to_find = $current_account ]];
        then
            #removes decripted password .txt file - security purposes
            rm "/Users/yourUser/psw_decripted.txt"
            echo "      > Account found: $current_account"
            current_username="${current#*=}"
            current_username="${current_username%%=*}"
            echo "      > Username is: $current_username"
            current_passwd="${current##*=}"
            #copies password to the clipboard
            echo "$current_passwd" | pbcopy
            echo "      > Password succesfully copied to clipboard"
            echo ""
            exit 0
        fi
    done <"$passwds_decripted"

    #removes decripted password .txt file - security purposes
    #ATTENTION: REPLACE PATH according to where your desencripted file was placed
    rm "/Users/yourUser/psw_decripted.txt"
    echo "      > ERROR: No password found"
    echo ""
    exit 1
fi
