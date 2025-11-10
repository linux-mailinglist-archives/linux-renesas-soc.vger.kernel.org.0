Return-Path: <linux-renesas-soc+bounces-24409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A16C470BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CC283BFC0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEAC30E0C5;
	Mon, 10 Nov 2025 13:48:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F321E098
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782498; cv=none; b=T82TbA30czbfPkrmAHx74tnTf+Mws+bx3lsGymbavsGhECVvTK3/tflIVykLumcDIYraGwgMZSAHsIJL9bTBHuC7sa0b3BnXdHRhzw0FtjMjURX2gPSyG6poSmW4hoqvUlTRsX+5BaeuJB2dUpDyDjY6dSbRbnjivX7UM3G6VPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782498; c=relaxed/simple;
	bh=TLoF+tW6MGQGC3ZdXzJEdfrUV9IkUw4etXHaqpJERy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7qqhCyIcc6aEYfbiFG3ELO3izibYh7Q5JP+jk7DZxvAb2SK7yU9oLsrciQdKlXQ2/mDOr9xwByZe4P7cQonKNOoEhcMlD6d9GjVVi25SL21OZSU1lhnX4dYNiVocRrX6B05YVNKWTnMhdqMC+bTdeqRxc1LfCilO0FlOPRdNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-932e6d498b2so1694364241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782496; x=1763387296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiUUP6y/tdABD28k7Uj6Lx28HH/CBe9ubTZdjhyrBDg=;
        b=Exzi8aCmq2vG3TrQLLURHF0qAD/PsDnhaRMcJ3mJIZGr/ZtlZp3NaZjAT8MqS8QsM2
         K9L/xt1OthOthuxM8rzpTwe94s4Z7wt088ftpCBar57+O2sHABN9UZvUNPNgzUIy+BQC
         fFL2aPHST7YdrEV8/FiBC/otboC9+uNb85OdcQM48PPVYYTYsK6idKP/LILEun97Z5lT
         qimm4tRiIBQrrKkLT6gTEZNjnUU8DKSzORohm7WwNFIfVnoK7EDbP7Za2NNQS8moP0Tp
         9Q81MuzvI+APaAbk6eCvis4jcJDJbtRpdYWr4REUyhNTPDnFp5f+xqSPCNQIU5VAUvvk
         4s2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeGXFaUK8nSYReIKBYA1DL32Xryz8lZtXaALUQRDYmfmev/BOCV1g3n4ybclQh2ul9zURLnUURhUfHRi8KsVRrJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU44/KVn3MF8gzlxKxQeaP7amj2qN4oxwgUbSDOJv3JqHJ7Ct7
	yqNGsxYKR4A/04SmrEo0kF9mRXtKSAk5u+w1gJxeNN6y+fCQa/hfUcxOpDzPo1+r
X-Gm-Gg: ASbGncvgOo5vZQE+XcDPJDNTa+WG6ey5yi7/SLXNrnIMFK6KcgWSeG63S3siT9eqHz2
	o1J6OnyYTB+BW9auM8MtE+Ij3C56XyMI8G0u7M7G8LUj220svEaJOfvFASNPNr+F6u0lURLbP9I
	1xXw3lSpxN+TFRBYTbgWKFrqSor9xiklow9NT2ij8s7Hf7+0zRFZWpjkdK8UBP6CaDFykjFidny
	pmfM1OqqicbylRt1s4sCSL2phy5et0rPfpvk8OCUn0qirZ9osMDB/Tfux7YVbcSFz5whL+tmVHb
	PcokPEtkxKz2ELwd7ciHI+hpc00V0X8aaG965I48hVWLibC+AueIEcNHDMyUawvPKLmxW2pzh9x
	FXhiYXDrktY4E2jaSV3jCMveICXyz4nmfBioaecwquSwrT8EwxNe3rJr6Xw5fGf7tsXclf0KfTL
	St+8woJGHjngvYQVPG7f0st1viLg8O3pXpgM2LjBjgLnxsvo3Cv0nwF2OGMqs=
