({
    searchTriggerHelper: function (component) {
        var orderEvent = component.getEvent("orderEvent");
        var getOrder = component.get('c.GetOrder');
        getOrder.setParams({'orderTN' : component.find('order-search-input').get('v.value') });
        console.log(component.find('order-search-input').get('v.value'));

        getOrder.setCallback(this, function(response){
            if (response.getState() == 'SUCCESS'){
                console.log(response.getReturnValue);
                component.set("v.ord", response.getReturnValue());
                orderEvent.setParams({ 'orderEvent' : response.getReturnValue()})
                orderEvent.fire();
            }
            else {
                alert('Tracking Number not found or does not exist. Please check your tracking number to insure you input the number correctly and try again. If this error continues to occur please submit a case');
            }
        });
        $A.enqueueAction(getOrder);
    }
})