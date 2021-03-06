function Show-CertificateTrustList {
<#
.ExternalHelp PSPKI.Help.xml
#>
[CmdletBinding()]
	param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[Security.Cryptography.X509Certificates.X509CTL]$CTL
	)
	
	process {
		if (!$CTL.Handle.Equals([IntPtr]::Zero)) {
			[PKI.ManagedAPI.ManagedCryptUI]::DisplayCTL($CTL.Handle)
		} else {
			Write-Error -Category ResourceUnavailable -ErrorId "InvalidHandleException" `
			-Message "An attempt was made to access an uninitialized object. The handle is invalid."
		}
	}
}