Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F10F7AD794
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 13:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfIILEy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 07:04:54 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:55080 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730648AbfIILEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 07:04:54 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3AF5A3C04C0;
        Mon,  9 Sep 2019 13:04:52 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ySeHIQ6wbUyk; Mon,  9 Sep 2019 13:04:45 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 633AE3C0016;
        Mon,  9 Sep 2019 13:04:45 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Sep 2019
 13:04:45 +0200
Date:   Mon, 9 Sep 2019 13:04:41 +0200
From:   veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20190909110441.GA17712@vmlxhi-070.adit-jv.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB4544AA760AE8DBC4CA8AC25ED8B70@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190909095543.GA17624@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190909095543.GA17624@kroah.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Shimoda-san, hello greg,

Thanks. 
I have addressed the findings and prepared a v3 patch, please find
it below.
 1. https://patchwork.kernel.org/patch/11137693/
 2. https://patchwork.kernel.org/patch/11137697/
 3. https://patchwork.kernel.org/patch/11137693/

Regards,
Veeraiyan Chidambaram

On Mon, Sep 09, 2019 at 10:55:43AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Sep 09, 2019 at 07:02:46AM +0000, Yoshihiro Shimoda wrote:
> > Hi Veeraiyan,
> > 
> > > From: Veeraiyan Chidambaram, Sent: Friday, September 6, 2019 9:04 PM
> > > 
> > > From: Eugeniu Rosca <erosca@de.adit-jv.com>
> > > 
> > > Commit [1] enabled the possibility of checking the DVST (Device State
> > > Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> > > the irq_dev_state() handler if the DVST bit is set. But neither
> > > commit [1] nor commit [2] actually enabled the DVSE (Device State
> > > Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> > > Register 0). As a consequence, irq_dev_state() handler is getting
> > > called as a side effect of other (non-DVSE) interrupts being fired,
> > > which definitely can't be relied upon, if DVST notifications are of
> > > any value.
> > > 
> > > Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> > > doesn't do much except of a dev_dbg(). Once more work is added to
> > > the handler (e.g. detecting device "Suspended" state and notifying
> > > other USB gadget components about it), enabling DVSE becomes a hard
> > > requirement. Do it in a standalone commit for better visibility and
> > > clear explanation.
> > > 
> > > [1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> > > [2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> > > 
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > 
> > I think your Signed-off-by is needed here and patch 2/3.
> 
> Yes, I can't take this as-is without that.
> 
> thanks,
> 
> greg k-h
