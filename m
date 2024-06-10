Return-Path: <linux-renesas-soc+bounces-6024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D31902B47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 00:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77CB1C21CBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 22:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D1214535A;
	Mon, 10 Jun 2024 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6uLceX0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994537143;
	Mon, 10 Jun 2024 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057017; cv=none; b=KGYHOaT7J4SJrRQ348Q/eNFz+kKleWHKBdXrqvvyL8xemIbewU7iuuVFJ25WWXdK/4mEJfsIWiJHHLD4Kw3JHk5sS3fvplRFzyaUX3evNzmNrFf+I3dR0EqIVJYK8hTApVzTA3ennmqWwCH64a1s9CqVGVs5ejRewUX+RRMPs1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057017; c=relaxed/simple;
	bh=ay4cfm5Vh6fseP07CmbZghkNIVWCHbsD/5Z3/ck6HMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfIRR4QmPjJq650Ix97vO2W/mPptCrQbhwECIwwBXRRLIUuqmz41LfqGDh5/3+ekQzzMqP/qQv0Xnl2LT/K5yXXvqo4aAMDmnAwuLj3KqS6yIpkTs1CrBRhiO4PUF3e4iI88Q6hmdgh5VJ2mLGwJHiGFepaipt9+vQ9CBPewbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6uLceX0; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4ecf4100d9dso108644e0c.1;
        Mon, 10 Jun 2024 15:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718057015; x=1718661815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37WK3YA7IDWiuaFSnLcLKkEgQk7Zp3w+7x4cWeVOqsM=;
        b=P6uLceX0USpiBAu474Ypza3vnCKX4hR7GxP0FMR7zaN81e6K0dRbEkKhXa9yKsVeMW
         OiNlortP8ooMq1A3T7spSowAx6nlwak50wLrLDTfsI+FTKaOFgM16pS6Bo1ANd/meGQ6
         NuiA9zzux734u+aHJvT/yHobNHwfPQla/dYaCzLbq2cAzmlOgjAyl9mcRIBU5NDQl32Z
         gfgDgLVDnk6nMXx0yu3oBKI0PVPJ7p10PY/moKqvwugL0Qy92alrkSWZoFKRghnwJ2Fz
         N9/0pa9GNXSikMWLj69fiI9P4jNyWXtL+1DXnabfmnembuWFU2xD5LaOcUz4AlIXTIrp
         8X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718057015; x=1718661815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37WK3YA7IDWiuaFSnLcLKkEgQk7Zp3w+7x4cWeVOqsM=;
        b=RCTm0TamejyGUMaCTAILWUZr2rJ+HROy+abi1xV+n0/df9bvvVbl0A3NkdzYFIrfdQ
         a7BmfRJgNOR6xOj/cKMB89/Ci9AHvYSgjdUT+TN3YIdZWOIy8emzhIxHnMmaatJsux6i
         0cr3Te+R2HJ8oLv6qVpgVYHqBp/hScQNDVZ4EgTDTo5Ub86nxUXnxT7/AI66BIaWWdqz
         voUnUXDU5kVPwBucb7ROP3YrJeujW9OlJNwEBj/O9lraB5vmFtGGBd8Jd5LlqK2U1Rb0
         ILqt3ut2lGvXYgBHYV+PlobPFTHqkpq+CgLTyXpr9u8J4pBW191F3x9w8b4uDCbmgI0Z
         nIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBuM2vty5+9MwcbbdTZnRMqtSWdjA8dtFvchOqKVtQXc4RSfeAGvu63LL9p+DgZjIpjJt9xGM8DVXLknDedKtvIMPxKGAJDWE3l9ZwjzGgkVvxcRSzKZuyogmsFTGPsevcO0vXIi+bgByEbXPaebu12NbPngUPCu1ZOslYnMV5F9Pa5M+Mjjzc723XHUvqLto5tufsYHKr5NUMtMzn13sVDWfeFoEJ
