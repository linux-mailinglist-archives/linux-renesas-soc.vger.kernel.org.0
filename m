Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E7463F456
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Dec 2022 16:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbiLAPmK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Dec 2022 10:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232117AbiLAPlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 10:41:45 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C2C19C2F
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Dec 2022 07:40:38 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id o12so1576576qvn.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2022 07:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOuOVPrk1SvG7ICL5C9KM8NA2rUmNWqx/LHQwPcR7Rw=;
        b=CLhYyv+2izO+TK8DieYtSRGm3w45DMms1MZvQltEjh2jaht1UUmNZm5+/7+TQdaAtA
         3VUx+eI0s24u//3XIIzd/ujaErVHI9B44lnTlcsc7N0WnDYcjFMF3dUFZrG4ifZai/NV
         883bzLKv75EQ+aV7esijqIuywGs2DpVfpCSQ6rYANk+ujy2iKjka1h31YZlc2lkM9lys
         1r3WHP2DWPNW6urX0TJ7jFPlTP+s+y3sG7rw4EixdN0+En2Dgxi7htVJ6Kgy7dcRZvp1
         JBtJws/tJcoSz5A4cmYrOgjv4t1cX5mX17oi9SS9bfsH2HZMNQSeR93tF5XTuNvW8W0G
         VLdw==
X-Gm-Message-State: ANoB5pkWESdXYxp6mAu7zLWbhiFWS1KeP74cKfGIiGAjEeU7EtyyRomd
        Z9/nz16TU4PVaoX/Tvki/exF6ex8CnhDkA==
X-Google-Smtp-Source: AA0mqf7SI8vI+hosFKUmWz7B/BMFv7xH5XUkvSNqBYSpdQ9xTFtpzdAR2TpQISVT+FMx/Tx3x88JQw==
X-Received: by 2002:a05:6214:4585:b0:4c6:82cd:de09 with SMTP id op5-20020a056214458500b004c682cdde09mr44862285qvb.119.1669909237257;
        Thu, 01 Dec 2022 07:40:37 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bj7-20020a05620a190700b006cfc1d827cbsm3595770qkb.9.2022.12.01.07.40.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 07:40:36 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 189so2504451ybe.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2022 07:40:36 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr2521446ybg.36.1669909236417; Thu, 01
 Dec 2022 07:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20221124170018.3150687-1-biju.das.jz@bp.renesas.com> <20221124170018.3150687-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221124170018.3150687-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Dec 2022 16:40:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhHvb__B2aRg8FOjhiAyLT=x3Fyki4RpFX15K-y=re1w@mail.gmail.com>
Message-ID: <CAMuHMdWhHvb__B2aRg8FOjhiAyLT=x3Fyki4RpFX15K-y=re1w@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a core driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Nov 24, 2022 at 6:00 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> the Renesas RZ/G2L family SoCs. It consists of eight 16-bit timer
> channels and one 32-bit timer channel. It supports the following
> functions
>  - Counter
>  - Timer
>  - PWM
>
> The 8/16/32 bit registers are mixed in each channel.
>
> Add MTU3a core driver for RZ/G2L SoC. The core driver shares the
> clk and channel register access for the other child devices like
> Counter, PWM, Clock Source, and Clock event.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * Added channel specific mutex to avoid races between child devices
>    (for eg: pwm and counter)
>  * Added rz_mtu3_shared_reg_update_bit() to update bit.

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clocksource/rz-mtu3.c

> +void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 off,
> +                                  u16 pos, u8 val)
> +{
> +       unsigned long tmdr;
> +
> +       tmdr = rz_mtu3_shared_reg_read(ch, off);
> +       __assign_bit(pos, &tmdr, !!val);
> +       rz_mtu3_shared_reg_write(ch, off, tmdr);

As this is RMW on a shared register, probably this needs locking,
here or in the callers?

> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);

> --- /dev/null
> +++ b/include/clocksource/rz-mtu3.h

> +enum rz_mtu3_functions {
> +       RZ_MTU3_NORMAL,

IIRC, this state means the channel is idle?
RZ_MTU3_IDLE?

> +       RZ_MTU3_16BIT_PHASE_COUNTING,
> +       RZ_MTU3_32BIT_PHASE_COUNTING,
> +       RZ_MTU3_PWM_MODE_1,

Do you need to know the actual function, or is it sufficient to just
know if the channel is busy? ...

> +};
> +
> +/**
> + * struct rz_mtu3_channel - MTU3 channel private data
> + *
> + * @dev: device handle
> + * @index: channel index
> + * @base: channel base address
> + * @lock: Lock to protect channel function
> + * @function: channel function
> + */
> +struct rz_mtu3_channel {
> +       struct device *dev;
> +       unsigned int index;
> +       void __iomem *base;
> +       struct mutex lock; /* Protect channel function */
> +       enum rz_mtu3_functions function;

... so perhaps a simple busy flag is sufficient?

Regardless, to avoid replicating the channel function in every
subdriver, I would add a simple API (can be inline) to request and
release a channel.

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
