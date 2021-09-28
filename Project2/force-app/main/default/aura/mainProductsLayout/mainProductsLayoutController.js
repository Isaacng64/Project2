({
    ShowImage: function (component, event, helper) {
        helper.UpdateIdProduct(component, event);
    },
    selectProduct : function(component, event, helper){
        component.set("v.SelectedProduct", event.getParam("id"));
        //alert(component.get("v.SelectedProduct")); // works
    },
    addToCart : function(component, event, helper){
        helper.addToCart(component);
    }
})