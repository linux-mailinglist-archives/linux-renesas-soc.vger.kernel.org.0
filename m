Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F63B16F0AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 21:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgBYUyV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 15:54:21 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:39628 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728787AbgBYUyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 15:54:21 -0500
Received: (qmail 6720 invoked by uid 2102); 25 Feb 2020 15:54:20 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Feb 2020 15:54:20 -0500
Date:   Tue, 25 Feb 2020 15:54:20 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
cc:     linux-usb@vger.kernel.org, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Lee, Chiasheng" <chiasheng.lee@intel.com>,
        Mathieu Malaterre <malat@debian.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        <scan-admin@coverity.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] usb: hub: Fix unhandled return value of usb_autopm_get_interface()
In-Reply-To: <20200225202223.GA9154@lxhi-065.adit-jv.com>
Message-ID: <Pine.LNX.4.44L0.2002251553030.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 25 Feb 2020, Eugeniu Rosca wrote:

> Hi Alan,
> 
> On Tue, Feb 25, 2020 at 02:39:23PM -0500, Alan Stern wrote:
> > On Tue, 25 Feb 2020, Eugeniu Rosca wrote:
> > > [1] (v5.6-rc3) git grep -En "[^=]\s+usb_autopm_get_interface\("
> > >   drivers/input/touchscreen/usbtouchscreen.c:1788:  usb_autopm_get_interface(intf);
> > >   drivers/media/usb/stkwebcam/stk-webcam.c:628:     usb_autopm_get_interface(dev->interface);
> > >   drivers/net/usb/hso.c:1308:                       usb_autopm_get_interface(serial->parent->interface);
> > >   drivers/net/usb/r8152.c:5231:                     usb_autopm_get_interface(tp->intf);
> > >   sound/usb/usx2y/us122l.c:192:                     usb_autopm_get_interface(iface);
> > 
> > Your regular expression isn't right because it doesn't match lines
> > where the usb_autopm_get_interface() is preceded only by one whitespace
> > character (i.e., a tab).  It also will match lines where there are two
> > space characters between the = sign and the function name.  I think
> > what you want is more like "(^|[^=[:space:]])\s*" at the start of the
> > RE.
> 
> Agreed. My version filters out some true positives.
> 
> > 
> > A revised search finds line 997 in drivers/usb/core/hub.c and lines
> > 216, 269 in drivers/usb/core/port.c.  (I didn't try looking in any
> > other directories.)  AFAICT all three of these should check the return
> > value, although a error message in the kernel log probably isn't
> > needed.
> > 
> > Do you want to fix those instances up also, maybe merging them in with
> > the existing patch?
> 
> I wonder if squashing all these fixes into one patch is the best option.
> 
> There are three commits fixed by the proposed changes in usb core:
>  - v5.6-rc3 commit 1208f9e1d758c9 ("USB: hub: Fix the broken detection of USB3 device in SMSC hub")
>  - v3.9-rc1 commit 971fcd492cebf5 ("usb: add runtime pm support for usb port device")
>  - v2.6.33-rc1 commit 253e05724f9230 ("USB: add a "remove hardware" sysfs attribute")
> 
> I assume a single fix will create some pain when applying it to the
> stable branches. Do you have any preference/inputs about that?

If you prefer to split this up into multiple patches, that's fine with 
me.

Alan Stern

