({
    /*
    addProductByCode : function(component, event){
        let orderID = component.get("v.draftOrderID"); // working!

        let productCode = event.getSource().get("v.value"); // working!

        //alert(orderID + " " + productCode); // working!

        let apex = component.get("c.addProductByCode");

        apex.setParams({"orderID" : orderID, "productCode" : productCode});

        apex.setCallback(this, function(response){
            this.console.log("response received");
            if (response.getState() == "SUCCESS"){
                alert("added");
            }else{
                alert("not added");
            }
        });

        $A.enqueueAction(apex);
        console.log("add product by code enqueued!");
    }*/
});