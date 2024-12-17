#Variaveis de email
$emailFrom = ""
$emailTo = ""
$subject = ""
$body = ""
$smtpServer = ""
$smtpUser = ""
$smtpPassword = ""
$smtpPort = 587

#Criando as credenciais
$securePassword = ConvertTo-SecureString $smtpPassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($smtpUser, $securePassword)

#DEFINIR UMA TAREFA 
echo "Iniciando a tarefa"
echo "Conteudo do log da tarefa" >> log.txt

#ENVIANDO O EMAIL
try {
    Send-MailMessage -From $emailFrom -To $emailTo -Subject $subject -Body $body -SmtpServer $smtpServer -Port $smtpPort -UseSsl -Credential $credential -Attachment ".\log.txt"
    Write-Output "Email enviado com sucesso!"
}
catch {
    Write-Errors "Erro ao enviar o email: $_"
}
