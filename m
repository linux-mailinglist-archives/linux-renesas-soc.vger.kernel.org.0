Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53B951B86A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 09:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbiEEHKJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 03:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbiEEHKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:10:08 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D27439B93;
        Thu,  5 May 2022 00:06:30 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id c1so2570323qkf.13;
        Thu, 05 May 2022 00:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wBJgXIebq1XDRWkw80M/tbsVjkVWmBwVz9lA2w4lvmA=;
        b=scuJ3ni+Gy0zNHNDcEWmnCSpZ5lad4BvojwOKQ69QiaUVwRyk4Dksi3ha/B70Ch8Gk
         hMbnWrltI2wgl8XEx70yynlsx/iHKRrb1DX7+wx64KXdHtMWvYh5PcCVyf7mcENZkZlK
         ebS+TeVuXjT8KAd21o788THnHDTdUzs1Jis3xv1Jl4tryff+RM0cp3CFqOOECx3l+hh5
         /XE21pMPC/x6tRpFNSqd14gE3tdfONfv9gKI3IuWW5m06Xv+4M2Xexy4fFpv8d4kQsBq
         FH5wX5YqFJqNmnkW85G4RdERpoyKJpyCYS1+LVsijtZjdViRzrrgGnv88BgJu9LSRao1
         hlNQ==
X-Gm-Message-State: AOAM531vYhRrtg04vOTxTeOPsCXQm2nxAisqdNQCKxEgJHeLXmXR9uLK
        3vyqIDtBNGoQfT/K5snQgutyF1qFsrdlaw==
X-Google-Smtp-Source: ABdhPJzMiTq3LGn/fYLRqUjVY5ihYShQwUW02xBAjIs4kqYzFJqjTwWz3Q56dAC7UakmD6Vngk6/sw==
X-Received: by 2002:a05:620a:3ca:b0:69e:88ef:5c75 with SMTP id r10-20020a05620a03ca00b0069e88ef5c75mr18775105qkm.255.1651734389390;
        Thu, 05 May 2022 00:06:29 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id b20-20020a05620a271400b0069fc13ce1d5sm426285qkp.6.2022.05.05.00.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 00:06:29 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id h10so6143800ybc.4;
        Thu, 05 May 2022 00:06:28 -0700 (PDT)
X-Received: by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr21780076ybb.36.1651734388574; Thu, 05
 May 2022 00:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 09:06:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
Message-ID: <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, May 4, 2022 at 8:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> After adding reset support to vsp, it needs a delay of 32 microseconds
> after reset operation, otherwise system hangs(due to register read/write).
> This patch fixes the system hang issue by adding delay after deassert
> operation.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> After adding reset/deassert support for vsp based on [1],
> RZ/G1N board hangs. On debugging it found that it needs a delay
> of 35 microseconds after deasserint reset. Wthout delay if
> there is any register read/write will lead to hang.
>
> This 35 microseconds value is  picked from the reset().

The 35 µs comes from the Hardware User's Manual: there should be
at least 1 RCLK cycle _in between_ asserting and deasserting reset.
The manual doesn't say anything about delays _after_ deasserting reset.

Could it be that the VSP1 driver is actually deasserting reset
too early?

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -637,6 +637,7 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
>         dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->base + priv->reset_regs[reg]);
> +

Unrelated change.

>         return 0;
>  }
>
> @@ -651,6 +652,10 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
>         dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
>
>         writel(bitmask, priv->base + priv->reset_clear_regs[reg]);
> +
> +       /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> +       udelay(35);
> +
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
