Return-Path: <linux-renesas-soc+bounces-5826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD88FB8D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 18:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A01C4B30B9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 16:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFE0149C7A;
	Tue,  4 Jun 2024 16:02:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB4E149C55;
	Tue,  4 Jun 2024 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516920; cv=none; b=tHiO5wiwkh1i7P84MbJWTpB1wnpy7SOvWKh++m0M6TwrvGzfJF/LD+fWP5VRNylqRiJQE1A6GCsBvKVahrWVzWa/iCsYyPZPtuGZz2HbPQccSD9Motbm6NcWZmZoHKx7xcSl5Y5A3npR0YoHyIF4Ee0LQ4L/vqNausZVDhI0Qzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516920; c=relaxed/simple;
	bh=SMBSb3Dc2fwROkWUlxe5ulZUXFb6LfXWCv/+EQodzsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXWKvRqQ9wq8PY5OoNRdg9DEIDRkC4p1/K3J2OkAfmcQQ3HUhtsUCDeXUJtIHahaIFzI/em7xrusmGEfuGiLrJ5NAVJYmHpofMPJn3znOrMSXdJqqcXesi3/bDhWYBNkEwR1coyhEu+biFMqJ0cJhHn0DPj2ZFWkhXBsk+DR7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62a08091c2bso63310217b3.0;
        Tue, 04 Jun 2024 09:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516916; x=1718121716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIOf757GnuZR9iGqOgRzuj9wVjjOZufKYrP2krAzxUo=;
        b=oFsQ0r1n5jRZ4Q6BirAA972SV6spu+Cyk3Bs9bdZPlyg+Vt39cYru9j7hpxK9szW/X
         y8a41EBUHLFBBiUmyHnop9P9OVjt8MS1+2YU0Lce0GW9FlZOEPrxOYw2P50/325w7Txc
         9xPxtN37pfJLFOPocmCTKEEwZQQ3mMFmJNvA9Dqvyje0vyyZZvPZZM+6JXZnGQY0tWtE
         fPBrV5R4xekaZL6n2jBEDmogTMQBmZXP9PF3VCEeqHWtr4y9YBdLDel5+seUR41xL3JQ
         1hnVtM8/Smtq5UqhBnAYA08J/iYT1RCGnDjC5kEZdyrK1K4sMaHInn6GktZ7kyOPHcvI
         xdrA==
X-Forwarded-Encrypted: i=1; AJvYcCWaoq7ogx4+0xxeEfrjxZxcwUuGbCB+cWFT1quKdd04Aw7hJXuwsuonRjgoreC7YwGjHYgiwh48govsAvRSgsUjHsACnecaSclWI187hukfsenOsJH5QOkdSs+dUyoeSszZH9JnQyVApXbE8W4C/+ldI5qRNv/UKhcXNyEtR2sr8J5LdEx9riaW2ijfnrVuSiV0WqyPRBy3HQuLTZM7egFcRDvecwsU
X-Gm-Message-State: AOJu0YzTmG2XPltwL6BWm5IyOrXdLF03ChFxwZ9sQ7KgfWb1qH1rxeQS
	YCMK7uGyDNf+PLqRHerS+1cv/rVixlnfwMIm0/s8msP4NxQW48e684DWlWtg
X-Google-Smtp-Source: AGHT+IGMjHqqLU8NcQLUDocL6X+Aagi8Hu1AijdF21DssrTbF3gBcoOSON6V9NZbxlBhbnQmaDRvpQ==
X-Received: by 2002:a81:4f93:0:b0:627:dfbd:89e with SMTP id 00721157ae682-62c7969b500mr114778237b3.11.1717516915930;
        Tue, 04 Jun 2024 09:01:55 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766b3259sm18453877b3.109.2024.06.04.09.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:01:55 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa682a4025so5261930276.2;
        Tue, 04 Jun 2024 09:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXghGfvVDRq7y497cEE70dfqaXDhL/dOoiMu7V2zR04f9TdTYmFYChBXXSs6IZN2a+/TqWIeiOiUJBd/qUJoKjXzx13rp3NBuZ2HJKoZAas9eGl9rrhtsYYxjI6vmfcLS7AjylX6NGDuqfamNgEymRMjgwEVAlPDGWz+MHQ/3r5FEerC/n6Zv9jRIxB2QHtGdBDexJt5gKwFwFNejNOkP2hEyq2/99T
