({
    addValue : function(component, event, helper) {
        component.set("v.SelectedQuantity", component.get("v.SelectedQuantity") + parseInt(event.getSource().get("v.value")));
        if(component.get("v.SelectedQuantity") < 0){
            component.set("v.SelectedQuantity", 0);
        }
    }
})
