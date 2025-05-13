Return-Path: <linux-renesas-soc+bounces-17028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5DAB4D90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 10:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1D5466E52
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 08:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1FF1F153A;
	Tue, 13 May 2025 08:03:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479BC1F151D;
	Tue, 13 May 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123391; cv=none; b=fPin9uqLmLpEvwA+2OR6mAF8ZaDBcUNlEwDwBLHlWaFyeIO5sHe9lHsT8veIHmtNJgeL36JplYjwedNYr3NvER9HtV5hQyOW50wo5QrYirBswuuRhhsPZynaDlx/R3AJAkmRLrhedLX4IMoW2FPYhNK1bh0RGgdUmMi17vfu16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123391; c=relaxed/simple;
	bh=Xz0gdXDv5XHURHHQ+iUWHrD/33XfS6r/5Bx860rTeI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVHAJq6f5sbVsAdHL3eNWw2hHR3Haz0oiCe+jLNmbym78ald6h6aePExhJmdBIKkt9qBe0leUeU6KyYgAV4CFgHObdDm1mvVLOZrlcyvDdjAe5fIZk+Y9SKw2yLvs3pDdEG3oEoGbqmRbHRUaswK3YwsbuXJpcb574+aM1cCJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4def6435699so1354462137.2;
        Tue, 13 May 2025 01:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123387; x=1747728187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXHqo7rRyIaXhw3+qc8NNegThcbgELXIOOOxT+mjhq0=;
        b=I7yr1OvQubGGULbPeFwlIXyA7Eiexbuyc3itc9/thPaTDtrtHm33ykV4Vbc70I91xt
         P0w6wwMrxCmRsQcBnGYoYiCOQ9O1Patg6HN+ZuwYZo1PTzJbsDhufQRFI3ED/e3A+JRS
         HNoh+DXommcjrqCADIj6z6NoI57Jh6wwwvdTkH3OyxQ3z9tNj62Efccjbc4F9MjP8FAx
         AkRLmbuFi8/ItqTOUjsrDX8axDfeaxD5h+b++opDdomqnvqppZwT1uW1oimjMsItnAl0
         e9OKnzT/gdv44xbYT13Qo2hvd80q8mL2CVHDIivzllAgGyS5x+F/4Mt/gadj1hkmqyuq
         3s3w==
X-Forwarded-Encrypted: i=1; AJvYcCU86pNTRfu8hsLLqfLMDM4RRFnRbZCB05Oi0Ch952tnZRsPqrDA71FN0rB1QOb40/+Ba6OzaMWKSJdapGsS@vger.kernel.org, AJvYcCUOoeT/TBpYksfuT48erN0ttoeSfjQbzJSKEPP7nxYboCE5fXfCrNtvJC6xPfG10UVQBw7vggjBXEo=@vger.kernel.org, AJvYcCVmNyPkZnKTdc55B0zKPycCD4CKpP6w7GXoWaC9+E9JBTqtIQ2zl2Bm2GrrzI7TsAHcparfcd99iuSy6VzxAYzJkUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61wpyfSd19jeTf4uE/8p/wpQvhGcHAUoEUwxU6URuj3RbVTDX
	0f/cfQeM7Yxa+bMNRDTSdTS6h/EkLbFHwtGkvzi41L+ZWclEN9Mfx/6Uvnxf
X-Gm-Gg: ASbGncvaR+aQyQS3aR8wmHpBiicEkEHlmKuVPSqKPz5DUo6vYppfFgUwVQboB/L8cKn
	t1bARx2wrlzKL2ezsiV40XzdWek7aA5Vjs7xLmUwkv/oRmxlGXVBuKZ/1quyx+jZej9oFAZe/PV
	yLTOWvlPqzVMQCgrRiRcEbrYEsaoQcOaAMa1QLtPxFMTe6BmOAUk5RIQW6qDmZxGLVJsY8w/o2c
	ak4u0ppsW0Fql+il87nAHWfZGWwsS/3sUa69xpeSM8+H6blz2m6nUkUz/CAxWFGWTDwa/18xt/T
	FmOYQHP4tDiZj+V2VqO4tl1rh/rcizb/a0psXh2q6f54cp91PsVIRcHPnLbGRKG+G4X9k6NBUvW
	EDwbHjLBTH1OdyA==
