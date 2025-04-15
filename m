Return-Path: <linux-renesas-soc+bounces-16018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD84A8A13D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E50217EA59
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C79C2951C5;
	Tue, 15 Apr 2025 14:36:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918CE1B0434;
	Tue, 15 Apr 2025 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727795; cv=none; b=KJrOLT+UAzUG4AFop9VVzwtpajh3xBYec/I1mLZDl55rNTKISFTTZuX9vpHCnVD8I3LJUJjYicC96fhLd3K1wQPV7bq/8ZMGkiTQZCynvjqESFaINymsFjghx1ZR7nfoDVYo8sElvuLCZml6n9k1DzfAYdZeQbv79Kh8KamgoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727795; c=relaxed/simple;
	bh=aHlMMNXSjyxlMjqZ/rdlSz/dzsA5T/GuKagUg8Lk6eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNfQyP5uuusOpbzkf6EhbHLwJIT0oZcJshzvIothTlMZkz8ffGWLOVg0ZxeLthIrfJTMel60ALwuwVNZ4OBCNrj2k2fqS3ZaK5LNkzknx2TFB4qEDTuF4VO1vdCOFH8IP4xgAXQ+1Oo97nHtfpIXv3MXxPqNEHkmWyeLZZtGGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769aef457bso57353351cf.2;
        Tue, 15 Apr 2025 07:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727791; x=1745332591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huDhGcroBByKUT/YKOKaER+RIBVsc6M7N9wWj5wNpMY=;
        b=rGVK7O1WsyrHkXvEXeDr6MzOyMkqA+1if992W6i0XjGNuknCySL4Uw5VLCPWmI/dh/
         EfvFUHak4OGrGQG+gYpVrbTOxrJoFpNYCktf00V8ZHOooNtGwKhOmT2tuAPs1VGy6IpG
         IyqoiOLnADilUB2SE5SbePTxStfQHfKqlYqHYSj28vONE40A8R/gbc2TWNW1XEmkuhhV
         ixmaTeprlzR+a4NE6NLWSF7Y+2vYGC1Tuq4lPE+uEhRq7TyJau9n0CUVy0cy8G22QQU1
         pAu/keo9IjvJsdlfMVeO7OCfeGiGsXG4oHqwKwX28DqNKGaL5o06jWlSFdAZ6WCia3yr
         QHrw==
X-Forwarded-Encrypted: i=1; AJvYcCU4fY/NObjaTie/7FTzimjrQq2ZJhJVynns1ZO4kEFrNBNBaEh3tEadTWY71hyVd56oW5kOXAlqrPnY@vger.kernel.org, AJvYcCVE8tOUWHMUlVaN4PHJAZ3+LoP3bhjjpG6+mHg8DyqreRF/tVpH9ZVTPPolbC4XfOIQKjsqqJPknKuX@vger.kernel.org, AJvYcCVjNT5j7NMX19NSEt8Uu4Ld8LELT8RKtd5Y9dLERSGtPBwy+ZFRKc0H6PZJ08MrJQmXUqLMWWG90qpqM/fI5r2ivp0=@vger.kernel.org, AJvYcCX71GMu7N9DlUNagXy9kJuNlRBOqnPgJ+b8zhx3LqtuuL1Rn9U5U19DzO4fZSzrtO+A+kX5NcCdaf+wTMEG@vger.kernel.org
X-Gm-Message-State: AOJu0YzpGP1KHZ+P0/p4EdT8t2vxC0Om+m/yjXMOOxlTvWbOieEDeKDN
	NuwNN/aZbOi76csQPiaX1LdZLVR4T7c1M3HVsX88N9cLv4gT4SchQX5UpJkB
X-Gm-Gg: ASbGncttlDtOjLB1eC8L/1FbUKciss0GzNZrD3qcWx8dVOhPo1aYxacMt07oNtAEDuO
	k6KqqOWElMXXXLBF7k+ZkBsA0mtZlwaj0ZO61V/anDMdgpX9N/lkd+xd+d44oBoQhmEodgHig4Y
	Vg8SSx/m42Xt0ePog8L2gWObu+1AwxbELgUJ6jyTqY6WhgiTo0HzPX+X05zRBFC3PVN1tVQb3kU
	oXFA1Doc1Op4nMZ8mTduUdTal/hgSw6ZdoS7sOglaf8IxN/ZekM2znt0i48ENAb0W4XJEZtmheQ
	FoldEtLpNSxs/EmLKAztOqeeTS8JHUlRvYZclAFS9gjCWH54xdz3pgfpxDnsEDPTcyqdft/MdHC
	axSzQeGg=
