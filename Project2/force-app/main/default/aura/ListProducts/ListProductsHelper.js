({
    readPrdHelper : function(component, event, helper) {
        
        var actions = [
            { label: 'Show details', name: 'show_details' }            
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
        var action = event.getParam('action');
        var row = event.getParam('row');
        
        switch (action.name) {
            case 'show_details':
                alert('Showing More Info: ' + JSON.stringify(row));
                break;
        }
    },
    selectProduct : function(component, event){
        let selectedRows = event.getParam('selectedRows');
        let selected = selectedRows[0];

        console.log("updateSelected has been fired!");

        //alert(selected.Id);

        if (selected){
            let e = component.getEvent("selectProduct");
            e.setParams({"id": selected.Id});
            e.fire();
        }
    }
})