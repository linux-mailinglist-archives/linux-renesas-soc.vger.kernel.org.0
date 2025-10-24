Return-Path: <linux-renesas-soc+bounces-23581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F91C05891
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC643AC5C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790C62853F2;
	Fri, 24 Oct 2025 10:15:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A62586E8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761300939; cv=none; b=dYo15aEEux/pORTWmiNUfKyk6pXYMJcKcCGkNz+eaSmNAtKCVQxK10JVUgjZ2VoVWvQvpRk4FGqxRKIOR5tLEafaJ7A0ChOdGNaVxPZXHGupFCaCrmpDprWQY/m4XzX6g5NNUztt/AyHVhXu8+2BdyHiYhdtPTIQJUZ8B8t7qe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761300939; c=relaxed/simple;
	bh=elTVsWdrRVyZXb9CeT0gn7vy7OzlSmdqPnuj0bdN97A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQNFZgFbBjfKSyunuzTyVOYhFLpP2yxARx1jtfjp+0dlZrDDz4mHYm1djWs2IRYcagCp86nYRmLoRsIVFanxcVLdlz8abg5JksaCowg/pSQKrcJanJExmeHJdPRWPMKu1qaD/23Kt6+ypPgjAthxwedM56YztvpnP6X3o2mTkgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-430b621ec08so19393255ab.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761300937; x=1761905737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUKThFRYge9/VpHdBSfe3W40P3TpedrdMNHqtfWCInw=;
        b=gPDHJOI7kdMxfW9B7LsAe/O3++6A7+Y88zSZs/r1p7fc/YnI/UGOr3zfHPYPWfm0Rh
         1XPJPZCJZFj0G3zxKURskvWgbqL4AKaFUox2DI6+MjwZ0JDQtOr6Rvs4TfVTqVGNAnZU
         vXvPZUnupidKt2/6ceDnkqhSIvjbl+5ozP95HMetBNVxJ9Zjbv//F3N3CFmop2CGCI31
         p2h/OTfMiRvIzR0vFgn5KnKOCSR9XVpGqsleN/iklIpHNdD8PWeEf7xSRNpIDh4gkBb8
         eA4t40lFX2Bti6Y8+oWgNQKw9mkuOyDS31xo5sqgLpabQW6w8EW3aCNYYCAqvn+kn1FM
         vREw==
X-Forwarded-Encrypted: i=1; AJvYcCUStpcXLwpgKXA/ZZgMQarfDH+0XvgaYHb84bavYS6y0JO9M4UObOVBQPbkIbi/9s6z202/vMdBJ3TaR7fNpwUcsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNehPEAJDaXThzKzQwSvZYu7wLuNxm2EmIrXkO+zUmRbKX8j63
	APfOgP8yV2I9nc+grt2C9AtkwlYyITjCZc3TZmSEut9meIoIKbtRIPR8Kw5p6to9
X-Gm-Gg: ASbGnctAEVH/SPMRkiJNlvFJCpFJpDFr6ppHJ3rC5sYjmnHo2Mr2q+dJ/15pY2fufGE
	Zk0yayvgtRE1/6GSgj6vuKQixCm6i4Y8lh9wNHdbZCt9AgwTgxPo6wmN2jAoYzc5Mvc6wubH+4/
	i+kIoJ3cmOo6OS6iz0scSi+aFAV42IfC1k5QWE5qBRyfm34BUnWWeH1vDxkLlbLvvheqYXw/nY7
	xwGUEKp2MsFLx7SCZ6vExlwNBW/wTc9zdfZV2LZhqdqPkBTYfYGcSFJJtXydHRwqKheSnspZSow
	fn3y1pu8J9OnJw1+zSjQ9aTNL9lfFHymDmtFo2h3NLFeRF3+9bFWoQST1JaAzVIrG/JG+Oo3DWv
	l4VqHTuxsK3Hm8kJXmHGZKgDfPeW+w+QS0YJLL5g4/ziVI1lj9I+DPvf6Yl7GxwqdtH4QrhPf5G
	p3FO6UGor7CvQ4S33jkQm4LkZs0j+9Ay8CrzGuEw==
X-Google-Smtp-Source: AGHT+IESuc869GlN1MEzfqZ/4EJlQwxVeWtx/91mkEKAccXoWiiO7I4xInYq6a1eGdu1DtnfKqTrQw==
X-Received: by 2002:a05:6e02:156c:b0:430:acb1:e785 with SMTP id e9e14a558f8ab-430c5208dacmr394191575ab.6.1761300936644;
        Fri, 24 Oct 2025 03:15:36 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb4e4bbefsm2014655173.5.2025.10.24.03.15.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:15:36 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-940d2b701a3so180210139f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrakHOq82zyiCTuF3lgcoY2z6L56gjbMu11Ksd5mzJC3GuEVG2kM2sHOvN5/UhFoJyaIgqm/uOdibex+6/eTPMtA==@vger.kernel.org
X-Received: by 2002:a05:6102:4496:b0:5db:2715:d01c with SMTP id
 ada2fe7eead31-5db2715d982mr2364430137.10.1761300521275; Fri, 24 Oct 2025
 03:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:08:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
X-Gm-Features: AS18NWDbAhl5j_H8OBpJGyjSPEBVaeQiqbN7vBJIAehOjNFs55YsioHkWFr2qYM
Message-ID: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module and core clocks used by xSPI (Expanded SPI) IP on the
> R9A09G077 SoC.
>
> The xSPI block uses PCLKH as its bus clock, while the operation clock
> (XSPI_CLKn) is derived from PLL4. To support this, define new selectors
> and dividers (FSELXSPI0/1 and DIVSEL_XSPI0/1) in SCKCR.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -105,6 +113,15 @@ static const struct clk_div_table dtable_1_2[] = {
>         {0, 0},
>  };
>
> +static const struct clk_div_table dtable_6_8_16_32_64[] = {
> +       {6, 64},
> +       {5, 32},
> +       {4, 16},
> +       {3, 8},
> +       {2, 6},
> +       {0, 0},
> +};
> +
>  static const struct clk_div_table dtable_24_25_30_32[] = {
>         {0, 32},
>         {1, 30},
> @@ -119,6 +136,7 @@ static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
>  static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
>  static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
>  static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
> +static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
>
>  static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         /* External Clock Inputs */
> @@ -154,6 +172,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
>                 dtable_24_25_30_32),
>
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
> +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
> +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
> +
>         /* Core output clk */
>         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
>                 dtable_1_2),
> @@ -178,9 +205,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
>         DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
>         DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> +       DEF_DIV("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
> +               FSELXSPI0, dtable_6_8_16_32_64),
> +       DEF_DIV("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
> +               FSELXSPI1, dtable_6_8_16_32_64),
>  };

Perhaps we need a custom clock for this?
According to Section 7.3.1 "SCKCR : System Clock Control Register",
some divider combinations are prohibited:
  - 4 x 6,
  - 4 x 32,
  - 4 x 64.
The last two are probably not an issue iff the xSPI driver never tries
to set the corresponding clock rates.
However, the first one may be an issue, as both 3 x 8 (valid) and 4 x 6
(prohibited) yield the same resulting divider, and I believe we cannot
be sure the clock core will never pick the prohibited combination.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

