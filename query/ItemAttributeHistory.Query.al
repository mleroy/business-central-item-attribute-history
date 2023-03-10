query 50140 "Item Attribute History"
{
    QueryType = API;
    APIPublisher = 'mleroy';
    APIGroup = 'itemAttributeHistory';
    APIVersion = 'v1.0';
    EntityName = 'itemAttributeHistoryEntry';
    EntitySetName = 'itemAttributeHistory';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(Rec; "Item Attribute History")
        {
            column(date; "Date") { }
            column(itemNo; "Item No.") { }
            column(attributeName; "Attribute Name") { }
            column(attributeValue; "Attribute Value") { }
            column(eventType; "Event Type") { }
            column(byUserName; "Event By") { }
        }
    }
}