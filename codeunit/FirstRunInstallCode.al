codeunit 50141 FirstRunInstallCode
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        HistoryManager: Codeunit "Item Attribute History Manager";
    begin
        if not HistoryManager.IsEmpty then
            exit;

        if ItemAttributeValueMapping.FindSet() then
            repeat
                HistoryManager.Save(
                    ItemAttributeValueMapping."No.",
                    ItemAttributeValueMapping."Item Attribute ID",
                    ItemAttributeValueMapping."Item Attribute Value ID",
                    ItemAttributeValueMapping.SystemModifiedAt,
                    ItemAttributeValueMapping.SystemModifiedBy,
                    "History Event Type"::"Initial setup");
            until ItemAttributeValueMapping.Next() = 0;
    end;
}