X-Received: by 2002:a25:6c89:0:b0:dfa:b412:20ae with SMTP id
 3f1490d57ef6-dfab41221efmr4047424276.7.1717516915044; Tue, 04 Jun 2024
 09:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240524082800.333991-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240524082800.333991-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2024 18:01:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPZgxsM1OsFt-+802mzajKR6CO8B9ofFzaThKsBAdGTQ@mail.gmail.com>
Message-ID: <CAMuHMdVPZgxsM1OsFt-+802mzajKR6CO8B9ofFzaThKsBAdGTQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: Add RZ/V2H CPG core wrapper driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CPG core helper wrapper driver for RZ/V2H SoC.

What is a "core helper wrapper"? ;-)

Looking at the structure, this looks like a family-specific clock driver?
Will there be more RZ/V2H-alike SoCs?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/renesas/Kconfig     |   5 +
>  drivers/clk/renesas/Makefile    |   1 +
>  drivers/clk/renesas/rzv2h-cpg.c | 673 ++++++++++++++++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h | 149 +++++++
>  4 files changed, 828 insertions(+)
>  create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
>  create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
>
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index d252150402e8..254203c2cb2e 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -40,6 +40,7 @@ config CLK_RENESAS
>         select CLK_R9A07G054 if ARCH_R9A07G054
>         select CLK_R9A08G045 if ARCH_R9A08G045
>         select CLK_R9A09G011 if ARCH_R9A09G011
> +       select CLK_R9A09G057 if ARCH_R9A09G057
>         select CLK_SH73A0 if ARCH_SH73A0
>
>  if CLK_RENESAS
> @@ -193,6 +194,10 @@ config CLK_R9A09G011
>         bool "RZ/V2M clock support" if COMPILE_TEST
>         select CLK_RZG2L
>
> +config CLK_R9A09G057
> +       bool "Renesas RZ/V2H(P) clock support" if COMPILE_TEST

Please drop "Renesas "
(few other symbols have it, I'll fix the remaining).

> +       select RESET_CONTROLLER
> +
>  config CLK_SH73A0
>         bool "SH-Mobile AG5 clock support" if COMPILE_TEST
>         select CLK_RENESAS_CPG_MSTP
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index f7e18679c3b8..79cc7c4d77c6 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)           +=3D r9a07g044-cp=
g.o
>  obj-$(CONFIG_CLK_R9A07G054)            +=3D r9a07g044-cpg.o
>  obj-$(CONFIG_CLK_R9A08G045)            +=3D r9a08g045-cpg.o
>  obj-$(CONFIG_CLK_R9A09G011)            +=3D r9a09g011-cpg.o
> +obj-$(CONFIG_CLK_R9A09G057)            +=3D rzv2h-cpg.o

If this is a family-specific clock driver, please use a separate Kconfig
symbol, like other families do, and move it ...

>  obj-$(CONFIG_CLK_SH73A0)               +=3D clk-sh73a0.o
>
>  # Family

... here.

> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +/**
> + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> + *
> + * @rcdev: Reset controller entity
> + * @dev: CPG device
> + * @base: CPG register block base address
> + * @rmw_lock: protects register accesses
> + * @clks: Array containing all Core and Module Clocks
> + * @num_core_clks: Number of Core Clocks in clks[]
> + * @num_mod_clks: Number of Module Clocks in clks[]
> + * @num_resets: Number of Module Resets in info->resets[]
> + * @info: Pointer to platform data
> + */
> +struct rzv2h_cpg_priv {
> +       struct reset_controller_dev rcdev;
> +       struct device *dev;
> +       void __iomem *base;
> +       spinlock_t rmw_lock;

Unused

> +
> +       struct clk **clks;
> +       unsigned int num_core_clks;
> +       unsigned int num_mod_clks;
> +       unsigned int num_resets;
> +
> +       const struct rzv2h_cpg_info *info;
> +};

> +static struct clk
> +*rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> +                              void *data)
> +{
> +       unsigned int clkidx =3D clkspec->args[1];
> +       struct rzv2h_cpg_priv *priv =3D data;
> +       struct device *dev =3D priv->dev;
> +       const char *type;
> +       struct clk *clk;
> +
> +       switch (clkspec->args[0]) {
> +       case CPG_CORE:
> +               type =3D "core";
> +               clk =3D priv->clks[clkidx];

No range checking?

> +               break;
> +
> +       case CPG_MOD:
> +               type =3D "module";
> +               if (clkidx >=3D priv->num_mod_clks) {
> +                       dev_err(dev, "Invalid %s clock index %u\n", type,
> +                               clkidx);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               clk =3D priv->clks[priv->num_core_clks + clkidx];
> +               break;
> +
> +       default:
> +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args=
[0]);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (IS_ERR(clk))
> +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> +                       PTR_ERR(clk));
> +       else
> +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> +                       clkspec->args[0], clkspec->args[1], clk,
> +                       clk_get_rate(clk));
> +       return clk;
> +}

