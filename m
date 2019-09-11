Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32F45AFDA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 15:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbfIKNXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 09:23:04 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:43273 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfIKNXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 09:23:04 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 050853C04C0;
        Wed, 11 Sep 2019 15:23:02 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PbvkNzfcUyt1; Wed, 11 Sep 2019 15:22:56 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 8D3003C0016;
        Wed, 11 Sep 2019 15:22:56 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 11 Sep
 2019 15:22:56 +0200
Date:   Wed, 11 Sep 2019 15:22:52 +0200
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
Message-ID: <20190911132252.GA22580@vmlxhi-070.adit-jv.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568043974-1236-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <TYAPR01MB4544C419E30F3D3033086088D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190910093117.GB9960@vmlxhi-070.adit-jv.com>
 <TYAPR01MB45447960B4D77CB0C01B08BBD8B10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB45447960B4D77CB0C01B08BBD8B10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello shimoda-san,

Thanks a lot for those hints.
On Wed, Sep 11, 2019 at 02:45:52AM +0000, Yoshihiro Shimoda wrote:
> Hello Veeraiyan-san,
> 
> > From: veeraiyan chidambaram, Sent: Tuesday, September 10, 2019 6:31 PM
> > 
> > Hello shimoda-san,
> > 
> > Thanks for point out checkpatch warning. After resolving checkpatch warning,
> > below  checkpatch warning is seen.
> > 
> > WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> > #23:
> > [1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> 
> I checked other commit log, and it seems adding a new line is better like below:
> 
> [1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common
>     code")

I have fixed and submitted v5 patch https://patchwork.kernel.org/patch/11141085/.

Best Regards,
Veeraiyan Chidambaram
