Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9792145855
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2020 15:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgAVO6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jan 2020 09:58:40 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38762 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725911AbgAVO6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jan 2020 09:58:39 -0500
Received: (qmail 1734 invoked by uid 2102); 22 Jan 2020 09:58:38 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Jan 2020 09:58:38 -0500
Date:   Wed, 22 Jan 2020 09:58:38 -0500 (EST)
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
In-Reply-To: <TYAPR01MB4544998EECD346105AE75494D80C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.2001220956510.1636-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 22 Jan 2020, Yoshihiro Shimoda wrote:

> > Okay, now I understand.  I misread the code in the original patch.
> > But now it looks like the code does roughly this:
> > 
> > Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
> > 			schedule_work();
> > 
> > Work routine:	usleep_range(4000, 8000);
> > 		udelay(10);
> > 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> > 			return;
> > 		udelay(10);
> > 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> > 			return;
> > 		ehci_platform_quirk_poll_rebind_companion(ehci);
> > 
> > So there are three calls to quirk_poll_check_condition, with 4 - 8 ms
> > between the first and second, and 10 us between the second and third.
> > Do you really need to have this combination of a long delay followed by
> > a short delay?  Wouldn't two check_condition calls with only one delay
> > be good enough?
> 
> I had implemented this code by using hardware team's suggestion without
> any doubt. So, I asked hardware team about this combination of delays.
> The hardware team said this combination can reduce misdetection ratio
> from noise and so on. They also said we can wait single 5 ms instead
> this combination (but this cannot reduce misdetection ratio).

Sure, the more times you delay and recheck, the better the error rate.  
But you don't want to go too far.

> So, now I'm thinking that the following process (single wait) is
> enough and it can improve readability. But, what do you think?
> 
> Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
>  			schedule_delayed_work(5 ms);
> 
> Delayed work routine:
> 		if (!ehci_platform_quirk_poll_check_condition(ehci))
>  			return;
>  		ehci_platform_quirk_poll_rebind_companion(ehci);

That looks good to me.

Alan Stern

