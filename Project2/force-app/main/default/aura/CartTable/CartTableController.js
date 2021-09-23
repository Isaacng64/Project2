({
    emitCartConfirm : function(component, event, helper) {
        let evt = component.getEvent("ToggleCart");
        evt.fire();
    }
})
