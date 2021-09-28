({
    readPrdHelper : function(component, event, helper) {
        
        var actions = [
            // { label: 'Show details', name: 'show_details' }
            { label: 'More Details', name: 'show_appdetails' }             
        ]
        component.set('v.columns', [
            { type: 'action', typeAttributes: { rowActions: actions } },
            {label: 'Unit Name', fieldName: 'Name', type: 'text'},
            {label: 'Serial Code', fieldName: 'ProductCode', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'Quantity', fieldName: 'inStockQuantity__c', type: 'Integer'}
        ]);
        
        var action = component.get("c.readProducts");
        //action.setParams({ });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.prdList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    RowAction: function (component, event, helper) {
        let action = event.getParam('action');
        let row = event.getParam('row');
        
        switch (action.name) {
            case 'show_details':
                let cmpEvent = component.getEvent("EvtPrdClicked");
                cmpEvent.setParams({ "idProduct" : row.Id });
                cmpEvent.fire();
                //alert('Showing More Info: ' + JSON.stringify(row) + ' ' + row.Id);
                break;
            case 'show_appdetails':
                let appEvent = $A.get("e.c:AppPrdClicked");
                appEvent.setParams({ "idAppProduct" : row.Id });
                appEvent.fire();
                //alert('Showing More Info: ' + JSON.stringify(row) + ' ' + row.Id);
                break;
        }
    }
})