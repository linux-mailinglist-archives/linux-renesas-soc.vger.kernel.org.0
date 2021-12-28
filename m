Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36171480B2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 17:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbhL1QTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 11:19:38 -0500
Received: from mail-qt1-f175.google.com ([209.85.160.175]:39559 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235613AbhL1QTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 11:19:38 -0500
Received: by mail-qt1-f175.google.com with SMTP id bp39so16301622qtb.6;
        Tue, 28 Dec 2021 08:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gROQL+4Z8GQP2U/xGCtDy1krGkz2XP6imrmbuPMihpI=;
        b=29VP19FUM90AGewyX2D9UcJVIxXtnf+hLpuBE3S7fAJv73LrkYEoIDoSIRqIa006Eq
         XtUBRbIM6cR/xhsEK7fyXVACqaOceiePpv22c6JEzZM0k2xM7Q3yhq4sYtAPq74ch5om
         Xx5oatEeNpTTI433bnHqWkM1ARSk2AFUtS+I29NpDKjvC2LV0adk9N8GZcvwi8xHJqQP
         Lsc7eGJVWSifmdqyTnH3bnxwasuNwfY0/4//HD/Y21JnjsvjscPPngkYHOUwcd2i3OMa
         ujojyYn5arNPtjDR/d6Dvel12cFe2YKQrtyJmnl+LnfcBUV6iaVDhMRMi31/pkezPIgS
         8lTw==
X-Gm-Message-State: AOAM532bew2a81O3YavBu9ts0Hy5X5w9ypm2OoaIeMJyeq0XjIQ5Dhl1
        mt6ht69vsAHZ4vILjDDEHER7OmYbDrwoTg==
X-Google-Smtp-Source: ABdhPJzxyNorTzUdKmBdlAo7crQQDIPQdFkjqjgbQ6MWDGI8VdwNzX2NQhMBffPB6aTzdH8IYbuA9w==
X-Received: by 2002:a05:622a:512:: with SMTP id l18mr19356616qtx.120.1640708377157;
        Tue, 28 Dec 2021 08:19:37 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id y17sm16152303qtj.75.2021.12.28.08.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 08:19:37 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id g80so11474633ybf.0;
        Tue, 28 Dec 2021 08:19:37 -0800 (PST)
X-Received: by 2002:ab0:b87:: with SMTP id c7mr5207725uak.14.1640707985863;
 Tue, 28 Dec 2021 08:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com> <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Dec 2021 17:12:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWALEaQ6jXZjqOtsx8dZ+eoMPHa0SZ_onREq2STKz-CUw@mail.gmail.com>
Message-ID: <CAMuHMdWALEaQ6jXZjqOtsx8dZ+eoMPHa0SZ_onREq2STKz-CUw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Ard Biesheuvel <ardb@kernel.org>
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

On Tue, Dec 28, 2021 at 3:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Dec 23, 2021 at 3:30 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > On Tue, 21 Dec 2021 at 22:56, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > On 21.12.2021 17:20, Ard Biesheuvel wrote:
> > > > On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > >> On 21.12.2021 14:34, Ard Biesheuvel wrote:
> > > >>> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > >>>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> > > >>>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > > >>>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> > > >>>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
> > > >>>>>>> and implement the entry code that detects whether we faulted because of a
> > > >>>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> > > >>>>>>>
> > > >>>>>>> While this adds a fair amount of tricky entry asm code, it should be
> > > >>>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
> > > >>>>>>> implementing the non-trivial handling of the overflow stack is emitted
> > > >>>>>>> out-of-line into the .text section.
> > > >>>>>>>
> > > >>>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> > > >>>>>>> table entries that cover the vmalloc region up to date, we need to
> > > >>>>>>> ensure that we don't hit such a stale PMD entry when accessing the
> > > >>>>>>> stack. So we do a dummy read from the new stack while still running from
> > > >>>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
> > > >>>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
> > > >>>>>>> switch fetches the latest version of the entries.
> > > >>>>>>>
> > > >>>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
> > > >>>>>>> space to stash a GPR until we know it is safe to touch the stack.
> > > >>>>>>> However, due to the cacheline alignment of the struct, this does not
> > > >>>>>>> actually increase the memory footprint of the struct stack array at all.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > >>>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
> > > >>>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> > > >>>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> > > >>>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> > > >>>>>> suspend/resume related code must be updated somehow (it partially works
> > > >>>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> > > >>>>>> you have any hints, let me know.
> > > >>>>>>
> > > >>>>> Are there any such systems in KernelCI? We caught a suspend/resume
> > > >>>>> related issue in development, which is why the hunk below was added.
> > > >>>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> > > >>>> available in KernelCI, but I don't know if they are still there.
> > > >>>>
> > > >>>>
> > > >>>>> In general, any virt-to-phys translation involving and address on the
> > > >>>>> stack will become problematic.
> > > >>>>>
> > > >>>>> Could you please confirm whether the issue persists with the patch
> > > >>>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> > > >>>>> looking in the right place?
> > > >>>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> > > >>>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
> > > >>>>
> > > >>> Thanks. Any other context you can provide beyond 'does not work' ?
> > > >> Well, the board properly suspends, but it doesn't wake then (tested
> > > >> remotely with rtcwake command). So far I cannot provide anything more.
> > > >>
> > > > Thanks. Does the below help? Or otherwise, could you try doubling the
> > > > size of the overflow stack at arch/arm/include/asm/thread_info.h:34?
> > >
> > > I've tried both (but not at the same time) on the current linux-next and
> > > none helped. This must be something else... :/
> > >
> >
> > Thanks.
> >
> > As i don't have access to this hardware, I am going to have to rely on
> > someone who does to debug this further. The only alternative is
> > marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
> > unfortunate.
>
> Wish I had seen this thread before...
>
> I've just bisected a resume after s2ram failure on R-Car Gen2 to the same
> commit a1c510d0adc604bb ("ARM: implement support for vmap'ed stacks")
> in arm/for-next.
>
> Expected output:
>
>     PM: suspend entry (deep)
>     Filesystems sync: 0.000 seconds
>     Freezing user space processes ... (elapsed 0.010 seconds) done.
>     OOM killer disabled.
>     Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
>     Disabling non-boot CPUs ...
>
> [system suspended, this is also where it hangs on failure]
>
>     Enabling non-boot CPUs ...
>     CPU1 is up
>     sh-eth ee700000.ethernet eth0: Link is Down
>     Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY
> driver (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=193)
>     OOM killer enabled.
>     Restarting tasks ... done.
>     PM: suspend exit
>
> Both wake-on-LAN and wake-up by gpio-keys fail.
> Nothing interesting in the kernel log, cfr. above.
>
> Disabling CONFIG_VMAP_STACK fixes the issue for me.

Enabling CONFIG_ARM_LPAE also fixes the issue, but is not an option
for shmobile_defconfig, as that would break systems with a Cortex-A9.

> Just like arch/arm/mach-exynos/ (and others), arch/arm/mach-shmobile/
> has several *.S files related to secondary CPU bringup.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
