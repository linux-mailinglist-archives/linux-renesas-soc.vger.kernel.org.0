Return-Path: <linux-renesas-soc+bounces-14228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A19A5A2A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 19:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9711895423
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 18:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A9A232367;
	Mon, 10 Mar 2025 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+XCKo7w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95772309B0;
	Mon, 10 Mar 2025 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741630942; cv=none; b=Xtz+tdh21aymWxxQS04IIYxxS4nBOycPY9ydS064PZyVONZCnYLM6P1QbtCkpTJKrR60277Dm/EMCe9lD0Ea8cv/VfQ38MC3J770oQZYN1v0QeL/nmxZ18fMK4xvnj5eILEpHTmd2AENILGaznDTpyE0AQbOnS749UKPZ1Dy9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741630942; c=relaxed/simple;
	bh=Dow8nikHJE8XsnkuX7AwuXTf/FlFHfui7cMftFHMses=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCVAecfStbLqrK0/DaZ+iB5g7sfJSvqyr1q1hNFuARzsE9RRLiwJQnqVHbcpHKw2xYADGSQyUOByb89AAHHSPEIAhdBIuKONPkIN3jYrJMJH3e1l4LlDDU5hdhVHp9ccXocfpuLl5FtLma+pThs7UKRguhDIK6aYub9+iBT8QME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+XCKo7w; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-524038ba657so1576284e0c.0;
        Mon, 10 Mar 2025 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741630939; x=1742235739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX5sgk1NrsSTqmDkZHWU3VI4LtlzTriqnBk+dv+I4P0=;
        b=U+XCKo7wF5MscTUFZg26l/eyYuISi3hvCVUYBjHIFSs1RFjmyNjx/r+g18DiZV9Hc/
         44Xmd9VjooCfsg1IfQlwo32Peo6v1bDjboyiEzkG7HAOX5gb7BEc4TQfVDZeON4MSIws
         BStgM2zGujOh183VHTfbCG6GxkcPqnSEXwFXHN7sAlw/Gpm5Sm9M/p2RwXfJuta9rThU
         XDr1v1Kc7dlJ42OgaPPAJKlGmoGrJlTpmtIFEZ4jDRaQGPXtlGjggb1WJnnViUa6jnoj
         XRHJzRewc/jbCijSjaT8pw0paapuxFtoyWGiu13n69lmKZd7WEbL22xK389AFkam9ko3
         ZlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630939; x=1742235739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX5sgk1NrsSTqmDkZHWU3VI4LtlzTriqnBk+dv+I4P0=;
        b=aBx05XpV1O0pw2EHyOff2kB7Rkt5xHUGd5Nvt4GEOyNAefXoDsLLFlA97dBCxG4Z6Z
         xSMBCtlXwlhCK8iXTmp9TgUqbmMDpTkaq4scTZmvKoJMozPO+KgWapYZDd8ZOORG0pN8
         5iTgGbWvoeEbWezI4YQ/YoZYH29SnhxkCbQexgJamVLlgnizH6fLt2FwSoiICHI2HDth
         MbBRVnY4Q1gAtIg2554sqpMVC7/kIDvWKAi/mQC27ZExoZoAthvKCAYbu+dzm2K0nhwQ
         YxrALHqKLrwSWe4P9lJN4TZ8hVhOhNj9aHSJewoiYj6+MvYa36dsItGqQwc4ut7rn5Uc
         +Unw==
X-Forwarded-Encrypted: i=1; AJvYcCUG6t+yrgdr6uCM7urKOV+y+/rSWOTpwIMItrL5aoeTO9Eru5tsX++Z8zZVapt18N8ZbY+fQ0G8pRi8JoY=@vger.kernel.org, AJvYcCW2Y3FXJUTmynDtT+lsHVdBCTUTzIAF18SBDTdDcPvapoh3mJIZ88Sa8/dtsZAVYrNjlnyHr1atEIRVfMN7JncCbaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOwQbgccetJGYawkNIWGM/a3jd/YosH4e9hKqxARbOonpGCXt
	CWsWbVHFgBO/E/FXqkn78dKl23JDwHMd3K1QY/6EesDKqF9hi8pvjK8Hw36S2bNS8aMrI9TNnTw
	HVt6FS/La9raIUVSVt8UTHigFjrw=
X-Gm-Gg: ASbGnctMdJSXy9GJ7qxStX4Lgn7rXq2nhGMG94reu5X+AYUgXErXIMciVL67kTO8J51
	VWFjm2rJABQ9oexscNWOGTP3Fflonw3TIPgRniCMG6HgrRyYSPZ4ezlyOB4D2m0RvklBUFp3RS6
	d0LrpwnH3sR9fsfDqjhuY8qthJdKfTLDoXbjfHjBYZytmpsylBjRgE1l/QPzI=
