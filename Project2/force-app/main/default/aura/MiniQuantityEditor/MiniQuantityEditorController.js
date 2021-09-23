({
    addValue : function(component, event, helper) {

        let amount = parseInt(event.getSource().get("v.value"));

        component.set("v.SelectedQuantity", component.get("v.SelectedQuantity") + amount);

        if(component.get("v.SelectedQuantity") < 0){
            component.set("v.SelectedQuantity", 0);
        }

        let e = $A.get("e.c:UpdateCartQuantity");
        e.setParams({"amount" : amount});
        e.fire();
    }
})
