Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4AF61F513
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 15:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbiKGOQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Nov 2022 09:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiKGOQl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 09:16:41 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5E81BE94
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Nov 2022 06:16:40 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id hh9so6873195qtb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 06:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoUHYyeERJ7ZSoedqyEHbCH9y9cYzcmahl5CxAc/j5Q=;
        b=3/lrSV2FB3VKgjWLFbnWITKGetXu251tGPp+qNBUFDcyDvBgZjIEqkFq3MuQXeDOB3
         3Uc6Yr/mFMsIVYR7izY/IrN6xrf9Yyo7E5wZuRTVN4K+NyNEU3UhzTSaybLZIQZO933Z
         r2IGFz+j/8sLAaFyl/P3mFoiQ18C1Vq27T/Y1siIBdWCkUP09V2yIiS4Op7baCP8y8zt
         n3jkSk5x6Wqi9d9xWV++L2yWvAqMpb+m68FAm8mgKkkHszec5qDH9wNGp7TjJoBawESl
         A17fx3FjGIAU/I2w6d3sTD9vvYmy6ek5ckP1jwEyLKmxomK7GRQ+4XQYItsB7CvN/Xje
         LD5A==
X-Gm-Message-State: ACrzQf2eaj358++e4xi/NMRMV22hr81GABOYG+3E7/Wg2/fWgGtaUEkG
        RIEBH9litdBujkjCGh36oLba+nurL/SAlQkA
X-Google-Smtp-Source: AMsMyM4VT79dWTcRY+RuMl8JgTcc0AG/ny0owzByxoSjX/9A+h7cnUqoaiW0QatyiXIJ4FA/HoQl2Q==
X-Received: by 2002:ac8:7309:0:b0:3a5:44d0:f000 with SMTP id x9-20020ac87309000000b003a544d0f000mr22262622qto.448.1667830599267;
        Mon, 07 Nov 2022 06:16:39 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id r16-20020ac87ef0000000b003996aa171b9sm5987525qtc.97.2022.11.07.06.16.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:16:38 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-333a4a5d495so105316887b3.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2022 06:16:38 -0800 (PST)
X-Received: by 2002:a0d:e301:0:b0:374:a8ba:99b0 with SMTP id
 m1-20020a0de301000000b00374a8ba99b0mr2071926ywe.358.1667830598476; Mon, 07
 Nov 2022 06:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20221027144844.85149-1-biju.das.jz@bp.renesas.com> <20221027144844.85149-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221027144844.85149-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Nov 2022 15:16:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVghus=mN0PajCsY5CAO+sT-NQPL9NJ5e=3wtqMOcahSQ@mail.gmail.com>
Message-ID: <CAMuHMdVghus=mN0PajCsY5CAO+sT-NQPL9NJ5e=3wtqMOcahSQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clocksource/drivers: Add RZ/G2L MTU3 core driver
To:     biju.das.jz@bp.renesas.com
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 27, 2022 at 4:49 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add RZ/G2L MTU3 core driver for the Multi-Function Timer Pulse
> Unit 3 (MTU3a) hardware available on SoCs from Renesas. The core
> driver allow to share the clk and channel between the other
> drivers like PWM, Clock Source, Clock event and Counter.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:

Thanks for the update!

>  * Moved core driver from MFD to timer
>  * Child devices instatiated using mfd_add_devices()

> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -524,6 +524,16 @@ config SH_TIMER_MTU2
>           Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
>           This hardware comes with 16-bit timer registers.
>
> +config RZ_MTU3
> +       bool "Renesas RZ/G2L MTU3 core driver"
> +       depends on (ARCH_RZG2L && OF) || COMPILE_TEST

As you are calling mfd_add_devices(), this driver needs (a very small
part of) the functionality provided by MFD.

If CONFIG_MFD_CORE is not set:

    aarch64-linux-gnu-ld: drivers/clocksource/rz-mtu3.o: in function
`rz_mtu3_reset_assert':
    rz-mtu3.c:(.text+0x38): undefined reference to `mfd_remove_devices'
    aarch64-linux-gnu-ld: drivers/clocksource/rz-mtu3.o: in function
`rz_mtu3_probe':
    rz-mtu3.c:(.text+0x180): undefined reference to `mfd_add_devices'

So either you should make this depend on MFD_CORE, or move to
another mechanism for registering the sub devices (e.g. calling
platform_device_{alloc,add}(), cfr. rpcif_probe()).

> +       help
> +         Select this option to enable Renesas RZ/G2L MTU3 core driver for
> +         the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available on
> +         SoCs from Renesas. The core driver allow to share the clk and channel
> +         between the others drivers like PWM, Clock Source, Clock event and
> +         Counter.
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
