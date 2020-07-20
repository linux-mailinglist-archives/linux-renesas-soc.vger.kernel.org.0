Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E5E225C17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jul 2020 11:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgGTJxe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jul 2020 05:53:34 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:40779 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgGTJxe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 05:53:34 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MbC5g-1kYz5w2sW0-00bZq0 for <linux-renesas-soc@vger.kernel.org>; Mon, 20
 Jul 2020 11:53:32 +0200
Received: by mail-qt1-f175.google.com with SMTP id w34so12473906qte.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jul 2020 02:53:32 -0700 (PDT)
X-Gm-Message-State: AOAM530V2lrRiXih5xL9B+5iqs/1lQMy+AQqx4JljKQu2t7+rgLxXeAw
        5BtV043YoSFmBAg2IYCEv2xjeq4wnW2aJzxCfFg=
X-Google-Smtp-Source: ABdhPJy0eYbtThNk21ssg1DPwo3IMbwId04TfyR4S/paqTy37SUzaaPccZTdrQTqvqJCktXJwFTvTOZsT80Nrl7ClEM=
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr22910778qtm.7.1595238811573;
 Mon, 20 Jul 2020 02:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200706150205.22053-1-geert+renesas@glider.be> <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
In-Reply-To: <CACRpkdZD3gVLdcjaOL9ZCfZD+hrOUB0-q0NpoHu6m1Ujupw6Fw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Jul 2020 11:53:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
Message-ID: <CAK8P3a33AWe-fa8jJnRrme56Hgc-hLdNH4FK6FEPyZ0=O=vwtg@mail.gmail.com>
Subject: Re: [PATCH/RFC v7] ARM: boot: Obtain start of physical memory from DTB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jVJM8ITv6A6CvwJz1vGduyOKQaxfhYF0iVTM3614wTw/6oYKi6i
 JwOOniyzEivJz2G14fspz6U7IucgCsY0ksYaeXKQaaaQLvkoiUU3weiJh4AYvhVtICuq/OV
 vGvdVeS7IZVohWrt3dHMGR4i/SGc3Rip0n5sKDGKpebEwoHQIKkiKP1aRCAZ7ciYmc+GWIm
 mzN9OwCONWkxtv9eyolTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PoCwPn+Pk8k=:VhntouJi4+HKhQqZ9odI25
 N6VIU2tVRIatk7vyNvnaAsBrA2SSIZ20hX57de6L/O5VgEqFYSOU2lvk5DUGmjDYNSS4V4xEi
 /LnvVAiRyn5OXW80oChBSNb/Hc0ru6nIH8SRqRUJPi3QZEW3jsjolCF7tpr8Snz6DRqoX4L2/
 JnWfrR56MKMi3SjtHowQGrJJEmB+mlKmnZgRP9r4pb03Q8/7aWl+kb4JqKxW1pxgHh3boMiZ7
 8ItHK+Oicih3UzTT2jqP5EOdHKnR91UW6txBbpbB1PguTTjJL1l9jx9P2V6OheujjuNqJFwka
 6z1h6NxJ+xqXP/Vq+VSnramET08SzirdiBw0yph6ms8e/s0f8S1FlrofrjGyZw+aByaliKj3G
 z7O953EBTmfaWAPcxAgTZO61IxRWX4dM4wk637a4TV+jM9X1raH//gBgwcxIHQtTozXNvyEWV
 +4oh5CZLb2OV5J9bgtN/Vb/Fveqs24f8AUvwfqgv2/GwYGWz7DOLfraW5vk1r8qnlF/M2Bzbv
 JDXvmSyByGagzyCqqCnuMGs2SpIs7RX3ox1jyzNBRAukJi2JT1WgfRzpL6DpSTJPZMk9NGV7b
 JsiLaLyNxyTQ45jxnSMhwXb2bfUbSSfp5hVjpK8nVQ/0C/B+7iE/Rn6AokGfm1ss0klpJOttg
 bHAffqjji4ECgWR+9AVIrfr3hn1AfYjPqQCYXrjmJ4PluHbrcgjIBV6paXifBEr0904JABFtP
 JWlX2T2MTrqkhgvim/KBkdkNLr8006OfpOvXCjaorhLmV8Rs70QAzzMNsI7EllT9wYj45jm5X
 WZ+GCr/65Xhjuw4ityQm16QEuI5PODNZTFTSa3PLLqRdyNXlOJgcdjJ0xfuzcScL6+cLqZC
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 20, 2020 at 11:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jul 6, 2020 at 5:03 PM Geert Uytterhoeven
>
> I tried to test this on the APQ8060 Qualcomm board. This is an odd beast,
> because physical memory starts at 0x40200000 which is 8MiB aligned,
> not even 16 MiB. Oddly this *works* with the mainline kernel, giving
> the following boot crawl:
>
> [    0.000000] cma: Reserved 256 MiB at 0x50000000
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000040200000-0x000000005fffffff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040200000-0x0000000042dfffff]
> [    0.000000]   node   0: [mem 0x0000000048000000-0x000000005fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040200000-0x000000005fffffff]
>
> It crashes so hard with this patch that I don't even get earlydebug
> messages. (Scary!)
>
> I also tried to simply load the kernel to 0x50000000 which solved
> an issue I had with KASan in the past, but it doesn't help. The
> first memblock is at 0x40200000 after all.
>
> Any hints at what may be going wrong here?
>
> No panic though - I know this platform is a stress test, but it'd be
> nice not to regress it.

No idea what /exactly/ is going wrong, but I would point out that this is one
of the platforms that is handled as a special case in the Makefile when
setting TEXT_OFFSET:

# Text offset. This list is sorted numerically by address in order to
# provide a means to avoid/resolve conflicts in multi-arch kernels.
textofs-y       := 0x00008000
# We don't want the htc bootloader to corrupt kernel during resume
textofs-$(CONFIG_PM_H1940)      := 0x00108000
# RTD1195 has Boot ROM at start of address space
textofs-$(CONFIG_ARCH_REALTEK)  := 0x00108000
# SA1111 DMA bug: we don't want the kernel to live in precious DMA-able memory
ifeq ($(CONFIG_ARCH_SA1100),y)
textofs-$(CONFIG_SA1111) := 0x00208000
endif
textofs-$(CONFIG_ARCH_IPQ40XX) := 0x00208000
textofs-$(CONFIG_ARCH_MSM8X60) := 0x00208000
textofs-$(CONFIG_ARCH_MSM8960) := 0x00208000
textofs-$(CONFIG_ARCH_MESON) := 0x00208000
textofs-$(CONFIG_ARCH_AXXIA) := 0x00308000
TEXT_OFFSET := $(textofs-y)

        Arnd
