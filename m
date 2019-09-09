Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35D02ADC96
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388386AbfIIQBk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 12:01:40 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:58049 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730077AbfIIQBk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 12:01:40 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 211583C04C0;
        Mon,  9 Sep 2019 18:01:38 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VqnC2O6doSsy; Mon,  9 Sep 2019 18:01:31 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E52A83C0016;
        Mon,  9 Sep 2019 18:01:31 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 9 Sep 2019
 18:01:31 +0200
Date:   Mon, 9 Sep 2019 18:01:28 +0200
From:   veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: enable DVSE interrupt
Message-ID: <20190909160128.GA1389@vmlxhi-070.adit-jv.com>
References: <1567771431-13235-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <20190909130525.GA19423@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190909130525.GA19423@vmlxhi-102.adit-jv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Eugeniu,

Thanks for pointing out.

On Mon, Sep 09, 2019 at 03:05:25PM +0200, Eugeniu Rosca wrote:
> Hi Veeraiyan,
> 
> On Fri, Sep 06, 2019 at 02:03:49PM +0200, Veeraiyan Chidambaram wrote:
> > From: Eugeniu Rosca <erosca@de.adit-jv.com>
> > 
> It looks like this series changes the patch order of v1.
> Could you kindly stick to the original order? Many thanks.

i have restored the patch order as of v1.

Best Regards,
Veeraiyan chidambaram
> -- 
> Best Regards,
> Eugeniu.
