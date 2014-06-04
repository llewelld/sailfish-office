/*
 * Copyright (C) 2013-2014 Jolla Ltd.
 * Contact: Robin Burchell <robin.burchell@jolla.com>
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

#include "documentproviderplugin.h"

class DocumentProviderPlugin::Private {
public:
    Private() {}
    QUrl page;
};

DocumentProviderPlugin::DocumentProviderPlugin(QObject* parent)
    : QObject(parent)
    , d(new Private)
{
}

DocumentProviderPlugin::~DocumentProviderPlugin()
{
    delete d;
}

QString DocumentProviderPlugin::setupPageUrl() const
{
    return QString();
}

bool DocumentProviderPlugin::needsSetup() const
{
    return false;
}

QUrl DocumentProviderPlugin::page() const
{
    return d->page;
}

void DocumentProviderPlugin::setPage(const QUrl& url)
{
    d->page = url;
    emit pageChanged();
}

void DocumentProviderPlugin::deleteFile(const QUrl& file)
{
    Q_UNUSED(file);
    qWarning("Provider does not implement file deletion.");
}
