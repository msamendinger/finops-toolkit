---
layout: default
title: Bicep Registry
has_children: true
nav_order: 50
description: 'Include bicep modules in your templates.'
permalink: /bicep
---

<span class="fs-9 d-block mb-4">Bicep Registry modules</span>
Leverage reusable bicep modules in your templates to accelerate your FinOps efforts.
{: .fs-6 .fw-300 }

[Modules](#-install-the-module){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-4 }

<details open markdown="1">
   <summary class="fs-2 text-uppercase">On this page</summary>

- [📥 Referencing bicep modules](#-referencing-bicep-modules)
- [🦾 Modules](#-modules)
- [🙋‍♀️ Looking for more?](#️-looking-for-more)
- [🧰 Related tools](#-related-tools)

</details>

---

Bicep modules developed within the toolkit are published to the [official Bicep Registry](https://azure.github.io/bicep-registry-modules). These modules are not included directly in the toolkit release.

[Bicep Registry](https://azure.github.io/bicep-registry-modules/#cost){: .btn .mb-4 .mb-md-0 .mr-4 }

<br>

## 📥 Referencing bicep modules

Referencing a module in your bicep template is as simple as adding the following to the top of your file:

```bicep
module <name> 'br/public:cost/<scope>-<type>:<version>' {
   name: '<name>'
   params: {
      parameterName: '<parameter-value>'
   }
}
```

For details about the parameters for each module, see the module details below.

<br>

## 🦾 Modules

- [Scheduled actions](scheduled-actions.md) – Send an email on a schedule or when an anomaly is detected.

<!--
## Exports
<small>Version: **Unreleased**</small>
{: .label .label-yellow .pt-0 .pl-3 .pr-3 .m-0 }
<small>Scopes: **Resource group, Subscription**</small>
{: .label .pt-0 .pl-3 .pr-3 .m-0 }
<small>[Issue: **#221**](https://github.com/microsoft/finops-toolkit/issues/221)</small>
{: .label .label-yellow .pt-0 .pl-3 .pr-3 .m-0 }
Creates an [export](https://learn.microsoft.com/rest/api/cost-management/exports) to push cost data to a storage account on a daily or monthly schedule.
-->

<br>

## 🙋‍♀️ Looking for more?

We'd love to hear about any modules or templates you're looking for. Vote up (👍) existing ideas or create a new issue to suggest a new idea. We'll focus on ideas with the most votes.

[Vote on ideas](https://github.com/microsoft/finops-toolkit/issues?q=is%3Aissue+is%3Aopen+label%3A%22Solution%3A+Bicep+Registry%22+sort%3Areactions-%2B1-desc){: .btn .mt-2 .mb-4 .mb-md-0 .mr-4 }
[Suggest an idea](https://github.com/microsoft/finops-toolkit/issues/new/choose){: .btn .mt-2 .mb-4 .mb-md-0 .mr-4 }

<br>

---

## 🧰 Related tools

{% include tools.md ps="1" %}

<br>
