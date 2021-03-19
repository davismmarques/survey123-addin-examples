/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial2 Settings Page
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
        settingsInfo.read();
    }

    //--------------------------------------------------------------------------

    Component.onDestruction: {
        page.forceActiveFocus();
        settingsInfo.write();
    }

    //--------------------------------------------------------------------------

    Dial2SettingsInfo {
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

            text: "Dial2 setting 1"

            font {
                family: page.font.family
                pointSize: 14
            }
        }

        TextField {
            id: setting1TextField

            Layout.fillWidth: true

            text: settingsInfo.setting1

            onEditingFinished: {
                settingsInfo.setting1 = text;
            }

            font {
                family: page.font.family
                pointSize: 16
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    //--------------------------------------------------------------------------
}