X-Gm-Message-State: AOJu0YyD/SE/w6I8GQP29XfJF4G691dWxdYnL3fpHFBUsqVSl+GlC9de
	jEktNy68IHXHL5pTZC2r93WY0ytOj+kiKZ8HS+m/auCkUAaBy1twu/X7/pp7KkQnmhXkrh2bUEb
	i4cgC5Lb7T/qMkgE22SEA6MaGfe0=
X-Google-Smtp-Source: AGHT+IEA8nq5wVpUdWIjizjQRrckrbSqgzcciwlVd1gcPp1d1GQna4Z/BwfT0NDNjIsJu01jpKIZs9QDNRwopwgclgE=
X-Received: by 2002:a05:6122:4010:b0:4e4:e749:32a2 with SMTP id
 71dfb90a1353d-4ecf284777emr1384635e0c.7.1718057014704; Mon, 10 Jun 2024
 15:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVPZgxsM1OsFt-+802mzajKR6CO8B9ofFzaThKsBAdGTQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVPZgxsM1OsFt-+802mzajKR6CO8B9ofFzaThKsBAdGTQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Jun 2024 23:03:07 +0100
Message-ID: <CA+V-a8tQr8gXxAfRcffP9Bz2dL66+NOYUacKx0nmZd=TTVA9FA@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: Add RZ/V2H CPG core wrapper driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jun 4, 2024 at 5:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add CPG core helper wrapper driver for RZ/V2H SoC.
>
> What is a "core helper wrapper"? ;-)
>
As this file basically uses core API for clock and reset, I worded the
commit as such.

> Looking at the structure, this looks like a family-specific clock driver?
Yes, as the CPG on RZ/V2H varies quite a bit compared to RZ/G2L I have
introduced a family-specific clock driver

> Will there be more RZ/V2H-alike SoCs?
>
I'm not sure about it tbh!

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/renesas/Kconfig     |   5 +
> >  drivers/clk/renesas/Makefile    |   1 +
> >  drivers/clk/renesas/rzv2h-cpg.c | 673 ++++++++++++++++++++++++++++++++
> >  drivers/clk/renesas/rzv2h-cpg.h | 149 +++++++
> >  4 files changed, 828 insertions(+)
> >  create mode 100644 drivers/clk/renesas/rzv2h-cpg.c
> >  create mode 100644 drivers/clk/renesas/rzv2h-cpg.h
> >
> > diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> > index d252150402e8..254203c2cb2e 100644
> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -40,6 +40,7 @@ config CLK_RENESAS
> >         select CLK_R9A07G054 if ARCH_R9A07G054
> >         select CLK_R9A08G045 if ARCH_R9A08G045
> >         select CLK_R9A09G011 if ARCH_R9A09G011
> > +       select CLK_R9A09G057 if ARCH_R9A09G057
> >         select CLK_SH73A0 if ARCH_SH73A0
> >
> >  if CLK_RENESAS
> > @@ -193,6 +194,10 @@ config CLK_R9A09G011
> >         bool "RZ/V2M clock support" if COMPILE_TEST
> >         select CLK_RZG2L
> >
> > +config CLK_R9A09G057
> > +       bool "Renesas RZ/V2H(P) clock support" if COMPILE_TEST
>
> Please drop "Renesas "
> (few other symbols have it, I'll fix the remaining).
>
OK.

> > +       select RESET_CONTROLLER
> > +
> >  config CLK_SH73A0
> >         bool "SH-Mobile AG5 clock support" if COMPILE_TEST
> >         select CLK_RENESAS_CPG_MSTP
> > diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefil=
e
> > index f7e18679c3b8..79cc7c4d77c6 100644
> > --- a/drivers/clk/renesas/Makefile
> > +++ b/drivers/clk/renesas/Makefile
> > @@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)           +=3D r9a07g044-=
cpg.o
> >  obj-$(CONFIG_CLK_R9A07G054)            +=3D r9a07g044-cpg.o
> >  obj-$(CONFIG_CLK_R9A08G045)            +=3D r9a08g045-cpg.o
> >  obj-$(CONFIG_CLK_R9A09G011)            +=3D r9a09g011-cpg.o
> > +obj-$(CONFIG_CLK_R9A09G057)            +=3D rzv2h-cpg.o
>
> If this is a family-specific clock driver, please use a separate Kconfig
> symbol, like other families do, and move it ...
>
> >  obj-$(CONFIG_CLK_SH73A0)               +=3D clk-sh73a0.o
> >
> >  # Family
>
> ... here.
>
OK, I will move it to the family section.

> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +/**
> > + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> > + *
> > + * @rcdev: Reset controller entity
> > + * @dev: CPG device
> > + * @base: CPG register block base address
> > + * @rmw_lock: protects register accesses
> > + * @clks: Array containing all Core and Module Clocks
> > + * @num_core_clks: Number of Core Clocks in clks[]
> > + * @num_mod_clks: Number of Module Clocks in clks[]
> > + * @num_resets: Number of Module Resets in info->resets[]
> > + * @info: Pointer to platform data
> > + */
> > +struct rzv2h_cpg_priv {
> > +       struct reset_controller_dev rcdev;
> > +       struct device *dev;
> > +       void __iomem *base;
> > +       spinlock_t rmw_lock;
>
> Unused
>
I will drop it.

> > +
> > +       struct clk **clks;
> > +       unsigned int num_core_clks;
> > +       unsigned int num_mod_clks;
> > +       unsigned int num_resets;
> > +
> > +       const struct rzv2h_cpg_info *info;
> > +};
>
> > +static struct clk
> > +*rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> > +                              void *data)
> > +{
> > +       unsigned int clkidx =3D clkspec->args[1];
> > +       struct rzv2h_cpg_priv *priv =3D data;
> > +       struct device *dev =3D priv->dev;
> > +       const char *type;
> > +       struct clk *clk;
> > +
> > +       switch (clkspec->args[0]) {
> > +       case CPG_CORE:
> > +               type =3D "core";
> > +               clk =3D priv->clks[clkidx];
>
> No range checking?
>
I will add a check for it.

> > +               break;
> > +
> > +       case CPG_MOD:
> > +               type =3D "module";
> > +               if (clkidx >=3D priv->num_mod_clks) {
> > +                       dev_err(dev, "Invalid %s clock index %u\n", typ=
e,
> > +                               clkidx);
> > +                       return ERR_PTR(-EINVAL);
> > +               }
> > +               clk =3D priv->clks[priv->num_core_clks + clkidx];
> > +               break;
> > +
> > +       default:
> > +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->ar=
gs[0]);
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (IS_ERR(clk))
> > +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkid=
x,
> > +                       PTR_ERR(clk));
> > +       else
> > +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> > +                       clkspec->args[0], clkspec->args[1], clk,
> > +                       clk_get_rate(clk));
> > +       return clk;
> > +}
>
> > +static void __init
> > +rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> > +                          const struct rzv2h_cpg_info *info,
> > +                          struct rzv2h_cpg_priv *priv)
> > +{
> > +       struct mstp_clock *clock =3D NULL;
> > +       struct device *dev =3D priv->dev;
> > +       unsigned int id =3D mod->id;
> > +       struct clk_init_data init;
> > +       struct clk *parent, *clk;
> > +       const char *parent_name;
> > +       unsigned int i;
> > +
> > +       WARN_DEBUG(id < priv->num_core_clks);
> > +       WARN_DEBUG(id >=3D priv->num_core_clks + priv->num_mod_clks);
> > +       WARN_DEBUG(mod->parent >=3D priv->num_core_clks + priv->num_mod=
_clks);
> > +       WARN_DEBUG(PTR_ERR(priv->clks[id]) !=3D -ENOENT);
> > +
> > +       if (!mod->name) {
> > +               /* Skip NULLified clock */
> > +               return;
> > +       }
>
> Do you have NULLified clocks?
>
Nope, I 'll drop this check.

>
> > new file mode 100644
> > index 000000000000..689c123d01c5
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > +/**
> > + * struct rzv2h_mod_clk - Module Clocks definitions
> > + *
> > + * @name: handle between common and hardware-specific interfaces
> > + * @id: clock index in array containing all Core and Module Clocks
> > + * @parent: id of parent clock
> > + * @off: register offset
>
> control register offset
>
> > + * @bit: ON/MON bit
>
> > + * @monoff: monitor register offset
> > + * @monbit: monitor bit
> > + */
> > +struct rzv2h_mod_clk {
> > +       const char *name;
> > +       unsigned int id;
> > +       unsigned int parent;
> > +       u16 off;
> > +       u8 bit;
>
> Perhaps name them ctrl{off,bit}?
>
> However, as all CPG_CLKONn registers are contiguous, storing
> the register index (u8) might be better than the register offset (u16)?
>
> > +       u16 monoff;
> > +       u8 monbit;
>
> Likewise for the CPG_CLKMONx registers...
>
> > +};
> > +
> > +#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit=
)        \
> > +       { \
> > +               .name =3D _name, \
> > +               .id =3D MOD_CLK_BASE + (_id), \
> > +               .parent =3D (_parent), \
> > +               .off =3D (_off), \
> > +               .bit =3D (_bit), \
> > +               .monoff =3D (_monoff), \
> > +               .monbit =3D (_monbit), \
> > +       }
> > +
> > +#define DEF_MOD(_name, _id, _parent, _off, _bit, _monoff, _monbit)    =
 \
