codeunit 50140 "Item Attribute History Manager"
{
    Access = Internal;

    procedure IsEmpty(): Boolean
    var
        History: Record "Item Attribute History";
    begin
        exit(History.IsEmpty);
    end;

    procedure Save(
        ItemNo: Code[20];
        AttributeNameId: Integer;
        AttributeValueId: Integer;
        EventAt: DateTime;
        EventBy: Guid;
        EventType: Enum "History Event Type")
    var
        History: Record "Item Attribute History";
    begin
        History.Init();
        History."Item No." := ItemNo;
        History."Attribute Name" := GetAttributeName(AttributeNameId);
        History."Attribute Value" := GetAttributeValueName(AttributeNameId, AttributeValueId);
        History."Date" := EventAt;
        History."Event By" := GetUserNameFromSecurityId(EventBy);
        History."Event Type" := EventType;
        History.Insert();
    end;

    local procedure GetAttributeName(AttributeId: Integer): Text[250]
    var
        ItemAttribute: Record "Item Attribute";
    begin
        if ItemAttribute.Get(AttributeId) then
            exit(ItemAttribute.Name);
    end;

    local procedure GetAttributeValueName(AttributeId: Integer; AttributeValueId: Integer): Text[250]
    var
        ItemAttributeValue: Record "Item Attribute Value";
    begin
        if ItemAttributeValue.Get(AttributeId, AttributeValueId) then
            exit(ItemAttributeValue.Value);
    end;

    local procedure GetUserNameFromSecurityId(UserSecurityId: Guid): Code[50]
    var
        User: Record User;
    begin
        if IsNullGuid(UserSecurityId) then
            exit('');

        User.Get(UserSecurityId);
        exit(User."User Name");
    end;
}