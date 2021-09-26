({
    Navigate : function(component, event, helper) {
        let target = event.getParam("target");
        component.set("v.SelectedPage", target);
    }
})
