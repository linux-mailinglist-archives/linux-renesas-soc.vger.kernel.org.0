Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE7214402E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2020 16:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgAUPKA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Jan 2020 10:10:00 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:35572 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727059AbgAUPKA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Jan 2020 10:10:00 -0500
Received: (qmail 2375 invoked by uid 2102); 21 Jan 2020 10:09:59 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Jan 2020 10:09:59 -0500
Date:   Tue, 21 Jan 2020 10:09:59 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@prisktech.co.nz" <linux@prisktech.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
In-Reply-To: <TYAPR01MB4544F9647CD645BEB2DC99D8D80D0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.2001211003430.1511-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 21 Jan 2020, Yoshihiro Shimoda wrote:

> Hi Alan,
> 
> > From: Alan Stern, Sent: Tuesday, January 21, 2020 12:12 AM
> > 
> > On Mon, 20 Jan 2020, Yoshihiro Shimoda wrote:
> > 
> > > > > +static void ehci_platform_quirk_poll_work(struct work_struct *work)
> > > > > +{
> > > > > +	struct ehci_platform_priv *priv =
> > > > > +		container_of(work, struct ehci_platform_priv, poll_work);
> > > > > +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> > > > > +					     priv);
> > > > > +	int i;
> > > > > +
> > > > > +	usleep_range(4000, 8000);
> > > >
> > > > You have just waited 1000 ms for the timer.  Why will sleeping an
> > > > additional 4 - 8 ms make any difference?
> > >
> > > This sleeping can avoid a misdetection between this work function and
> > > reconnection. If user reconnects the usb within 4 ms, the PORTSC
> > > condition is possible to be the same as the issue's condition.
> > > I think I should have described this information into the code.
> > >
> > > However, if I used schedule_delayed_work() instead, we can remove
> > > the usleep_range().
> > 
> > Why not just make the timer delay be 1004 or 1008 ms instead of adding
> > this extra delay here?
> 
> My concern is a race condition when the issue doesn't happen. If
> the workaround code has an extra delay, we can detect misdetection like below.
> This is related to the EHCI/OHCI controllers on R-Car Gen3 SoCs though,
> updating the CCS status is possible to be delayed. To be clear of the reason,
> I should have described this CCS status behavior too.
> 
> Timer routine		workqueue		EHCI PORTSC	USB connection
> 								disconnect
> 						CCS=0		connect (within 4 ms)
> condition = true (misdetection)			CCS=0
> 			usleep_range(4000,8000)	CCS=1
> 			condition = false

Okay, now I understand.  I misread the code in the original patch.
But now it looks like the code does roughly this:

Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
			schedule_work();

Work routine:	usleep_range(4000, 8000);
		udelay(10);
		if (!ehci_platform_quirk_poll_check_condition(ehci))
			return;
		udelay(10);
		if (!ehci_platform_quirk_poll_check_condition(ehci))
			return;
		ehci_platform_quirk_poll_rebind_companion(ehci);

So there are three calls to quirk_poll_check_condition, with 4 - 8 ms
between the first and second, and 10 us between the second and third.
Do you really need to have this combination of a long delay followed by
a short delay?  Wouldn't two check_condition calls with only one delay
be good enough?

Alan Stern

