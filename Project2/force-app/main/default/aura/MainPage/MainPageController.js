({
    Navigate : function(component, event, helper) {
        let target = event.getParam("target");
        component.set("v.SelectedPage", target);
    },
    init: function (component, event){
        let a = component.get("c.initCart");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.SessionOrderID", response.getReturnValue());
                alert("successly made cart?");

            }else{
                alert("did not made cart?");
            }
        });

        $A.enqueueAction(a);
    },
})