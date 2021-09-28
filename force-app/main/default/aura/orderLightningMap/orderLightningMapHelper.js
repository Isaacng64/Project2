({
    handleComponentHelper : function(component, event) {
        var ordLoc = event.getParam("orderEvent");
        component.set("v.orderLocation", ordLoc);
        console.log('Map log ' + ordLoc)
        // use this for event instead of the apex actions
        if (ordLoc != null){
            component.set('v.orderMarker', [
            {
                location: {
                    Latitude: ordLoc.Lat__c,
                    Longitude: ordLoc.Lon__c,
                },
                title: 'My Order'
            }]);
        }
    }
})