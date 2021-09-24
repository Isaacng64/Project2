({
    CartConfirm : function(component, event, helper) {
        let data = component.get("v.data");
        if (data.length > 0){
            let evt = component.getEvent("ToggleCart");
            evt.fire();
        }else{
            alert("Cart must have at least 1 item in it to move to checkout")
        }
        
    },
    init: function (component, event, helper) {

        helper.setTableColumnsAndRerender(component);

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
