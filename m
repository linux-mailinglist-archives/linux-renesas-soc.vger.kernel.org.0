Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEC9480B41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 17:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbhL1Q2B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 11:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233260AbhL1Q2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 11:28:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E586C061574;
        Tue, 28 Dec 2021 08:28:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C92B4611DF;
        Tue, 28 Dec 2021 16:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35821C36AF3;
        Tue, 28 Dec 2021 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640708879;
        bh=R6Jv9J0BxrC+z8teg96UirleOKuDMCl+//tC6vwo9E8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tsykbORowRces+IbbOhfubWCPPC04lZjK75CaQHoSiv5jau0xuN8Ayvl2Zov+figH
         3xoFpTepFdEafLdGhdVtjgSOmvpKNPVR+dflxiIEKURY2QLsitdSdaugG8ARIapA4T
         J0UhDzZvozjcxNegj7+U5rYCbEHou395dgj/kmViDlTph7WndJ3HvYz4Ta7wQGlX//
         T5NmAwMmOWXYFZopKRkFmkQgFpnDYxxSl08sSqFP4bSJg+ShsNrIaz9TmoEIrA3DFG
         LaOm+Qhfeg1e3ROuW2aFgLa0EYoi6FRm6414WJWZCrqLyi3/nPV/8LL4kP3qKksySk
         ADBOMX5PeJM9A==
Received: by mail-wr1-f48.google.com with SMTP id r17so39344369wrc.3;
        Tue, 28 Dec 2021 08:27:59 -0800 (PST)
X-Gm-Message-State: AOAM532pD9xpvNzP91wcFc/DbN1r6hVA0JYs/lWCggqh+8fPdO+GvcwA
        YxPEZbo6K+BxbN4H6pXzirhCn8dpJDO3RYLtDwQ=
X-Google-Smtp-Source: ABdhPJw/MwBMEIAZN5SY17OLS8R0iHn7WE9gXetg1uCSD+W/kXmNtEYPh87zbAKHgQIF+cWKczr40Yb86kEVZukG3kw=
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr17033550wry.447.1640708877257;
 Tue, 28 Dec 2021 08:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com> <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com> <CAMuHMdWALEaQ6jXZjqOtsx8dZ+eoMPHa0SZ_onREq2STKz-CUw@mail.gmail.com>
In-Reply-To: <CAMuHMdWALEaQ6jXZjqOtsx8dZ+eoMPHa0SZ_onREq2STKz-CUw@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 28 Dec 2021 17:27:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHJTMpGZEWUUM7=hXyxxkBTsTH2YqrZLeECtKAAu2Vg=Q@mail.gmail.com>
Message-ID: <CAMj1kXHJTMpGZEWUUM7=hXyxxkBTsTH2YqrZLeECtKAAu2Vg=Q@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 28 Dec 2021 at 17:13, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, Dec 28, 2021 at 3:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Dec 23, 2021 at 3:30 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Tue, 21 Dec 2021 at 22:56, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > On 21.12.2021 17:20, Ard Biesheuvel wrote:
> > > > > On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > >> On 21.12.2021 14:34, Ard Biesheuvel wrote:
> > > > >>> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > >>>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> > > > >>>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > > >>>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> > > > >>>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
> > > > >>>>>>> and implement the entry code that detects whether we faulted because of a
> > > > >>>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> > > > >>>>>>>
> > > > >>>>>>> While this adds a fair amount of tricky entry asm code, it should be
> > > > >>>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
> > > > >>>>>>> implementing the non-trivial handling of the overflow stack is emitted
> > > > >>>>>>> out-of-line into the .text section.
> > > > >>>>>>>
> > > > >>>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> > > > >>>>>>> table entries that cover the vmalloc region up to date, we need to
> > > > >>>>>>> ensure that we don't hit such a stale PMD entry when accessing the
> > > > >>>>>>> stack. So we do a dummy read from the new stack while still running from
> > > > >>>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
> > > > >>>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
> > > > >>>>>>> switch fetches the latest version of the entries.
> > > > >>>>>>>
> > > > >>>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
> > > > >>>>>>> space to stash a GPR until we know it is safe to touch the stack.
> > > > >>>>>>> However, due to the cacheline alignment of the struct, this does not
> > > > >>>>>>> actually increase the memory footprint of the struct stack array at all.
> > > > >>>>>>>
> > > > >>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > >>>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
> > > > >>>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> > > > >>>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> > > > >>>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> > > > >>>>>> suspend/resume related code must be updated somehow (it partially works
> > > > >>>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> > > > >>>>>> you have any hints, let me know.
> > > > >>>>>>
> > > > >>>>> Are there any such systems in KernelCI? We caught a suspend/resume
> > > > >>>>> related issue in development, which is why the hunk below was added.
> > > > >>>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> > > > >>>> available in KernelCI, but I don't know if they are still there.
> > > > >>>>
> > > > >>>>
> > > > >>>>> In general, any virt-to-phys translation involving and address on the
> > > > >>>>> stack will become problematic.
> > > > >>>>>
> > > > >>>>> Could you please confirm whether the issue persists with the patch
> > > > >>>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> > > > >>>>> looking in the right place?
> > > > >>>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> > > > >>>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
> > > > >>>>
> > > > >>> Thanks. Any other context you can provide beyond 'does not work' ?
> > > > >> Well, the board properly suspends, but it doesn't wake then (tested
> > > > >> remotely with rtcwake command). So far I cannot provide anything more.
> > > > >>
> > > > > Thanks. Does the below help? Or otherwise, could you try doubling the
> > > > > size of the overflow stack at arch/arm/include/asm/thread_info.h:34?
> > > >
> > > > I've tried both (but not at the same time) on the current linux-next and
> > > > none helped. This must be something else... :/
> > > >
> > >
> > > Thanks.
> > >
> > > As i don't have access to this hardware, I am going to have to rely on
> > > someone who does to debug this further. The only alternative is
> > > marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
> > > unfortunate.
> >
> > Wish I had seen this thread before...
> >
> > I've just bisected a resume after s2ram failure on R-Car Gen2 to the same
> > commit a1c510d0adc604bb ("ARM: implement support for vmap'ed stacks")
> > in arm/for-next.
> >
> > Expected output:
> >
> >     PM: suspend entry (deep)
> >     Filesystems sync: 0.000 seconds
> >     Freezing user space processes ... (elapsed 0.010 seconds) done.
> >     OOM killer disabled.
> >     Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
> >     Disabling non-boot CPUs ...
> >
> > [system suspended, this is also where it hangs on failure]
> >
> >     Enabling non-boot CPUs ...
> >     CPU1 is up
> >     sh-eth ee700000.ethernet eth0: Link is Down
> >     Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY
> > driver (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=193)
> >     OOM killer enabled.
> >     Restarting tasks ... done.
> >     PM: suspend exit
> >
> > Both wake-on-LAN and wake-up by gpio-keys fail.
> > Nothing interesting in the kernel log, cfr. above.
> >
> > Disabling CONFIG_VMAP_STACK fixes the issue for me.
>
> Enabling CONFIG_ARM_LPAE also fixes the issue, but is not an option
> for shmobile_defconfig, as that would break systems with a Cortex-A9.
>

Thanks Geert.

As you have confirmed on #armlinux, the issue also goes away when
booting with 'nosmp'. So this looks like an issue with the virtual
mapping of the stack in the secondary boot path on !LPAE. That really
narrows it down, so hopefully I will be able to fix this shortly.

Marek: could you please confirm whether or not enabling LPAE (on cores
that support it, of course) and/or booting with 'nosmp' make the issue
go away?
