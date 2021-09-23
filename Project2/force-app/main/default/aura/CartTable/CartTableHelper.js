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
    }
})
