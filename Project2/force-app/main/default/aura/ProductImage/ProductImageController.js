({
    bringData : function(component, event) { 
        //helper.changeProduct(component, event); 	
        let newAppIdProduct = event.getParam("idAppProduct");
        let imgProduct = event.getParam("imgProduct"); 
        let nameProduct = event.getParam("nameProduct"); 
        let priceProduct = event.getParam("priceProduct"); 
        if (imgProduct == null) {
            imgProduct = "/resource/Img_noProduct"
        } else {
            imgProduct = "/resource/" + imgProduct
        }
        component.set("v.idSelectedProduct", newAppIdProduct);   
        component.set("v.imgSelectedProduct", imgProduct); 
		component.set("v.nameProduct", nameProduct);  
        component.set("v.pricedProduct", priceProduct)
    }
})