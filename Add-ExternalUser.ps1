<#
.Synopsis
Invites external users to tenant
.DESCRIPTION
Invites an external account to an azure / office 365 tenant
.PARAMETER Mailbox
Mailbox of the external user you're inviting
.EXAMPLE
Add-ExternalUser -Mailbox "bob.builder@gmail.com" -DisplayName "Bob the Builder" 
#>
function Add-ExternalUser {
    # Start function
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]$Mailbox,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]$DisplayName
    )
    Begin {
        Import-Module AzureAD
        Connect-AzureAD 
    }
    Process {
        # Invites user to tenant as external guest
        New-AzureADMSInvitation -InvitedUserDisplayName $DisplayName -InvitedUserEmailAddress $Mailbox -SendInvitationMessage $true -InviteRedirectUrl "http://myapps.microsoft.com" -InvitedUserType Guest
    }
}
