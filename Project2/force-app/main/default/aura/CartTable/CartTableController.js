({
    emitCartConfirm : function(component, event, helper) {
        let evt = component.getEvent("ToggleCart");
        evt.fire();
    },
    submitOrder : function(component, event, helper) {
        //alert("Order submit!");
    },
    init: function (component, event, helper) {

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

        helper.updateMiniQuantityView(selected);
        
    },
    updateSelectedAmount : function(component, event, helper){
        let dir = event.getParam("direction");
        let selected = component.get("v.selectedRow");
        if(selected){
            if (dir == "UP"){
                if (event.getParam("remove")){
    
                    helper.removeRow(component, selected);
    
                    helper.getCartProducts(component);
    
                }else{
                    let added = event.getParam("added");
                
                    helper.updateSelectedAmount(component, event, selected, added);
                
                    helper.setTableColumnsAndRerender(component);
        
                    helper.updateMiniQuantityView(selected);
                }
            }
        }
    }
})
