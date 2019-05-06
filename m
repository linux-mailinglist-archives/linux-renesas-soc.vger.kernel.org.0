Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2A51480E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 May 2019 12:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFKCy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 06:02:54 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39622 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfEFKCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 06:02:54 -0400
Received: by mail-ua1-f65.google.com with SMTP id v7so2131917ual.6;
        Mon, 06 May 2019 03:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9NwW6JuaCHRbk9iHlaDnZmYNT9j+qr4OHyLgmonq1CA=;
        b=ReHcnQ/oRloUAIJYAZkUX4XzVk33uDyaf/VrZzYyvPN57Sfsofi/dMSDLr1mjAwmkx
         1FBtLX6YDrx9CVCz1qxJkQwqeJH37EgD20Pe1gHLO7ybe/hzSFO6A69GrcNAWR4S7mgy
         sWACiZ98et/1LRP5X0aRiSh976tiyVHITNZ0KxK+FF5JDkASgxbJUv6oZT81v44qk+7U
         FCS1grbVQ8IC/ogDqX2W7UiY+QVgp6I4AqEx+apuss0iOSJUqnCU2+r8IOtI9OGFy+yx
         rLHA0aVSwZRcO0lcIxIUp/V8esnQd1tpgrcODVfstzCbZXES4uBOIB9CaxiwtqcYvHzz
         fRyQ==
X-Gm-Message-State: APjAAAVJnJTHjXa26U2Tsmc4PSyuSc9ZNyWaRSh0UXZsN+gAuA1kiG8l
        R6BSvXeWRqd4AFd8XGDJMQvMVPa2OoFW3ob1dVg=
X-Google-Smtp-Source: APXvYqxk8z6V0eseA0bkbJ6PN020DcYv39FKIEIUOAix6BDdYJy+oQyhqSZ/ddanAGl+CLZR8FMgIFqRH0yLvnsftFw=
X-Received: by 2002:a9f:352a:: with SMTP id o39mr12388154uao.78.1557136972908;
 Mon, 06 May 2019 03:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190504004258.23574-1-erosca@de.adit-jv.com> <20190504004258.23574-3-erosca@de.adit-jv.com>
In-Reply-To: <20190504004258.23574-3-erosca@de.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 May 2019 12:02:41 +0200
Message-ID: <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
Subject: Re: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"
To:     Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
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
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Michael Rodin <mrodin@de.adit-jv.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

Thanks for your report!

On Sat, May 4, 2019 at 2:45 AM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> This reverts commit 97f26702bc95b5c3a72671d5c6675e4d6ee0a2f4.
>
> Here is the story behind this revert.
>
> Mainline commit [0] landed in the stable tree as commit [1], from where
> it reached us in the form of regular stable update. After that, Michael
> started to report occasional (30-50%) freezes of serial console on
> booting M3-ES1.1-Salvator-XS. Same happened on M3-ES1.1-Salvator-X.
>
> Every time the issue occurs, the serial console outputs below [2]
> before becoming totally unresponsive and printing nothing else:
>   rcar-dmac e7300000.dma-controller: Channel Address Error
>
> Git bisecting shows that the problem is contributed by commits [0-1].
>
> While we can't be 100% certain (since we don't have the SCIF design docs
> revealing its internal implementation detail) we think there is plenty
> of evidence to assume that DMA is not supported on SCIF2, hence should
> stay disabled on this specific channel:
>
>  - Excerpt from Chapter 17. Direct Memory Access Controller for System
>    (SYS-DMAC) of R19UH0105EJ0150 Rev.1.50:
>    ---------8<---------
>    [H3, H3-N, M3-W, V3M, V3H, D3, M3-N, E3]
>    The following modules can issue on-chip peripheral module requests.
>    [..] HSCIF0/1/2/3/4, [..] SCIF0/1/3/4/5,
>    ---------8<---------
>
>  - Excerpt from RENESAS_RCH3M3M3NE3_SCIF_UME_v2.00.pdf (Yocto v3.15.0):
>    ---------8<---------
>    DMA Transfer:
>    - Support: SCIF0, SCIF1, SCIF3, SCIF4, SCIF5
>    - Not support: SCIF2
>    ---------8<---------

>  - Disabled SCIF2 DMA in official Renesas v4.9/v4.14 kernels, e.g. see:
>    https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=e79c418fda8c

Table 17.5 ("Selecting On-Chip Peripheral Module Request Modes") of
"R-Car Series, 3rd Generation User’s Manual: Hardware" gained entries
for SCIF2 in Revision 1.50 of the document, but it seems 17.1.1
("Features") and Table 17.6 ("Data Length of DMA Transfer for Each of
the On-Chip Peripheral Modules") were forgotten to be updated.
The addition of the entry for SCIF2 is also mentioned in "Renesas
Technical Update  TN-RCT-S019A/E / R-Car M3-W Additional Explanation for
Direct Memory Access Controller for System (SYS-DMAC)".
Unfortunately both documents report wrong MID/RID values, due to a
hexadecimal vs. decimal mistake, which were corrected in the Feb 12
errata for Rev. 1.50.

So in my understanding, and according to my testing, DMA has always
worked for SCIF2 on (at least) R-Car H3 ES1.0/2.0, M3-W, and M3-N.
However, early firmware versions (before IPL and Secure Monitor
Rev1.0.6, released on Feb 25, 2016) prohibited the use of SYS-DMAC2,
cfr. commit eb21089c32054ecd ("arm64: dts: renesas: r8a7795: Add missing
SYS-DMAC2 dmas").

Perhaps some firmware versions may impose additional restrictions?

> Based on the issues generated by [0-1] (reproduced on H3, M3 and M3N)
> and the doc statements presented above, we think it makes sense to
> disable DMA on SCIF2 for most/all R-Car3 SoCs.
>
> [0] v5.0-rc6 commit 97f26702bc95b5 ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> [1] v4.14.106 commit 703db5d1b1759f ("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2")
> [2] scif (DEBUG) and rcar-dmac logs:
>     https://gist.github.com/erosca/132cce76a619724a9e4fa61d1db88c66

I have checked my kernel logs, and found a few instances of "Channel
Address Error".  In all cases, I had enabled/added extra debug prints in
the sh-sci driver, which may have had impact.
Last occurrence was in a kernel based on v4.18-rc2, which predates
several recent fixes for the sh-sci and rcar-dmac drivers.
Can the issue be reproduced on current mainline?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
