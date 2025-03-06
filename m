Return-Path: <linux-renesas-soc+bounces-14073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC293A54B6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AC6F7A8BC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93308209F44;
	Thu,  6 Mar 2025 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djNdtBsD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB254BA4A;
	Thu,  6 Mar 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266293; cv=none; b=uZd/N8f10ht+vnsWex80zZgrkZMVazgZr3V8gpkky6V78bPiPiqY6ied1m0jFcCU5kaM9ZhyjA5A12YFnQEaqxeLiBibRXfa1GRlh8WcY4ohRN3I23sUcMzBkKxo+l9mS19u2QqqKmin/sbw+LausoAdPSDQ25+DLjop+726YUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266293; c=relaxed/simple;
	bh=qCDKpADemGDDYCfhI/N5KOQxe8pDvVbHCSJnDL6GYtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aj2Dv0OYam2+6dGWlqwWGg2HUryNqPnC4kHBPyjX6OUavxYXHuPfPNCv5RamFPkK/YRk8odRJ2M38w8y1ehyMbt/fZBdPt9Qo995K+Xd6yi8PVWPiCsfwdQ4UbsH1p21mUD+TiM5oXnEe+WReAp05U2E/5rFei7DADrm3v9mtqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djNdtBsD; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e1b11859a7so2134236d6.1;
        Thu, 06 Mar 2025 05:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741266290; x=1741871090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwtQbo4c/+0nP1ZBh3OcW9J/EfLuZOrEvjWNhxSbfx0=;
        b=djNdtBsDZeGelXkr0YzAo3M2IVLv9Zt3/E48okoyqsqiOwdpL3QphGUqszIUv7srTf
         Ph6OLgPgCjgci9aGEGRJW0dn/lWvHKtn0bQMd5A8MTp4IeOddN+Pj4B3AMbkHKCSElE9
         PUAANKR/YJc7D9cShz54V/qqGkUIS8rfsYG8+G2UkVdTIs/6oJ3vucDkOWGqkYmYOecG
         O891CA0Aq5dGtu6LWiehB1/ci/RhVhBdavxRgesgptF5KYMStUR2TV8IeZN2TDFyuaJc
         GnutF/Bk2a9aynwx6iY/vfKGOxJSOgQV6EVNmB7MIuptaE2wmrrFAUxLRXkywfaQ8qNx
         x23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266290; x=1741871090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwtQbo4c/+0nP1ZBh3OcW9J/EfLuZOrEvjWNhxSbfx0=;
        b=ObvESyLWqzAjeZ76Epy5Bibvoi4W7yxpqNbZp6eFK4MXk1Oaqzcs965cHFuCVZlZ1X
         fB6+xZSlHtTYHkmwOt9+OwsN2aJBI61o+LsNUGBF1GiSPsj6TkOKukTh0F35R9v7B3TT
         msGKBBenYQc5w+ms4KeSWU1CkEsc2fvAM8JE5yiBiIhCK/458VAlwg1d/0eD9/DDpf3T
         LyGqaqisivNhciTSZdxdi2tbCKjXXEFhlOU2QZ1rvYrbmayJ7hI5zED8DM6b8IRd2adl
         daeI6Bha11zkhXKHQH98xGGFQBATFx+DrJxOvIuGgS/QyVQk5SAY7MN/vPVa/C3Tu46m
         ExSA==
X-Forwarded-Encrypted: i=1; AJvYcCVtrNwLZNXwhxlEBQgiWrxhG0D2qLaUg+A/gh8rfVGurpx+2sPkPIhQHfrwwEsxDBAXTs7ciB/IBIPmGXKD@vger.kernel.org, AJvYcCW+YfBZiY+Gfu6ySSk3It4FGZZ8LGdYHLy6yE4f4+BUppy7tMCBT8N+GIw+C5yUlnAglKtdrixZoAgHnFjSKMVeK/g=@vger.kernel.org, AJvYcCX53tUdc9KjE8ShifM13CTjo9E5lu07MXZU18uV9Goz1FuEMqFc+CucOBLY2i7xdTw6D6CydDp0gas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLLNtvDWmCbkF1zSFzAvC0FYaahHrPb4FsEhreAZv33RmCoGx
	y11ZnTy6IrNjxPrCS4NIiPDmbDo4obI2jPM9w+18p8YoPek8t0QL7q0MOgMpi1UDkD7eCzKNiIV
	seq3kTFk4e+UXAzAfWjljJ6whQTI=
