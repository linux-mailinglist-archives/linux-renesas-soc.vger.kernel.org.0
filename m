Return-Path: <linux-renesas-soc+bounces-25085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A906CC81824
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 17:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8C444E64BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F4A314D1E;
	Mon, 24 Nov 2025 16:15:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC49314D10
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000902; cv=none; b=icqIpZjkilV2g9gyrpb93Gglsi/VtIEG35z4imEvkbxtkFcWsK6nvEhSafI+KHuB31wSQPXvLJ5lMaA9qNHGab+/2Gr8bPGEKPkluS2SzXYUbiFCdtge4Pbjokp7yNaApwMqhAs3ySf/uX8cI4w+sIOZeBBoP3HjoFIW6uo9V3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000902; c=relaxed/simple;
	bh=Ct6EmmfJDAgn7B9tkHJzMK6uE8/DdEgE+4JHHWAnNSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKfPVsMuanYcf2UAMI+iZGBh9cZYx/ZmQlcWs9Y+CFbqiYLvhOF5pz7SPY8KTKh2ry+Zw3T3++kPXnDWBnm21ThOsaV9AcAAg16n4QCSCDdzdOX5xyCY0SkQUg8GaT17vecgSu61ge1Fdnie3z6lm50tAE8VC7I4JejJcDza40w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3035361e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 08:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000898; x=1764605698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skCFru9tSb5bZJKp10m7UL+/GYNhDPJb/Un2MBDqH48=;
        b=VzWOlozYB/RedSkBe0ANxfFj2P9PWlF/9q09CSs1nytZO1AMiI19sYwrp8Lta0Supj
         555BjJctT47JCBgRrRjBRJDkq9GYJWkQ7ooX5L5ESLzK1loK9Oy5Czki9euNvUvDRp6a
         YRF39ubb18IeGWtAD+rqwFVrzHoE/BGJVP4fJpdW3vDhuSD9Dqyfgc435z4mLBVuM/gM
         l592oa1VtEkx3NjGIrHTMSfKl8AjtHnYG4Vua8Ie0n9/gxp3wK3kisUxFl1BMqeZluN1
         C4fIYwEPLl7WnU3hYK7ujzxHwdme4OyZjmmL8a+fWLXn9GbNqU3eG/y33B9nTwcAFBNh
         cfIw==
X-Forwarded-Encrypted: i=1; AJvYcCX4G6hHRAjcbtBa5xVQN6IJlm8qCCCXXGXZ6P6qrUbQpWWtmbgn24+pSAaHTWwRdQH6It/vpLUK46L8lczBAXMiwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7pCtpWQ/VHaSRhC7G8a2Ng8iTm47ZJcAAKfqGyxJcTOKMtZW
	9nuOEfbCgHLhAFhvk7LCFNMraDWzXl8OZmWZe4d9qze1tgAHzWm452jGUCcCE9SvLTo=
X-Gm-Gg: ASbGncv+93sdNr3Az7vyidodlHhzzA6I9pl2uBTBlg9pc+UijhvgGAcodzJHBliP8Qg
	lEzsYT7VAXDupkm6mHHo5i0jRhutLxDW0O/s9kAn8LQGuO9jI33hg8uhKAss7PlFn9/bXx70WN7
	ksGTXbUd9Wd3o9V1E7JD70Hzdady3Cg26sNh2asoJYqZ0I/d2gUzVN5NRnUe4nE/+TICuA+Wf8H
	eji/t9/FES6V6HamN4JFoQroC6VMsKox8V+JWk9AyKrZnbGIWgPMInEh9DpWRUtGY1mB2oT6SiL
	qSY5CHYbNJVzWFzX2ckNsTeoaRmTqfR5G3OFOZcuuFG9ttzKzAU1cfV4VamzbbhdqWyJVE9zV6U
	WXwbzfk70/GLPQIIWedmmZ9UBFzRTRaiphArHiMH4kGvs5ONq+2PCRJGf9XWKFOHabfvziLUYAo
	+PTHwdhiElcVktN8jaslxUM5sbgV/WwtAFSBjw9lYgpp61QOJn
