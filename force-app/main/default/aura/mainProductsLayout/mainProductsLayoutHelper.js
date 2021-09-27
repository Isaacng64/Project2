({
    UpdateIdProduct : function(component, event, helper) {
        let newIdProduct = event.getParam("idProduct");
        alert('Product in Main : ' + newIdProduct);
        component.set("v.IdProduct", newIdProduct);      
    }
})