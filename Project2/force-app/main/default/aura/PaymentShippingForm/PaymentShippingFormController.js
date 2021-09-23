({
    emitCartConfirm : function(component, event, helper) {
        let evt = component.getEvent("ToggleCart");
        evt.fire();
    },
    sameShipping : function(component, event, helper) {
        component.set("v.bSameShipping", ! component.get("v.bSameShipping")); // client side

        helper.setSameShipping(component, event, helper, component.get("v.bSameShipping")); // update on order draft
    },
    getPersistentSameShipping : function(component, event, helper) {
        helper.getPersistentSameShipping(component, event);
    }
})
