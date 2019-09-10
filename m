Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3AE4AE705
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 11:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389959AbfIJJba (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 05:31:30 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:33584 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbfIJJba (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 05:31:30 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 3868C3C0016;
        Tue, 10 Sep 2019 11:31:27 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VFZvJfaNJ9pe; Tue, 10 Sep 2019 11:31:21 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CDA613C04C0;
        Tue, 10 Sep 2019 11:31:21 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 10 Sep
 2019 11:31:21 +0200
Date:   Tue, 10 Sep 2019 11:31:17 +0200
From:   veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: Re: [PATCH v4 2/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20190910093117.GB9960@vmlxhi-070.adit-jv.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568043974-1236-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB4544C419E30F3D3033086088D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544C419E30F3D3033086088D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello shimoda-san,

Thanks for point out checkpatch warning. After resolving checkpatch warning,
below  checkpatch warning is seen.

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#23:
[1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")


is this warning fine for you? .

Regards,

veeraiyan chidambaram.

On Tue, Sep 10, 2019 at 04:45:29AM +0000, Yoshihiro Shimoda wrote:
> Hi Veeraiyan,
> 
> Thank you for the patch!
> 
> > From: Veeraiyan Chidambaram, Sent: Tuesday, September 10, 2019 12:46 AM
> <snip>
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
> > [1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> > [2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> 
> I'm afraid I should have realized but, according to checkpatch.pl,
> these formats cause ERROR like below. So, they should be fixed.
> 
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")'
> #90:
> [1] f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> 
> ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")'
> #91:
> [2] 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> 
> Best regards,
> Yoshihiro Shimoda
> 
