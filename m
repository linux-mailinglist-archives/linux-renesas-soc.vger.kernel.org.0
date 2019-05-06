Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3A715488
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2019 21:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfEFTmt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 15:42:49 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:57799 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEFTms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 15:42:48 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id B52003C00C6;
        Mon,  6 May 2019 21:42:44 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id T_jqXnamrbWI; Mon,  6 May 2019 21:42:37 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 1C6823C004C;
        Mon,  6 May 2019 21:42:37 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 May 2019
 21:42:36 +0200
Date:   Mon, 6 May 2019 21:42:33 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for
 SCIF2"
Message-ID: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
 <20190504004258.23574-3-erosca@de.adit-jv.com>
 <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, May 06, 2019 at 12:02:41PM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> Thanks for your report!

Thanks for your feedback.

> 
> On Sat, May 4, 2019 at 2:45 AM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > This reverts commit 97f26702bc95b5c3a72671d5c6675e4d6ee0a2f4.
> >
> > Here is the story behind this revert.
> >
> > Mainline commit [0] landed in the stable tree as commit [1], from where
> > it reached us in the form of regular stable update. After that, Michael
> > started to report occasional (30-50%) freezes of serial console on
> > booting M3-ES1.1-Salvator-XS. Same happened on M3-ES1.1-Salvator-X.
> >
> > Every time the issue occurs, the serial console outputs below [2]
> > before becoming totally unresponsive and printing nothing else:
> >   rcar-dmac e7300000.dma-controller: Channel Address Error
> >
> > Git bisecting shows that the problem is contributed by commits [0-1].
> >
> > While we can't be 100% certain (since we don't have the SCIF design docs
> > revealing its internal implementation detail) we think there is plenty
> > of evidence to assume that DMA is not supported on SCIF2, hence should
> > stay disabled on this specific channel:
> >
> >  - Excerpt from Chapter 17. Direct Memory Access Controller for System
> >    (SYS-DMAC) of R19UH0105EJ0150 Rev.1.50:
> >    ---------8<---------
> >    [H3, H3-N, M3-W, V3M, V3H, D3, M3-N, E3]
> >    The following modules can issue on-chip peripheral module requests.
> >    [..] HSCIF0/1/2/3/4, [..] SCIF0/1/3/4/5,
> >    ---------8<---------
> >
> >  - Excerpt from RENESAS_RCH3M3M3NE3_SCIF_UME_v2.00.pdf (Yocto v3.15.0):
> >    ---------8<---------
> >    DMA Transfer:
> >    - Support: SCIF0, SCIF1, SCIF3, SCIF4, SCIF5
> >    - Not support: SCIF2
> >    ---------8<---------
> 
> >  - Disabled SCIF2 DMA in official Renesas v4.9/v4.14 kernels, e.g. see:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=e79c418fda8c
> 
> Table 17.5 ("Selecting On-Chip Peripheral Module Request Modes") of
> "R-Car Series, 3rd Generation User’s Manual: Hardware" gained entries
> for SCIF2 in Revision 1.50 of the document, but it seems 17.1.1
> ("Features") and Table 17.6 ("Data Length of DMA Transfer for Each of
> the On-Chip Peripheral Modules") were forgotten to be updated.
> The addition of the entry for SCIF2 is also mentioned in "Renesas
> Technical Update  TN-RCT-S019A/E / R-Car M3-W Additional Explanation for
> Direct Memory Access Controller for System (SYS-DMAC)".
> Unfortunately both documents report wrong MID/RID values, due to a
> hexadecimal vs. decimal mistake, which were corrected in the Feb 12
> errata for Rev. 1.50.

I do observe now that the most recent Rev. 1.50 of "R-Car Series, 3rd
Generation User’s Manual: Hardware" does update _some_ of its internal
chapters/tables to reflect the support of DMA on SCIF2. These SCIF2
changes look to be also tracked in the "Revision History" companion doc:

Rev  | Date         | Page     | Summary
1.50 | Nov 30, 2018 | 17-86-87 | Table 17.5 Selecting On-Chip Peripheral
                                 Module Request Modes: DMA Transfer
                                 Request Source, changed. SCIF2
                                 reception and SCIF2 transmission, added
                    | 17-91    | Table 17.6 Data Length of DMA Transfer
                                 for Each of the On-Chip Peripheral
                                 Modules: SCIF2, added

As you have already stated, it looks like certain chapters like
"17.1.1 Features" didn't receive a proper update, generating confusion.
I will report this in parallel to Renesas Duesseldorf.

> 
> So in my understanding, and according to my testing, DMA has always
> worked for SCIF2 on (at least) R-Car H3 ES1.0/2.0, M3-W, and M3-N.

Well, my testing shows different results. Using M3-W-ES1.1-Salvator-XS,
I can reproduce the issue since v4.17 (also reproduced on v4.18, v4.19
and v5.1 with cherry picking 97f26702bc95b5 ("arm64: dts: renesas:
r8a7796: Enable DMA for SCIF2") where appropriate).

> However, early firmware versions (before IPL and Secure Monitor
> Rev1.0.6, released on Feb 25, 2016) prohibited the use of SYS-DMAC2,
> cfr. commit eb21089c32054ecd ("arm64: dts: renesas: r8a7795: Add missing
> SYS-DMAC2 dmas").

I use a very recent Rev2.0.2 of
https://github.com/renesas-rcar/arm-trusted-firmware .

> 
> Perhaps some firmware versions may impose additional restrictions?

I would have some suspicions about ATF if the issue was consistent.
Since it is not, I believe there is a race going on in the kernel.

> 
> > Based on the issues generated by [0-1] (reproduced on H3, M3 and M3N)
> > and the doc statements presented above, we think it makes sense to
> > disable DMA on SCIF2 for most/all R-Car3 SoCs.
> >
> > [0] v5.0-rc6 commit 97f26702bc95b5 ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> > [1] v4.14.106 commit 703db5d1b1759f ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> > [2] scif (DEBUG) and rcar-dmac logs:
> >     https://gist.github.com/erosca/132cce76a619724a9e4fa61d1db88c66
> 
> I have checked my kernel logs, and found a few instances of "Channel
> Address Error".  In all cases, I had enabled/added extra debug prints in
> the sh-sci driver, which may have had impact.
> Last occurrence was in a kernel based on v4.18-rc2, which predates
> several recent fixes for the sh-sci and rcar-dmac drivers.
> Can the issue be reproduced on current mainline?

With pure vanilla sources, arm64 defconfig and DTS (+97f26702bc95b5
where appropriate), the issue is seen on M3-W-ES1.1-Salvator-XS since
v4.17. Can you please confirm you are seeing it too?

Enabling DEBUG in drivers/dma/sh/rcar-dmac.c, I can notice that one of
the symptoms is a NULL dst_addr revealed by:

rcar-dmac e7300000.dma-controller: chan0: queue chunk (____ptrval____): 0@0xffff800639eb8090 -> 0x0000000000000000

In working scenarios, dst_addr is never zero. Does it give any hints?

> 
> Thanks!

Likewise!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Best Regards,
Eugeniu.