X-Google-Smtp-Source: AGHT+IFNBmAhsFL43gvU0VzFXgaltHnEj9qIZ1CPyp8IDUg/7wcLQ/6MnY7yyQgya0nEi0HM68f6AQ==
X-Received: by 2002:a05:6102:fa8:b0:4de:a850:9a0 with SMTP id ada2fe7eead31-4deed34e325mr13464936137.8.1747123386897;
        Tue, 13 May 2025 01:03:06 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d59sm6426287241.31.2025.05.13.01.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:03:06 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4de317a6fbcso1868926137.1;
        Tue, 13 May 2025 01:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf/wIo+/k2s/LedI8j1TqWWui3qEGobr8mrF63fl1eNd5HwvLUvXrQOxvWDexsnXaFB5z/CSTJc/bCAYMU8H7p8Gg=@vger.kernel.org, AJvYcCVLpW8BQ750UEdpZIQo4wvwR+mFVD767VbIPMHHmsi7z1gOiSduCu6Wl0n7Bb3VLhI7oWWUrInv+5M=@vger.kernel.org, AJvYcCVSg5r6N8nqeCKjjyZ4pANlvAiD2KklqtQQeGoGiai3ezPr9uePXgrrdHEb97iWLowNeJQjqvJmNbF+l+dr@vger.kernel.org
X-Received: by 2002:a67:e7c1:0:b0:4c1:924e:1a2a with SMTP id
 ada2fe7eead31-4deed410e33mr14297941137.25.1747123386337; Tue, 13 May 2025
 01:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250509160121.331073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250509160121.331073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 10:02:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpWxVDOXHGhRqHPTjG6_z3XVqT7ZdJGz7Axk8Rut3Lsw@mail.gmail.com>
X-Gm-Features: AX0GCFuKF8GYuJOLu2uJ3z1OHoS0MlWBI9eBM2Mke_jwI2a_qYrsjfzFe5egwRg
Message-ID: <CAMuHMdVpWxVDOXHGhRqHPTjG6_z3XVqT7ZdJGz7Axk8Rut3Lsw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for
 external clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 9 May 2025 at 18:01, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> For module clocks whose parent mux may select an external source, bypass
> the normal monitor (CLK_MON) register check when the external clock is
> active. Introduce a new `ext_clk_mux_index` in `struct rzv2h_mod_clk` and
> `struct mod_clock`, and detect the current mux index in
> `rzv2h_mod_clock_is_enabled()` to disable monitoring if it matches the
> external source index.
>
> Provide the `DEF_MOD_MUX_EXTERNAL()` macro for declaring external-source
> module clocks, and populate the `ext_clk_mux_index` field in
> `rzv2h_cpg_register_mod_clk()`.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped external_clk_mux_index and external_clk and introduced
>   ext_clk_mux_index.
> - Updated DEF_MOD_*() macros to include ext_clk_mux_index.
> - Added a new helper function `rzv2h_clk_mux_to_index()` to get the
>   current mux index.
> - Dropped IS_ERR() check for parent_clk in `rzv2h_clk_mux_to_index()`.
> - Updated commit description to clarify the purpose of the patch.

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -563,14 +565,38 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
> +static int rzv2h_clk_mux_to_index(struct clk_hw *hw)

Renaming to rzv2h_parent_clk_mux_to_index(), as it operates on the parent...

> +{
> +       struct clk_hw *parent_hw;
> +       struct clk *parent_clk;
> +       struct clk_mux *mux;
> +       u32 val;
> +
> +       /* This will always succeed, so no need to check for IS_ERR() */
> +       parent_clk = clk_get_parent(hw->clk);
> +
> +       parent_hw = __clk_get_hw(parent_clk);
> +       mux = to_clk_mux(parent_hw);
> +
> +       val = readl(mux->reg) >> mux->shift;
> +       val &= mux->mask;
> +       return clk_mux_val_to_index(parent_hw, mux->table, 0, val);
> +}
> +
>  static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
>  {
>         struct mod_clock *clock = to_mod_clock(hw);
>         struct rzv2h_cpg_priv *priv = clock->priv;
> +       int mon_index = clock->mon_index;
>         u32 bitmask;
>         u32 offset;
>
> -       if (clock->mon_index >= 0) {
> +       if (clock->ext_clk_mux_index >= 0) {
> +               if (rzv2h_clk_mux_to_index(hw) == clock->ext_clk_mux_index)

Collapsing into a single if-statement...

> +                       mon_index = -1;
> +       }
> +
> +       if (mon_index >= 0) {
>                 offset = GET_CLK_MON_OFFSET(clock->mon_index);

Dropping "clock->"...

>                 bitmask = BIT(clock->mon_bit);
>
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17 with the above changes.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