> +static void __init
> +rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> +                          const struct rzv2h_cpg_info *info,
> +                          struct rzv2h_cpg_priv *priv)
> +{
> +       struct mstp_clock *clock =3D NULL;
> +       struct device *dev =3D priv->dev;
> +       unsigned int id =3D mod->id;
> +       struct clk_init_data init;
> +       struct clk *parent, *clk;
> +       const char *parent_name;
> +       unsigned int i;
> +
> +       WARN_DEBUG(id < priv->num_core_clks);
> +       WARN_DEBUG(id >=3D priv->num_core_clks + priv->num_mod_clks);
> +       WARN_DEBUG(mod->parent >=3D priv->num_core_clks + priv->num_mod_c=
lks);
> +       WARN_DEBUG(PTR_ERR(priv->clks[id]) !=3D -ENOENT);
> +
> +       if (!mod->name) {
> +               /* Skip NULLified clock */
> +               return;
> +       }

Do you have NULLified clocks?


> new file mode 100644
> index 000000000000..689c123d01c5
> --- /dev/null
> +++ b/drivers/clk/renesas/rzv2h-cpg.h

> +/**
> + * struct rzv2h_mod_clk - Module Clocks definitions
> + *
> + * @name: handle between common and hardware-specific interfaces
> + * @id: clock index in array containing all Core and Module Clocks
> + * @parent: id of parent clock
> + * @off: register offset

control register offset

> + * @bit: ON/MON bit

> + * @monoff: monitor register offset
> + * @monbit: monitor bit
> + */
> +struct rzv2h_mod_clk {
> +       const char *name;
> +       unsigned int id;
> +       unsigned int parent;
> +       u16 off;
> +       u8 bit;

Perhaps name them ctrl{off,bit}?

However, as all CPG_CLKONn registers are contiguous, storing
the register index (u8) might be better than the register offset (u16)?

> +       u16 monoff;
> +       u8 monbit;

Likewise for the CPG_CLKMONx registers...

> +};
> +
> +#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit) =
       \
> +       { \
> +               .name =3D _name, \
> +               .id =3D MOD_CLK_BASE + (_id), \
> +               .parent =3D (_parent), \
> +               .off =3D (_off), \
> +               .bit =3D (_bit), \
> +               .monoff =3D (_monoff), \
> +               .monbit =3D (_monbit), \
> +       }
> +
> +#define DEF_MOD(_name, _id, _parent, _off, _bit, _monoff, _monbit)     \
> +       DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit)
> +
> +/**
> + * struct rzv2h_reset - Reset definitions
> + *
> + * @off: reset register offset
> + * @bit: reset bit
> + * @monoff: monitor register offset
> + * @monbit: monitor bit
> + */
> +struct rzv2h_reset {
> +       u16 resoff;
> +       u8 resbit;
> +       u16 monoff;
> +       u8 monbit;

... and the CPG_RSTx and CPG_RSTMONx registers.


> +};
> +
> +#define DEF_RST(_id, _resoff, _resbit, _monoff, _monbit)       \
> +       [_id] =3D { \
> +               .resoff =3D (_resoff), \
> +               .resbit =3D (_resbit), \
> +               .monoff =3D (_monoff), \
> +               .monbit =3D (_monbit) \
> +       }
> +
> +/**
> + * struct rzv2h_cpg_info - SoC-specific CPG Description
> + *
> + * @core_clks: Array of Core Clock definitions
> + * @num_core_clks: Number of entries in core_clks[]
> + * @num_total_core_clks: Total number of Core Clocks (exported + interna=
l)
> + *
> + * @mod_clks: Array of Module Clock definitions
> + * @num_mod_clks: Number of entries in mod_clks[]
> + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> + *
> + * @resets: Array of Module Reset definitions
> + * @num_resets: Number of entries in resets[]
> + *
> + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> + *                 should not be disabled without a knowledgeable driver
> + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> + * @pll_get_clk1_offset: Function pointer to get PLL CLK1 offset
> + * @pll_get_clk2_offset: Function pointer to get PLL CLK2 offset
> + */
> +struct rzv2h_cpg_info {

> +       /* function pointers for PLL information */
> +       int (*pll_get_clk1_offset)(int clk);
> +       int (*pll_get_clk2_offset)(int clk);

Why are these function pointers?

> +};
> +
> +#endif /* __RENESAS_RZV2H_CPG_H__ */

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

