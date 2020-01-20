Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5012A142E87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 16:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgATPMG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 10:12:06 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44831 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726901AbgATPMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 10:12:06 -0500
Received: (qmail 17758 invoked by uid 500); 20 Jan 2020 10:12:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Jan 2020 10:12:05 -0500
Date:   Mon, 20 Jan 2020 10:12:05 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@prisktech.co.nz" <linux@prisktech.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
In-Reply-To: <TYAPR01MB45443178BFBB9C16CF3BC32AD8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.2001201009480.16814-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 20 Jan 2020, Yoshihiro Shimoda wrote:

> > > +static void ehci_platform_quirk_poll_work(struct work_struct *work)
> > > +{
> > > +	struct ehci_platform_priv *priv =
> > > +		container_of(work, struct ehci_platform_priv, poll_work);
> > > +	struct ehci_hcd *ehci = container_of((void *)priv, struct ehci_hcd,
> > > +					     priv);
> > > +	int i;
> > > +
> > > +	usleep_range(4000, 8000);
> > 
> > You have just waited 1000 ms for the timer.  Why will sleeping an
> > additional 4 - 8 ms make any difference?
> 
> This sleeping can avoid a misdetection between this work function and
> reconnection. If user reconnects the usb within 4 ms, the PORTSC
> condition is possible to be the same as the issue's condition.
> I think I should have described this information into the code.
> 
> However, if I used schedule_delayed_work() instead, we can remove
> the usleep_range().

Why not just make the timer delay be 1004 or 1008 ms instead of adding
this extra delay here?

Alan Stern

