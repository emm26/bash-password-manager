# bash_password_manager

Using a UNIX terminal, this script allows you to manage a passwords encripted text file. Given an entered name of an account, searches for it in the passwords file (in fact, a previously and temporary decripted file of the encripted passwords file):

  - If the entered account name is found in the passwords file: Shows the username for the desired account and pastes its password to  the clipboard.

  - If the entered account name is not found in the passwords file, simply shows a message saying the username and password   for the requested account have not been found.

Also, if executing the bash script without entering an account or entering more than one account, shows a message indicating the correct use of the script.

******************************************************************************************************************************

NOTICE:

  1) EACH LINE OF THE PASSWORDS FILE MUST HAVE THE FOLLOWING FORMAT: "account_name=username=password"
  2) TO ENCRYPT THE PASSWORDS TEXT FILE USE "openssl des3 -salt -in /Users/yourUser/psw_decripted.txt >> /Users/yourUser/psw_encripted.txt" (Replace the PATHS as you wish), set your own encription password which will be requested to decript when you run the script.