X-Google-Smtp-Source: AGHT+IEPdZEq7coX5pTau7t6SmigM2UHhPJpEQBqoV1F/spx0U3PKqxHmTngw+7V/xU1dBEu/uWWeuytZzjMsJJxwno=
X-Received: by 2002:a05:6122:469e:b0:520:4d63:72da with SMTP id
 71dfb90a1353d-524196d8362mr552754e0c.6.1741630939544; Mon, 10 Mar 2025
 11:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309211402.80886-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250309211402.80886-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309211402.80886-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Mar 2025 18:21:53 +0000
X-Gm-Features: AQ5f1Jr7XdViOvlSMZDdyZAppvrQKWrkpa5abBLYLSyis9LKmLDk6xicWFaKdXw
Message-ID: <CA+V-a8sqJy1HJYkxZONqSEsFuCmENgbs_ofLyaUChtRJpj_ebg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Sun, Mar 9, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU being
> disabled by default in TF-A. Add support for enabling PLL clocks in the
> RZ/V2H(P) CPG driver to manage this.
>
> Introduce `is_enabled` and `enable` callbacks to handle PLL state
> transitions. With the `enable` callback, PLLGPU will be turned ON only
> when the GPU node is enabled; otherwise, it will remain off. Define new
> macros for PLL standby and monitor registers to facilitate this process.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Updated macros to get PLL offsets
> - Switched to readl_poll_timeout_atomic() and updated the timeout
> ---
>  drivers/clk/renesas/rzv2h-cpg.c | 49 +++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index e489ce28ae63..76ad037b4361 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -44,12 +44,18 @@
>  #define CPG_BUS_1_MSTOP                (0xd00)
>  #define CPG_BUS_MSTOP(m)       (CPG_BUS_1_MSTOP + ((m) - 1) * 4)
>
> +#define CPG_PLL_STBY(x)                ((x))
> +#define CPG_PLL_STBY_RESETB    BIT(0)
> +#define CPG_PLL_STBY_RESETB_WEN        BIT(16)
>  #define CPG_PLL_CLK1(x)                ((x) + 0x004)
>  #define KDIV(val)              ((s16)FIELD_GET(GENMASK(31, 16), (val)))
>  #define MDIV(val)              FIELD_GET(GENMASK(15, 6), (val))
>  #define PDIV(val)              FIELD_GET(GENMASK(5, 0), (val))
>  #define CPG_PLL_CLK2(x)                ((x) + 0x008)
>  #define SDIV(val)              FIELD_GET(GENMASK(2, 0), (val))
> +#define CPG_PLL_MON(x)         ((x) + 0x010)
> +#define CPG_PLL_MON_RESETB     BIT(0)
> +#define CPG_PLL_MON_LOCK       BIT(4)
>
>  #define DDIV_DIVCTL_WEN(shift)         BIT((shift) + 16)
>
> @@ -141,6 +147,47 @@ struct ddiv_clk {
>
>  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
>
> +static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct pll_clk *pll_clk =3D to_pll(hw);
> +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> +       u32 val =3D readl(priv->base + CPG_PLL_MON(pll_clk->pll.offset));
> +
> +       /* Ensure both RESETB and LOCK bits are set */
> +       return (val & (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) =3D=3D
> +              (CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK);
> +}
> +
> +static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
> +{
> +       struct pll_clk *pll_clk =3D to_pll(hw);
> +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> +       struct pll pll =3D pll_clk->pll;
> +       u32 stby_offset;
> +       u32 mon_offset;
> +       u32 val;
> +       int ret;
> +
> +       if (rzv2h_cpg_pll_clk_is_enabled(hw))
> +               return 0;
> +
> +       stby_offset =3D CPG_PLL_STBY(pll.offset);
> +       mon_offset =3D CPG_PLL_MON(pll.offset);
> +
> +       writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +              priv->base + stby_offset);
> +
> +       /* ensure PLL is in normal mode */
> +       ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
> +                                       (val & (CPG_PLL_MON_RESETB | CPG_=
PLL_MON_LOCK)) =3D=3D
> +                                       (CPG_PLL_MON_RESETB | CPG_PLL_MON=
_LOCK), 10, 100);
This timeout didnt work when I power cycled after a complete shutdown overn=
ight.

I will update the timeout as below, this Ive made sure the below delay
works OK after complete shutdown.

/*
* Ensure PLL enters into normal mode
*
* Note: There is no HW information about the worst case latency.
*
* Since this value might be dependent on external xtal rate, pll
* rate or even the other emulation clocks rate, use 2000 as a
* "super" safe value.
*/
ret =3D readl_poll_timeout_atomic(priv->base + mon_offset, val,
                                                    (val &
(CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK)) =3D=3D

(CPG_PLL_MON_RESETB | CPG_PLL_MON_LOCK), 200, 2000);

Please let me know shall I send v3 with this change or wait for your review=
.

Cheers,
Prabhakar

