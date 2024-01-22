# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

& "$PSScriptRoot/../Initialize-Tests.ps1"

Describe 'CostExports' {
    BeforeAll {
        # Arrange
        $context = Get-AzContext
        $rg = "ftk-integration-tests"
        $scope = "/subscriptions/$($context.Subscription.Id)/resourceGroups/$rg"
        $loc = "East US"
        $storageName = ([guid]::NewGuid().Guid.Replace('-', '').Substring(0, 24))
        $exportName = "ftk-int-CostExports"

        New-AzResourceGroup -Name $rg -Location $loc -Force
        $storage = New-AzStorageAccount `
            -ResourceGroupName $rg `
            -Name $storageName `
            -Location $loc `
            -SkuName Standard_LRS
    }

    It 'Should create-read-update-delete exports' {
        Monitor "Export tests..." -Indent '  ' {
            Monitor "Creating $exportName export..." {
                # Act -- create
                $newResult = New-FinOpsCostExport -Name $exportName -Scope $scope -StorageAccountId $storage.Id -Execute -Backfill 1
                # TODO: Run tests for all supported API versions: -ApiVersion '2023-08-01'
                
                # Assert
                Report -Object $newResult
                $newResult.Name | Should -Be $exportName
                $newResult.RunHistory | Should -BeNullOrEmpty -Because "the -RunHistory option was not specified"
            }

            Monitor "Getting $exportName..." {
                # Act -- read
                $getResult = Get-FinOpsCostExport -Name $exportName -Scope $scope -RunHistory

                # Assert
                Report "Found $($getResult.Count) export(s)"
                Report -Object $getResult
                $getResult.Count | Should -Be 1
                $getResult.Name | Should -Be $exportName
                $getResult.RunHistory.Count | Should -BeGreaterThan 0 -Because "-Execute -Backfill 1 was specified during creation"
            }

            Monitor "Running $exportName..." {
                # Act -- run now
                $runResult = Start-FinOpsCostExport -Name $exportName -Scope $scope
                
                # Assert
                Report $runResult
                $runResult | Should -BeTrue
            }

            Monitor "Deleting $exportName..." {
                # Act -- delete
                $deleteResult = Remove-FinOpsCostExport -Name $exportName -Scope $scope
                $confirmDeleteResult = Get-FinOpsCostExport -Name $exportName -Scope $scope
                
                # Assert
                Report $deleteResult
                $deleteResult | Should -BeTrue
                Report "$($getResult.Count) export(s) remaining"
                $confirmDeleteResult | Should -BeNullOrEmpty
            }

            # Cleanup
            Remove-AzStorageAccount -ResourceGroupName $rg -Name $storageName -Force
            Report "Storage account deleted"
        }
    }

    # TODO: Update this to check if older than 13 months
    It 'Should create one-time export' {
        # Arrange
        $historicalExportName = $exportName
        $startDate = (Get-Date -Day 1 -Hour 0 -Minute 0 -Second 0 -Millisecond 0 -AsUTC).AddMonths(-12)

        Monitor "Export tests..." -Indent '  ' {
            Monitor "Creating $historicalExportName export..." {
                # Act -- create
                $newResult = New-FinOpsCostExport `
                    -Name $historicalExportName `
                    -Scope $scope `
                    -StorageAccountId $storage.Id `
                    -Dataset AmortizedCost `
                    -OneTime `
                    -StartDate $startDate
                
                # Assert
                Report -Object $newResult
                $newResult.Name | Should -Be $historicalExportName
                $newResult.DatasetStartDate | Should -Be $startDate
            }

            Monitor "Getting $historicalExportName..." {
                # Act -- read
                $getResult = Get-FinOpsCostExport -Name $historicalExportName -Scope $scope -RunHistory

                # Assert
                Report "Found $($getResult.Count) export(s)"
                Report -Object $getResult
                $getResult.Count | Should -Be 1
                $getResult.Name | Should -Be $historicalExportName
                $getResult.RunHistory.Count | Should -BeGreaterThan 0 -Because "-Execute -Backfill 1 was specified during creation"
            }

            Monitor "Deleting $historicalExportName..." {
                # Act -- delete
                $deleteResult = Remove-FinOpsCostExport -Name $historicalExportName -Scope $scope
                $confirmDeleteResult = Get-FinOpsCostExport -Name $historicalExportName -Scope $scope
                
                # Assert
                Report $deleteResult
                $deleteResult | Should -BeTrue
                Report "$($getResult.Count) export(s) remaining"
                $confirmDeleteResult | Should -BeNullOrEmpty
            }

            # Cleanup
            Remove-AzStorageAccount -ResourceGroupName $rg -Name $storageName -Force
            Report "Storage account deleted"
        }
    }
}
