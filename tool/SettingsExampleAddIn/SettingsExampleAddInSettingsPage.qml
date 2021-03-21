

/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  SettingsExampleAddIn Settings Page
 *
 *  Created %{CurrentDate} %{CurrentTime}
 *
 *------------------------------------------------------------------------------
*/
import QtQml 2.12
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import ArcGIS.AppFramework 1.0

import ArcGIS.Survey123 1.0

AddInSettingsPage {
    id: page

    //--------------------------------------------------------------------------
    Component.onCompleted: {
        settingsInfo.read()
    }

    //--------------------------------------------------------------------------
    Component.onDestruction: {
        page.forceActiveFocus()
        settingsInfo.write()
    }

    //--------------------------------------------------------------------------
    SettingsExampleAddInSettingsInfo {
        id: settingsInfo

        settings: page.settings
    }

    //--------------------------------------------------------------------------
    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(page, true)
    }

    //--------------------------------------------------------------------------
    ColumnLayout {
        anchors {
            fill: parent
            margins: 10 * AppFramework.displayScaleFactor
        }
        spacing: 5 * AppFramework.displayScaleFactor

        Text {
            Layout.fillWidth: true
            text: "SettingsExampleAddIn - setting - Show Delete Button"
            font {
                family: page.font.family
                pointSize: 14
            }
        }

        Switch {
            id: showButtonSwitch
            Layout.fillWidth: true
            text: qsTr("Show Delete Button")
            font {
                family: page.font.family
                pointSize: 16
            }
            checked: settingsInfo.showButton
            onCheckedChanged: settingsInfo.showButton = (checked) ? 1 : 0
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    //--------------------------------------------------------------------------
}