X-Gm-Gg: ASbGncu9NmkqgfG0IMXLQ7XGuUNupfieruJ1uQh9phdc+Ie5q5J9XC03sGYZ5ysyZnH
	rTFj7UOJAx61iAM5quMW4cEfMAcixUoI6UEEJcuS4T1h2l175FrEDybC4JDBsLgkSTAQo1q7XeN
	5osqVgtH0uOz73Ra+OD+I/iIlJ3FYboMsDlrrCzuHYIT3/PnHSjFwzHTxOsQ==
X-Google-Smtp-Source: AGHT+IG3jsf38OT7KWRRfxdlMxgW5pX91fPtiKVDYvVnc1lux9uapmuHdKZS92YY6eWhXtrSE5hdsgHhdFYuxrlr/gI=
X-Received: by 2002:a05:6214:3002:b0:6e8:91fd:cfc0 with SMTP id
 6a1803df08f44-6e8e6cdd70fmr104063636d6.16.1741266290454; Thu, 06 Mar 2025
 05:04:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com>
In-Reply-To: <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Mar 2025 13:04:24 +0000
X-Gm-Features: AQ5f1JrimiJhSM8I2aViC79LpPFgUNwzAcs3MANZ_cWJOmq-VxT3mgANqF6Vgl0
Message-ID: <CA+V-a8uvfb=a=K1YzGNeZdiAzeXWMpdbxj=6UuL_xQfxKmOBZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Mar 5, 2025 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU bein=
g
> > disabled by default in TF-A. Add support for enabling PLL clocks in the
> > RZ/V2H(P) CPG driver to manage this.
>
> Does it make sense to enable the GPU PLL if no GPU is present?
>
No it doesn't,  PLLGPU is enabled on needs basis ie if GPU node is
enabled the PLLGPU is enabled, if GPU is disabled the PLLGPU will be
untouched and will remain OFF. Note I also have a patch which does
disable the PLL's but I have not added as this isn't tested with the
full system running and I'm not sure if there will be any radiation if
we turn ON/OFF PLLs (Im discussing this internally once approved I
will add support to disable PLLs too).

GPU node enabled in board DTS:
---------------------------------------------
root@rzv2h-evk-alpha:~# cat /sys/kernel/debug/clk/clk_summary | grep gpu
    .pllgpu                          1       1        0
1260000000  0          0     50000      Y      deviceless
        no_connection_id
       .pllgpu_gear                  1       1        0
630000000   0          0     50000      Y         deviceless
           no_connection_id
          gpu_0_clk                  1       2        0
630000000   0          0     50000      Y            14850000.gpu
              no_connection_id

                                             14850000.gpu
      no_connection_id
             gpu_0_ace_clk           0       1        0
400000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
             gpu_0_axi_clk           1       2        0
400000000   0          0     50000      Y               14850000.gpu
                 bus
root@rzv2h-evk-alpha:~#

GPU node disabled in board DTS:
---------------------------------------------
root@rzv2h-evk-alpha:~# cat /sys/kernel/debug/clk/clk_summary | grep gpu
    .pllgpu                          0       0        0
1260000000  0          0     50000      N      deviceless
        no_connection_id
       .pllgpu_gear                  0       0        0
630000000   0          0     50000      Y         deviceless
           no_connection_id
          gpu_0_clk                  0       0        0
630000000   0          0     50000      N            deviceless
              no_connection_id
             gpu_0_ace_clk           0       0        0
400000000   0          0     50000      N               deviceless
                 no_connection_id
             gpu_0_axi_clk           0       0        0
400000000   0          0     50000      N               deviceless
                 no_connection_id
root@rzv2h-evk-alpha:~#


> > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > transitions. With the `enable` callback, PLLGPU will be turned ON only
> > when the GPU node is enabled; otherwise, it will remain off. Define new
> > macros for PLL standby and monitor registers to facilitate this process=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/renesas/rzv2h-cpg.c | 57 +++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2=
h-cpg.c
> > index 1ebaefb36133..d7230a7e285c 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -56,9 +56,16 @@
> >
> >  #define CPG_CLKSTATUS0         (0x700)
> >
> > +#define PLL_STBY_RESETB                BIT(0)
> > +#define PLL_STBY_RESETB_WEN    BIT(16)
>
> Please move these just below the definition of PLL_STBY_OFFSET().
> (Hmm, [KMP]DIV() should be below PLL_CLK1_OFFSET(), and
>  SDIV() below PLL_CLK2_OFFSET()).
>
OK.

