# Enviar Email com PowerShell

Este repositório contém um script PowerShell para enviar emails com anexos usando o cmdlet `Send-MailMessage`.

## Pré-requisitos

- Windows PowerShell
- Acesso a um servidor SMTP (por exemplo, Gmail, Outlook, servidor SMTP corporativo)
- Credenciais de email válidas para o servidor SMTP

## Uso

1. **Clone o Repositório:**

    ```sh
    git clone https://github.com/victorgemelgo/PowerShell-SendMail.git
    cd PowerShell-SendMail
    ```

2. **Edite o Script:**

    Abra o arquivo `envia_email.ps1` em um editor de texto e atualize as seguintes variáveis com suas informações:

    ```powershell
    $emailFrom = "seu_email@example.com"
    $emailTo = "destinatario@example.com"
    $subject = "Assunto do Email"
    $body = "Conteúdo do email"
    $smtpServer = "smtp.example.com"
    $smtpUser = "seu_email@example.com"
    $smtpPassword = "sua_senha"
    $smtpPort = 587
    ```

3. **Execute o Script:**

    Abra o PowerShell e navegue até o diretório onde o arquivo `envia_email.ps1` está localizado. Execute o script com:

    ```powershell
    .\envia_email.ps1
    ```

## Detalhes do Script

Aqui está o conteúdo do script `envia_email.ps1`:

```powershell
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
```
Notas
- Certifique-se de que os detalhes do servidor SMTP estão corretos.
- Para o Gmail, você pode precisar permitir acesso a aplicativos menos seguros ou criar uma senha de aplicativo se tiver a autenticação em dois fatores ativada.
- O script suporta múltiplos anexos. Basta fornecer uma lista de caminhos de arquivos separados por vírgulas na variável $attachment.
