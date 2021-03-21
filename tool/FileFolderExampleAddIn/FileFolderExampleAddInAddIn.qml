
/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  FileFolderExampleAddIn
 *
 *  Created %{CurrentDate} %{CurrentTime}
 *
 *------------------------------------------------------------------------------
*/

// ref: https://developers.arcgis.com/qt/extras/api-reference/qml-esri-arcgisextras-filefolder.html
import QtQml 2.12
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import ArcGIS.AppFramework 1.0

import ArcGIS.Survey123 1.0

AddInTool {
    id: addIn

    //--------------------------------------------------------------------------
    onSettingsModified: {
        settingsInfo.read()
    }

    //--------------------------------------------------------------------------
    FileFolderExampleAddInSettingsInfo {
        id: settingsInfo

        settings: addIn.settings
    }

    //--------------------------------------------------------------------------
    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(addIn, true)
    }

    //--------------------------------------------------------------------------
    ColumnLayout {
        anchors.fill: parent
        Item {
            Layout.fillHeight: true
        }
        // Exists
        // ref: https://developers.arcgis.com/qt/extras/api-reference/qml-esri-arcgisextras-filefolder.html#exists-prop
        Row {
            Layout.fillWidth: true
            Text {
                id: fileExistsText
                text: "fileExists:"
                anchors.left: parent.left
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
            }
            TextField {
                id: existCheckTextField
                Layout.fillWidth: true
                anchors.right: existCheckStatusIndicator.left
                anchors.left: fileExistsText.right
                wrapMode: Text.WrapAnywhere
                text: legacyStorageFolderPath
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
                onTextChanged: {
                    existCheckFileFolder.path = text
                    if (existCheckFileFolder.exists) {
                        existCheckStatusIndicator.color = "green"
                    } else {
                        existCheckStatusIndicator.color = "red"
                    }
                }
            }
            Rectangle {
                id: existCheckStatusIndicator
                anchors.right: parent.right
                radius: 100
                color: "green"
                width: 45
                height: 45
            }
        }
        Item {
            Layout.fillHeight: true
        }
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 5
            Rectangle {
                anchors.fill: parent
                color: "#1167b1"
            }
        }
        // makePath
        // Ref: https://developers.arcgis.com/qt/extras/api-reference/qml-esri-arcgisextras-filefolder.html#makePath-method
        Row {
            Layout.fillWidth: true
            Text {
                id: makePathText
                text: "makePath:"
                anchors.left: parent.left
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
            }
            TextField {
                id: makePathTextField
                anchors.right: makePathButton.left
                anchors.left: makePathText.right
                wrapMode: Text.WrapAnywhere
                text: legacyStorageFolderPath
                Layout.fillWidth: true

                font {
                    family: addIn.font.family
                    pointSize: 20
                }
            }
            Button {
                id: makePathButton
                text: "Create!"
                anchors.right: makePathStatusIndicator.left
                Layout.preferredWidth: parent.width * 0.1
                onClicked: {
                    if (makePathFileFolder.makeFolder(makePathTextField.text)) {
                        makePathStatusIndicator.color = "green"
                    } else {
                        makePathStatusIndicator.color = "red"
                    }
                }
            }
            Rectangle {
                id: makePathStatusIndicator
                anchors.right: parent.right
                radius: 100
                color: "white"
                width: 45
                height: 45
            }
        }
        Item {
            Layout.fillHeight: true
        }
        Item {
            Layout.fillWidth: true
            Layout.minimumHeight: 5
            Rectangle {
                anchors.fill: parent
                color: "#1167b1"
            }
        }
        // File info
        // ref: https://developers.arcgis.com/qt/extras/api-reference/qml-esri-arcgisextras-fileinfo.html
        Row {
            Layout.fillWidth: true
            Text {
                id: fileInfoText
                text: "makePath:"
                anchors.left: parent.left
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
            }
            TextField {
                id: fileInfoTextField
                anchors.right: parent.right
                anchors.left: fileInfoText.right
                wrapMode: Text.WrapAnywhere
                text: legacyStorageFolderPath
                Layout.fillWidth: true

                font {
                    family: addIn.font.family
                    pointSize: 20
                }
                onTextChanged: {
                    fileInfoFileFolder.path = text
                    if (fileInfoFileFolder.exists) {
                        var fileInfo = fileInfoFileFolder.fileInfo(text)
                        var createdDate = fileInfo.created.toString()
                        var size = fileInfo.size
                        var isWritable = fileInfo.isWritable

                        createdfileInfoText.text = "Created: " + createdDate
                        if (size === 0) {
                            sizefileInfoText.text = "Size: N/A"
                        } else {
                            sizefileInfoText.text = "Size: " + size
                        }
                        isWritablefileInfoText.text = "Writable: " + isWritable
                    } else {
                        createdfileInfoText.text = "Created: File/Folder not found"
                        sizefileInfoText.text = "Size: File/Folder not found "
                        isWritablefileInfoText.text = "Writable: File/Folder not found"
                    }
                }
            }
        }
        Item {
            Layout.fillHeight: true
        }
        Column {
            Layout.fillWidth: true
            Text {
                id: createdfileInfoText
                Layout.fillWidth: true
                text: "Created:"
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
                wrapMode: Text.WrapAnywhere
            }
            Text {
                id: sizefileInfoText
                Layout.fillWidth: true
                text: "Size:"
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
                wrapMode: Text.WrapAnywhere
            }
            Text {
                id: isWritablefileInfoText
                Layout.fillWidth: true
                text: "Witable? "
                font {
                    family: addIn.font.family
                    pointSize: 20
                }
                wrapMode: Text.WrapAnywhere
            }
        }
        Item {
            Layout.fillHeight: true
        }
    }

    // File Folders
    FileFolder {
        id: existCheckFileFolder
        path: existCheckTextField.text
    }
    FileFolder {
        id: makePathFileFolder
        path: makePathTextField.text
    }

    FileFolder {
        id: fileInfoFileFolder
        path: fileInfoTextField.text
    }

    //--------------------------------------------------------------------------
}
