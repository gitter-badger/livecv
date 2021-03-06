TEMPLATE = app
TARGET   = livecv
QT      += qml quick

# Application
# -----------

include(src/application.pri)

RC_ICONS = $$PWD/icons/livecv.ico

win32{
    Release:DESTDIR = release/../release #fix for app current path
    Release:OBJECTS_DIR = release/.obj
    Release:MOC_DIR = release/.moc
    Release:RCC_DIR = release/.rcc

    Debug:DESTDIR = debug/../debug #fix for app current path
    Debug:OBJECTS_DIR = debug/.obj
    Debug:MOC_DIR = debug/.moc
    Debug:RCC_DIR = debug/.rcc
}

# Deploy Plugins
# --------------

PLUGIN_DEPLOY_FROM = $$PWD/plugins
win32:CONFIG(debug, debug|release): PLUGIN_DEPLOY_TO = $$OUT_PWD/../application/debug/plugins
else:win32:CONFIG(release, debug|release): PLUGIN_DEPLOY_TO = $$OUT_PWD/../application/release/plugins
else:unix: PLUGIN_DEPLOY_TO = $$OUT_PWD/../application

win32:PLUGIN_DEPLOY_TO ~= s,/,\\,g
win32:PLUGIN_DEPLOY_FROM ~= s,/,\\,g

plugincopy.commands = $(COPY_DIR) \"$$PLUGIN_DEPLOY_FROM\" \"$$PLUGIN_DEPLOY_TO\"

first.depends = $(first) plugincopy
export(first.depends)
export(plugincopy.commands)

QMAKE_EXTRA_TARGETS += first plugincopy

# Qml
# ---

RESOURCES += $$PWD/application.qrc

OTHER_FILES += \
    $$PWD/plugins/lcvcontrols/RegionSelection.qml \
    $$PWD/plugins/lcvcontrols/VideoControls.qml \
    $$PWD/plugins/lcvcontrols/KeypointListView.qml \
    $$PWD/plugins/lcvcontrols/LiveCVScrollStyle.qml \
    $$PWD/plugins/lcvcontrols/qmldir

include(deployment.pri)

DISTFILES += \
    $$PWD/plugins/lcvcontrols/DropDown.qml \
    $$PWD/plugins/lcvcontrols/ConfigurationPanel.qml \
    $$PWD/plugins/lcvcontrols/ConfigurationField.qml \
    $$PWD/plugins/lcvcontrols/InputBox.qml \
    plugins/lcvcontrols/FeatureDetectorSelection.qml \
    plugins/lcvcontrols/SelectionArea.qml \
    $$PWD/plugins/lcvcontrols/SelectionWindow.qml \
    plugins/lcvcontrols/LiveCVStyle.qml \
    plugins/lcvcontrols/FeatureObjectList.qml \
    plugins/lcvcontrols/FeatureObjectMatch.qml \
    plugins/lcvcontrols/DescriptorExtractorSelection.qml \
    plugins/lcvcontrols/TextButton.qml

