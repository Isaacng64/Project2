({
    bringData : function(component, event) { 
        //helper.changeProduct(component, event); 	
        let newAppIdProduct = event.getParam("idAppProduct");
        //alert('Product in Main App Image Prd : ' + newAppIdProduct);
        component.set("v.idSelectedProduct", newAppIdProduct);         
    }
})