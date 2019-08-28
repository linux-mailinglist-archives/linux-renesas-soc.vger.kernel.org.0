Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5967A082D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 19:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfH1RKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 13:10:02 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56266 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfH1RKC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 13:10:02 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 1D1A83C04C0;
        Wed, 28 Aug 2019 19:09:59 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wFRQm0T6AO6a; Wed, 28 Aug 2019 19:09:52 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id E689D3C0579;
        Wed, 28 Aug 2019 19:09:52 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 28 Aug
 2019 19:09:52 +0200
Date:   Wed, 28 Aug 2019 19:09:49 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Michael Dege <michael.dege@renesas.com>,
        <Andrew_Gabbasov@mentor.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add
 Renesas M3-W+ (M3 ES3.0) SoC support
Message-ID: <20190828170949.GA30469@vmlxhi-102.adit-jv.com>
References: <20190821124441.22319-1-erosca@de.adit-jv.com>
 <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for taking some time to reflect retrospectively on the bring-up
experiences from the past and to summarize the lessons learned.

On Fri, Aug 23, 2019 at 04:18:09PM +0200, Geert Uytterhoeven wrote:
[..]
> Actually R-Car H3 ES2.0 is r8a77951, while ES1.x is r8a77950.

That's a great detail which I missed. I confirm below:
 - SoC HW manual "Rev.1.00 Apr 2018" maps R8A77951 to H3 ver2.0
 - SoC HW manuals "Rev.1.50 Nov 2018" and "Rev.2.00 Jul 2019" map
   R8A77951 to H3 ver3.0
 - Older Renesas docs refer to the earlier H3 ES1.x SoC as R8A77950

So, on the one hand, there _is_ a 'part number' update from H3 ver1 to
rev2 and, on the other hand, there is no part number update from ver2 to
ver3. My understanding of the latter (as a side note) is that there are
no added/dropped HW features in ver3, hence the same 'part number'.

[..]

> When we started work on H3 ES2.0, it was considered an evolutionary step
> from ES1.x, not a different SoC.  We also were used to 4-digit IDs in
> compatible values, as before the 5th digit was typically used to
> indicate a minor difference, like a different package, or a different
> ROM option.  Hence we ignored the 5th digit, reused the compatible
> values for H3 ES1.x, and went with soc_device_match() to differentiate,
> where needed.

Honestly, this still sounds sensible and intuitive, assuming the delta
between the SoC models (differing in the 5th digit) is relatively low
(not sure how to quantify it though and where the threshold is).

One of the concerns related to soc_device_match() is that it sometimes
doesn't play nicely with spinlocks, generating lockdep splats [1].

> However, it turned out H3 ES2.0 was more like a different SoC in the
> same family: it has more similarities with R-Car M3-W ES1.0 than with
> R-Car H3 ES1.x. 
>
> In the mean time, with the advent of R-Car D3 and M3-N,
> we also got used to 5 digits.  Hence in hindsight, it might have been
> better if we had considered H3 ES1.x and ES2.0 to be two different
> SoCs.

Thinking of the way H3-ES1.x support was added, now that H3-ES1.x is
declared obsolete, we could probably reduce the image size by
some tens of KiB (more?) by simply disabling CONFIG_ARCH_R8A77950 if
its support was implemented as standalone CONFIG_ARCH? We now have to
compile and link the H3-ES1.x functionality even if nobody needs it,
which is a bit unfortunate.

> 
> Given R-Car M3-W and M3-W+ may co-exist as separate SoCs, I think
> approach B is the best approach, using separate DTS, compatible values,
> Kconfig, and drivers, like we did for e.g. R-Car M3-N.
> 
> What do you think?

I still think B is the best option in terms of transparency (clear
mapping between documentation and code), but I try to reconcile below
recent concerns (any support appreciated):

 - After reviewing the "Engineering Change Notice for R8A77961", it
   seems to me that the number of differences between R8A77960 and
   R8A77961 is really low (much much lower than in the case of
   R8A77950->R8A77951 transition). Most (if not all) of the IP blocks
   present in R8A77960 and removed in R8A77961 [2] (i.e. fcpci0, fcpcs,
   ivdp1c, vdpb) are not even supported in vanilla.
 - I guess with this low amount of differences, R8A77961 will be an
   almost perfect twin of R8A77960. If so, then is the additional
   maintenance effort (resulting after bring-up) still justified?
 - Duplicating 'drivers/pinctrl/sh-pfc/pfc-r8a7796.c' (as it was done
   for M3-N, with 99% similarity in the contents) will increase the
   image size by roughly 50KiB [3]. Additional (albeit less significant)
   size increase is expected from the addition of other SoC-specific
   drivers.
 - [Minor] According to your feedback and to the best of our knowledge,
   both M3-W and M3-W+ are expected to reach the end user, which might
   create less motivation to really separate the two SoCs via CONFIG.

What do you think about the above?
Thanks!

[1] lockdep splats generated by soc_device_match()
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba164a49f8f739
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=8037f4932ec5
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=08cd9d10caff
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=34d3b527b70c
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=918f22c7b2ae
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=196d1399ffa8
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=5ed4a312252e
[2] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=8ba438fd03d5
[3] $ size drivers/pinctrl/sh-pfc/pfc-r8a7796*.o
   text        data     bss     dec     hex filename
  51660       0       0   51660    c9cc drivers/pinctrl/sh-pfc/pfc-r8a77965.o
  51628       0       0   51628    c9ac drivers/pinctrl/sh-pfc/pfc-r8a7796.o

-- 
Best Regards,
Eugeniu.
