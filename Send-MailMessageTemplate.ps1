$parameters = @{
    From = 'from@bar.com'
    To = 'to@bar.com'
    Subject = 'Email Subject'
    Attachments = @('C:\files\samplefile1.txt', 'C:\files\samplefile2.txt')
    BCC = 'bcc@bar.com'
    Body = 'Email body'
    BodyAsHTML = $False
    CC = 'cc@bar.com'
    Credential = Get-Credential
    DeliveryNotificationOption = 'onSuccess'
    Encoding = 'UTF8'
    Port = '25'
    GoalKicker.com – PowerShell® Notes for Professionals 66
    Priority = 'High'
    SmtpServer = 'smtp.com'
    UseSSL = $True
}
# Notice: Splatting requires @ instead of $ in front of variable name
Send-MailMessage @parameters
