/****************************************************************************
**
** Copyright (C) 2014-2016 Dinu SV.
** (contact: mail@dinusv.com)
** This file is part of Live CV Application.
**
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
****************************************************************************/

#include "qbriefdescriptorextractor.h"
#include "opencv2/features2d/features2d.hpp"

QBriefDescriptorExtractor::QBriefDescriptorExtractor(QQuickItem *parent)
    : QDescriptorExtractor(new cv::BriefDescriptorExtractor, parent)
{
}

QBriefDescriptorExtractor::~QBriefDescriptorExtractor(){
}

void QBriefDescriptorExtractor::initialize(const QVariantMap &params){
    int bytes = 32;
    if ( params.contains("bytes") )
        bytes = params["bytes"].toInt();

    initializeExtractor(new cv::BriefDescriptorExtractor(bytes));
}
