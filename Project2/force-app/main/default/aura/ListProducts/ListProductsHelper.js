({
    readPrdHelper : function(component, event, helper) {
        component.set('v.columns', [
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
    }
})