> > +       DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _monoff, _monbit)
> > +
> > +/**
> > + * struct rzv2h_reset - Reset definitions
> > + *
> > + * @off: reset register offset
> > + * @bit: reset bit
> > + * @monoff: monitor register offset
> > + * @monbit: monitor bit
> > + */
> > +struct rzv2h_reset {
> > +       u16 resoff;
> > +       u8 resbit;
> > +       u16 monoff;
> > +       u8 monbit;
>
> ... and the CPG_RSTx and CPG_RSTMONx registers.
>
>
Ok, I will store the indexes for CLK/CLKMON/RST/RSTMON regs.

> > +};
> > +
> > +#define DEF_RST(_id, _resoff, _resbit, _monoff, _monbit)       \
> > +       [_id] =3D { \
> > +               .resoff =3D (_resoff), \
> > +               .resbit =3D (_resbit), \
> > +               .monoff =3D (_monoff), \
> > +               .monbit =3D (_monbit) \
> > +       }
> > +
> > +/**
> > + * struct rzv2h_cpg_info - SoC-specific CPG Description
> > + *
> > + * @core_clks: Array of Core Clock definitions
> > + * @num_core_clks: Number of entries in core_clks[]
> > + * @num_total_core_clks: Total number of Core Clocks (exported + inter=
nal)
> > + *
> > + * @mod_clks: Array of Module Clock definitions
> > + * @num_mod_clks: Number of entries in mod_clks[]
> > + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> > + *
> > + * @resets: Array of Module Reset definitions
> > + * @num_resets: Number of entries in resets[]
> > + *
> > + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> > + *                 should not be disabled without a knowledgeable driv=
er
> > + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> > + * @pll_get_clk1_offset: Function pointer to get PLL CLK1 offset
> > + * @pll_get_clk2_offset: Function pointer to get PLL CLK2 offset
> > + */
> > +struct rzv2h_cpg_info {
>
> > +       /* function pointers for PLL information */
> > +       int (*pll_get_clk1_offset)(int clk);
> > +       int (*pll_get_clk2_offset)(int clk);
>
> Why are these function pointers?
>
To get the offsets for PLL CLK1/2. But I plan to drop these and get
the offset from conf instead.

Cheers,
Prabhakar

