# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

<#
.SYNOPSIS
    Creates a new directory if it doesn't already exist. Does not return an object.
.EXAMPLE
    ./New-Directory foo
    Creates the "foo" directory.
#>
function New-Directory
{
    Param (
        [string] $Path
    )

    Test-Path $Path `
    | Where-Object { -not $_ } `
    | New-Item $Path -ItemType Directory `
    | Out-Null
}