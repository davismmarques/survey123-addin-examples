/*
 *------------------------------------------------------------------------------
 *  Survey123 Add-In
 *
 *  Dial
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

AddInControl {
    id: addIn

    onPropertiesChanged: {
        console.log('dial properties changed', JSON.stringify(addIn.properties));
    }
    onSettingsModified: {
        settingsInfo.read();
    }

    //--------------------------------------------------------------------------

    DialSettingsInfo {
        id: settingsInfo

        settings: addIn.settings
    }

    //--------------------------------------------------------------------------

    LoggingCategory {
        id: logCategory

        name: AppFramework.typeOf(addIn, true)
    }

    //--------------------------------------------------------------------------

    Item {
        height: 120
        width: parent.width

        Dial {
            id: dial
            anchors.centerIn: parent
            from: addIn.properties.start
            height: 120
            onMoved: {
                console.log('dial value changed', value);
                addIn.value = value;
            }
            snapMode: Dial.SnapAlways
            stepSize: addIn.properties.step
            to: addIn.properties.end
            width: 120
        }

        Text {
            anchors.centerIn: parent
            text: dial.value
        }
    }

    //--------------------------------------------------------------------------
}

