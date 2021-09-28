({
    handleCmpEventHelper : function(component, event) {
        let containerOrder = event.getParam();
        component.set("v.theOrder", containerOrder);        
    }
})