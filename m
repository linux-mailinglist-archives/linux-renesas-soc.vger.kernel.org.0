Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B333D572F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 12:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbhGZJbX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 05:31:23 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:43643 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhGZJbX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 05:31:23 -0400
Received: by mail-vs1-f54.google.com with SMTP id j10so4882861vsl.10;
        Mon, 26 Jul 2021 03:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jjpIlEH3s0yO4Q9AxaHHwMaFxPOP1aM+EZtElR67Iw=;
        b=kTbzyKrKYxuxcViWxkhQaD5IWTsELxcRbyigHq4lO32oSfJhVNkTYXGxzikny4bQUt
         RzZ1GieMxafUgYXsz+W99+IvvLUd55EgBYQutO1WXiW2N5QChXq6qGIi0UCewk81HFuP
         Uo7ECVMQAwXSfF1n0yEeitCRpD0thq9sJR5ODJ47h+n+f8veemapusZTQHzBHtt8J9Ds
         nD6MyAjebJ/pMYRaKwlXvxqDpmMgxUxn0Ss6TTfeXBkzuTEE5HnhUB4L5NaMxrhY8l4A
         jlGVi5k0yl5kdiWUhyTeePofMln3J52788zkSKKKyNk+Q9NJ5/p8emK0GfiSC9wVSQtO
         +SZg==
X-Gm-Message-State: AOAM53038M1z6KmwplvxGdj38gM1VgT1kbQfZErw6RZnUAAMReCUUh13
        OjX+Q3IAr7FN2tzX9tmEQKm6Yt7/9s1kwXl4Ndk=
X-Google-Smtp-Source: ABdhPJxPOIS9NEA+QutNbhoOa/eySyUNthF2DTc/4RDUtvwapY98H3FptApCFeHQMgehwA4YLQXaeCaL4OP4vni4yQw=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr11332444vsf.40.1627294311783;
 Mon, 26 Jul 2021 03:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com> <20210722141351.13668-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210722141351.13668-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 12:11:40 +0200
Message-ID: <CAMuHMdWj6jjHPhP9M=W8uwj3x-eOeDCtnRLR8t8x6XY6-H7CWg@mail.gmail.com>
Subject: Re: [PATCH net-next 04/18] drivers: clk: renesas: r9a07g044-cpg: Add
 GbEthernet clock/reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jul 22, 2021 at 4:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add ETH{0,1} clock/reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -137,6 +137,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
>                                 0x578, 2),
>         DEF_MOD("usb_pclk",     R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
>                                 0x578, 3),
> +       DEF_MOD("eth0_axi",     R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
> +                               0x57c, 0),
> +       DEF_MOD("eth0_chi",     R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
> +                               0x57c, 0),
> +       DEF_MOD("eth1_axi",     R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
> +                               0x57c, 1),
> +       DEF_MOD("eth1_chi",     R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
> +                               0x57c, 1),

The AXI and CHI clocks use the same register bits, so this won't work
as expected. E.g. when disabling one clock, the other clock will be
disabled, too. The correct way to handle this is to create a new clock
type for coupled clocks, which sets the CPG_CLKON_ETH.CLK[01]_ON bit
when at least one clock is enabled, and clears the bit only when both
clocks are disabled.

>         DEF_MOD("i2c0",         R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
>                                 0x580, 0),
>         DEF_MOD("i2c1",         R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
> @@ -181,6 +189,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
>         DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
>         DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
>         DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
> +       DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
> +       DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
>         DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
>         DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
>         DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),

This part is OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
