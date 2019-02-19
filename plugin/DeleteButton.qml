/*
 * Copyright (C) 2019 Jolla Ltd.
 * Contact: Joona Petrell <joona.petrell@jolla.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 only.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0

IconButton {
    property DocumentPage page
    readonly property url source: page.source
    property Item _remorsePopup
    readonly property bool remorseActive: _remorsePopup && _remorsePopup.active
    function remorseAction(text, action) {
        if (!_remorsePopup) {
            _remorsePopup = remorsePopupComponent.createObject(page)
        }
        if (!_remorsePopup.active) {
            _remorsePopup.execute(text, action)
        }
    }

    onSourceChanged: if (_remorsePopup && _remorsePopup.active) _remorsePopup.trigger()
    onClicked: {
        //: Delete an image
        //% "Deleting"
        remorseAction(qsTrId("sailfish-office-la-deleting"), function() {
            page.provider.deleteFile(page.source)
            pageStack.pop()
        })
    }

    icon.source: "image://theme/icon-m-delete"
    anchors.verticalCenter: parent.verticalCenter
    visible: page.source != ""
    Component {
        id: remorsePopupComponent
        RemorsePopup {}
    }
}
