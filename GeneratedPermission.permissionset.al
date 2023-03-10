permissionset 50140 ItemAttributeHistory
{
    Assignable = true;
    Permissions = tabledata "Item Attribute History" = RIMD,
        table "Item Attribute History" = X,
        codeunit AttributeMappingEventHandler = X,
        codeunit FirstRunInstallCode = X,
        codeunit "Item Attribute History Manager" = X,
        page "Item Attribute History" = X,
        query "Item Attribute History" = X;
}