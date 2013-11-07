import QtQuick 2.0
import Sailfish.Silica 1.0
import org.kde.calligra 1.0 as Calligra

DocumentPage {
    id: page;

    attachedPage: Component {
        PresentationThumbnailPage {
            document: doc;
        }
    }

    Calligra.View {
        id: v;
        anchors.fill: parent;
        document: doc;
    }

    SilicaFlickable {
        id: f;
        anchors.fill: parent;

        Calligra.ViewController {
            id: controller;
            view: v;
            flickable: f;
            minimumZoomFitsWidth: true;
        }

        children: [
            HorizontalScrollDecorator { color: Theme.highlightDimmerColor; },
            VerticalScrollDecorator { color: Theme.highlightDimmerColor; }
        ]

        PinchArea {
            anchors.fill: parent;

            onPinchUpdated: {
                var newCenter = mapToItem( f, pinch.center.x, pinch.center.y );
                controller.zoomAroundPoint(pinch.scale - pinch.previousScale, newCenter.x, newCenter.y);
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: page.open = !page.open;
            }
        }
    }

    Calligra.Document {
        id: doc;

        onStatusChanged: if(status == Calligra.DocumentStatus.Loaded) controller.zoomToFitWidth(page.width);
    }
    
    busy: doc.status != Calligra.DocumentStatus.Loaded;
    source: doc.source;
    indexCount: doc.indexCount;

    onStatusChanged: {
        //Delay loading the document until the page has been activated.
        if(status == PageStatus.Active) {
            doc.source = page.path;
        }
    }
}
