({
    EmitNavigate : function(component, event, helper) {
        let evt = component.getEvent("Navigation");

        let target = event.getParam("name");

        evt.setParams({"target" : target});
        evt.fire();
    },
    EmitNavigatePromo : function(component, event, helper) {
        let evt = component.getEvent("Navigation");

        let target = "promo";

        evt.setParams({"target" : target});
        evt.fire();
    }
})
