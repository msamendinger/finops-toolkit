# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

<#
    .SYNOPSIS
    Adds a standard copyright header to all files in the repository that don't already have it.
    
    .DESCRIPTION
    Run this from the /src/scripts folder.
    
    .EXAMPLE
    ./Add-CopyrightHeader

    Loops thru all files in the src folder and adds the header if missing.
#>
function Add-CopyrightHeader
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [ValidateScript({ Test-Path -Path $_ })]
        [string]
        $Path = "$PSScriptRoot/../.."
    )

    $Path = (Resolve-Path -Path $Path).Path    

    # Header lines to add to the top of each file
    $headerLines = @( "Copyright (c) Microsoft Corporation.", "Licensed under the MIT License." )

    # File types to add the copyright header to and their comment characters
    $fileTypes = @{
        bicep = "// {0}"
        css   = "/* {0} */"
        html  = "<!-- {0} -->"
        js    = "// {0}"
        ps1   = "# {0}"
        psd1  = "# {0}"
        psm1  = "# {0}"
        scss  = "// {0}"
    }

    $exclude = 'node_modules', '.*', 'version.txt', '*.abf', '*.bim', '*.csv', '*.ico', '*.json', '*.md', '*.pbidataset', '*.pbip', '*.pbir', '*.pbix', '*.png', '*.svg', '*.workbook', '*.xml', '*.yml'
    $newLine = [Environment]::NewLine

    $valid = 0
    $fixed = 0
    $notSupported = 0

    $files = Get-ChildItem -Path $Path -Recurse -Include '*.*' -Exclude $exclude -File
    foreach ($file in $files)
    {
        # Look up the comment character for the file type
        $ext = $file.Extension.TrimStart(".")
        if ($file.FullName.Contains('node_modules') -or $file.FullName.Contains('release'))
        {
            # Ignore files in node_modules
            continue
        }
        elseif ($fileTypes.ContainsKey($ext))
        {
            $commentFormat = $fileTypes[$file.Extension.TrimStart(".")]
        }
        else
        {
            Write-Warning "SKIPPED: [$($file.FullName)]: File type not supported: $ext" -WarningAction Continue
            $notSupported++
            continue
        }
        
        # Build the header
        $header = (($headerLines | ForEach-Object { [string]::Format($commentFormat + $newLine, $_) }) -join '') + $newLine

        # Check if the file already has the header and add it if missing
        $content = Get-Content $file.FullName -Raw
        if ($content.StartsWith($header))
        {
            Write-Verbose "SKIPPED: [$($file.FullName)]: already has header."
            $valid++
        }
        else
        {
            Set-Content -Path $file -Value ($header + $content) -NoNewline
            Write-Information "ADDED: [$($file.FullName)]" -InformationAction Continue
            $fixed++
        }
    }

    Write-Information "$($valid + $fixed) files checked" -InformationAction Continue
    Write-Information "$fixed file(s) updated" -InformationAction Continue
    Write-Information "$notSupported unsupported file type(s)" -InformationAction Continue
}
