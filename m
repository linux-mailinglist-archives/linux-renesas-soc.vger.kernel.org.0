Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E86D170747
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 19:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgBZSKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 13:10:22 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:34780 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgBZSKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 13:10:22 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3E1F33C009D;
        Wed, 26 Feb 2020 19:10:20 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ox3u6X-MG0Pr; Wed, 26 Feb 2020 19:10:15 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 1A7E03C005E;
        Wed, 26 Feb 2020 19:10:15 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 26 Feb
 2020 19:10:14 +0100
Date:   Wed, 26 Feb 2020 19:10:11 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Lee, Chiasheng" <chiasheng.lee@intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <scan-admin@coverity.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] usb: hub: Fix unhandled return value of
 usb_autopm_get_interface()
Message-ID: <20200226181011.GA2868@lxhi-065.adit-jv.com>
References: <20200225202223.GA9154@lxhi-065.adit-jv.com>
 <Pine.LNX.4.44L0.2002251553030.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2002251553030.1485-100000@iolanthe.rowland.org>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

On Tue, Feb 25, 2020 at 03:54:20PM -0500, Alan Stern wrote:
> On Tue, 25 Feb 2020, Eugeniu Rosca wrote:
> > There are three commits fixed by the proposed changes in usb core:
> >  - v5.6-rc3 commit 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
> >  - v3.9-rc1 commit 971fcd492cebf5 ("usb: add runtime pm support for usb port device")
> >  - v2.6.33-rc1 commit 253e05724f9230 ("USB: add a "remove hardware" sysfs attribute")
> > 
> > I assume a single fix will create some pain when applying it to the
> > stable branches. Do you have any preference/inputs about that?
> 
> If you prefer to split this up into multiple patches, that's fine with 
> me.

Please, check https://lore.kernel.org/lkml/20200226175036.14946-1-erosca@de.adit-jv.com/

-- 
Best Regards
Eugeniu Rosca