X-Google-Smtp-Source: AGHT+IFB1cyVMvD9hK7ztTc1/2ECSjke3TxoMmraJTl1yGTR1ZKCiOZbZFgHNT45lKNnpNWmyk1q3A==
X-Received: by 2002:ac8:5a0a:0:b0:477:1ee2:1260 with SMTP id d75a77b69052e-4797751566cmr265453721cf.1.1744727790559;
        Tue, 15 Apr 2025 07:36:30 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2c07fsm96365071cf.44.2025.04.15.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:36:30 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c54a9d3fcaso602488585a.2;
        Tue, 15 Apr 2025 07:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUteSfG44Q5fKMtztl0uNHEa9YuzYwfVVsvPMRx9brP2jSxzs7xUANRpPOMZJwRl06uCs7pPq8mm/qA@vger.kernel.org, AJvYcCWkZwaMGWsf83IzTI6RZadVAhl+Xob6dMxKhyIwOr5OuUAyEsvdL6PmDic3YghZdAG4vtCvt748LwGE9t3J@vger.kernel.org, AJvYcCWxKS3wp0mHatO8CYs9TdeLI/94DHG45KJthfFxC/Fqw5JUAQDaRWycJfKebciz4yIBG91lvoc/9nnS@vger.kernel.org, AJvYcCXAnaccRw0w/whghOuhuaJi0eZiNXYp42jPBZQuvLXeHyN1ODaDuYaAjlFLwI8VhgoSnIQsi3KJ1orF4Mf9sKeYdTY=@vger.kernel.org
X-Received: by 2002:a05:620a:3182:b0:7c5:71b4:3cc5 with SMTP id
 af79cd13be357-7c7af0f8807mr2508993485a.7.1744727789506; Tue, 15 Apr 2025
 07:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuqYHAv+yyOJxC3kre1vaspuXmTMev0ZBixEiEo+4saQ@mail.gmail.com>
X-Gm-Features: ATxdqUEPYaCUkSrLLkZOcuAtFSrkSXIwre0mnY3ysaJvbSzgPLZSw9AoWeSSMXM
Message-ID: <CAMuHMdXuqYHAv+yyOJxC3kre1vaspuXmTMev0ZBixEiEo+4saQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: rzv2h-cpg: Ignore monitoring CLK_MON
 bits for external clocks
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

Thanks for your patch!

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Ignore CLK_MON bits when turning on/off module clocks that use an external
> clock source.
>
> Introduce the `DEF_MOD_EXTERNAL()` macro for defining module clocks that
> may have an external clock source. Update `rzv2h_cpg_register_mod_clk()`
> to update mon_index.

So I guess you implemented this because the external clock was not
running, and you got into an infinite loop?

This looks rather fragile to me. How do you know when the clock
is actually running, and thus usable?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -569,6 +569,25 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
> +static bool rzv2h_mod_clock_is_external(struct rzv2h_cpg_priv *priv,
> +                                       u16 ext_clk_offset,

unsigned int

> +                                       u8 ext_clk_bit,

unsigned int

> +                                       u8 ext_cond)

bool

> +{
> +       u32 value;
> +
> +       if (!ext_clk_offset)
> +               return false;
> +
> +       value = readl(priv->base + ext_clk_offset) & BIT(ext_clk_bit);
> +       value >>= ext_clk_bit;

No need to shift:

    return !!value == ext_cond;

> +
> +       if (value == ext_cond)
> +               return true;
> +
> +       return false;
> +}
> +
>  static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
>  {
>         struct mod_clock *clock = to_mod_clock(hw);
> @@ -691,6 +710,11 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
>         clock->on_index = mod->on_index;
>         clock->on_bit = mod->on_bit;
>         clock->mon_index = mod->mon_index;
> +       /* If clock is coming from external source ignore the monitor bit for it */
> +       if (rzv2h_mod_clock_is_external(priv, mod->external_clk_offset,
> +                                       mod->external_clk_bit,
> +                                       mod->external_cond))

Perhaps just pass "mod" instead of three of its members, to fully
hide the logic inside the helper function?

> +               clock->mon_index = -1;
>         clock->mon_bit = mod->mon_bit;
>         clock->no_pm = mod->no_pm;
>         clock->priv = priv;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