> > +#define PLL_MON_RESETB         BIT(0)
> > +#define PLL_MON_LOCK           BIT(4)
>
> Please move these just below the definition of PLL_MON_OFFSET().
>
OK.

> > +
> >  #define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
> >  #define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> >  #define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
> > +#define PLL_STBY_OFFSET(n)     (PLL_CLK1_OFFSET(n) - (0x4))
>
> Let's subtract 4...
>
> > +#define PLL_MON_OFFSET(n)      (PLL_STBY_OFFSET(n) + (0x10))
>
> ... and add 0x10. Where are we now? ;-)
>
> I think it would be better to store the PLL base offset instead of the
> PLL CLK1 offset in cpg_core_clk.cfg.conf, and define offsets
> relative to that:
>
You mean PLL_STBY offset in cpg_core_clk.cfg.conf and have the below
CPG_PLL_XX macros.

Or maybe instead of using a conf can I add the below?

+/**
+ * struct pll - Structure for PLL configuration
+ *
+ * @offset: STBY register offset
+ * @clk: Flag to indicate if CLK1/2 are accessible or not
+ * @sscen: Flag to indicate if SSCEN bit needs enabling/disabling
+ */
+struct pll {
+    unsigned int offset:8;
+    unsigned int clk:1;
+    unsigned int sscen:1;
+};
+
+#define PLL_PACK(_offset, _clk, _sscen) \
+    ((struct pll){ \
+        .offset =3D _offset, \
+        .clk =3D _clk \
+        .sscen =3D _sscen \
+    })
+
+#define PLLCA55        PLL_PACK(0x64, 1, 0)


>     #define CPG_PLL_STBY    0x000
>     #define CPG_PLL_CLK1    0x004
>     #define CPG_PLL_CLK2    0x008
>     #define CPG_PLL_MON     0x010
>
> >
> >  /**
> >   * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> > @@ -144,6 +151,54 @@ struct ddiv_clk {
> >
> >  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
> >
> > +static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       u32 mon_offset =3D PLL_MON_OFFSET(pll_clk->conf);
> > +       u32 val;
> > +
> > +       val =3D readl(priv->base + mon_offset);
>
> As mon_offset is used only once, you can combine the above 4 lines
> into a single line.
>
OK.

> > +
> > +       /* Ensure both RESETB and LOCK bits are set */
> > +       return (val & (PLL_MON_RESETB | PLL_MON_LOCK)) =3D=3D
> > +              (PLL_MON_RESETB | PLL_MON_LOCK);
> > +}
> > +
> > +static int rzv2h_cpg_pll_clk_enable(struct clk_hw *hw)
> > +{
> > +       bool enabled =3D rzv2h_cpg_pll_clk_is_enabled(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +       u32 conf =3D pll_clk->conf;
> > +       unsigned long flags =3D 0;
> > +       u32 stby_offset;
> > +       u32 mon_offset;
> > +       u32 val;
> > +       int ret;
> > +
> > +       if (enabled)
>
>     if (!rzv2h_cpg_pll_clk_is_enabled(hw))
>
> for brevity.
>
OK.

> > +               return 0;
> > +
> > +       stby_offset =3D PLL_STBY_OFFSET(conf);
> > +       mon_offset =3D PLL_MON_OFFSET(conf);
> > +
> > +       val =3D PLL_STBY_RESETB_WEN | PLL_STBY_RESETB;
> > +       spin_lock_irqsave(&priv->rmw_lock, flags);
> > +       writel(val, priv->base + stby_offset);
> > +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
>
> A single writel does not need protection by a spinlock.
>
OK, I will drop it.

> > +
> > +       /* ensure PLL is in normal mode */
> > +       ret =3D readl_poll_timeout(priv->base + mon_offset, val,
> > +                                (val & (PLL_MON_RESETB | PLL_MON_LOCK)=
) =3D=3D
> > +                                (PLL_MON_RESETB | PLL_MON_LOCK), 0, 25=
0000);
>
> How long does this typically take?
> I.e. would it make sense to use a non-zero delay_us()?
>
I'll rework on timeout value.

Cheers,
Prabhakar

