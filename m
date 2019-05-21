Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930DF2579B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 20:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfEUSeV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 14:34:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbfEUSeV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 14:34:21 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE3E62173E;
        Tue, 21 May 2019 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558463660;
        bh=TS+Myr7yTT1qT00ODngyVPlLPpDgzJtrP5FUpXyLIEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qlKEBLZMfmLyAMNkN9oCsU/Wup5zhTA9zasTLh40i5Zyp8qlqlklHK/+m2/KGngOA
         pixi4WTFD9n5AjTcIiG1TLcRJkcI8p+yapxLMdOLxC1pPHv+UveLyUuFDmm2loPgD6
         2kTmneGIO6MOBoGzSbrjqVpWxH879GcvzelQ5xMI=
Date:   Tue, 21 May 2019 11:34:18 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: crypto: run initcalls for generic implementations earlier
Message-ID: <20190521183417.GA121164@gmail.com>
References: <git-mailbomb-linux-master-c4741b23059794bd99beef0f700103b0d983b3fd@kernel.org>
 <CAMuHMdWSUMOh1uG1g+cipup86ZpiVYuHDpPJtp+gSmmUyjB6eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSUMOh1uG1g+cipup86ZpiVYuHDpPJtp+gSmmUyjB6eA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 21, 2019 at 06:39:00PM +0200, Geert Uytterhoeven wrote:
> Hi Eric,
> 
> On Tue, May 7, 2019 at 5:26 AM Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org> wrote:
> > Commit:     c4741b23059794bd99beef0f700103b0d983b3fd
> > Parent:     40153b10d91c9e25f912344ba6ce1f0874400659
> > Refname:    refs/heads/master
> > Web:        https://git.kernel.org/torvalds/c/c4741b23059794bd99beef0f700103b0d983b3fd
> > Author:     Eric Biggers <ebiggers@google.com>
> > AuthorDate: Thu Apr 11 21:57:42 2019 -0700
> > Committer:  Herbert Xu <herbert@gondor.apana.org.au>
> > CommitDate: Thu Apr 18 22:15:03 2019 +0800
> >
> >     crypto: run initcalls for generic implementations earlier
> >
> >     Use subsys_initcall for registration of all templates and generic
> >     algorithm implementations, rather than module_init.  Then change
> >     cryptomgr to use arch_initcall, to place it before the subsys_initcalls.
> >
> >     This is needed so that when both a generic and optimized implementation
> >     of an algorithm are built into the kernel (not loadable modules), the
> >     generic implementation is registered before the optimized one.
> >     Otherwise, the self-tests for the optimized implementation are unable to
> >     allocate the generic implementation for the new comparison fuzz tests.
> >
> >     Note that on arm, a side effect of this change is that self-tests for
> >     generic implementations may run before the unaligned access handler has
> >     been installed.  So, unaligned accesses will crash the kernel.  This is
> >     arguably a good thing as it makes it easier to detect that type of bug.
> >
> >     Signed-off-by: Eric Biggers <ebiggers@google.com>
> >     Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> > --- a/crypto/jitterentropy-kcapi.c
> > +++ b/crypto/jitterentropy-kcapi.c
> > @@ -198,7 +198,7 @@ static void __exit jent_mod_exit(void)
> >         crypto_unregister_rng(&jent_alg);
> >  }
> >
> > -module_init(jent_mod_init);
> > +subsys_initcall(jent_mod_init);
> >  module_exit(jent_mod_exit);
> >
> >  MODULE_LICENSE("Dual BSD/GPL");
> 
> This change causes jitterentropy to fail on Renesas SoCs based on
> single-core Cortex A9 with:
> 
>     jitterentropy: Initialization failed with host not compliant with
> requirements: 2
> 
> This happens because jitterentropy is now initialized before the main
> clocksource is activated, i.e. before
> 
>     clocksource: Switched to clocksource ostm timer (on RZ/A1)
>     clocksource: Switched to clocksource fff80000.timer (on R-Mobile A1)
> 
> is printed.
> RZ/A1 and R-Mobile A1 SoCs rely on the OSTM resp. TMU timers.
> 
> The issue does not happen on SoCs with Cortex A15 cores (with ARM
> architectured timer) or Cortex A9 multicore (with ARM global timer).
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

Thanks for the bug report.  It seems there was no point for my patch to change
jitterentropy_rng, since it's not a generic crypto algorithm that has multiple
implementations, nor is it testable by the crypto self-tests.  So I'll send a
patch that changes it back to module_init().

- Eric
