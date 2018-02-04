# bash_password_manager

Using a UNIX terminal, this script allows you to manage a passwords encripted text file. Given an entered name of an account, searches for it in the passwords file (in fact, a previously decripted file of the encripted passwords file):

  - If the entered account name is found in the passwords file: Shows the username for the desired account and pastes its password to  the clipboard.

  - If the entered account name is not found in the passwords file, simply shows a message saying the username and password   for the requested account have not been found.

Also, if executing the bash script without entering an account or entering more than one account, shows a message indicating the correct use of the script.

******************************************************************************************************************************

NOTICE THAT EACH LINE OF THE TEXT FILE MUST HAVE THE FOLLOWING FORMAT: "account_name=username=password"
