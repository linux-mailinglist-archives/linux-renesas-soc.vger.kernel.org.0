Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D003FC577
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 12:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfKNLh6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 06:37:58 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:55076 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNLh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 06:37:57 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id C1A7A3C04C0;
        Thu, 14 Nov 2019 12:37:53 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kfw6ztwQwdUg; Thu, 14 Nov 2019 12:37:48 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 367E73C009C;
        Thu, 14 Nov 2019 12:37:48 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 14 Nov
 2019 12:37:47 +0100
Date:   Thu, 14 Nov 2019 12:37:43 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     Wolfram Sang <wsa@the-dreams.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP_ERASE to
 Gen3 SoCs
Message-ID: <20191114113743.GA19656@vmlxhi-102.adit-jv.com>
References: <20191112134808.23546-1-erosca@de.adit-jv.com>
 <20191112204952.GA2976@kunai>
 <CAPDyKFq8oVk26ruNA_R8HDXhMGKhDeHnL0q82xi40g1aeo109A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPDyKFq8oVk26ruNA_R8HDXhMGKhDeHnL0q82xi40g1aeo109A@mail.gmail.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi everyone,

On Thu, Nov 14, 2019 at 11:56:23AM +0100, Ulf Hansson wrote:
> On Tue, 12 Nov 2019 at 21:49, Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> > On Tue, Nov 12, 2019 at 02:48:08PM +0100, Eugeniu Rosca wrote:
> > > From: Harish Jenny K N <harish_kandiga@mentor.com>
> > >
> > > Enable MMC_CAP_ERASE capability in the driver to allow
> > > erase/discard/trim requests.
> > >
> > > Suggested-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> > > Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> > > [erosca: Forward-port and test on v5.4-rc7 using H3ULCB-KF:
> > >          "blkdiscard /dev/mmcblk0" passes with this patch applied
> > >          and complains otherwise:
> > >        "BLKDISCARD ioctl failed: Operation not supported"]
> > > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> >
> > Looks good to me. Just a generic question, probably more for Ulf:
> >
> > Why does this CAP_ERASE exist? As I understand, the driver only needs to
> > set the flag and no further handling is required. Why would a driver not
> > set this flag and not support erase/trim commands?
> 
> I am working on removing the cap, altogether. Step by step, this is
> getting closer now.
> 
> The main problem has been about busy detect timeouts, as an erase
> command may have a very long busy timeout. On the host side, they
> typically need to respect the cmd->busy_timeout for the request, and
> if it can't because of some HW limitation, it needs to set
> mmc->max_busy_timeout.

FWIW we've discussed such concerns internally, based on past commits
which either disable [1-2] busy timeouts or increase their value [3].

To get a feeling if this is relevant for R-Car3, I've run blkdiscard on
a 64 GiB eMMC without noticing any issues on v5.4-rc7. Hopefully this
is sufficient as testing?

> 
> Once that is fixed for all, we can drop CAP_ERASE.
> 
> Kind regards
> Uffe

[1] 93caf8e69eac76 ("omap_hsmmc: add erase capability")
[2] b13d1f0f9ad64b ("mmc: omap: Add erase capability")
[3] ec30f11e821f2d ("mmc: rtsx_usb: Use the provided busy timeout from the mmc core")

-- 
Best Regards,
Eugeniu
