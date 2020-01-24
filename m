Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54794148B24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 16:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389354AbgAXPSZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jan 2020 10:18:25 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:48942 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2387611AbgAXPSY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jan 2020 10:18:24 -0500
Received: (qmail 1782 invoked by uid 2102); 24 Jan 2020 10:18:23 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Jan 2020 10:18:23 -0500
Date:   Fri, 24 Jan 2020 10:18:23 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     gregkh@linuxfoundation.org, <linux@prisktech.co.nz>,
        <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] usb: host: ehci-platform: add a quirk to avoid stuck
In-Reply-To: <1579840923-10709-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.2001241012160.1610-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 24 Jan 2020, Yoshihiro Shimoda wrote:

> Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
> be getting stuck very rarely after a full/low usb device was
> disconnected. To detect/recover from such a situation, the controllers
> require a special way which poll the EHCI PORTSC register and changes
> the OHCI functional state.
> 
> So, this patch adds a polling timer into the ehci-platform driver,
> and if the ehci driver detects the issue by the EHCI PORTSC register,
> the ehci driver removes a companion device (= the OHCI controller)
> to change the OHCI functional state to USB Reset once. And then,
> the ehci driver adds the companion device again.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

All good, except for one thing at the end...

> diff --git a/include/linux/usb/ehci_def.h b/include/linux/usb/ehci_def.h
> index a15ce99..0ebfa74 100644
> --- a/include/linux/usb/ehci_def.h
> +++ b/include/linux/usb/ehci_def.h
> @@ -150,6 +150,7 @@ struct ehci_regs {
>  #define PORT_LED_MASK	(3<<14)
>  #define PORT_OWNER	(1<<13)		/* true: companion hc owns this port */
>  #define PORT_POWER	(1<<12)		/* true: has power (see PPC) */
> +#define PORT_LS_MASK	(3<<10)		/* USB 1.1 device */

The comment should say: /* Link status (SE0, K, or J) */ 

>  #define PORT_USB11(x) (((x)&(3<<10)) == (1<<10))	/* USB 1.1 device */
>  /* 11:10 for detecting lowspeed devices (reset vs release ownership) */

You can remove this comment now.  Since there is an actual macro for
bits 11:10, we don't need a separate comment saying what they are.

Alan Stern

>  /* 9 reserved */

