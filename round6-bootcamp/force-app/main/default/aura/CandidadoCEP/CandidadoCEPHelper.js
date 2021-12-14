({
    doInit : function(component) {
        var recorId = component.get("v.recordId");
        
        var increment = 0;

        component.find("button1").set("v.label",increment);

    }
})
