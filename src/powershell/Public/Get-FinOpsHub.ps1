<#
    .SYNOPSIS
    Gets a FinOps hub instance.

    .PARAMETER Name
    Name of the FinOps hub.

    .PARAMETER ResourceGroupName
    Name of the resource group the FinOps hub was deployed to.

    .EXAMPLE
    Get-FinOpsHub -Name foo*

    Returns all FinOps hubs that start with 'foo'.

    .EXAMPLE
    Get-FinOpsHub -ResourceGroupName foo

    Returns all resources associated with a FinOps hub in reource group 'foo'.

    .EXAMPLE
    Get-FinOpsHub -Name foo -ResourceGroupName bar

    Returns all FinOps hubs named 'foo' in the 'bar' resource group.
#>

function Get-FinOpsHub
{
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [string]
        $Name,

        [Parameter()]
        [string]
        $ResourceGroupName
    )

    if ([System.String]::IsNullOrEmpty($Name))
    {
        $Name = '*'
    }

    if ([System.String]::IsNullOrEmpty($ResourceGroupName))
    {
        $ResourceGroupName = '*'
    }
    
    $context = Get-AzContext
    if (-not $context)
    {
        throw $script:localizedData.ContextNotFound
    }

    $tagTemplate = '/subscriptions/{0}/resourceGroups/{1}/providers/Microsoft.Cloud/hubs/{2}'
    $tagName = 'cm-resource-parent' 
    $subscriptionId = $context.Subscription.Id
    $tagValue = $tagTemplate -f $subscriptionId, $ResourceGroupName, $Name
    $resourceMatches = @()
    $resources = Get-AzResource -TagName $tagName
    foreach ($resource in $resources)
    {
        $tagMatch = $resource.Tags.Values | Where-Object -FilterScript {$_ -like $tagValue}
        if ($tagMatch)
        {
            $properties = [ordered]@{
                Name = $tagMatch.Split('/')[-1]
                HubId = $tagMatch
                Resource = $resource
            }
            
            $resourceMatches += New-Object -TypeName 'PSObject' -Property $properties
        }
    }

    if ($resourceMatches.Count -gt 0)
    {
        $output = @()
        $groups = $resourceMatches | Group-Object -Property 'HubId'
        foreach ($group in $groups)
        {
            $groupProperties = [ordered]@{
                Name = $group.Group.Name | Select-Object -Unique
                HubId = $group.Group.HubId | Select-Object -Unique
                Resources = $group.Group.Resource
            }

            $output += New-Object -TypeName 'PSObject' -Property $groupProperties
        }

        return $output
    }
}
