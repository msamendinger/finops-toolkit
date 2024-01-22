---
layout: default
title: Cost optimization workbook
nav_order: 30
description: 'Azure Monitor workbook focused on cost optimization.'
permalink: /optimization-workbook
---

<span class="fs-9 d-block mb-4">Cost optimization workbook</span>
Give your engineers a single pane of glass for cost optimization with this handy Azure Monitor workbook.
{: .fs-6 .fw-300 }

[Deploy](./README.md#-create-a-new-hub){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-4 }
[Try now](<https://portal.azure.com/#blade/AppInsightsExtension/UsageNotebookBlade/ComponentId/Azure%20Advisor/ConfigurationId/community-Workbooks%2FAzure%20Advisor%2FCost%20Optimization/Type/workbook/WorkbookTemplateName/Cost%20Optimization%20(Preview)>){: .btn .fs-5 .mb-4 .mb-md-0 .mr-4 }

---

The cost optimization workbook is an Azure Monitor workbook that provides a single pane of glass for cost optimization, modeled after the Well-Architected Framework guidance.

![Screenshot of the Cost optimization workbook overview](https://github.com/microsoft/finops-toolkit/assets/399533/70b71cb4-d42e-40fc-8870-b4262ecc3633)

<br>

## ➕ Deploy the workbook

1. Confirm you have the following least-privileged roles to deploy and use the workbook:

   - **Workbook Contributor** allows you to deploy the workbook.
   - **Reader** view all of the workbook tabs.

   <blockquote class="tip" markdown="1">
     _If you only have read access, you can still import your workbook directly into Azure Monitor. You will not be able to save it, but you can view all tabs._
   </blockquote>

2. [Deploy the **optimization-workbook** template](../resources/deploy.md).

   [![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2FcreateUiDefinition.json) &nbsp; [![Deploy To Azure US Gov](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazuregov.svg?sanitize=true)](https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2FcreateUiDefinition.json)

<br>

---

## 🧰 Related tools

{% include tools.md hubs="1" gov="1" %}

<br>
