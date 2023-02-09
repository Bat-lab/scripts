


SMTP_HOST=<your-mail-server>
SMTP_PORT=<smtp-port>
read -p "user-name:" SMTP_AUTH_MAILID
read -s -p "Password:" SMTP_AUTH_PASSWD
echo ""
#read -p "Press Enter to Login:"
#SMTP_AUTH_PASSWD=$(cat /root/mails/.secret_vault.txt | openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -iter 100000 -salt -pass pass:'secret#vault!password')
read -p "from:" SENDER_MAILID
read -p "to:" RECEIVER_MAILID
#RECEIVER_MAILID='awais.khan@apmosys.com'
read -p "Subject:" SUBJECT
#read -p "Body:" BODY
#echo $BODY > /opt/mail.txt
echo "Body(press enter then Ctrl+d to save):-"
cat > /opt/mail.txt
read -p "File Path:" $FPATH


sleep 5

cat /opt/mail.txt | mailx -s "$SUBJECT" -a $FPATH  -S smtp-use-starttls -S ssl-verify=ignore -S smtp-auth=login  -S smtp=smtp://$SMTP_HOST:$SMTP_PORT -S from="$SENDER_MAILID" -S smtp-auth-user=$SMTP_AUTH_MAILID -S smtp-auth-password=$SMTP_AUTH_PASSWD -S nss-config-dir=/etc/pki/nssdb/ $RECEIVER_MAILID
