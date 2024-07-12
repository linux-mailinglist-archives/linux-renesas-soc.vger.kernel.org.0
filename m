Return-Path: <linux-renesas-soc+bounces-7291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1F92F9C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22937284880
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 11:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56BF16B3A5;
	Fri, 12 Jul 2024 11:59:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED82BB15;
	Fri, 12 Jul 2024 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785585; cv=none; b=Nt5WXRUT9WPAFvCUtELFkDzwUktQoy7x9Dc/JtePFgROlhoBZO8zkJ43zErLESMr+8vdNw4BReiZaXX1lEiD5bP5sJfGk1X+iUR0kLKh53Y6i9+H1+cYq9qyk/R/vD0RUyq5AKmZYxhDnY3TNHZEaDch87cZlJcV7rPzenOxcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785585; c=relaxed/simple;
	bh=Y8GUrwKdBPeuWlGW8O+ZM3aOUDLYdjLjJDkS9cndnEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVbe8eeN+GMt9RuKv5F/LjkTpDUAORQ4DhlraavWrZ+khcn1anKwdr7gL+PRnaV4VMX+EVuyxuHTMtTRxG0EW/k++Gs0b9RcZIpL8wPw+vmNWvVJyC2uv7Kq4K5jWh+YRhVv23kN7GGINjnEaAFU4dpON5SEp2wAm8ELVzC6zLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e026a2238d8so1929768276.0;
        Fri, 12 Jul 2024 04:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720785581; x=1721390381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56u2SQbsSqy63Am7LkgkpMkl9moHRB8K1RpGAqv6ZeA=;
        b=Xf67wqwemXFZwS1TByuMCSX4mvQ4jkq8XOfePxcqhQ9kdv60sarerSBoZ4hUT7qPhz
         YpUbJMb1YOPIAS9HPeCWUSYo2OeRZSUBHeFKRIY1lzqSejmelDvWYKMM+Kg+h0HMGxuW
         O7O9KweTJzLdtTenZD48uXta6Ttb+xAI3K2HvW8xFAI8KqYURApmwfPUW7/CeWkd/uxt
         HLFREY8WVovKO7DGGFLIWQbsTuxxf3KrUJ7YlSQMQxxwAuLIwYhPaVQwWIPZ23h4eHP1
         70diPC0FhmbIhroYK+WTiEbah93GUZ68RRxIBZZbACW0U2vWTTzvv8pTxtcUJfre+XvH
         8Rzg==
X-Forwarded-Encrypted: i=1; AJvYcCWrTVJBG/nUsP7gdBlE+t3rob9TFY75+CgKsbVTCjuwo4Eomz2iOAW/NYG5UyddzTaX9hJgNd4zdgwzbe56EZqE98TPDZ9/OTQwKD9VsaHZfpRsozTwXlb8ggEQghSq1mnvYr4WCNETD8JXGBAkwgkUn3k4G4oxemUXincJ4W7JdMV+WzUKjfZ4mo/li/cyBWZudoAwCrZZEegW7gLlgOtTpaJfcd7l
X-Gm-Message-State: AOJu0Yw00Tsz5yjD3Pi4d3UT5vD/WMFUATiiVon0WuhafR/2y+zAAE/8
	IxlcAiSaDVB2T8E/lQ/UQQ5OJvnBT6IV3sTWWHtlCy/YztFPguAW3UBKc27g
X-Google-Smtp-Source: AGHT+IHjABMvzkh2uV1EIcwYjukm9P09N0AOKbnc6v4C6NjLz1r0HvMyWvtg9AXJ8uTgRd87efmW2A==
X-Received: by 2002:a25:8005:0:b0:e03:4f88:81f1 with SMTP id 3f1490d57ef6-e041b03c556mr13165897276.5.1720785581408;
        Fri, 12 Jul 2024 04:59:41 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a981cb4sm1259851276.44.2024.07.12.04.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 04:59:41 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64789495923so18576947b3.0;
        Fri, 12 Jul 2024 04:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYttJQDZfsV/x4Y+NJnxVGl2EX3lfvj4I+KRiy/t0tyRPTVJNOs/xmPhWD1LH+j/t36FQLM8oE9jIGKnI9/WzqVE7hQy4Cy48vKuFluryq+uAKFJUCK8uqBiqeEi2AmbVUcK0dLqOb0L4qWlnUc0DcBrfEMdG1yIHKhakhVGD9hO7Eij7ajK7GCaFQc1pr2VyamgNnZClkotLgZV+S246s16t1jwjA
