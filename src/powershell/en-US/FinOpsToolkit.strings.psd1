# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# culture="en-US"
ConvertFrom-StringData -StringData @'
    Common_ContextNotFound = Could not retrieve Az context. Run Az-Login.
    Common_ErrorResponse = {0} (Code: {1}).
    CostExport_Remove_NotFound = Cost Management export not found. Operation failed with message: '{0}' (Code: {1}).
    CostExport_Remove_Failed = Delete Cost Management export operation failed with message: '{0}' (Code: {1}).
    Hub_Deploy_Deploy = Deploying FinOps hub '{0}' to resource group '{1}'.
    Hub_Deploy_TemplateNotFound = Could not find template 'main.bicep' at path '{0}'.
    Hub_Remove_Failed = FinOps hub could not be deleted. {0}.
    Hub_Remove_NotFound = FinOps hub '{0}' not found.
    HubProviders_Register_AlreadyRegistered =  Resource provider {0} is already registered.
    HubProviders_Register_Register =  Registering resource provider {0}.
    HubProviders_Register_RegisterError =  Error registering resource provider: {0}.
    HubTemplate_Save_ExpandingZip = Expanding zip '{0}'.
    HubTemplate_Save_FoundAsset = Found asset '{0}'.
    NewDirectory_Execute = Creating directory '{0}'.
    SchemaTransform_Invoke_ActualCostPathNotFound = ActualCostPath not found. Please enter a valid path: {0}.
    SchemaTransform_Invoke_AmortizedCostPathNotFound = AmortizedCostPath not found. Please enter a valid path: {0}.
    ToolkitVersion_Get_FoundLatestRelease = Found latest release '{0}'.
'@
