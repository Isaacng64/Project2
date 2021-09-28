({
    UpdateIdProduct : function(component, event, helper) {
        let newIdProduct = event.getParam("idProduct");
        alert('Product in Main : ' + newIdProduct);
        component.set("v.IdProduct", newIdProduct);      
    },
    addToCart : function(component){
        let apex = component.get("c.updateCart");

        //alert(component.get("v.draftOrderID"));
        //alert(component.get("v.SelectedProduct"));
        let ob = {"orderID" : component.get("v.draftOrderID"), "productOrOrderItemID" : component.get("v.SelectedProduct"), "amount" : 1};

        apex.setParams(ob);

        apex.setCallback(this, function(response){
            if (response.getState() == "SUCCESS"){
                alert("product added");
            }else{
                for(let ob in response.getError()){
                    alert(ob["message"]);
                }
                //alert(response.getError());
            }
            
        })
        $A.enqueueAction(apex);
    }
})