X-Google-Smtp-Source: AGHT+IFJDutJ9Aomp8Z3YS+B1QWsSK2Y0gejJBcH0D8gC1PjXFQFx5z8lLLQZ8OPSn740ilLLPHjPg==
X-Received: by 2002:a05:6102:f08:b0:5db:ceaa:1dbe with SMTP id ada2fe7eead31-5ddc477eb2emr2793996137.29.1762782495676;
        Mon, 10 Nov 2025 05:48:15 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708aa2ef2sm5795543241.14.2025.11.10.05.48.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:48:15 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93518a78d0aso1652325241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:48:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEky1T8XH5TcMW5XHRsbqMRfmSQ90xqBJWIMcblCoGK7CR9LjipAopVBgWMbWLqOuvmX4qMyZsYGcUTKkY84LL3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:510a:b0:5db:d7a5:ba18 with SMTP id
 ada2fe7eead31-5ddc4807e64mr3048323137.44.1762782494661; Mon, 10 Nov 2025
 05:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:48:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
X-Gm-Features: AWmQ_bmKTzSHX049lQiR1VHWNPu-wG2BlrvB51tlczP7EyXTuG2z2m7Th5IlB-8
Message-ID: <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
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

On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add core clocks and module clock definitions required by the xSPI
> (Expanded SPI) IP on the R9A09G077 SoC.
>
> Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 and
> add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> PCLKH as its bus clock (use as module clock parent) while the operation
> clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> provide mux/div selectors and divider tables for the supported
> XSPI operating rates.
>
> Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> where the determine_rate() callback enforces the hardware constraint:
> when the parent output is 600MHz only dividers 8 and 16 are valid,
> whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> be used. The custom determine_rate() picks the best parent/divider pair
> to match the requested rate and programs the appropriate SCKCR fields.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added custom divider clock type for XSPI clocks to enforce hardware
>   constraints on supported operating rates.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -54,12 +56,19 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
>  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)
>
> +#define DIVSELXSPI_RATE_600MHZ         600000000UL
> +#define DIVSELXSPI_RATE_800MHZ         800000000UL

I find it a bit weird that the name of the define includes its value.
Perhaps just use "600 * MEGA" resp. "800 * MEGA" in the code instead?
But see below...

> @@ -154,6 +180,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
>                 dtable_24_25_30_32),
>
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),

Please move these two just below the existing entry for ".pll4d1".

> +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
> +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
> +
>         /* Core output clk */
>         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
>                 dtable_1_2),

> @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device *dev,
>         return clk_hw->clk;
>  }
>
> +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> +                                                struct clk_rate_request *req)
> +{
> +       struct clk_divider *divider = to_clk_divider(hw);
> +       unsigned long parent_rate, best = 0, now;
> +       const struct clk_div_table *clkt;
> +       unsigned long rate = req->rate;
> +       int div = 0;

unsigned int

> +
> +       if (!rate)
> +               rate = 1;
> +
> +       for (clkt = divider->table; clkt->div; clkt++) {
> +               parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);

I had expected the use of some *_determinate_rate_*() helper, as the
parent can be changed to find a better clock rate?
Perhaps you should use a composite clock for that?

> +               /*
> +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> +                * When the parent_rate is 600MHz, only dividers of 8 and 16
> +                * are supported otherwise dividers of 6, 8, 16, 32, 64 are supported.
> +                * This check ensures that FSELXSPIx is set correctly.
> +                */
> +               if (parent_rate == DIVSELXSPI_RATE_600MHZ &&

Does this actually work as expected? I doubt parent_rate is guaranteed
to be exactly 600 or 800 MHz, and expect it can differ slightly due
to rounding.  Hence I would look at clk_fixed_factor.div instead.

> +                   (clkt->div != 8 && clkt->div != 16))
> +                       continue;
> +               now = DIV_ROUND_UP_ULL((u64)parent_rate, clkt->div);

No need to cast to u64 (DIV_ROUND_*_ULL() handle this internally).

> +               if (abs(rate - now) < abs(rate - best)) {
> +                       div = clkt->div;
> +                       best = now;
> +                       req->best_parent_rate = parent_rate;
> +               }
> +       }
> +
> +       if (!div) {
> +               u8 maxdiv = 0;
> +
> +               req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
> +               /*
> +                * If DIVSELXSPIx is set to 800MHz set the maximum divider
> +                * or else fall back to divider of 16 which is a maximum
> +                * supported divider for 600MHz operation.
> +                */
> +               if (req->best_parent_rate == DIVSELXSPI_RATE_800MHZ) {
> +                       for (clkt = divider->table; clkt->div; clkt++) {
> +                               if (clkt->div > maxdiv)
> +                                       maxdiv = clkt->div;
> +                       }
> +                       div = maxdiv;

Why not hardcode the divider, like in the else branch?

> +               } else {
> +                       div = 16;
> +               }
> +       }
> +
> +       req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);

No need to cast to u64.


> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

