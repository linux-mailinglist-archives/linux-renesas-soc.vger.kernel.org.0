Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E032AD9A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 15:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfIINFq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 09:05:46 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56294 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbfIINFq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 09:05:46 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 063F73C04C0;
        Mon,  9 Sep 2019 15:05:44 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YBJvnVtT2PP6; Mon,  9 Sep 2019 15:05:38 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D190C3C0579;
        Mon,  9 Sep 2019 15:05:29 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Sep 2019
 15:05:29 +0200
Date:   Mon, 9 Sep 2019 15:05:25 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20190909130525.GA19423@vmlxhi-102.adit-jv.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

On Fri, Sep 06, 2019 at 02:03:49PM +0200, Veeraiyan Chidambaram wrote:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Commit [1] enabled the possibility of checking the DVST (Device State
> Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> the irq_dev_state() handler if the DVST bit is set. But neither
> commit [1] nor commit [2] actually enabled the DVSE (Device State
> Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> Register 0). As a consequence, irq_dev_state() handler is getting
> called as a side effect of other (non-DVSE) interrupts being fired,
> which definitely can't be relied upon, if DVST notifications are of
> any value.
> 
> Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> doesn't do much except of a dev_dbg(). Once more work is added to
> the handler (e.g. detecting device "Suspended" state and notifying
> other USB gadget components about it), enabling DVSE becomes a hard
> requirement. Do it in a standalone commit for better visibility and
> clear explanation.
> 
> [1] f1407d5 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> [2] 2f98382 ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
> 
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> v2: No change
> v1: https://patchwork.kernel.org/patch/10581479/

It looks like this series changes the patch order of v1.
Could you kindly stick to the original order? Many thanks.

-- 
Best Regards,
Eugeniu.
