Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A05480A0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 15:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhL1Oj0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 09:39:26 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:35469 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbhL1Oj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 09:39:26 -0500
Received: by mail-ua1-f47.google.com with SMTP id v14so14799276uau.2;
        Tue, 28 Dec 2021 06:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kpKebKhTPkAf5g+7wJecDZs+7FWqimgm1MM7GRPt3OU=;
        b=BYPeeVGBeI05WcUXpkB5nZzUWMDVpOeLgiPQciBMWfzDm0rME8mdY8A5JFrvVdl69I
         Gkbw641ogVTLr+C/jHw/8qc2JFJXj08/s3keuj17SJq08L7UNe+HM2FOKsXKR9Z9HCoC
         wJxPQjVzBRrhZUGzsIhEIHwcyGF0WKHAGSEDd1QZ6LUUqVaMOVSvjTrmkT9S2SRALCFx
         QCC+0Pru7A2Dbhsb7l/ITaTJmzK4pOtFrZwoW331hdfPgrCZnui57GgIBR+64PLgeqhg
         jGZmj6BNBe/8soTN0jRhGDVdwIlu/lr2tBaS4QRLNVT0+CaJGbfToquCU/yW7CWQmFaU
         594A==
X-Gm-Message-State: AOAM5317bsiTRGKvdfCKSajgvjC31EI2yMx5AzGuZBR2jh+9VG3CjHJt
        8maaKVr55EyC/blVITOWxQlgidaLdSP58w==
X-Google-Smtp-Source: ABdhPJxCk+nr+FHmcvl/qBgSlh3lHEc5LdIGNQBeuCphSvhWynkoZDCbv06JTchYCeUjU8a50XYxAQ==
X-Received: by 2002:a67:b143:: with SMTP id z3mr6313194vsl.66.1640702365077;
        Tue, 28 Dec 2021 06:39:25 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id x19sm3788139vsh.6.2021.12.28.06.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 06:39:24 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id i6so32172900uae.6;
        Tue, 28 Dec 2021 06:39:24 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr6366856vsg.57.1640702364070;
 Tue, 28 Dec 2021 06:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com> <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
In-Reply-To: <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Dec 2021 15:39:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
Message-ID: <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com>
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

Hi Ard,

On Thu, Dec 23, 2021 at 3:30 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Tue, 21 Dec 2021 at 22:56, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > On 21.12.2021 17:20, Ard Biesheuvel wrote:
> > > On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >> On 21.12.2021 14:34, Ard Biesheuvel wrote:
> > >>> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
> > >>>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
> > >>>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
> > >>>>>>> and implement the entry code that detects whether we faulted because of a
> > >>>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
> > >>>>>>>
> > >>>>>>> While this adds a fair amount of tricky entry asm code, it should be
> > >>>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
> > >>>>>>> implementing the non-trivial handling of the overflow stack is emitted
> > >>>>>>> out-of-line into the .text section.
> > >>>>>>>
> > >>>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
> > >>>>>>> table entries that cover the vmalloc region up to date, we need to
> > >>>>>>> ensure that we don't hit such a stale PMD entry when accessing the
> > >>>>>>> stack. So we do a dummy read from the new stack while still running from
> > >>>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
> > >>>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
> > >>>>>>> switch fetches the latest version of the entries.
> > >>>>>>>
> > >>>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
> > >>>>>>> space to stash a GPR until we know it is safe to touch the stack.
> > >>>>>>> However, due to the cacheline alignment of the struct, this does not
> > >>>>>>> actually increase the memory footprint of the struct stack array at all.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > >>>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
> > >>>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
> > >>>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
> > >>>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
> > >>>>>> suspend/resume related code must be updated somehow (it partially works
> > >>>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
> > >>>>>> you have any hints, let me know.
> > >>>>>>
> > >>>>> Are there any such systems in KernelCI? We caught a suspend/resume
> > >>>>> related issue in development, which is why the hunk below was added.
> > >>>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
> > >>>> available in KernelCI, but I don't know if they are still there.
> > >>>>
> > >>>>
> > >>>>> In general, any virt-to-phys translation involving and address on the
> > >>>>> stack will become problematic.
> > >>>>>
> > >>>>> Could you please confirm whether the issue persists with the patch
> > >>>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> > >>>>> looking in the right place?
> > >>>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
> > >>>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
> > >>>>
> > >>> Thanks. Any other context you can provide beyond 'does not work' ?
> > >> Well, the board properly suspends, but it doesn't wake then (tested
> > >> remotely with rtcwake command). So far I cannot provide anything more.
> > >>
> > > Thanks. Does the below help? Or otherwise, could you try doubling the
> > > size of the overflow stack at arch/arm/include/asm/thread_info.h:34?
> >
> > I've tried both (but not at the same time) on the current linux-next and
> > none helped. This must be something else... :/
> >
>
> Thanks.
>
> As i don't have access to this hardware, I am going to have to rely on
> someone who does to debug this further. The only alternative is
> marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
> unfortunate.

Wish I had seen this thread before...

I've just bisected a resume after s2ram failure on R-Car Gen2 to the same
commit a1c510d0adc604bb ("ARM: implement support for vmap'ed stacks")
in arm/for-next.

Expected output:

    PM: suspend entry (deep)
    Filesystems sync: 0.000 seconds
    Freezing user space processes ... (elapsed 0.010 seconds) done.
    OOM killer disabled.
    Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
    Disabling non-boot CPUs ...

[system suspended, this is also where it hangs on failure]

    Enabling non-boot CPUs ...
    CPU1 is up
    sh-eth ee700000.ethernet eth0: Link is Down
    Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY
driver (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=193)
    OOM killer enabled.
    Restarting tasks ... done.
    PM: suspend exit

Both wake-on-LAN and wake-up by gpio-keys fail.
Nothing interesting in the kernel log, cfr. above.

Disabling CONFIG_VMAP_STACK fixes the issue for me.

Just like arch/arm/mach-exynos/ (and others), arch/arm/mach-shmobile/
has several *.S files related to secondary CPU bringup.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
