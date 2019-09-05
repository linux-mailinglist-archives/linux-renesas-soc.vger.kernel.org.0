Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78B8AABBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 21:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733259AbfIETHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 15:07:19 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43391 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbfIETHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 15:07:19 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 330653C00C5;
        Thu,  5 Sep 2019 21:07:15 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OTGX0Nk9r1cT; Thu,  5 Sep 2019 21:07:09 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 587473C005E;
        Thu,  5 Sep 2019 21:07:09 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 5 Sep 2019
 21:07:08 +0200
Date:   Thu, 5 Sep 2019 21:07:05 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Message-ID: <20190905190705.GA4062@vmlxhi-102.adit-jv.com>
References: <1567675074-3331-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB45449D299241B52077101C85D8BB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB45449D299241B52077101C85D8BB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Shimoda-san,

On Thu, Sep 05, 2019 at 11:07:02AM +0000, Yoshihiro Shimoda wrote:
> Hi Veeraiyan,
> 
> > From: Veeraiyan Chidambaram, Sent: Thursday, September 5, 2019 6:18 PM
> > 
> > In R-Car Gen3 USB 3.0 Function, if host is detached an interrupt
> > will be generated and Suspended state bit is set in interrupt status
> > register. Interrupt handler will call driver->suspend(composite_suspend)
> > if suspended state bit is set. composite_suspend will call
> > ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> > by user space application via /dev/ep0.
> > 
> > To be able to detect the host detach, USB_INT_1_B2_SPND to cover the
> > Suspended bit of the B2_SPND_OUT[9] from the USB Status Register
> > (USB_STA) register and perform appropriate action in the
> > usb3_irq_epc_int_1 function.
> > 
> > Without this commit, disconnection of the phone from R-Car H3 ES2.0
> > Salvator-X CN11 port is not recognized and reverse role switch does
> > not happen. If phone is connected again it does not enumerate.
> > 
> > With this commit, disconnection will be recognized and reverse role
> > switch will happen by a user space application. If phone is connected
> > again it will enumerate properly and will become visible in the
> > output of 'lsusb'.
> > 
> > Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> 
> Thank you for the patch!
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> And, I tested this patch on my environment [1] and works correctly. So,
> 
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I guess there are strong similarities between this patch and [3].
Would you like to pick [1-3], as they still apply cleanly to vanilla?

[1] https://patchwork.kernel.org/patch/10581479/
    ("[1/3] usb: renesas_usbhs: simplify usbhs_status_get_device_state()")
[2] https://patchwork.kernel.org/patch/10581485/
    ("[2/3] usb: renesas_usbhs: enable DVSE interrupt")
[3] https://patchwork.kernel.org/patch/10581489/
    ("usb: renesas_usbhs: add suspend event support in gadget mode")

PS: Apologize for long silence in [3].

-- 
Best Regards,
Eugeniu.
