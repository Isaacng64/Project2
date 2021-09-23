({
    emitCartConfirm : function(component, event, helper) {
        let evt = component.getEvent("ToggleCart");
        evt.fire();
    },
    submitOrder : function(component, event, helper) {
        //alert("Order submit!");
    },
    init: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Unit Number', fieldName: 'ProductCode', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'},
            {label: 'Quantity', fieldName: 'Quantity', type: 'Integer'}
        ]);

        // actually load real data not fake data
        //helper.getAllProducts(component, event);

        // get just products in your cart
        helper.getCartProducts(component, event);

        helper.initTheCart(component, event);

        /*
        let data = [
            {'Name' : 'one', 'ProductCode' : '5109353', 'Description' : 'lalalaaalaa'},
            {'Name' : 'two', 'ProductCode' : '51034234329353', 'Description' : 'lalaladdddddddddddlaa'},
            {'Name' : 'otewne', 'ProductCode' : '51093353', 'Description' : 'lalalsssssssssssssalaa'},
            {'Name' : 'teeeee', 'ProductCode' : '510931111111111111111153', 'Description' : 'lalalzzzzzzzzzalaa'}
        ];

        component.set("v.data", data);
        */

    },
    updateSelectedText : function(component, event, helper){
        let selectedRows = event.getParam('selectedRows');
        component.set('v.selectedText', selectedRows[0].Name);
    }
})
