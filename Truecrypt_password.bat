:: Make sure you edit the USERNAME and password below
:: Creates the batch file that the scheduled task runs
ECHO C:\Program Files\TrueCrypt\TrueCrypt.exe /a favorites /p "password" /q > C:\users\USERNAME\documents\truecrypt.bat

:: Creates the Task in the Task Scheduler
:: Remember to change the USERNAME below
:: Remember the add the specific user in the Trigger property!
schtasks /create /TN "Truecrypt" /TR C:\users\USERNAME\documents\truecrypt.bat /SC ONLOGON

:: Open Task Scheduler so you can specify the user to apply the truecrypt task to at logon (otherwise it does this for any user)
taskschd.msc

:: It waits for you to close the tashschd.msc window. Then it shows a popup message that reminds you to add your disk to the Truecrypt favorites so the task will run successfully
echo msgbox "Don't forget to add your drive to your favorites in Truecrypt! Otherwise your drive will not mount" > %tmp%\tmp.vbs
wscript %tmp%\tmp.vbs
del %tmp%\tmp.vbs

:: Opens Truecrypt
START "Truecrypt" "C:\Program Files\Truecrypt\Truecrypt.exe"
