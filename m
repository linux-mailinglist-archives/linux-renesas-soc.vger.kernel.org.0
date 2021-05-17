Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A81D382873
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 11:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhEQJiY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 05:38:24 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:41963 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbhEQJiJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 05:38:09 -0400
Received: by mail-vs1-f53.google.com with SMTP id u188so2773090vsu.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 May 2021 02:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e7wXQ4j5mT2fJ/UZLjYZ8ZUWZv12p5uLDD8TbpsiQFw=;
        b=YmCN36LhKNx5eEUJxYdQUs8yi3tuiD8S8PGYLPxa5dMz0+XQKGDj6VZaHn2my1MqL7
         k6P7ounEIhGpPhhYbpWFfkBC6miz9CvOW9fWiVDWDQGRTSwfoXeIDr5u13fu7XwuiNX2
         MBvBdPYyNzhchV4P62/JxNuS2cGI/p7Sdsi4UhDeK4PHYGMO8PWusOc3VyenmQn5b6fD
         90Nx6cX113RlICq6pPCK9JGSOyY8xnjBypcL+cSgCszcwlA+DiyGFBZHJ/iuWIh0H84R
         rvfmLNaJhYQ7a5ncx5IBRKRBk4Xbu+/hwPJN+B5a2z0YGEapk09DeIg5birSimFSOyU7
         Gswg==
X-Gm-Message-State: AOAM531TskFlZt0JOpYTLe9RmcupEcmeMnDkZ4ywwHgJcNT0CLSUsGdY
        x5ISbZcZ2zOK6GhTeAdMzlnnyWuSJ4992pBcxOw=
X-Google-Smtp-Source: ABdhPJzcGryZRwZrbMEmNO212j2YVouk64aDbte9UfzAJqGrk+HE+x/fyE9Y8VAafssHGfaQbX6GRqqrECY8x0JlTUY=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr51069237vsq.40.1621244206105;
 Mon, 17 May 2021 02:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com> <87im3ici1u.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87im3ici1u.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 11:36:34 +0200
Message-ID: <CAMuHMdX-JK7eta966wsLC-sGf7Z81196wmUVs3eGyVmAwi7FWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a77995: Add ZA2 clock
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        hoai.luu.ub@renesas.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, May 17, 2021 at 2:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Implement support for the ZA2 clock which is needed
> for R-Car Sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -35,6 +35,7 @@ enum clk_ids {
>         CLK_PLL0D2,
>         CLK_PLL0D3,
>         CLK_PLL0D5,
> +       CLK_PLL0D24,
>         CLK_PLL1D2,
>         CLK_PE,
>         CLK_S0,
> @@ -62,6 +63,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
>         DEF_FIXED(".pll0d2",   CLK_PLL0D2,         CLK_PLL0,       2, 1),
>         DEF_FIXED(".pll0d3",   CLK_PLL0D3,         CLK_PLL0,       3, 1),
>         DEF_FIXED(".pll0d5",   CLK_PLL0D5,         CLK_PLL0,       5, 1),
> +       DEF_FIXED(".pll0d24",  CLK_PLL0D24,        CLK_PLL0,      24, 1),
>         DEF_FIXED(".pll1d2",   CLK_PLL1D2,         CLK_PLL1,       2, 1),
>         DEF_FIXED(".pe",       CLK_PE,             CLK_PLL0D3,     4, 1),
>         DEF_FIXED(".s0",       CLK_S0,             CLK_PLL1,       2, 1),
> @@ -75,6 +77,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
>         DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
>
>         /* Core Clock Outputs */
> +       DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D24,    1, 1),

This does not match the Hardware User's Manual (Rev. 2.20):
  1. ZA2 is not a fixed clock, but can be controlled through the ZA2CKCR
     register.  Adding support for that requires writing a custom clock
     driver.
     Of course we can consider it a fixed clock initially, and make it
     configurable later, when time permits.
  2. The parent clock is either PLL0D3 or S0, with a configurable
     post-divider of 2 or 4, yielding 200, 250, 400, or 500[*] MHz.
     Using plain PLL0D24 would mean a post-divider of 8, yielding
     125 MHz, which is not documented as a supported value.

[*] Using the default would mean:

    DEF_FIXED("za2", R8A77995_CLK_ZA2, CLK_PLL0D3, 4, 1);

>         DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
>         DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
>         DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
