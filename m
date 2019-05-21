Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1581255C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 18:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfEUQjN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 12:39:13 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35130 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfEUQjN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 12:39:13 -0400
Received: by mail-vs1-f67.google.com with SMTP id q13so11537973vso.2;
        Tue, 21 May 2019 09:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3r+vtHOni2ql6K8KUyHYDwXA6dbsBBCMW+a9jJjXY0=;
        b=ptSGQht4/1Z682C+yPxpLx8zmsnzKrrvEctI3mcXgdYD5nxhJ3QzrJfKHBGlZlNGQw
         Kq3u596/OJ1U3gXi50oj4mBNLD0X5CJbDyj5WpUIE9bo/mCNICw7oBjr+wejRs7abfhv
         KLp8TZzGOP8k7czbRIRZkCfRRms1phJe9jN9OH9yjKlbKAeiJMZsOhK+Bh76zdYNxNr+
         XwlgnHrFo8DxRzPveBpf9FHO83WY/pVIb7Aw5j7Avszp71P6HtPfjwBE7U9hNChjlVDQ
         y0dZ/o2WeCf/Dm1TY1h3mr5pApM99jobAu3trlhOAXEs481+V6Vu0v6LYSTe0nE4ilCa
         2FFA==
X-Gm-Message-State: APjAAAVy0ZYDzHKUrB3yR+8AFbHeJ2sQ2lbDoyYN7rafdU/9o2r93GsF
        2s162tCYlKoYRmSN/WVEaOj598kS9QwiykJzviQFhbAq
X-Google-Smtp-Source: APXvYqwCQIckTpeBswbXwCcMWkbVVy9WAUMEJsw8Zbz08S2CXrenseFMa2ivFFBrrmH68j06jfFotolazbcgC2VSxME=
X-Received: by 2002:a67:f589:: with SMTP id i9mr9021336vso.152.1558456752226;
 Tue, 21 May 2019 09:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-c4741b23059794bd99beef0f700103b0d983b3fd@kernel.org>
In-Reply-To: <git-mailbomb-linux-master-c4741b23059794bd99beef0f700103b0d983b3fd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 May 2019 18:39:00 +0200
Message-ID: <CAMuHMdWSUMOh1uG1g+cipup86ZpiVYuHDpPJtp+gSmmUyjB6eA@mail.gmail.com>
Subject: Re: crypto: run initcalls for generic implementations earlier
To:     Eric Biggers <ebiggers@google.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eric,

On Tue, May 7, 2019 at 5:26 AM Linux Kernel Mailing List
<linux-kernel@vger.kernel.org> wrote:
> Commit:     c4741b23059794bd99beef0f700103b0d983b3fd
> Parent:     40153b10d91c9e25f912344ba6ce1f0874400659
> Refname:    refs/heads/master
> Web:        https://git.kernel.org/torvalds/c/c4741b23059794bd99beef0f700103b0d983b3fd
> Author:     Eric Biggers <ebiggers@google.com>
> AuthorDate: Thu Apr 11 21:57:42 2019 -0700
> Committer:  Herbert Xu <herbert@gondor.apana.org.au>
> CommitDate: Thu Apr 18 22:15:03 2019 +0800
>
>     crypto: run initcalls for generic implementations earlier
>
>     Use subsys_initcall for registration of all templates and generic
>     algorithm implementations, rather than module_init.  Then change
>     cryptomgr to use arch_initcall, to place it before the subsys_initcalls.
>
>     This is needed so that when both a generic and optimized implementation
>     of an algorithm are built into the kernel (not loadable modules), the
>     generic implementation is registered before the optimized one.
>     Otherwise, the self-tests for the optimized implementation are unable to
>     allocate the generic implementation for the new comparison fuzz tests.
>
>     Note that on arm, a side effect of this change is that self-tests for
>     generic implementations may run before the unaligned access handler has
>     been installed.  So, unaligned accesses will crash the kernel.  This is
>     arguably a good thing as it makes it easier to detect that type of bug.
>
>     Signed-off-by: Eric Biggers <ebiggers@google.com>
>     Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

> --- a/crypto/jitterentropy-kcapi.c
> +++ b/crypto/jitterentropy-kcapi.c
> @@ -198,7 +198,7 @@ static void __exit jent_mod_exit(void)
>         crypto_unregister_rng(&jent_alg);
>  }
>
> -module_init(jent_mod_init);
> +subsys_initcall(jent_mod_init);
>  module_exit(jent_mod_exit);
>
>  MODULE_LICENSE("Dual BSD/GPL");

This change causes jitterentropy to fail on Renesas SoCs based on
single-core Cortex A9 with:

    jitterentropy: Initialization failed with host not compliant with
requirements: 2

This happens because jitterentropy is now initialized before the main
clocksource is activated, i.e. before

    clocksource: Switched to clocksource ostm timer (on RZ/A1)
    clocksource: Switched to clocksource fff80000.timer (on R-Mobile A1)

is printed.
RZ/A1 and R-Mobile A1 SoCs rely on the OSTM resp. TMU timers.

The issue does not happen on SoCs with Cortex A15 cores (with ARM
architectured timer) or Cortex A9 multicore (with ARM global timer).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
