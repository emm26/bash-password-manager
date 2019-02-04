# bash_password_manager

Using a UNIX terminal, this script allows you to manage a passwords encripted text file by 2 main functions: adding new passwords(password_manager_encrypt) and getting existant passwords (password_manager_decrypt) and copying them to the clipboard. Both opperations are described in detail next. 

# password_manager_decrypt
**password_manager_decrypt** does the following:

  Given an entered name of an account, searches for it in the passwords file (in fact, a previously and temporary decripted file of the provided encripted passwords file):

   - If the entered account name is found in the passwords file: Shows the username for the desired account and pastes its password to the clipboard.

   - If the entered account name is not found in the passwords file, simply shows a message saying the username and password   for the requested account have not been found.

# password_manager_encrypt
 **password_manager_encrypt** does the following:

  Given an account's name (for instance, "gmail"), its username and its password, decrypts the old encrypted passwords file (if existant, otherwise it creates it).
  
  Adds at the end of the resultant decrypted file the given account's details (name, username and password).
  
  Then it encrypts the new decrypted file (which, again, contains new account's details).
 
# Usage
 **password_manager_decrypt**: ./password_manager_decrypt.sh [accountName]
 
 **password_manager_encrypt**: ./password_manager_encrypt.sh [accountName] [userName] [password]
  
# To consider

  1) Both scripts **delete the decrypted passwords file** as soon as is not anymore needed, for **security** purposes.

  2) Each line of the decrypted/plain passwords file must have the following **FORMAT**: "accountName=userName=password", **each field must be sepparated by the "=" token**.
  
  3) To encrypt the passwords text file it uses "openssl aes-256-cbc -salt -in /Users/yourUser/psw_decripted.txt >> /Users/yourUser/psw_encripted.txt" (Replace the PATHS as you wish, as well as the encryption algorithm), set your own encription password which will be requested to decript when you run the script.
