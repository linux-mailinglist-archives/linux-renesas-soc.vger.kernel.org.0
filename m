Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6688E25CB80
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 22:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgICUtk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 16:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbgICUth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 16:49:37 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF01C061244
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2020 13:49:37 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e11so5400393ljn.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2020 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aZHlqxn/Fnph8PVm4RSvr0q++hV2RuznG8DX9vFEqs=;
        b=yPRZLPXMXKKOzlOJcVwh88bMkYG3qMzfe3OvwL0DEcZiyMrreygS1OhHzrc0EdinUx
         n9TK9SBzzxtRqJZ5ZQ/zdNFjHo1AmNQCgLOhjsqz1w7/mm5vxtUUw3X5jcdHgtxRCjYu
         IYTcMIhebodhkcmMEcNI+pSdP3qnPtqUvuX139t9hh+w0tCEmsMV39D87BjqmuMIocE1
         NbKXlpdXC7tB7DuVVlWuE5r3vvqzN9+qhcYn7YumgRnh+tD4dz/uo+clYAFL0bi+tl6q
         TPMwMuK3DePvOYaYoAxPUeplFVxPypg5BF6oj+iyY7gsSeRib5hbL9MuppxlRsSxK7fd
         pyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aZHlqxn/Fnph8PVm4RSvr0q++hV2RuznG8DX9vFEqs=;
        b=baGsFSPOeCOcvW2H5892jgRpPsxUHasdmafMWUoE5q4q0En428+KDZgT+cD4DyvbQf
         1HCHmNLO+DEOdjJRm9Gv4JmVW7rbLzVwqUc0vhxevMAGnKUJAWUNnYMgTPn01YwLiJ5F
         fiBYPK1/c49h1WpfNVhaPJJTAgWjFpQi3jEDkrsc2W+0itjdgGTa4tNMIjV7rSYGRVWC
         vlFw/bRWfi+BZnlgjlbbUSJZzyFf+TO57RHgJeLYvXjDnPQ/S5nwmv0o8CkO1Caaw8us
         srj23VEeBvLox0hiNbil4oYGoukx+mCiSFABt5Rj9L127ZZSXPJJbq1PbEQDNqwwl0rJ
         Qh9w==
X-Gm-Message-State: AOAM533fcjRrxabNVuwWlyxiup+utEy7su1bQdaJbyvsS8CwZvkbL+LE
        rK2v/7/TVGrp/9AoGED8yZS/+EKd08FuWs+dYxMfaw==
X-Google-Smtp-Source: ABdhPJzwDmiGGLFYOuHNedurvo+SNBE5jxrjprwbs5FFGLhT+z2cU+Jw5Eyz844sZM+HO8nNdC290PucsxSdCFsw1Cs=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr2153576ljb.144.1599166175530;
 Thu, 03 Sep 2020 13:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be>
In-Reply-To: <20200902153606.13652-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Sep 2020 22:49:24 +0200
Message-ID: <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
Subject: Re: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

I am trying to understand this thing, it looks useful!

On Wed, Sep 2, 2020 at 5:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> @@ -254,8 +254,56 @@ not_angel:

This looks like it happens before CONFIG_ARM_ATAG_DTB_COMPAT
meaning it will not use the DTB that is augmented with ATAGs,
especially not ATAG_MEM (0x54410002) correct?

That seems sad, because that would actually be useful to me.

Can you see if it is possible to put this in after the ATAGs have
been merged into the DTB?

>  #ifdef CONFIG_AUTO_ZRELADDR
> +#ifdef CONFIG_USE_OF
>                 /*
> -                * Find the start of physical memory.  As we are executing
> +                * Find the start of physical memory.
> +                * Try the DTB first, if available.
> +                */
> +               adr     r0, LC1
> +               ldr     sp, [r0]        @ get stack location
> +               add     sp, sp, r0      @ apply relocation
> +
> +#ifdef CONFIG_ARM_APPENDED_DTB
> +               /*
> +                * Look for an appended DTB. If found, use it and
> +                * move stack away from it.
> +                */
> +               ldr     r6, [r0, #4]    @ get &_edata
> +               add     r6, r6, r0      @ relocate it
> +               ldmia   r6, {r0, r5}    @ get DTB signature and size
> +#ifndef __ARMEB__
> +               ldr     r1, =0xedfe0dd0 @ sig is 0xd00dfeed big endian
> +               /* convert DTB size to little endian */
> +               eor     r2, r5, r5, ror #16
> +               bic     r2, r2, #0x00ff0000
> +               mov     r5, r5, ror #8
> +               eor     r5, r5, r2, lsr #8
> +#else
> +               ldr     r1, =0xd00dfeed
> +#endif

We now have two and even three copies of this code,
sort of. Right above  CONFIG_ARM_ATAG_DTB_COMPAT
there is this:

#ifdef CONFIG_ARM_APPENDED_DTB
(...)
        ldr    lr, [r6, #0]
#ifndef __ARMEB__
        ldr    r1, =0xedfe0dd0        @ sig is 0xd00dfeed big endian
#else
        ldr    r1, =0xd00dfeed
#endif
        cmp    lr, r1
        bne    dtb_check_done        @ not found

Then inside CONFIG_ARM_ATAG_DTB_COMPAT:

        /* Get the initial DTB size */
        ldr    r5, [r6, #4]
#ifndef __ARMEB__
        /* convert to little endian */
        eor    r1, r5, r5, ror #16
        bic    r1, r1, #0x00ff0000
        mov    r5, r5, ror #8
        eor    r5, r5, r1, lsr #8
#endif

Then at the end after deciding to use the appended
device tree we get the DTB size *again* and moves
the sp beyond the DTB permanently as we do not
want to damage the DTB of course.

To me it looks like the DTB size gets added to sp
a second time? First it is bumped by your code,
then when the appended DTB is detected and
augmented further down, it gets bumped again
for no reason here:

/* relocate some pointers past the appended dtb */
add    r6, r6, r5
add    r10, r10, r5
add    sp, sp, r5
dtb_check_done:

I don't know if I'm right, I may be confused...

It would be better if we could avoid copy/paste and
merge the code in here so we first check if there is a
DTB, else there is not much to do, and if there is, we
get the size, move the sp and do both operations:

1. Check for ATAGs and augment the DTB
2. Check for memory size in the DTB

This way the ATAG-augmented DTB can be used
for checking for the memory start.

I understand that you need the physical address
before turning on the caches, so what I am thinking
is if it is possible to move the check for appended
DTB and ATAG augmentation business up before
the cache enablement in a separate patch and then
modify it from there. Then you could potentially
merge these two things.

Maybe there is something conceptually wrong with
this that I have overlooked... :/

Yours,
Linus Walleij