X-Received: by 2002:a05:690c:f02:b0:64a:d5fd:f19f with SMTP id
 00721157ae682-658eec68ddemr151773527b3.18.1720785580735; Fri, 12 Jul 2024
 04:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 13:59:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
Message-ID: <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add family-specific clock driver for RZ/V2H(P) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Dropped num_hw_resets from struct rzv2h_cpg_priv
> - Dropped range_check for module clocks
> - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> - Added support for critical module clocks with DEF_MOD_CRITICAL
> - Added check for mon_index in rzv2h_mod_clock_endisable and
>   rzv2h_mod_clock_is_enabled()

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct clk * __init
> +rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
> +                          struct rzv2h_cpg_priv *priv,
> +                          const struct clk_ops *ops)
> +{
> +       void __iomem *base =3D priv->base;
> +       struct clk **clks =3D priv->clks;
> +       struct device *dev =3D priv->dev;
> +       struct clk_init_data init;
> +       const struct clk *parent;
> +       const char *parent_name;
> +       struct pll_clk *pll_clk;
> +
> +       parent =3D clks[core->parent & 0xffff];

No need to mask with 0xffff, as nothing is ever stored in the high bits.

> +static void __init
> +rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> +                          struct rzv2h_cpg_priv *priv)
> +{
> +       struct mod_clock *clock =3D NULL;
> +       struct device *dev =3D priv->dev;
> +       struct clk_init_data init;
> +       unsigned int id =3D mod->id;

This is the sole user of mod->id, which can be calculated easily from
mod->on_index and mod->on_bit.

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> +/**
> + * struct rzv2h_mod_clk - Module Clocks definitions
> + *
> + * @name: handle between common and hardware-specific interfaces
> + * @parent: id of parent clock
> + * @id: clock index in array containing all Core and Module Clocks
> + * @critical: flag to indicate the clock is critical
> + * @on_index: control register index
> + * @on_bit: ON bit
> + * @mon_index: monitor register index
> + * @mon_bit: monitor bit
> + */
> +struct rzv2h_mod_clk {
> +       const char *name;
> +       unsigned int parent;
> +       unsigned int id;

No need to store the id, as it can be calculated when needed.

> +       bool critical;
> +       u8 on_index;
> +       u8 on_bit;
> +       s8 mon_index;
> +       u8 mon_bit;

That leaves us with 1 64-bit pointer, 1 32-bit integer, and 5 bytes.
Using bitfields for the latter is complicated due to the mix of signed
and unsigned values.
However, parent can be reduced to u16, shaving off one 64-bit word
from each entry.

> +};

> +/**
> + * struct rzv2h_reset - Reset definitions
> + *
> + * @reset_index: reset register index
> + * @reset_bit: reset bit
> + * @mon_index: monitor register index
> + * @mon_bit: monitor bit
> + */
> +struct rzv2h_reset {
> +       u8 reset_index;
> +       u8 reset_bit;
> +       u8 mon_index;
> +       u8 mon_bit;
> +};
> +
> +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> +
> +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)      \
> +       [_id] =3D { \

Indexing by _id means the reset array will be very sparse.  E.g. the
innocent-looking r9a09g057_resets[] with only a single entry takes
600 bytes.

If you do need the full array for indexing, please allocate and
populate it at runtime.
As a bonus, you would no longer need rzv2h_cpg_info.info, and
r9a09g057_resets[] and r9a09g057_cpg_info[] can become __initconst.

> +               .reset_index =3D (_resindex), \
> +               .reset_bit =3D (_resbit), \
> +               .mon_index =3D (_monindex), \
> +               .mon_bit =3D (_monbit), \
> +       }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

