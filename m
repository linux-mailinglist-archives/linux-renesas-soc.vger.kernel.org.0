Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5646C2C42D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 16:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgKYP2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 10:28:13 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43192 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgKYP2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 10:28:13 -0500
Received: by mail-oi1-f194.google.com with SMTP id t143so3192264oif.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2020 07:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMYs/wDnIXPwoThKasq1IN9TC8G7JGT9yMlos8nWvwc=;
        b=tcdL4zQpqI1ts0Mm4ydQfMHjkbJvZEwuiIQYo5J5SzGI0ZyZuw14BwXokJL47U9ufS
         LSDozZTZ+cNxLJbs8MSrR7BEcWkOXp1DU/Rmv8XrJt9lvupquvCldX0qVbC622yYmQrd
         7/6QvXBeeGL3EslsolRRPeWUss8pN4AJr4iB5wtHoxgu+7DMTEKzB6T7nRIgw5STy16F
         iwieOLW1X/N9pwJST0c4dnGG+h+gEAB8P3DIcvhC5A9yB9UTeqIP2MFSmwqKRPhVMHfK
         53+MWC6+d9pfGjLJfbE/TxTGaEqa3gjW+9my90Cs47XrfmSWOENdbqbHYF6GRx5nHctK
         pk2g==
X-Gm-Message-State: AOAM532dlGam9q2xAj/5TnvhRxPxwxMImVUHsQEDZprEvMIBFbm8+na2
        EpzdVDzWyz+ZfP36nVgh7Vmf8lDbcixfx1Hm/9Q7ocU71w4=
X-Google-Smtp-Source: ABdhPJx2smTtTxCCfUm2LMLY+lV+XxxGt3i6q+Gt+648H4Yu12BsAt4G6lVAE3xFZjpyYZP+R2VZmM6kpUTShgxFqVU=
X-Received: by 2002:aca:c3c4:: with SMTP id t187mr2506113oif.148.1606318092381;
 Wed, 25 Nov 2020 07:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be> <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 16:28:00 +0100
Message-ID: <CAMuHMdXuuC3P=LOYG582FeFcrUGonu+Kh-TdG54k+61QGhBDEg@mail.gmail.com>
Subject: Re: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
To:     Linus Walleij <linus.walleij@linaro.org>
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
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

On Thu, Sep 3, 2020 at 10:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 2, 2020 at 5:36 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > @@ -254,8 +254,56 @@ not_angel:
>
> This looks like it happens before CONFIG_ARM_ATAG_DTB_COMPAT
> meaning it will not use the DTB that is augmented with ATAGs,
> especially not ATAG_MEM (0x54410002) correct?
>
> That seems sad, because that would actually be useful to me.
>
> Can you see if it is possible to put this in after the ATAGs have
> been merged into the DTB?

I made a deep dive into arch/arm/boot/compressed/head.S, to analyze all
possible combinations of the various options (your article [1] was a
great help, thanks for that!).  I considered all of the following:

  - Passed by bootloader in r2:
      [A] ATAGS,
      [B] DTB (with proper memory nodes),
      [C] Rubbish.

  - Optional appended DTB (CONFIG_ARM_APPENDED_DTB=y):
      [D] DTB (with proper memory nodes),
      [E] DTB (without memory nodes).
    Notes:
      - The appended DTB takes precedence over the DTB passed via r2
        (case [B])!
      - This is meant as a backward compatibility convenience for
        systems with a bootloader that can't be upgraded to accommodate
        the documented boot protocol using a device tree.

  - ATAGS to augment appended DTB (CONFIG_ARM_ATAG_DTB_COMPAT=y):
      [F] Passed via r2,
      [G] Stored at start of memory + 0x100.
    Notes:
      - [F] is tried first; it it fails, [H] is tried next,
      - This is meant as another backward compatibility convenience for
        systems with an old bootloader,

  - [H] The Kdump kernel is deliberately not stored in the first 128 MiB
    of RAM.

Of course not all combinations are possible/sensible.

Note that there exists another option (handover from EFI), which is not
relevant here, as it follows a different code path, and passes the image
base explicitly.

> It would be better if we could avoid copy/paste and
> merge the code in here so we first check if there is a
> DTB, else there is not much to do, and if there is, we
> get the size, move the sp and do both operations:
>
> 1. Check for ATAGs and augment the DTB
> 2. Check for memory size in the DTB
>
> This way the ATAG-augmented DTB can be used
> for checking for the memory start.
>
> I understand that you need the physical address
> before turning on the caches, so what I am thinking
> is if it is possible to move the check for appended
> DTB and ATAG augmentation business up before
> the cache enablement in a separate patch and then
> modify it from there. Then you could potentially
> merge these two things.
>
> Maybe there is something conceptually wrong with
> this that I have overlooked... :/

Augmenting the appended DTB (case [E]) with information passed in ATAGS
via r2 (case [F]) can indeed be moved up.
However, augmenting the appended DTB with information stored in ATAGS at
the start of physical RAM + 0x100 (case [G]) cannot be moved up, as it
relies on knowing the start of memory.   Hence this can only be done on
systems where the start of RAM is a multiple of 128 MiB, and masking the
PC with 0xf8000000 yields a valid RAM address, thus leading to a
chicken-and-egg problem...

Given the appended DTB, and augmenting it with information from ATAGS,
is clearly marked as a backward compatibility convenience for systems
with a bootloader that cannot be upgraded, I think it is reasonable to
take a step back, and limit the validation to modern systems which do
pass the DTB in r2.  This would simplify the code, and avoid
regressions.

Does that sound right?

Later, we can easily add on top support for kdump adding a
"linux,usable-memory-range" property to the DTB (passed in r2), cfr. [2]
and [3].

Thanks for your comments!

[1] https://people.kernel.org/linusw/how-the-arm32-linux-kernel-decompresses
[2] "[PATCH] ARM: Parse kdump DT properties"
    (https://lore.kernel.org/r/20200902154538.6807-1-geert+renesas@glider.be)
[3] "PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB"
    (https://lore.kernel.org/r/20200902154129.6358-1-geert+renesas@glider.be).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
