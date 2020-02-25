Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A46C16EFF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 21:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731715AbgBYUWf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 15:22:35 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53946 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731565AbgBYUWe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 15:22:34 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 890913C009D;
        Tue, 25 Feb 2020 21:22:32 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vydUNAF9Bs4E; Tue, 25 Feb 2020 21:22:26 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 824033C005E;
        Tue, 25 Feb 2020 21:22:26 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 25 Feb
 2020 21:22:26 +0100
Date:   Tue, 25 Feb 2020 21:22:23 +0100
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
Message-ID: <20200225202223.GA9154@lxhi-065.adit-jv.com>
References: <20200225191241.GA32410@lxhi-065.adit-jv.com>
 <Pine.LNX.4.44L0.2002251419120.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2002251419120.1485-100000@iolanthe.rowland.org>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

On Tue, Feb 25, 2020 at 02:39:23PM -0500, Alan Stern wrote:
> On Tue, 25 Feb 2020, Eugeniu Rosca wrote:
> > [1] (v5.6-rc3) git grep -En "[^=]\s+usb_autopm_get_interface\("
> >   drivers/input/touchscreen/usbtouchscreen.c:1788:  usb_autopm_get_interface(intf);
> >   drivers/media/usb/stkwebcam/stk-webcam.c:628:     usb_autopm_get_interface(dev->interface);
> >   drivers/net/usb/hso.c:1308:                       usb_autopm_get_interface(serial->parent->interface);
> >   drivers/net/usb/r8152.c:5231:                     usb_autopm_get_interface(tp->intf);
> >   sound/usb/usx2y/us122l.c:192:                     usb_autopm_get_interface(iface);
> 
> Your regular expression isn't right because it doesn't match lines
> where the usb_autopm_get_interface() is preceded only by one whitespace
> character (i.e., a tab).  It also will match lines where there are two
> space characters between the = sign and the function name.  I think
> what you want is more like "(^|[^=[:space:]])\s*" at the start of the
> RE.

Agreed. My version filters out some true positives.

> 
> A revised search finds line 997 in drivers/usb/core/hub.c and lines
> 216, 269 in drivers/usb/core/port.c.  (I didn't try looking in any
> other directories.)  AFAICT all three of these should check the return
> value, although a error message in the kernel log probably isn't
> needed.
> 
> Do you want to fix those instances up also, maybe merging them in with
> the existing patch?

I wonder if squashing all these fixes into one patch is the best option.

There are three commits fixed by the proposed changes in usb core:
 - v5.6-rc3 commit 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
 - v3.9-rc1 commit 971fcd492cebf5 ("usb: add runtime pm support for usb port device")
 - v2.6.33-rc1 commit 253e05724f9230 ("USB: add a "remove hardware" sysfs attribute")

I assume a single fix will create some pain when applying it to the
stable branches. Do you have any preference/inputs about that?

-- 
Best Regards
Eugeniu Rosca
