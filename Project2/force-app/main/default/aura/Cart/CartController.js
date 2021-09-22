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
            {label: 'Opportunity name', fieldName: 'opportunityName', type: 'text'},
            {label: 'Account name', fieldName: 'accountName', type: 'text'},
            {label: 'Close date', fieldName: 'closeDate', type: 'date'},
            {label: 'Confidence', fieldName: 'confidence', type: 'percent'},
            {label: 'Amount', fieldName: 'amount', type: 'currency', typeAttributes: { currencyCode: 'EUR'}},
            {label: 'Contact Email', fieldName: 'contact', type: 'email'},
            {label: 'Contact Phone', fieldName: 'phone', type: 'phone'},
            {label: 'Website', fieldName: 'website', type: 'url', typeAttributes: { target: '_parent'}},
            {label: 'Address', fieldName: 'address', type: 'location'}
        ]);

        var fetchData = {
            opportunityName: "company.companyName",
            accountName : "name.findName",
            closeDate : "date.future",
            amount : "finance.amount",
            contact: "internet.email",
            phone : "phone.phoneNumber",
            website : "internet.url"
        };

        component.set("v.data", fetchData);
        //helper.fetchData(cmp, fetchData, 100);
    }
})

    
