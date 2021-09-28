({
    aHelperFunction : function(component) {
        let ordLoc = component.get("orderLocation");
        component.set('v.orderMarker', [
            {
                location: {
                    Latitude: ordLoc.Lat__c,
                    Longitude: ordLoc.Lon__c
                }
            }
        ]);
    }
})