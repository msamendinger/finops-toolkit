---
layout: default
title: Open data
nav_order: 60
description: 'Leverage open data to normalize and enhance your FinOps reporting.'
permalink: /data
---

<span class="fs-9 d-block mb-4">Open data</span>
Leverage open data to normalize and enhance your FinOps reporting.
{: .fs-6 .fw-300 }

[Download](https://github.com/microsoft/finops-toolkit/releases/latest){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-4 }
[Share feedback](#️-looking-for-more){: .btn .fs-5 .mb-4 .mb-md-0 .mr-4 }

<details open markdown="1">
   <summary class="fs-2 text-uppercase">On this page</summary>

- [📏 Pricing units](#-pricing-units)
- [🗺️ Regions](#️-regions)
- [📚 Resource types](#-resource-types)
- [🎛️ Services](#️-services)
- [⬇️ Sample exports](#️-sample-exports)
- [🙋‍♀️ Looking for more?](#️-looking-for-more)
- [🧰 Related tools](#-related-tools)

</details>

---

Reporting is the life-blood of any FinOps initiative. And your reports are only as good as your data. This is why [data ingestion and normalization](https://learn.microsoft.com/azure/cost-management-billing/finops/capabilities-ingestion-normalization) is such an important part of FinOps (and any big data effort). The following datasets can be used to clean and normalize your data as part of data ingestion, reporting, or other solutions.

<br>

## 📏 Pricing units

Microsoft Cost Management uses the `UnitOfMeasure` column to indicate how each charge is measured. This can be in singular or distinct units or can be grouped into chunks based on applicable block pricing rules. As a string, the `UnitOfMeasure` column can be challenging to parse and handle all the different permutations and inconsistencies. The Pricing units file provides a list of values you may find within common cost-related datasets (e.g., Cost Management exports and price sheets) along with their related distinct unit and block size or scaling factor to compare pricing to usage units.

Sample data:

| UnitOfMeasure    | AccountTypes | PricingBlockSize | DistinctUnits |
| ---------------- | ------------ | ---------------: | ------------- |
| 1 Hour           | MCA, EA      |                1 | Hours         |
| 10000 GB         | EA           |            10000 | GB            |
| 150 Hours        | EA           |              150 | Hours         |
| 200 /Hour        | EA           |              200 | Units/Hour    |
| 5 GB             | MCA, EA      |                5 | GB            |
| 5000000 Requests | EA           |          5000000 | Requests      |
| 744 Connections  | EA           |              744 | Connections   |

A few important notes about the data:

1. Meter names are not included to keep the file size down.
2. The default unit type is "Units".
3. Some default units may include a more specific unit in the meter name, which is not accounted here since meter names aren't included.
4. Marketplace meters are not included due to inconsistencies that would impact data size.

<blockquote class="note" markdown="1">
   _`UnitOfMeasure` maps to `PricingUnit` in FOCUS 1.0._
</blockquote>

<blockquote class="tip" markdown="1">
   _You can also integrate service data into your workflow with the [Get-FinOpsService](../powershell/data/Get-FinOpsService) PowerShell command._
</blockquote>

[Download](https://github.com/microsoft/finops-toolkit/releases/latest/download/PricingUnits.csv){: .btn .mb-4 .mb-md-0 .mr-4 }
[See PowerShell](../powershell/data/Get-FinOpsPricingUnit){: .btn .mb-4 .mb-md-0 .mr-4 }

<br>

## 🗺️ Regions

Microsoft Cost Management provides various values for resource locations that are occasionally inconsistent due to different underlying systems providing the data. The Regions file provides a list of values you may find within common cost-related datasets (e.g., Cost Management exports and price sheets) along with their related Azure region IDs and names.

Sample data:

| OriginalValue | RegionId      | RegionName     |
| ------------- | ------------- | -------------- |
| AP East       | eastasia      | East Asia      |
| CA Central    | canadacentral | Canada Central |
| DE North      | germanynorth  | Germany North  |
| NO West       | norwaywest    | Norway West    |
| TW North      | taiwannorth   | Taiwan North   |

<blockquote class="tip" markdown="1">
   _You can also integrate service data into your workflow with the [Get-FinOpsRegion](../powershell/data/Get-FinOpsRegion) PowerShell command._
</blockquote>

[Download](https://github.com/microsoft/finops-toolkit/releases/latest/download/Regions.csv){: .btn .mb-4 .mb-md-0 .mr-4 }
[See PowerShell](../powershell/data/Get-FinOpsRegion){: .btn .mb-4 .mb-md-0 .mr-4 }

<br>

## 📚 Resource types

Azure resource types are a semi-readable code that represents what kind of resource it is. Currently, there's no mapping of the resource type to a user-friendly string, description, or its icon. The ResourceTypes file provides a list of resource type values you'll find in the Azure portal along with their display names, description, and a link to the icon, when available.

Sample data:

| ResourceType                      | Singular Display Name   | Plural Display Name      | Lower Singular Display Name | Lower Plural Display Name |
| --------------------------------- | ----------------------- | ------------------------ | --------------------------- | ------------------------- |
| microsoft.compute/virtualmachines | Virtual machine         | Virtual machines         | virtual machine             | virtual machines          |
| microsoft.insights/workbooks      | Azure Workbook          | Azure Workbooks          | azure workbook              | azure workbooks           |
| microsoft.logic/workflows         | Logic app               | Logic apps               | logic app                   | logic apps                |
| microsoft.network/virtualnetworks | Virtual network         | Virtual networks         | virtual network             | virtual networks          |
| microsoft.recoveryservices/vaults | Recovery Services vault | Recovery Services vaults | recovery services vault     | recovery services         |
| microsoft.search/searchservices   | Search service          | Search services          | search service              | search services           |
| microsoft.sql/servers             | SQL server              | SQL servers              | SQL server                  | SQL servers               |
| microsoft.sql/servers/databases   | SQL database            | SQL databases            | SQL database                | SQL databases             |
| microsoft.web/sites               | App Service web app     | App Service web apps     | app service                 | app services              |

<blockquote class="tip" markdown="1">
   _You can also integrate resource type data into your workflow with the [Get-FinOpsResourceType](../powershell/data/Get-FinOpsResourceType) PowerShell command._
</blockquote>

[Download CSV](https://github.com/microsoft/finops-toolkit/releases/latest/download/ResourceTypes.csv){: .btn .fs-5 .mb-4 .mb-md-0 .mr-4 }
[Download JSON](https://github.com/microsoft/finops-toolkit/releases/latest/download/ResourceTypes.json){: .btn .fs-5 .mb-4 .mb-md-0 .mr-4 }
[See PowerShell](../powershell/data/Get-FinOpsResourceType){: .btn .fs-5 .mb-4 .mb-md-0 .mr-4 }

<br>

## 🎛️ Services

In Microsoft Cost Management, `ConsumedService` represents the primary service or resource provider of the resource you used. This is roughly the same as `ServiceName` in [FOCUS](https://focus.finops.org). In some cases, multiple services share the same resource provider, so we're using the `ConsumedService` and `ResourceType` columns to map to `ServiceName` and `ServiceCategory` values for use within FOCUS.

Sample data:

| ConsumedService      | ResourceType                          | ServiceName         | ServiceCategory | PublisherName | PublisherType  |
| -------------------- | ------------------------------------- | ------------------- | --------------- | ------------- | -------------- |
| microsoft.compute    | microsoft.compute/virtualmachines     | Virtual Machines    | Compute         | Microsoft     | Cloud Provider |
| microsoft.documentdb | microsoft.documentdb/databaseaccounts | Cosmos DB           | Databases       | Microsoft     | Cloud Provider |
| Microsoft.Kusto      | microsoft.kusto/clusters              | Azure Data Explorer | Analytics       | Microsoft     | Cloud Provider |
| Microsoft.Network    | microsoft.network/virtualnetworks     | Virtual Network     | Networking      | Microsoft     | Cloud Provider |
| MICROSOFT.STORAGE    | microsoft.storage/storageaccounts     | Storage Accounts    | Storage         | Microsoft     | Cloud Provider |

A few important notes about the data:

1. `ConsumsedService` values should match the case of your cost data. When they are provided in mixed case, you'll see multiple rows in the Services file.
2. `ResourceType` values are all lowercased to avoid case sensitivity issues.
3. `ServiceName` values should match the product marketing name for the closest possible service. Some services reuse resource types and cannot be distinguished from the resource type alone (e.g., Azure functions will show as App Service).
4. `ServiceCategory` values are aligned with the allowed values in FOCUS.

<blockquote class="tip" markdown="1">
   _You can also integrate service data into your workflow with the [Get-FinOpsService](../powershell/data/Get-FinOpsService) PowerShell command._
</blockquote>

[Download](https://github.com/microsoft/finops-toolkit/releases/latest/download/Services.csv){: .btn .mb-4 .mb-md-0 .mr-4 }
[See PowerShell](../powershell/data/Get-FinOpsService){: .btn .mb-4 .mb-md-0 .mr-4 }

<br>

## ⬇️ Sample exports

The following files are examples of what you will find when you export data from Microsoft Cost Management. These files are provided to help you understand the data structure and format. They are from an Enterprise Agreement (EA) demo account and are not intended to be used for ingestion or reporting.

- Cost and usage
  - Actual (billed) (`2021-10-01`)
  - Amortized (`2021-10-01`)
  - FOCUS (`1.0-preview (v1)`)
- Prices(`2023-05-01`)
- Reservation details (`2023-03-01`)
- Reservation transactions (`2023-05-01`)
- Reservation recommendations (`2023-05-01`)

[Download](https://github.com/microsoft/finops-toolkit/releases/latest/download/sample-exports.zip){: .btn .mb-4 .mb-md-0 .mr-4 }

<br>

## 🙋‍♀️ Looking for more?

We'd love to hear about any datasets you're looking for. Create a new issue with the details that you'd like to see either included in existing or new datasets.

[Share feedback](https://github.com/microsoft/finops-toolkit/issues/new/choose){: .btn .mt-2 .mb-4 .mb-md-0 .mr-4 }

<br>

---

## 🧰 Related tools

{% include tools.md pbi="1" ps="1" %}

<br>
