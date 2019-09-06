Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DF3AB45B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2019 10:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392697AbfIFIuS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Sep 2019 04:50:18 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:45834 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392632AbfIFIuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Sep 2019 04:50:18 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E467C3C00C5;
        Fri,  6 Sep 2019 10:50:15 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JYJmjfcXmBAG; Fri,  6 Sep 2019 10:50:10 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id A1BD93C005E;
        Fri,  6 Sep 2019 10:50:09 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 6 Sep 2019
 10:50:09 +0200
Date:   Fri, 6 Sep 2019 10:50:06 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Message-ID: <20190906085006.GA13214@vmlxhi-102.adit-jv.com>
References: <1567675074-3331-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB45449D299241B52077101C85D8BB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190905190705.GA4062@vmlxhi-102.adit-jv.com>
 <TYAPR01MB4544B6F543B4678FAF95C2E7D8BA0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB4544B6F543B4678FAF95C2E7D8BA0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Sep 06, 2019 at 04:41:50AM +0000, Yoshihiro Shimoda wrote:
> Hello Eugeniu-san,
> 
> > From: Eugeniu Rosca, Sent: Friday, September 6, 2019 4:07 AM
> <snip>
> > 
> > I guess there are strong similarities between this patch and [3].
> > Would you like to pick [1-3], as they still apply cleanly to vanilla?
> 
> Thank you for your comment! I completely forgot that you had submitted
> these [1-3] patches though, I'm thinking renesas_usbhs driver also should
> have this similar feature. I checked the [3] again and the commit log
> and the conditions should be fixed like this patch. Would you submit
> v2 patch series for renesas_usbhs driver? Or, May I submit it?
> Anything is OK to me.

Thank your for the prompt reply. It is very appreciated.
We'll make sure to submit the v2 of [1-3], as per your request.

> 
> > [1] https://patchwork.kernel.org/patch/10581479/
> >     ("[1/3] usb: renesas_usbhs: simplify usbhs_status_get_device_state()")
> > [2] https://patchwork.kernel.org/patch/10581485/
> >     ("[2/3] usb: renesas_usbhs: enable DVSE interrupt")
> > [3] https://patchwork.kernel.org/patch/10581489/
> >     ("usb: renesas_usbhs: add suspend event support in gadget mode")

-- 
Best Regards,
Eugeniu.
