Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079D130A59C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Feb 2021 11:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhBAKkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Feb 2021 05:40:53 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:36782 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhBAKkm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 05:40:42 -0500
Received: by mail-oi1-f177.google.com with SMTP id d18so18314237oic.3;
        Mon, 01 Feb 2021 02:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PbFNPUDjF8u5uZWpIEHcWpaJI3RXUPiFu34mgVi86XY=;
        b=kR0WBOo5QS9f9TkTTR+rPrsBc4VdyoFrFpj8812H2ZYgAtEV7GbioPzxjtHy1YaL5u
         GPUq7oJEjxo/smdF5fRdOUne0xGmOp7hb20x5Ta/ph4KgtrxHnwSfLJb93egLupCQQ4X
         NaoPTFltaK5iYaKWFiKYBBj3T2h5wdD3w8aajNlyZ+Pc2LEtOkORbJ46pJjgHXFQZQZv
         DSfZNdHf7SJ+7egfSzcRUhiMPz5bXnYdCYTK1sR2wmTkEVkve5/z13EXNawsrG433Dl3
         xSqsRCIa4Ybq8yR8cb6dLljn4Il/hbO85DkAH6lnj/5Sn6+IQO4r2BETbbpruQAnIalW
         ch3A==
X-Gm-Message-State: AOAM532u7fjKKoQJ8eXCP0Kfh8OW7+qqKu94oD01eXZWdOR9ai0e/w8J
        bKqaIBbGW9yReew7GTd5VH2XO92mPVIW9EeFkf8=
X-Google-Smtp-Source: ABdhPJw65qTThGcsX9iC1bv+Rc95DdKf2Iuj2OS3RR8/qhbi7vQxnnIIJMJ47LSut7xngwvxuA293xVZ1BzjGh51Fww=
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr10190512oib.153.1612176001101;
 Mon, 01 Feb 2021 02:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20210130040344.2807439-1-saravanak@google.com> <CAGETcx941J7Zhrf=ZjO6PW0fiax5VXcV3gbsLQfM_wU_U0EnYw@mail.gmail.com>
In-Reply-To: <CAGETcx941J7Zhrf=ZjO6PW0fiax5VXcV3gbsLQfM_wU_U0EnYw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Feb 2021 11:39:49 +0100
Message-ID: <CAMuHMdUGkRmjnkSXQ4VNz5crMJ0S4xUvrV=BenOf96Y_bepPSw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Make fw_devlink=on more forgiving
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Marc Zyngier <maz@kernel.org>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Sat, Jan 30, 2021 at 5:09 AM Saravana Kannan <saravanak@google.com> wrote:
> On Fri, Jan 29, 2021 at 8:03 PM Saravana Kannan <saravanak@google.com> wrote:
> > This patch series solves two general issues with fw_devlink=on
> >
> > Patch 1/2 addresses the issue of firmware nodes that look like they'll
> > have struct devices created for them, but will never actually have
> > struct devices added for them. For example, DT nodes with a compatible
> > property that don't have devices added for them.
> >
> > Patch 2/2 address (for static kernels) the issue of optional suppliers
> > that'll never have a driver registered for them. So, if the device could
> > have probed with fw_devlink=permissive with a static kernel, this patch
> > should allow those devices to probe with a fw_devlink=on. This doesn't
> > solve it for the case where modules are enabled because there's no way
> > to tell if a driver will never be registered or it's just about to be
> > registered. I have some other ideas for that, but it'll have to come
> > later thinking about it a bit.
> >
> > These two patches might remove the need for several other patches that
> > went in as fixes for commit e590474768f1 ("driver core: Set
> > fw_devlink=on by default"), but I think all those fixes are good
> > changes. So I think we should leave those in.
> >
> > Marek, Geert,
> >
> > Can you try this series on a static kernel with your OF_POPULATED
> > changes reverted? I just want to make sure these patches can identify
> > and fix those cases.
> >
> > Tudor,
> >
> > You should still make the clock driver fix (because it's a bug), but I
> > think this series will fix your issue too (even without the clock driver
> > fix). Can you please give this a shot?
>
> Marek, Geert, Tudor,
>
> Forgot to say that this will probably fix your issues only in a static
> kernel. So please try this with a static kernel. If you can also try
> and confirm that this does not fix the issue for a modular kernel,
> that'd be good too.

Thanks for your series!

For the modular case, this series has no impact, as expected (i.e. fails
to boot, no I/O devices probed).
With modules disabled, both r8a7791/koelsch and r8a77951/salvator-xs
seem to boot fine, except for one issue on koelsch:

dmesg:

    +i2c-demux-pinctrl i2c-12: failed to setup demux-adapter 0 (-19)
    +i2c-demux-pinctrl i2c-13: failed to setup demux-adapter 0 (-19)
    +i2c-demux-pinctrl i2c-14: failed to setup demux-adapter 0 (-19)

    -  #0: rsnd-dai.0-ak4642-hifi
    +  No soundcards found.

regulator_summary:

    -13-0050-vcc                   0    0mA     0mV     0mV
    -13-0039-dvdd-3v               1    0mA     0mV     0mV
    -13-0039-bgvdd                 1    0mA     0mV     0mV
    -13-0039-pvdd                  1    0mA     0mV     0mV
    -13-0039-dvdd                  1    0mA     0mV     0mV
    -13-0039-avdd                  1    0mA     0mV     0mV

pm_genpd_summary:

    -/devices/platform/soc/e6518000.i2c  suspended                  0
    -/devices/platform/soc/e6530000.i2c  suspended                  0
    -/devices/platform/soc/e6520000.i2c  suspended                  0

These are all symptoms of the same issue: i2c buses and devices are not
probed, due to the use of the i2c demuxer.
I guess the fw_devlink tracker doesn't consider "i2c-parent" links?

Note that I only tested this on R-Car Gen2 and Gen3.
I did not test this on Renesas SH/R-Mobile or RZ/A SoCs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
