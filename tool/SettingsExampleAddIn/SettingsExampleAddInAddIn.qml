/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  SettingsExampleAddIn
 *
 *  Created %{CurrentDate} %{CurrentTime}
 *
 *------------------------------------------------------------------------------
*/

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
        settingsInfo.read();
    }

    //--------------------------------------------------------------------------

    SettingsExampleAddInSettingsInfo {
        id: settingsInfo

        settings: addIn.settings
    }

    //--------------------------------------------------------------------------

    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(addIn, true)
    }

    //--------------------------------------------------------------------------




    ListModel {
        id: fruitModel
        ListElement {
            title: "Apple"
        }
        ListElement {
            title: "Banana"
        }
        ListElement {
            title: "Orange"
        }
        ListElement {
            title: "Kiwifruit"
        }
        ListElement {
            title: "Cheries"
        }
        ListElement {
            title: "Avocado"
        }
        ListElement {
            title: "Figs"
        }
    }


    ColumnLayout {
        anchors.fill: parent



        TableView {
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: deleteBtn.top
            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: fruitModel

            delegate: Rectangle {
                implicitWidth: parent.width
                implicitHeight: 50
                Text {
                    text: title

                    font {
                        family: page.font.family
                        pointSize: 20
                    }


                }
            }
        }


        Button{
            id: deleteBtn
            anchors.bottom: parent.bottom
            Layout.fillWidth: true
            enabled: settingsInfo.showButton === 1
            text: settingsInfo.showButton === 1 ? "DELETE" : "DELETE - Enable this button through Add-In settings."
            onClicked: {
                fruitModel.remove(0)
            }
        }

    }

    //--------------------------------------------------------------------------
}

