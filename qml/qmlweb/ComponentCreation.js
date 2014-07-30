var history = []
var component;
var lastUrl;

function navigate(url) {
    console.log("Navigating " + url);
    component = Qt.createComponent(url, Component.Asynchronous);

    if (component.status == Component.Ready) {
        lastUrl = url;
        finishCreation();
    } else if (component.status == Component.Loading) {
        lastUrl = url;
        component.statusChanged.connect(finishCreation);
    } else {
        console.error("Error loading component for " + url);
        return;
    }
}

function goBack() {
    history.pop();
    navigate(history.pop());
}

function finishCreation() {
    if (component.status == Component.Ready) {
        history.push(lastUrl);

        var page = component.createObject(stack);
        stack.push(page);
    } else if (component.status == Component.Error) {
        console.error("Error loading component:", component.errorString());
    }
}
