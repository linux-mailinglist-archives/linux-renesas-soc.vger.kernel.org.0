Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0605116EEC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 20:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbgBYTMw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 14:12:52 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:53783 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbgBYTMw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 14:12:52 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 0D6353C009D;
        Tue, 25 Feb 2020 20:12:50 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Xi8uvvwKm-pQ; Tue, 25 Feb 2020 20:12:44 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 4C76E3C005E;
        Tue, 25 Feb 2020 20:12:44 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 25 Feb
 2020 20:12:43 +0100
Date:   Tue, 25 Feb 2020 20:12:41 +0100
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
Message-ID: <20200225191241.GA32410@lxhi-065.adit-jv.com>
References: <20200225130846.20236-1-erosca@de.adit-jv.com>
 <Pine.LNX.4.44L0.2002251028030.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2002251028030.1485-100000@iolanthe.rowland.org>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

Many thanks for the prompt review.

On Tue, Feb 25, 2020 at 10:32:32AM -0500, Alan Stern wrote:
> On Tue, 25 Feb 2020, Eugeniu Rosca wrote:
> > +		int r = usb_autopm_get_interface(intf);
> > +
> > +		if (!r)
> > +			hub->quirk_disable_autosuspend = 1;
> > +		else
> > +			dev_dbg(&intf->dev, "disable autosuspend err=%d\n", r);
> >  	}
> >  
> >  	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> 
> This change is not necessary, because the resume operation cannot fail
> at this point (interfaces are always powered-up during probe).

Agreed to avoid unneeded complexity.

> A better solution would be to call usb_autpm_get_interface_no_resume()
> instead.

Pushed to https://lore.kernel.org/lkml/20200225183057.31953-1-erosca@de.adit-jv.com

> 
> On the other hand, the other places that call
> usb_autopm_get_interface() without checking should be audited.  Some of
> them almost certainly need to be fixed.

A quick 'git grep' outputs below list of auditable candidates [1].

With no relevant devices at hand, I would avoid touching these drivers,
since oftentimes even legitimate patches introduce regressions w/o
testing.

If anybody volunteers with testing, I guess it should be quick to
either convert usb_autpm_get_interface to *_no_resume variant or
handle the return value in place in below instances.

[1] (v5.6-rc3) git grep -En "[^=]\s+usb_autopm_get_interface\("
  drivers/input/touchscreen/usbtouchscreen.c:1788:  usb_autopm_get_interface(intf);
  drivers/media/usb/stkwebcam/stk-webcam.c:628:     usb_autopm_get_interface(dev->interface);
  drivers/net/usb/hso.c:1308:                       usb_autopm_get_interface(serial->parent->interface);
  drivers/net/usb/r8152.c:5231:                     usb_autopm_get_interface(tp->intf);
  sound/usb/usx2y/us122l.c:192:                     usb_autopm_get_interface(iface);

-- 
Best Regards
Eugeniu Rosca
