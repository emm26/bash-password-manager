#!/bin/bash
if [ $# -ne 3 ];
then
    echo ""
    echo "      > ERROR: Correct use: $0 [accountName] [userName] [password] "
    echo "      > FUNCTION: Adds account and password to the encrypted passwords file "
    echo ""
    exit 1
else
    # animation - {delete this block for fastest response time}
        echo ""
        echo -ne 'LOADING: ##########                          (33%)\r'
        sleep .40
        echo -ne 'LOADING: ####################                (66%)\r'
        sleep .40
        echo -ne 'LOADING: ##############################      (100%)\r'
        echo -ne '\n'
    # end of animation

    account_name_to_save=$1
    userName_to_save=$2
    password_to_save=$3

    # converts $1 to lowercase - as all accounts will have the 
    # 'account_name' attribute defined in lowercase format
    account_name_to_save=$(echo "$account_name_to_save" | tr '[:upper:]' '[:lower:]')

    # ATTENTION: REPLACE desired PATHS according to where your encrypted file is 
    # located and where you want your temporary decrypted file
    passwds_decrypted="/Users/edgarmoreno/psw_decrypted.txt"
    passwds_encrypted="/Users/edgarmoreno/psw_encrypted.bin"

    # decrypt existant encrypted passwords file
    openssl aes-256-cbc -d -salt -in "$passwds_encrypted" -out "$passwds_decrypted"

    # add new account's credentials in decrypted file
    echo "$account_name_to_save=$userName_to_save=$password_to_save" >> "$passwds_decrypted"

    # encrypts
    # if there is any existant passwords in the encrypted passwords file,
    # the password to input must be the same one as the previously existant password
    openssl aes-256-cbc -salt -in "$passwds_decrypted" -out "$passwds_encrypted"

    # deletes the passwords decrypted file for security purposes
    rm "$passwds_decrypted"
fi
