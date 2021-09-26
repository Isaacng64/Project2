({
    getPersistentSameShipping : function(component, event) {
        let a = component.get("c.getSameAddress");

        a.setParams({"orderID" : component.get("v.draftOrderID")});         //component.get("draftOrderID")});

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

        a.setParams({"orderID" : component.get("v.draftOrderID"), "bool" : bool});         //component.get("draftOrderID")});

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
            }else{

            }
        });

        $A.enqueueAction(a);
    },
    validateInputs : function(event){
        let fields = event.getParam("fields");
        for (let field in fields){
            if (field == "" || field == {} || field == []){
                event.preventDefault();
                alert("Please fill out all fields");
            }
        }
    }
})
