find_package(PkgConfig REQUIRED)
pkg_check_modules(SAILFISHSILICA sailfishsilica REQUIRED)

include_directories(
    ${SAILFISHSILICA_INCLUDE_DIRS}
)

set(plugin_SRCS
    fileinfo.cpp
    plaintextmodel.cpp
    sailfishofficeplugin.cpp
)

add_library(sailfishofficeplugin MODULE ${plugin_SRCS})
qt5_use_modules(sailfishofficeplugin Widgets Quick)
target_link_libraries(sailfishofficeplugin stdc++ ${QT_LIBRARIES} ${SAILFISHSILICA_LIBRARIES})

install(TARGETS sailfishofficeplugin DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt5/qml/Sailfish/Office)

install(FILES
    qmldir
    ContextMenuHook.qml
    ControllerFlickable.qml
    DeleteButton.qml
    DetailsPage.qml
    DocumentFlickable.qml
    DocumentHeader.qml
    DocumentPage.qml
    FullscreenError.qml
    IndexButton.qml
    OverlayToolbar.qml
    PDFAnnotationEdit.qml
    PDFAnnotationNew.qml
    PDFContextMenuHighlight.qml
    PDFContextMenuLinks.qml
    PDFContextMenuText.qml
    PDFDocumentPage.qml
    PDFDocumentToCPage.qml
    PDFSelectionDrag.qml
    PDFSelectionHandle.qml
    PDFSelectionView.qml
    PDFStorage.js
    PDFView.qml
    PlainTextDocumentPage.qml
    PresentationPage.qml
    PresentationThumbnailPage.qml
    SearchBarItem.qml
    ShareButton.qml
    SpreadsheetListPage.qml
    SpreadsheetPage.qml
    TextDocumentPage.qml
    TextDocumentToCPage.qml
    ToolBar.qml
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/qt5/qml/Sailfish/Office
)
