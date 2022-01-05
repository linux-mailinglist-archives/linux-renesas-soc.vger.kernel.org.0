Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03AF4851A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 12:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239617AbiAELM4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 06:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbiAELMz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 06:12:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912B3C061761;
        Wed,  5 Jan 2022 03:12:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A6A3B81A21;
        Wed,  5 Jan 2022 11:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E578AC36AF3;
        Wed,  5 Jan 2022 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641381171;
        bh=FP6go+G51SetXZwLjWew7bzAodSWP9fx1rJi4M88cQI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pOO5zaxkN7t+HEwnSCmMB28mx+9SIb9AyBmnYfHSZq5oXXM3G9JJ1i+Qh8M66tX6e
         gL7Q77xRFHgL8o4s3HsUpp3oMM444sa7mYDyukJ7PVFtWsBTTjY80qhh5+HjtgoiSO
         gh6juu7HxvuGTF0iHUEgTnJR957TOHZvbrhYcaHVFePkDDf8CPRlrguhQHGvT3s3Ih
         OGcEz0z6X7qNRKjafoHWH9qsoTXtLH3DRXGUw2cfNNeR8znpgyE9csaNl2MzJp8RTM
         7Z+ONMTFCjNqfJ1veT/72XjZq+MFTtxm/XA4VDZxTFOH0aOz8eaFlzqoFQGnNNRKT5
         4XRq9hGkgfCjg==
Received: by mail-wr1-f52.google.com with SMTP id j18so82208762wrd.2;
        Wed, 05 Jan 2022 03:12:51 -0800 (PST)
X-Gm-Message-State: AOAM530i+lZEK7XoOWV+cQmHS2TOGOIiBNL+B3d04SKDb2LG4OpYcDBE
        8C1L8VIRLu67Pec5ImFWd8hI0BCaB/2iIUTrJ0o=
X-Google-Smtp-Source: ABdhPJwgpT/JqnrJYh9N1qdWJipPK0T451NjGBj4d+vEH8cfsbu6zCBvRfCzFVUb2cJmkbuO61XENYMZKwW6so9Qg8s=
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr46471812wrc.417.1641381170183;
 Wed, 05 Jan 2022 03:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20211122092816.2865873-1-ardb@kernel.org> <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
 <20211122092816.2865873-8-ardb@kernel.org> <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
 <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
 <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com> <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
 <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com> <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
 <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com> <CAMj1kXGyL7yTV4+pOs9iBWYuVvVmPTZrV5r=nzqttqpZ6-vYJA@mail.gmail.com>
 <CAMuHMdWNuCVeFiDrhnFmX0F1jxz8Fs4eFx55ojJF3d2ro-udrA@mail.gmail.com> <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com>
In-Reply-To: <bbb0c788-bd83-833c-9445-87cff525f728@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 5 Jan 2022 12:12:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
Message-ID: <CAMj1kXEYjUspxOnvK=3O4pkVtXT+iBPz6mkskn=K6TTUZc+W2g@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
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
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 5 Jan 2022 at 12:08, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ard,
>
> On 28/12/2021 14:39, Geert Uytterhoeven wrote:
>
> ...
>
> >> As i don't have access to this hardware, I am going to have to rely on
> >> someone who does to debug this further. The only alternative is
> >> marking CONFIG_VMAP_STACK broken on MACH_EXYNOS but that would be
> >> unfortunate.
> >
> > Wish I had seen this thread before...
> >
> > I've just bisected a resume after s2ram failure on R-Car Gen2 to the same
> > commit a1c510d0adc604bb ("ARM: implement support for vmap'ed stacks")
> > in arm/for-next.
> >
> > Expected output:
> >
> >      PM: suspend entry (deep)
> >      Filesystems sync: 0.000 seconds
> >      Freezing user space processes ... (elapsed 0.010 seconds) done.
> >      OOM killer disabled.
> >      Freezing remaining freezable tasks ... (elapsed 0.009 seconds) done.
> >      Disabling non-boot CPUs ...
> >
> > [system suspended, this is also where it hangs on failure]
> >
> >      Enabling non-boot CPUs ...
> >      CPU1 is up
> >      sh-eth ee700000.ethernet eth0: Link is Down
> >      Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY
> > driver (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=193)
> >      OOM killer enabled.
> >      Restarting tasks ... done.
> >      PM: suspend exit
> >
> > Both wake-on-LAN and wake-up by gpio-keys fail.
> > Nothing interesting in the kernel log, cfr. above.
> >
> > Disabling CONFIG_VMAP_STACK fixes the issue for me.
> >
> > Just like arch/arm/mach-exynos/ (and others), arch/arm/mach-shmobile/
> > has several *.S files related to secondary CPU bringup.
>
>
> This is also breaking suspend on our 32-bit Tegra platforms. Reverting
> this change on top of -next fixes the problem.
>

Thanks for the report.

It would be helpful if you could provide some more context:
- does it happen on a LPAE build too?
- does it only happen on SMP capable systems?
- does it reproduce on such systems when using only a single CPU?
(i.e., pass 'nosmp' on the kernel command line)
- when passing 'no_console_suspend' on the kernel command line, are
any useful diagnostics produced?
- is there any way you could tell whether the crash/hang (assuming
that is what you are observing) occurs on the suspend path or on
resume?
- any other observations that could narrow this down?

Thanks,
Ard.
