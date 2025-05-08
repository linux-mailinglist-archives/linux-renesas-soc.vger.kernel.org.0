Return-Path: <linux-renesas-soc+bounces-16814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3124DAAFFE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15F9E3A7BBB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9390227CB04;
	Thu,  8 May 2025 16:06:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06927C84F;
	Thu,  8 May 2025 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720364; cv=none; b=a9OyQHMzlJ/6eakirVhWTaK+pnDWoDRcNpSqgw3p2lgCvKH+RR1fQIx+Veusn7Bs/ICODGtvef1TG+Vx/bjXa6AciAMct4A5qZkqJXeEtqIPRUBVFmU7kLhtN5ciza1p9W5KVXwyGBHtNJzbIov0ZnERwjyLe8L/kvptx7mefEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720364; c=relaxed/simple;
	bh=ihkSVWywF9TjtlNw2Ii6Pmfbivd/sXdxO0jq1ulf6EY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSM+815gwPOzO9y327IF/1EUwzqU6+70YJ3DAJyjc1k6Dfc5GTFwRO4Wa/wuh/7UZFyp4Q+vD2iByW103zHtvi5kSSbRkehordYvgl0J/sB0CQNymMXvKNQesC2va4u7l036HLGNlFKzNNMdpNMwjssz4QRP2xcPLG3WLJsIlUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2dab7a32fb7so795372fac.0;
        Thu, 08 May 2025 09:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720361; x=1747325161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9viKlCPHcZtiypyh4vkytWTu384jwtWko1AJgn/CLw=;
        b=ZyWaf/9VGgZVdp+uBrQuSJHcSaMxTm2THYbX7AntHJgJXz6Sr9ag0dZontvZFlXKxM
         QfIE0TMVWi3NKfMq5YUxTvvHM9HY5e6WFgs3/gnIMfj6/8Rx7fn/IDuNU5mgbjgisIS9
         CdiIciLolMJRlnjZC07kFoaDbkUUpMJ/5Sf0djrF7bV6zastjsFdXY2Le5+Ijhmk22f4
         xNRXA+zsfqo3o7W+yHMwV5O7x3NAtTwF5HbUtHLaKsF0XLYH+BpT2JUgOSIFOeLSmwtf
         Mx07jcoXB4UC4ImTwHzS/q0hsgRXucAmcXrRztUqdH/VaGT8qNGGCHgK08ab5VVOA616
         ftEw==
X-Forwarded-Encrypted: i=1; AJvYcCU4C8SnRE005e3vLz24lp6kKh7pfZulp2nZOwiGWk5vTOYL0/6Lh9uTMN2V+o/KjKtpwsGgETLcs34844Qk@vger.kernel.org, AJvYcCUBI6OaKaE1Rx/Z1w9uTAKEu8BwKv0x62RfXYlYb86HGP3HBvE4TB5V2q1/xRlG71qFo173QjNU4Kg=@vger.kernel.org, AJvYcCW2trwzrR/kJ4KQoz7fXZzOPJMVSebssEsyJ2C3ZlWvM/Fxe2MXiN7T2Sm6856pACJEzVsA3xZ4oKTWIeIf8n0yr/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YySKtk1rUt4p5BqPfYiG46Ja5BOwM+BXwhcCbxLdGH3zITsRGbb
	gjfor7HEI3JRqC25sG0enn+lkUZfj8eOt5meARMp6Ua7zg36QMEoaRl34e4o
X-Gm-Gg: ASbGnctjp705A3vbTNkiplfYO+o2ApNl6QDFPlURMyl8CX0iiT6u1ejyxoLNeHxDnAq
	Dd9QI6FWwkWTgqJDcMHCbOifTAOBjQX5bpAaLSly/MGh2bFFc2LiUCFv6sHZfleGp8e0WUSTuEO
	j7KWfU12xwwSWsezAP9gtZWXhYR5YarbUv1NrBOrkCuUwP7WBQU8veDa7CXelMbl86v9FcLr3Rq
	xamSsPKzw//ucpiSilauehnM+WQ13pydtb4a/df6vPd63OgNd5dIMerBoS1q/YUtKFJYDH0m5ju
	e8c5CVtllIGWu5Dj8JnKePGr+DTEgWac5tJ4VHZar1+m3XK/jlRtRauV6Lal3aN5eJ/V9lslR+t
	0iBs6+v0=
X-Google-Smtp-Source: AGHT+IGJoTeTItd0KvcACW3wZQbhBQPtChaLb9/GFTJIayGQvDMjEWln2CGN3UXeDUZDEANpfDMm4g==
X-Received: by 2002:a05:6870:e999:b0:2c2:3ae9:5b9c with SMTP id 586e51a60fabf-2dba421429bmr29387fac.2.1746720360355;
        Thu, 08 May 2025 09:06:00 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0b7f77csm100131fac.48.2025.05.08.09.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:06:00 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-403407e998eso876097b6e.0;
        Thu, 08 May 2025 09:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUTSN+PdLKSb275Q6wz47ljGjPu7k0+bJh20tFOMHBPkVKq9yu9NSBvAYQ5TSfrUp0diq1kznrvUwqUP9T+U6s2UQ=@vger.kernel.org, AJvYcCUfKF3ZNKeb+T/AelzWynp/VUsebI7hrP+Kffmbcxi3UAceXf7gP+KD7Wt8YTA0uP1sWUUW4ao4K0+8MRQ6@vger.kernel.org, AJvYcCXCgTPpvmYal9SkjmCIuR2yuAFTjspqJyXt96OVzgK93yTyo+uKTU0J4AP8RXoZ3RYna5tstPBA2k4=@vger.kernel.org
