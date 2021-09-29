({
    toggleCart : function(component, event, helper) {
        component.set("v.bCartConfirmed", ! component.get("v.bCartConfirmed"));
    },
    addProductByCodeJS : function(component, event, helper){
        //helper.addProductByCode(component, event);

        let orderID = component.get("v.draftOrderID"); // working!

        let productCode = event.getSource().get("v.value"); // working!

        //alert(orderID + " " + productCode); // working!

        let apex = component.get("c.addProductByCode");

        apex.setParams({"orderID" : orderID, "productCode" : productCode});
        //apex.setParams({"orderID" : "8015f000000smRWAAY", "productCode" : "GC3020"});

        apex.setCallback(this, function(response){
            this.console.log("response received");
            if (response.getState() == "SUCCESS"){
                //alert("added");
            }else{
                alert(response.getError()[0]["message"]);
            }
        });

        $A.enqueueAction(apex);
        console.log("add product by code enqueued!");

    }
})