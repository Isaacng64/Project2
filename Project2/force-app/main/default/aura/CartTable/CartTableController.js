({
    emitCartConfirm : function(component, event, helper) {
        let evt = component.getEvent("ToggleCart");
        evt.fire();
    },
    submitOrder : function(component, event, helper) {
        //alert("Order submit!");
    },
    init: function (component, event, helper) {
        /*
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Unit Number', fieldName: 'ProductCode', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'Quantity', fieldName: 'Quantity', type: 'Integer'}
        ]);
        */
        helper.setTableColumnsAndRerender(component);

        // actually load real data not fake data
        //helper.getAllProducts(component, event);

        // get just products in your cart
        helper.getCartProducts(component, event);

        helper.initTheCart(component, event);

    },
    updateSelected : function(component, event, helper){
        let selectedRows = event.getParam('selectedRows');
        let selected = selectedRows[0];

        console.log("updateSelected has been fired!");

        if (selected){
            component.set("v.selectedRow", selected);
        }
        
    },
    incrementSelected : function(component, event, helper){
        let selected = component.get("v.selectedRow");

        helper.incrementSelected(component, event, selected);
        
        helper.setTableColumnsAndRerender(component);
    }
})
