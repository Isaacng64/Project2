({
    DoInit: function (component) {
        
    },
    Clear: function(component) {
        component.set("v.cleanForm", false);
        alert('Thank you for joining our mailing list: + {!} ' );
        component.set("v.cleanForm", true);
    },
        Error: function(component) {
        component.set("v.cleanForm", false);
        alert('There was an Error saving the Contact Information. Please try again!');
        component.set("v.cleanForm", true);
    }
})