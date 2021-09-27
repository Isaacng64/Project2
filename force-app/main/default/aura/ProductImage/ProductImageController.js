({
	showImage : function(component, event, helper) {
		//var Id = row.Id;
        var idPrd = event.getParam('v.Product');
        alert('Showing Details: ' + JSON.stringify(idPrd));
	}
})