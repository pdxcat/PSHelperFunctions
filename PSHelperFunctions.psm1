# An assortment of helper functions that are useful in the CAT/MCECS environment.
Function Test-32Bit {
    return [IntPtr]::size -eq 4
}

Function Assert-32Bit {
    $Is32Bit = Test-32Bit
    if (-not $is32Bit) { throw "Shell is not 32-bit.`n" }
    return $Is32Bit
}

Function Test-64Bit {
    return [IntPtr]::size -eq 8
}

Function Assert-64Bit {
    $Is64Bit = Test-64Bit
    if (-not $is64Bit) { throw "Shell is not 64-bit.`n" }
    return $Is64Bit
}

Function Assert-CompIsOnline {
    param(
        [String]$ComputerName
    )
    $online = Test-Connection -ComputerName $ComputerName -Count 1 -Quiet
    if (-not $online) { throw "Computer $ComputerName is not on.`n" }
}

Function Get-DomainlessUserName {
    param(
        [String]$UserName
    )
    $UserName -match '^\w+\\(.+)' | Out-Null
    $user = $UserName
    if ($Matches) { $user = $Matches[1] }
    return $user
}
