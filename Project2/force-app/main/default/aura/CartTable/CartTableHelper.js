({
    getAllProducts: function (component, event) {
        let a = component.get("c.getProducts");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.data", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    },
    initTheCart : function (component, event){
        let a = component.get("c.initCart");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.draftOrderID", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    },
    getCartProducts : function(component, event){
        let a = component.get("c.getCartProducts");

        a.setParams({"orderID" : "8015f000000g3ZeAAI"});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.data", response.getReturnValue());

                //alert(response.getReturnValue()[0]["Name"]); // HOW DID THIS WORK!?!?

                //alert(Object.keys(response.getReturnValue()[0])); //["prod"]["Name"]

                //alert(response.getReturnValue()[0]["prod"]["Name"]); // WORKS NOW YES!!!!!!!!!!! Noww that I've @AuraEnabled in my wrapper class properties on the apex controller!
            }
        });

        $A.enqueueAction(a);
    },
    incrementSelected : function(component, event, selectedRow){

        selectedRow.Quantity += 1; // passed by reference

        let a = component.get("c.updateCart");

        //component.get("draftOrderID")});
        a.setParams({"orderID" : "8015f000000g3ZeAAI", "productOrOrderItemID" : selectedRow["OrderItemID"], "amount" : selectedRow["Quantity"]});
        
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
    }
})