X-Received: by 2002:a05:6808:182a:b0:3f7:28ac:8068 with SMTP id
 5614622812f47-4037fe39654mr163075b6e.13.1746720359868; Thu, 08 May 2025
 09:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250428184152.428908-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250428184152.428908-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 18:05:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtQEEW3SU+f7qTDq6NVhy3LhrrwOgECdrZMfUk6vWQ2A@mail.gmail.com>
X-Gm-Features: AX0GCFsA13ugezWQtaxo0RK9_3rwzM9bCee2PL_4fXMnTRxdT89qkKk9FaJflqw
Message-ID: <CAMuHMdVtQEEW3SU+f7qTDq6NVhy3LhrrwOgECdrZMfUk6vWQ2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for
 external clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 28 Apr 2025 at 20:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce support for module clocks that may be sourced from an external
> clock rather than the on-chip PLL. Add two new fields `external_clk` and
> `external_clk_mux_index` to `struct rzv2h_mod_clk` and `struct mod_clock`
> to mark such clocks and record the mux index corresponding to the external
> input.
>
> Provide a new helper macro `DEF_MOD_MUX_EXTERNAL()` for concise declaration
> of external-source module clocks.
>
> In `rzv2h_mod_clock_is_enabled()`, detect when the parent mux selects the
> external source (by comparing the current mux index against
> `external_clk_mux_index`) and skip the normal CLK_MON register check in
> that case. Update `rzv2h_cpg_register_mod_clk()` to populate the new fields
> from the SoC info.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Renamed helper macro to `DEF_MOD_MUX_EXTERNAL()`.
> - Added a new field `external_clk_mux_index` to `struct mod_clock` to
>   store the mux index corresponding to the external input.
> - Updated the `rzv2h_mod_clock_is_enabled()` function to check if the
>   parent mux selects the external source by comparing the current mux
>   index against `external_clk_mux_index`.
> - Updated the `rzv2h_cpg_register_mod_clk()` function to populate the new
>   fields from the SoC info.
> - Updated commit description

Thanks for the update!

LGTM. But as I will not apply the second patch yet anyway, I am a
little bit more pedantic with my comments below (no offense intended,
though ;-)

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -119,6 +119,8 @@ struct pll_clk {
>   * @on_bit: ON/MON bit
>   * @mon_index: monitor register offset
>   * @mon_bit: monitor bit
> + * @external_clk: Boolean flag indicating whether the parent clock can be an external clock
> + * @external_clk_mux_index: Index of the clock mux selection when the source is an external clock
>   */
>  struct mod_clock {
>         struct rzv2h_cpg_priv *priv;
> @@ -129,6 +131,8 @@ struct mod_clock {
>         u8 on_bit;
>         s8 mon_index;
>         u8 mon_bit;
> +       bool external_clk;
> +       u8 external_clk_mux_index;

Perhaps combine these two fields into

    s8 ext_clk_mux_index;

with -1 indicating not valid, cfr. mon_bit?


>  };
>
>  #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
> @@ -567,10 +571,33 @@ static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
>  {
>         struct mod_clock *clock = to_mod_clock(hw);
>         struct rzv2h_cpg_priv *priv = clock->priv;
> +       bool skip_mon = false;
>         u32 bitmask;
>         u32 offset;
>
> -       if (clock->mon_index >= 0) {
> +       if (clock->mon_index >= 0 && clock->external_clk) {

I think the first condition can be dropped, as clock->external_clk
implies a valid mon_index.

> +               struct clk_hw *parent_hw;
> +               struct clk *parent_clk;
> +               struct clk_mux *mux;
> +               int index;
> +               u32 val;
> +
> +               parent_clk = clk_get_parent(hw->clk);
> +               if (IS_ERR(parent_clk))

Can this actually happen?

> +                       goto check_mon;
> +
> +               parent_hw = __clk_get_hw(parent_clk);
> +               mux = to_clk_mux(parent_hw);
> +
> +               val = readl(mux->reg) >> mux->shift;
> +               val &= mux->mask;
> +               index = clk_mux_val_to_index(parent_hw, mux->table, 0, val);
> +               if (index == clock->external_clk_mux_index)
> +                       skip_mon = true;
> +       }
> +
> +check_mon:
> +       if (clock->mon_index >= 0 && !skip_mon) {
>                 offset = GET_CLK_MON_OFFSET(clock->mon_index);
>                 bitmask = BIT(clock->mon_bit);
>

I am not so fond of the goto and the !skip_mon logic, and wonder
if we can improve? Perhaps spin of the index obtaining logic into a
parent_clk_mux_index() helper, and something like:

    int mon_index = clock->mon_index;

    if (clock->external_clk) {
            if (parent_clk_mux_index(hw) == clock->external_clk_mux_index))
                    mon_index = -1;
    }

    if (mon_index >= 0) {
            // do it
    }

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -192,6 +192,8 @@ enum clk_types {
>   * @on_bit: ON bit
>   * @mon_index: monitor register index
>   * @mon_bit: monitor bit
> + * @external_clk: Boolean flag indicating whether the parent clock can be an external clock
> + * @external_clk_mux_index: Index of the clock mux selection when the source is an external clock
>   */
>  struct rzv2h_mod_clk {
>         const char *name;
> @@ -203,9 +205,12 @@ struct rzv2h_mod_clk {
>         u8 on_bit;
>         s8 mon_index;
>         u8 mon_bit;
> +       bool external_clk;
> +       u8 external_clk_mux_index;

s8 ext_clk_mux_index

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

