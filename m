Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC6262D55C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 09:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239384AbiKQIqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 03:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239526AbiKQIpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 03:45:54 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB457B61
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 00:45:49 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id w4so700718qts.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 00:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPoPYl746IiOK9aWRnbnf3uYcknHtWJG22UmQd3crO8=;
        b=vOT6bnKjLTR05vKYX48dDsiLzghS9KyTPbBnW5wFVkvVjZQFrieqwPesWQ/5k/IoEv
         pCj6NuQPpoa7eTSSuoKNOo6TwL2+t883YzvFZr5C76pZkNAglOzHOsJe13eyS4xLFMzL
         ql2eWo1HVkHpkzTEwbjC8ovVTTVaHynVqmRNKrBd4/WkbeesfcszaFPoZ9xrUDHjnPYB
         4zwIjvzIeLzapdO1Gzg1oTgxz9bVDKVYCqVJW+HVlhP2A3MRAyriWGceSYryHHptEeDi
         mdYCtFTwkxERuh4nYq+hFhy3CQxXAkTNzb+SzUEgZoLSePFG9B4v977hJ2o0ynKUJZed
         +JAw==
X-Gm-Message-State: ANoB5pmxWqc4sleovChA/4eCNePodMbfB+XZIXBtWWFSoXGqI4tkDxaC
        0hlz2y5AVuLudIS8Rt1nBzBMRWoSOL130g==
X-Google-Smtp-Source: AA0mqf53Pj0yFVAglxvo6OfY+3sPfzxJuKLnhwqVuJQKzY3MVkPsw1AszM7JEIeQzbyLZcj4JKQd0A==
X-Received: by 2002:a05:622a:4085:b0:3a5:73b6:9184 with SMTP id cg5-20020a05622a408500b003a573b69184mr1282117qtb.602.1668674748303;
        Thu, 17 Nov 2022 00:45:48 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id w12-20020ac84d0c000000b00398313f286dsm63027qtv.40.2022.11.17.00.45.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 00:45:47 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id i131so1061854ybc.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 00:45:47 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr1293464ybq.89.1668674747430; Thu, 17 Nov
 2022 00:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Nov 2022 09:45:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
Message-ID: <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Nov 16, 2022 at 9:21 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Documentation for most CMTs say that we need to wait two input clocks
> before changes propagate to the timer. This is especially relevant when
> we stop the timer to change further settings. Implement the delays
> according to the spec. To avoid unnecessary delays in atomic mode, we
> also check if the to-be-written value actually differs. CMCNT is a bit
> special because testing showed that we need to wait 3 cycles instead.
> AFAIU, this is also true for all CMTs. Also, the WRFLAG needs to be
> checked before writing. This fixes "cannot clear CMCNT" messages which
> occur often on R-Car Gen4 SoCs, but only very rarely on older SoCs for
> some reason.
>
> Fixes: 81b3b2711072 ("clocksource: sh_cmt: Add support for multiple channels per device")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
>  #include <linux/module.h>
> @@ -116,6 +117,7 @@ struct sh_cmt_device {
>         void __iomem *mapbase;
>         struct clk *clk;
>         unsigned long rate;
> +       unsigned long reg_delay;

unsigned int (everywhere)?
Yes, this is the result of a long-by-long division, but it should be
a small value anyway.

>
>         raw_spinlock_t lock; /* Protect the shared start/stop register */
>

> @@ -270,12 +284,26 @@ static inline u32 sh_cmt_read_cmcnt(struct sh_cmt_channel *ch)
>
>  static inline void sh_cmt_write_cmcnt(struct sh_cmt_channel *ch, u32 value)
>  {
> +       /* Tests showed that we need to wait 3 clocks here */
> +       unsigned long cmcnt_delay = ch->cmt->reg_delay * 3 / 2;

DIV_ROUND_UP()

> +       u32 reg;
> +
> +       if (ch->cmt->info->model > SH_CMT_16BIT)
> +               read_poll_timeout_atomic(sh_cmt_read_cmcsr, reg, !(reg & SH_CMT32_CMCSR_WRFLG),
> +                                        1, cmcnt_delay, false, ch);
> +
>         ch->cmt->info->write_count(ch->ioctrl, CMCNT, value);
> +       udelay(cmcnt_delay);
>  }

> @@ -1032,10 +1043,16 @@ static int sh_cmt_setup(struct sh_cmt_device *cmt, struct platform_device *pdev)
>         if (ret < 0)
>                 goto err_clk_unprepare;
>
> -       if (cmt->info->width == 16)
> -               cmt->rate = clk_get_rate(cmt->clk) / 512;
> -       else
> -               cmt->rate = clk_get_rate(cmt->clk) / 8;
> +       rate = clk_get_rate(cmt->clk);
> +       if (!rate) {
> +               ret = -EINVAL;
> +               goto err_clk_disable;
> +       }
> +
> +       /* We shall wait 2 input clks after register writes */
> +       if (cmt->info->model >= SH_CMT_48BIT) // FIXME: Really not needed for older ones?
> +               cmt->reg_delay = 2000000UL / rate + 1;
> +       cmt->rate = cmt->info->width == 16 ? rate / 512 : rate / 8;

cmt->rate = rate / (cmt->info->width == 16 ? 512 : 8);

>
>         /* Map the memory resource(s). */
>         ret = sh_cmt_map_memory(cmt);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
