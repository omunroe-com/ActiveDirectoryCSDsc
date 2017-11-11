<#
    .EXAMPLE
        This example will add the Active Directory Certificate Services Certificate Authority
        feature to a server and configure it as a certificate authority enterprise root CA.
#>
Configuration Example
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost'
    )

    WindowsFeature ADCS-Cert-Authority
    {
        Ensure = 'Present'
        Name   = 'ADCS-Cert-Authority'
    }

    xAdcsCertificationAuthority CertificateAuthority
    {
        Ensure     = 'Present'
        Credential = $Node.Credential
        CAType     = 'EnterpriseRootCA'
        DependsOn  = '[WindowsFeature]ADCS-Cert-Authority'
    }
}
