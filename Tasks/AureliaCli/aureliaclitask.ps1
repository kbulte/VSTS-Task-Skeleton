[CmdletBinding()]
param()

# For more information on the VSTS Task SDK:
# https://github.com/Microsoft/vsts-task-lib
Trace-VstsEnteringInvocation $MyInvocation
try {
    # Set the working directory.
    $cwd = Get-VstsInput -Name cwd -Require
    Assert-VstsPath -LiteralPath $cwd -PathType Container
    Write-Verbose "Setting working directory to '$cwd'."
    Set-Location $cwd

    # Output the command to the log.
    Write-Host au (Get-VstsInput -Name command) (Get-VstsInput -Name arguments)
    $command = Get-VstsInput -Name command -Require
    $arguments = Get-VstsInput -Name arguments
    
    au $command $arguments

} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
