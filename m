Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04EE10024F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 11:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfKRKY2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 05:24:28 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:41405 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfKRKY2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 05:24:28 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 0748D3C04C0;
        Mon, 18 Nov 2019 11:24:26 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FajJQDfEdwDF; Mon, 18 Nov 2019 11:24:20 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6F9B53C0022;
        Mon, 18 Nov 2019 11:24:20 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 18 Nov
 2019 11:24:19 +0100
Date:   Mon, 18 Nov 2019 11:24:16 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20191118102416.GA17554@lxhi-065.adit-jv.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <20190909130525.GA19423@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190909130525.GA19423@vmlxhi-102.adit-jv.com>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Felipe,

On Mon, Sep 09, 2019 at 03:05:25PM +0200, Eugeniu Rosca wrote:
> Hi Veeraiyan,
> 
> On Fri, Sep 06, 2019 at 02:03:49PM +0200, Veeraiyan Chidambaram wrote:
> > From: Eugeniu Rosca <erosca@de.adit-jv.com>
> > 
> > Commit [1] enabled the possibility of checking the DVST (Device State
> > Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> > the irq_dev_state() handler if the DVST bit is set. But neither
> > commit [1] nor commit [2] actually enabled the DVSE (Device State
> > Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> > Register 0). As a consequence, irq_dev_state() handler is getting
> > called as a side effect of other (non-DVSE) interrupts being fired,
> > which definitely can't be relied upon, if DVST notifications are of
> > any value.
> > 
> > Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> > doesn't do much except of a dev_dbg(). Once more work is added to
> > the handler (e.g. detecting device "Suspended" state and notifying
> > other USB gadget components about it), enabling DVSE becomes a hard
> > requirement. Do it in a standalone commit for better visibility and
> > clear explanation.
> > 
> > [1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> > [2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> > v2: No change
> > v1: https://patchwork.kernel.org/patch/10581479/
> 
> It looks like this series changes the patch order of v1.
> Could you kindly stick to the original order? Many thanks.

I see this _superseded_ patch version (and apparently the whole series)
present on your "next" branch, as well as on linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=next&id=8b20d00f0f08
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8b20d00f0f08

The most recent v5 version of this series has been recently pushed to
(not yet visible in upstream):
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-testing

-- 
Best Regards,
Eugeniu
