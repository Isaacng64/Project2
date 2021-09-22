({
    getAllProducts: function (component, event) {
        let a = component.get("c.getProducts");

        a.setCallback(this, function(response){
            if(response.getState() == "SUCCESS"){
                
                component.set("v.data", response.getReturnValue());

            }
        });

        $A.enqueueAction(a);
    }
});