Return-Path: <linux-renesas-soc+bounces-16023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE081A8A243
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 17:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B5027ADD6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA292BD596;
	Tue, 15 Apr 2025 14:58:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9229A3C7;
	Tue, 15 Apr 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729108; cv=none; b=gr+szJ9ubUOMN6m7Kuy1zNvzIRFnglHudt/pDfnypydy3R5qzhycijBnUOzaIMWwCSsd1+psZLZXIiR/jRTNekfx/Y6ZoTKKaZnwEIN4GN/oUoSBDJhdxmUw5CfE0qvMwTe9bOR0nAOGyVTzsbZC9QR0QUb1dRuYZG2m2auDW5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729108; c=relaxed/simple;
	bh=yj24jdntq7KtOcQz/LewZwXTbNubrVvLzcvOkoHp5D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAGfL30+Q83ZbsZhjijvBJVHW+OWgW8LOHnTls9Le9oF5jZCSsNpJ5tqnTzGTTPTZrTtB1BoxA/9Z3vpmIPA23ZGmLaBYXXX6EWCLXEIl7ApDDcknoRE5/hD20nfnopF+Oi3gS59Jdk+fUBSBGLjpjVD+Cr2llxpIe/BRabIaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5262475372eso2351508e0c.2;
        Tue, 15 Apr 2025 07:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729105; x=1745333905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4a6j47dvp+eA1P3zGtnscPx3AJ8IAar6Kj7Z5zUOvU=;
        b=XMfMXg+JvY1Ll4Tj5KLIjGDukLADUmB6l98ciybsFvkOfa9aGLJU2QJ9nG5JKvs7G6
         lHpRu57R3MzkqLm8yS1+NIM5LdByEj03EL01E44OtJBcMI1g//6xp6+nwiO1S2kJ23s5
         uPWpiQoAyqyxNRYsKZ7ZZPx6i2OQbHTu+lZFUFH6Pz4uuRvKA621iwvRvCXgG4P8NGt6
         pw6v7U7LBcAAdzHAAsSs7kkFYQ4dWx3TTxcxa+Z00SDjHvdOSHW3ynWbqY5SkhVPBn0b
         1dHH8rKTTusVVimM/n4lBNJ0v5ct5kYLWJLysgbyduyb1iJK6RRxo0wXRzwuSOHjLMRG
         Be3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9g/WPjtNZqgHaX7QZxPXsZMR9WjQK1x0SzmBHDW1HoAlCt/N7rvw51kD6odCSPKhqNZR8DwR4rdST@vger.kernel.org, AJvYcCVHJ65A5yr2G1OqddL3d2h/l0Ih29P44wuk3Jt16nOckgsbcguV7QNkVCUECJLQ/h4P6RtdzNkcKylnRpZSyfqVbcM=@vger.kernel.org, AJvYcCVPpIxsQx33oEFu+fgyKkSzwEfwBCqTt5zj0snYjS7ryDsuOOSuiuMPHIn+FvHsaHAtEs5RcrvYiRF9m9WZ@vger.kernel.org, AJvYcCXZcUrmtmovuch6Rf/C0LTyFp4fv34DOXb/yu7x/39hQbjJkVo9coTwllqS0QrkHEvUIs5uT5bnFrsy@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+d+MX5DesxpT5Abi4nnc1AFkbwUK3Z6PNIyMKTX22NPpPycr
	ZySc6lL4/RUCmOCLlbyanMshI8Chb5ztd+TS1FAknrAl/Rq+X0EZJsiElE3t
X-Gm-Gg: ASbGncu8X8DRcD1+4A37XieqghLgCryIyvGRHWulZP5l4N5AFltrCiQW91lgypHlc/3
	F9gimWEh9du2qLkhjg18AuvrHTqpVuocj6UvhT8mq83CXgykw3VblW/aGHrD2bX1Zc8WL/dFtHp
	7eeqlM7q4fA3DjamkWWmuxl9OreIFtiZcIyugtzqSq2sZ+5L1TxFyGTv86Gonfrq/5KjWrMdUvc
	3f+JPqXcO/P0NFmlHs9ocm9+RTOnar6mnVqIbucnqEtnRCnmz85liBvKUm5oZrbTTwLckERCAWP
	pqK1DKoZu5QuLH/V34vDOcyuDCSjBJUdM2sLM+Vdd8mMCYd60DBZXHaV6cppn1jIC7bXB/B1U6U
	TVYY=
X-Google-Smtp-Source: AGHT+IHYIpc6eXTwxqg2OTiCpS87O/yX0GXyVfcp5WPoZ/HlG3JXR6eXSpHI1fn7HvrahjhfOzmSIg==
X-Received: by 2002:a05:6122:2221:b0:519:fcf2:ef51 with SMTP id 71dfb90a1353d-527c34cac1fmr11330912e0c.5.1744729105366;
        Tue, 15 Apr 2025 07:58:25 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd77f82sm2692998e0c.17.2025.04.15.07.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:58:25 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c30a4bcceeso257796137.3;
        Tue, 15 Apr 2025 07:58:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1EoIjQvNAv9hxy7XPegaT6ZeOaR+7ytZNpiPl8EPKkd8h4rzBCMDXyCEHwmhndhkav8u2dLvd8ZbFxWpe90uQor8=@vger.kernel.org, AJvYcCUR76D28iITHQT9P4+vMtJu56JhNbDgmHWtWs+z3GSwUCfKyOUPJ5bBWlNFDECt0X7Mez3m0rJjq4np@vger.kernel.org, AJvYcCUT4GeMaF3dC8z6FNCfGlTH9Zkt/8IpV0zg6SJ7zXYeI8wW8yJ/KaqlLW1n/g+9LVddtNPxalGwgH5Wn2pG@vger.kernel.org, AJvYcCWgFvlwxqiqX9J5ZEUx3greebUJLJvor7kxigiFBdZUQQApqc29koXQBR3QWE7tGIvfprNimSdIJrnw@vger.kernel.org
X-Received: by 2002:a05:6102:160a:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4c9e504d016mr10205575137.25.1744729104858; Tue, 15 Apr 2025
 07:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:58:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZisqxyGL32Y-AD1UgQD9fWKG+a-o71R+KeuSqn=U6gQ@mail.gmail.com>
X-Gm-Features: ATxdqUF7uCq3d6TZFmW1hFAcHR_xum_PX4q7kLPsABlFSFkCIzYc0BA79FKRuvQ
Message-ID: <CAMuHMdWZisqxyGL32Y-AD1UgQD9fWKG+a-o71R+KeuSqn=U6gQ@mail.gmail.com>
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

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Ignore CLK_MON bits when turning on/off module clocks that use an external
> clock source.
>
> Introduce the `DEF_MOD_EXTERNAL()` macro for defining module clocks that
> may have an external clock source. Update `rzv2h_cpg_register_mod_clk()`
> to update mon_index.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -569,6 +569,25 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
> +static bool rzv2h_mod_clock_is_external(struct rzv2h_cpg_priv *priv,
> +                                       u16 ext_clk_offset,
> +                                       u8 ext_clk_bit,
> +                                       u8 ext_cond)
> +{
> +       u32 value;
> +
> +       if (!ext_clk_offset)
> +               return false;
> +
> +       value = readl(priv->base + ext_clk_offset) & BIT(ext_clk_bit);

As ext_clk_offset is actually the offset of the Static Mux Control
Registers (CPG_SSELm), this reads the current state of the mux.
However, can't the state be changed at runtime (despite it being named
a "static mux")?

> +       value >>= ext_clk_bit;
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

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

