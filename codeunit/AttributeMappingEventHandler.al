codeunit 50142 AttributeMappingEventHandler
{
    [EventSubscriber(ObjectType::Table, Database::"Item Attribute Value Mapping", 'OnAfterInsertEvent', '', false, false)]
    procedure OnAfterMappingInsert(var Rec: Record "Item Attribute Value Mapping")
    var
        HistoryManager: Codeunit "Item Attribute History Manager";
    begin
        HistoryManager.Save(
            Rec."No.",
            Rec."Item Attribute ID",
            Rec."Item Attribute Value ID",
            Rec.SystemCreatedAt,
            Rec.SystemCreatedBy,
            "History Event Type"::Insert);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Attribute Value Mapping", 'OnAfterModifyEvent', '', false, false)]
    procedure OnAfterMappingModify(var Rec: Record "Item Attribute Value Mapping")
    var
        HistoryManager: Codeunit "Item Attribute History Manager";
    begin
        HistoryManager.Save(
            Rec."No.",
            Rec."Item Attribute ID",
            Rec."Item Attribute Value ID",
            Rec.SystemModifiedAt,
            Rec.SystemModifiedBy,
            "History Event Type"::Modify);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Attribute Value Mapping", 'OnAfterDeleteEvent', '', false, false)]
    procedure OnAfterMappingDelete(var Rec: Record "Item Attribute Value Mapping")
    var
        HistoryManager: Codeunit "Item Attribute History Manager";
    begin
        HistoryManager.Save(
            Rec."No.",
            Rec."Item Attribute ID",
            Rec."Item Attribute Value ID",
           // There is no property indicating time of deletion
           CurrentDateTime,
           // There is no property indicating the user behind the deletion
           '{00000000-0000-0000-0000-000000000000}',
            "History Event Type"::Delete);
    end;
}