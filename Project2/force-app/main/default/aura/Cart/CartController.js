({
    toggleCart : function(component, event, helper) {
        component.set("v.bCartConfirmed", ! component.get("v.bCartConfirmed"));
    },
    submitOrder : function(component, event, helper) {
        //alert("Order submit!");
    },
    sameShipping : function(component, event, helper) {
        component.set("v.bSameShipping", ! component.get("v.bSameShipping"));
    }
})

    
