Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 893BBA4337
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 10:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfHaIBH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Aug 2019 04:01:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48380 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfHaIBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Aug 2019 04:01:07 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1289E25AD78;
        Sat, 31 Aug 2019 18:01:05 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E7924E218F0; Sat, 31 Aug 2019 10:01:02 +0200 (CEST)
Date:   Sat, 31 Aug 2019 10:01:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Michael Dege <michael.dege@renesas.com>,
        Andrew_Gabbasov@mentor.com,
        "George G. Davis" <george_davis@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add
 Renesas M3-W+ (M3 ES3.0) SoC support
Message-ID: <20190831080102.sudig7zyadiqdlst@verge.net.au>
References: <20190821124441.22319-1-erosca@de.adit-jv.com>
 <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdObHAesUvF1BLwnEFJ6dsdpwM2yPRdUFW4D1Rp6d-tQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 04:18:09PM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> Thanks for bringing this up!
> 
> On Wed, Aug 21, 2019 at 2:45 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> > Similar to the revision update from H3-ES1.x to H3-ES2.0, the update
> > from M3-ES1.x to M3-ES3.0, in addition to fixing HW bugs/erratas, drops
> > entire silicon IPs [1-2] (for cost efficiency and other reasons).
> >
> > However, unlike in the H3 ES1.x->ES2.0 revision update, the M3-ES3.0
> > came with a new SoC id, i.e. r8a77961 (according to both [2] and
> 
> Actually R-Car H3 ES2.0 is r8a77951, while ES1.x is r8a77950.
> But we ignored the fifth digit (see below).
> 
> > the updated SoC HW manual Rev.2.00 Jul 2019). The choice to allocate a
> > new identifier seems to strengthen the HW differences between M3-ES1.x
> > and M3-ES3.0 (as it is the case for M3N/r8a77965).
> 
> While H3 ES2.0 was an evolutionary step, obsoleting H3 ES1.x, it looks
> like M3-W and M3-W+ may exist as two separate products, next to each
> other.
> 
> > Given the above, there are several ways to differentiate between
> > M3-ES1.x and M3-ES3.0:
> >
> > A. The BSP way [1]. Move/rename r8a7796.dtsi to r8a7796-es1.dtsi and
> > keep using r8a7796.dtsi for M3-ES3.x.
> >
> > Pros:
> >  * Resembles commit 291e0c4994d081 ("arm64: dts: r8a7795: Add support
> >    for R-Car H3 ES2.0")
> >  * Reuses the r8a7796 (e.g. sysc, cpg-mssr) drivers for r8a77961 (i.e.
> >    minimizes the bring-up effort)
> > Cons:
> >  * Deliberately diverges from the vendor documentation [2] by
> >    ignoring the new SoC identifier r8a77961, i.e. leading to
> >    inconsistencies in the names of the drivers and DTS
> >
> > B. The approach taken in this patch, i.e. create a brand new
> >   r8a77961.dtsi (similar to r8a77965.dtsi).
> >
> > Pros:
> >  * Reflects the reality documented by HW designers [2]
> >  * Maintains drivers/DTS naming consistency and avoids mismatch between
> >    documentation and code
> > Cons:
> >  * higher bring-up effort than (A)
> >  * more discussion is needed on whether it makes sense to separate:
> >    - DTS only
> >    - DTS + Kconfig (ARCH_R8A77961)
> >    - DTS + Kconfig (ARCH_R8A77961) + drivers (sysc, cpg-mssr, other?)
> >
> > Comments appreciated!
> 
> When we started work on H3 ES2.0, it was considered an evolutionary step
> from ES1.x, not a different SoC.  We also were used to 4-digit IDs in
> compatible values, as before the 5th digit was typically used to
> indicate a minor difference, like a different package, or a different
> ROM option.  Hence we ignored the 5th digit, reused the compatible
> values for H3 ES1.x, and went with soc_device_match() to differentiate,
> where needed.
> 
> However, it turned out H3 ES2.0 was more like a different SoC in the
> same family: it has more similarities with R-Car M3-W ES1.0 than with
> R-Car H3 ES1.x.  In the mean time, with the advent of R-Car D3 and M3-N,
> we also got used to 5 digits.  Hence in hindsight, it might have been
> better if we had considered H3 ES1.x and ES2.0 to be two different
> SoCs.
> 
> Given R-Car M3-W and M3-W+ may co-exist as separate SoCs, I think
> approach B is the best approach, using separate DTS, compatible values,
> Kconfig, and drivers, like we did for e.g. R-Car M3-N.
> 
> What do you think?
> Thanks!

+1

Your recollection of the decisions made around H3 and 4/5 digit identifiers
matches mine. And I agree that in hindsight we may have been better to use
a 5 digit identifier for H3 ES2.0.  So I think it would be a good idea to
learn from this and use a 5 digit identifier for M3-W+. We can always
register unused identifiers if the need arises.

For may the main drawback of this approach is that it is inconsistent
with the one we took for H3, which may lead to confusion. But I think
that we are better off to favour evolution over reuse in this case.
Or in other words, it seems like a good opportunity to learn from
our mistakes.

