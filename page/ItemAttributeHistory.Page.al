page 50140 "Item Attribute History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Item Attribute History";
    Caption = 'Item Attribute History';
    SourceTableView = sorting(Date, "Item No.", "Attribute Name") order(descending);

    layout
    {
        area(Content)
        {
            repeater(History)
            {
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Attribute"; Rec."Attribute Name")
                {
                    ApplicationArea = All;
                    Caption = 'Attribute';
                }
                field("Value"; Rec."Attribute Value")
                {
                    ApplicationArea = All;
                    Caption = 'Value';
                }
                field("Event Type"; Rec."Event Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field("By"; Rec."Event By Full Name")
                {
                    ApplicationArea = All;
                    Caption = 'By';
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(PromotedReloadRef; Reload) { }
        }

        area(Processing)
        {
            action(Reload)
            {
                ApplicationArea = All;
                Caption = 'Reload';
                Image = Refresh;

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }
}