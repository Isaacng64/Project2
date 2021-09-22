({
    toggleCart : function(component, event, helper) {
        component.set("v.bCartConfirmed", ! component.get("v.bCartConfirmed"));
    },
    submitOrder : function(component, event, helper) {
        //alert("Order submit!");
    },
    sameShipping : function(component, event, helper) {
        component.set("v.bSameShipping", ! component.get("v.bSameShipping"));
    },
    init: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Unit Number', fieldName: 'ProductCode', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'}
        ]);

        //let data = [
        //    {'Name' : 'one', 'ProductCode' : '5109353', 'Description' : 'lalalaaalaa'},
        //    {'Name' : 'two', 'ProductCode' : '51034234329353', 'Description' : 'lalaladdddddddddddlaa'},
        //    {'Name' : 'otewne', 'ProductCode' : '51093353', 'Description' : 'lalalsssssssssssssalaa'},
        //    {'Name' : 'teeeee', 'ProductCode' : '510931111111111111111153', 'Description' : 'lalalzzzzzzzzzalaa'}
        //];

        //component.set("v.data", data);

        // actually load real data not fake data
        helper.getAllProducts(component, event);
    },
    updateSelectedText : function(component, event, helper){
        let selectedRows = event.getParam('selectedRows');
        component.set('v.selectedText', selectedRows[0].Name);
    }
})

    
