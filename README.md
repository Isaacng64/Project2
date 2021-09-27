# These are the changes I made to the Order Object that is required for my aura components to work

I added the following fields  
  -TrackingNumber__c : auto number datat type with the format {YYYY}{MM}{DD}{0}  
  -LastLocation__c : Text Area data type which describes the last location of where the order was  
  -Lat__c : text data type with order's last location Latitude   
  -Lon__c : text data type with order's last location Longitude  