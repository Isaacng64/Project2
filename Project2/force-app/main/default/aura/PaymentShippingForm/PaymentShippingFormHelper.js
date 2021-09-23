({
    getPersistentSameShipping : function(component, event) {
        let a = component.get("c.getSameAddress");

        a.setParams({"orderID" : "8015f000000g3ZeAAI"});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.bSameShipping", response.getReturnValue());

            }else{

            }

            component.set("v.bResponseReceived", true);
        });

        $A.enqueueAction(a);
    },
    setSameShipping : function(component, event, helper, bool) {
        let a = component.get("c.setSameAddress");

        a.setParams({"orderID" : "8015f000000g3ZeAAI", "bool" : bool});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
            }else{

            }
        });

        $A.enqueueAction(a);
    },
    submitOrder : function(component){
        let a = component.get("c.activateOrder");

        a.setParams({"orderID" : "8015f000000g3ZeAAI", "bool" : bool});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
            }else{

            }
        });

        $A.enqueueAction(a);
    }
})
