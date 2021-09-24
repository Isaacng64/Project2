({
    /*
    getAllProducts: function (component, event) {
        let a = component.get("c.getProducts");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.data", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    },*/
    initTheCart : function (component, event){
        let a = component.get("c.initCart");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.draftOrderID", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    },
    getCartProducts : function(component){
        let a = component.get("c.getCartProducts");

        a.setParams({"orderID" : "8015f000000oVAaAAM"});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.data", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    },
    updateSelectedAmount : function(component, event, selectedRow, added){

        selectedRow.Quantity += added; // passed by reference

        let a = component.get("c.updateCart");

        //component.get("draftOrderID")});
        a.setParams({"orderID" : "8015f000000oVAaAAM", "productOrOrderItemID" : selectedRow["OrderItemID"], "amount" : selectedRow["Quantity"]});
        
        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                console.log(component.get('v.selectedRow').Quantity);
            }
        });

        $A.enqueueAction(a);
    },
    setTableColumnsAndRerender : function(component){  // easiest way to get the lightningtable to rerender, by updating an aura attribute which it is bound to directly
        component.set("v.columns", [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Unit Number', fieldName: 'ProductCode', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'Quantity', fieldName: 'Quantity', type: 'Integer'}
        ]);
    },
    updateMiniQuantityView : function(selectedRow){

        let amount = 0;
        if(selectedRow){
            amount = selectedRow.Quantity;
        }

        let e = $A.get("e.c:UpdateCartQuantity");
        if(amount){

            e.setParams({"current" : amount, "direction" : "DOWN"});
    
        }else{

            e.setParams({"current" : 0, "direction" : "DOWN"});

        }

        e.fire();
    },
    removeRow : function(component, row){
        let a = component.get("c.removeItem");
        a.setParams({"orderID" : "8015f000000oVAaAAM", "productOrOrderItemID" : row.OrderItemID})

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){

            }
        });

        $A.enqueueAction(a);
    }
})
