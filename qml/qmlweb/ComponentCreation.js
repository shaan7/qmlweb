var component;

function navigate(url) {
    component = Qt.createComponent(url);
    component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status == Component.Ready) {
        var page = component.createObject(stack);
        stack.push(page)
    } else if (component.status == Component.Error) {
        console.log("Error loading component:", component.errorString());
    }
}
