Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6718A88CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 21:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730478AbfIDObt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 10:31:49 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:34117 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIDObt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 10:31:49 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D99FF3C04C1;
        Wed,  4 Sep 2019 16:31:46 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ah1KTVIjuPTC; Wed,  4 Sep 2019 16:31:41 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 499BA3C005E;
        Wed,  4 Sep 2019 16:31:41 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 4 Sep 2019
 16:31:40 +0200
Date:   Wed, 4 Sep 2019 16:31:36 +0200
From:   veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: add suspend event support
Message-ID: <20190904143136.GA19719@vmlxhi-070.adit-jv.com>
References: <1567589047-29816-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks a lot  for your feedback.

On Wed, Sep 04, 2019 at 12:08:39PM +0000, Yoshihiro Shimoda wrote:
> Hi Veeraiyan,
> 
> Thank you very much for the patch! I didn't realize that using USB_INT_1_B2_SPND
> can resolve such a behavior. I'd like to apply this patch into upstream, but
> I have some comments below.
> 
> > From: Veeraiyan Chidambaram, Sent: Wednesday, September 4, 2019 6:24 PM
> > 
> > In RCAR3 USB 3.0 Function, if host is detached an interrupt
> 
> I'd like to replace "RCAR3" with "R-Car Gen3".
  Yes . I agree  
> > Without this commit, disconnection of the phone from R-Car-H3 ES2.0
> 
> s/R-Car-H3/R-Car H3/
  Yes . I agree 
> IIUC, reverse role switch will happen by a user space application.
> Is it correct?
  Yes, understanding is correct and made the change in commit message. 

> I'd like to change the conditions like below if it still works on your environment.
> This is because I'd like to set the gadget state if other gadget driver except f_fs
> is used anyway. After that, a user also can recognize the state by using
> /sys/devices/platform/soc/ee020000.usb/udc/ee020000.usb/state even if the use
> doesn't use f_fs driver.
> 
> 	if (usb3->gadget.speed != USB_SPEED_UNKNOWN &&
> 	    usb3->gadget.state != USB_STATE_NOTATTACHED) {
> 		if (usb3->driver && usb3->driver->suspend)
> 			usb3->driver->suspend(&usb3->gadget);
> 		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);
> 	}

Above change worked in our environment. I prepare patch for this
> Best regards,
> Yoshihiro Shimoda
> 