X-Google-Smtp-Source: AGHT+IFlVz5jEurVZEoICSPLp45jc731HnNZMUmxPQLyArXp11JE234Ki9u6mt7pn0cKXSNUlVp9lg==
X-Received: by 2002:a05:6122:3bcd:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-55b8d6ec7a8mr4081788e0c.4.1764000897817;
        Mon, 24 Nov 2025 08:14:57 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f657f41sm5639617e0c.9.2025.11.24.08.14.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:14:57 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3174576137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 08:14:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVx5mwZfWq45aHvjMgaYhkAbI1sqiqFAJ8wbu3VECM+ILO2IB4yJX694f0y/8ths73M1ZlnzCPinNABxqzHCl0tw==@vger.kernel.org
X-Received: by 2002:a05:6102:2c1a:b0:534:cfe0:f86c with SMTP id
 ada2fe7eead31-5e1de0881aemr4251586137.15.1764000897028; Mon, 24 Nov 2025
 08:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 17:14:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnUiaGr1dcqhB3aBYLE4STsPDqvqPoiwcR4RoK3ykxFi0wp_OUt9jBeQrg
Message-ID: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 17 Nov 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> Note this patch was originally part of series [0] as rest of the series
> is already merged into linux-next, sending only this patch as v3.
> [0] https://lore.kernel.org/all/20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v2->v3:
> - Dropped check for 800/600 MHz in
>   r9a09g077_cpg_fselxspi_determine_rate() instead compared divider values 3/4.
> - Sorted pll4d1_div3/pll4d1_div4 definitions to be with other pll4d1 dividers.
> - Dropped u64 caset in DIV_ROUND_UP_ULL()
> - Hardcoded the maxdiv when no dividers are found
> - Rebaesed to latest -next

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -58,11 +60,16 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
>  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)

Moving all of these up while applying, so SCKCR comes before SCKCR2.

>
>  enum rzt2h_clk_types {
>         CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
>         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
> +       CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn source selector */
>  };
>
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \


> @@ -148,6 +172,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>                 sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
>
>         DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),

Inserting a blank line.

>         DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
>                 dtable_24_25_30_32),
>         DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,

> +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> +                                                struct clk_rate_request *req)
> +{
> +       struct clk_divider *divider = to_clk_divider(hw);
> +       unsigned long parent_rate, best = 0, now;
> +       const struct clk_div_table *clkt;
> +       unsigned long rate = req->rate;
> +       unsigned int num_parents;
> +       unsigned int divselxspi;
> +       unsigned int div = 0;
> +
> +       if (!rate)
> +               rate = 1;
> +
> +       /* Get the number of parents for FSELXSPIn */
> +       num_parents = clk_hw_get_num_parents(req->best_parent_hw);
> +
> +       for (clkt = divider->table; clkt->div; clkt++) {
> +               parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);
> +               /* Skip if parent can't provide any valid rate */
> +               if (!parent_rate)
> +                       continue;
> +
> +               /* Determine which DIVSELXSPIn divider (3 or 4) provides this parent_rate */
> +               divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw, parent_rate,
> +                                                               num_parents);
> +               if (!divselxspi)
> +                       continue;
> +
> +               /*
> +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> +                * When divselxspi is 4 (600MHz operation), only FSELXSPIn dividers of 8 and 16
> +                * are supported. Otherwise, when divselxspi is 3 (800MHz operation),
> +                * dividers of 6, 8, 16, 32, and 64 are supported. This check ensures that
> +                * FSELXSPIx is set correctly based on hardware limitations.
> +                */
> +               if (divselxspi == 4 && (clkt->div != 8 && clkt->div != 16))
> +                       continue;

Inserting a blank line.

> +               now = DIV_ROUND_UP_ULL(parent_rate, clkt->div);
> +               if (abs(rate - now) < abs(rate - best)) {
> +                       div = clkt->div;
> +                       best = now;
> +                       req->best_parent_rate = parent_rate;
> +               }
> +       }
> +
> +       if (!div) {
> +               req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
> +               divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw,
> +                                                               req->best_parent_rate,
> +                                                               num_parents);
> +               /* default to divider 3 which will result DIVSELXSPIn = 800 MHz */
> +               if (!divselxspi)
> +                       divselxspi = 3;

Inserting a blank line.

> +               /*
> +                * Use the maximum divider based on the parent clock rate:
> +                *  - 64 when DIVSELXSPIx is 800 MHz (divider = 3)
> +                *  - 16 when DIVSELXSPIx is 600 MHz (divider = 4)
> +                */
> +               if (divselxspi == 3)
> +                       div = 64;
> +               else
> +                       div = 16;

Replacing by:

    div = divselxspi == 3 ? 64 : 16;

> +       }
> +
> +       req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> +
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20, with the above changes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

