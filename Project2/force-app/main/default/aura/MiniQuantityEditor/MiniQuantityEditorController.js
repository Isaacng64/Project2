({
    addValue : function(component, event, helper) {
        let e = $A.get("e.c:UpdateCartQuantity");
        let amount = parseInt(event.getSource().get("v.value"));

        e.setParams({"added" : amount, "direction" : "UP"});

        e.fire();
    },

    getValue : function(component, event, helper){
        if (event.getParam("direction") == "DOWN"){
            let value = event.getParam("current");
            component.set("v.SelectedQuantity", value);
        }
        
    },
    removeItem : function(component, event, helper){
        
        let e = $A.get("e.c:UpdateCartQuantity");

        e.setParams({"remove" : true, "direction" : "UP"});

        e.fire();
    }
})