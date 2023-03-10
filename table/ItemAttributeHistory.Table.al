table 50140 "Item Attribute History"
{
    Caption = 'Item Attribute History';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Date"; DateTime)
        {
            Caption = 'Date';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(3; "Attribute Name"; Text[250])
        {
            Caption = 'Attribute Name';
            TableRelation = "Item Attribute".Name;
        }
        field(4; "Attribute Value"; Text[250])
        {
            Caption = 'Attribute Value';
        }
        field(5; "Event Type"; Enum "History Event Type")
        {
            Caption = 'Type';
        }
        field(6; "Event By"; Code[50])
        {
            Caption = 'Event By';
            TableRelation = User;
        }
        field(7; "Event By Full Name"; Text[80])
        {
            CalcFormula = Lookup(User."Full Name" WHERE("User Name" = FIELD("Event By")));
            Caption = 'By Full Name';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Date", "Item No.", "Attribute Name")
        {
            Clustered = true;
        }
    }
}