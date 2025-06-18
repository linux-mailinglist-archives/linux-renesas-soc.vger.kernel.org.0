Return-Path: <linux-renesas-soc+bounces-18501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA7ADEA8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 13:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D124617CEA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 11:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F1A28000E;
	Wed, 18 Jun 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f387vdlf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C51E51EF;
	Wed, 18 Jun 2025 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246982; cv=none; b=IinC8/e+Tc+saEgyKULEECr3UpCZIcncg3vAgQ4htkuOgulP8iKo02PuxwhHcUknt+HkBkyw4O13h37vdHXh4FTfUzynWV2+aiNKEp6AhAd0zitL3xJJyUiCcXFVVttpizRxeLP/RpR6jKVGbT/H4t0h3P2RaI/Amoyy5vgH82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246982; c=relaxed/simple;
	bh=VlfbtQYYTrjFHnqGf2jzA5p2HffdINuHDE7DsSRq51I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kyefe8Af/qfMl4QKZ4z1e1ghpmvxgx3yXsNEvvlpy0Az5B7d6HLtP4cSV+anqluwUBbd10rbgRZY+3b7W0Pkwz/S9IlzGXWyNN2SyBESrJzSFfyv3fGS8G4WOF9W0s5+5GMAxZQy4uvAtDLUmvN4Jr4Fc3UA/S3rQY5/OofZOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f387vdlf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so3872921f8f.1;
        Wed, 18 Jun 2025 04:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750246978; x=1750851778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6MMd9hKBdGUOmmbHR5SVGMjbovW8QOYngJfAtL7i+E=;
        b=f387vdlfJZM4VYGRUynf8TMqaNcV+ZZV3UomE9+7tJA1o/4pqkOf3bW6PCEQ3DIHMQ
         vAst8g7ZOfBAkdgGfXXqwUXnX7wNqmhn95uvrQ9n/uXOc2hVZUZB1tspRNF9fqc1MzOz
         hOpmfInS1aohLgqL2vSrJ1Nz9m9iaXOp59LqQ4B/FjLOM5S9U7bj6shsykO2A1zA3asO
         DdD8slc8DoNPD1+Ql4yBxBrZwW2/KGPcWAlD+lx7YgZ7dEyglgj1XEsa/9amONegEChC
         0iu5qeIXF/97rTFt18nWvemjHhFAff9Tca8SQHi0B6eSInaUIPO8+4OnOC24Dv0j5sG4
         aRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246978; x=1750851778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6MMd9hKBdGUOmmbHR5SVGMjbovW8QOYngJfAtL7i+E=;
        b=fHgtjNi5T5qgTKcNztvqjrYMaspvC4325h0ieHEGfAnVCNpKE0ITtOanLj6uaHQDmW
         3jKdG6mw5kt9PYk7LDVZ60CknOLvquRP0z+Z/TiB6j2+d9PKRldPQRxNmIXDoWN1qd93
         lix5jh+t5VcYBUW2UsaeQon3P8JqxtPZ0QYDHSXDADnXGd3PPadujz//R8NZK05kqXvc
         1UkdEzGnzYDCG7D/njFwc5j7oceirMLKdkctm/ZnjrUJu80xuRelVa6gDAebySzS/8jh
         J/57S0VnXtS4qDfTEmxvapJW1Pi8uj/1l/LW4mMIoQNKYJ5ApK3l3NJ6+wIXa0R6zWCE
         BLYw==
X-Forwarded-Encrypted: i=1; AJvYcCUX4MC/E34VocRHjX8CPiZuo1G7pu2wCtJo4Lpy8rWJYPm4HtQxjBFrczgjuMic9KZoQho0eR3roovAVgMCRN5Pwp4=@vger.kernel.org, AJvYcCW+5qZ8dOEJaJEupXsnPLESJmzY7pJ1db8/Xee+TeaqnTvSRnWdO/xSww/Z1mYTTDsxLb0+iEYMvscQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKkm+XWfnSh56xX9dVvzXnJnUavc5mFYSzeFoHwes+Yxg2HKj
	fawThBhS+sZ1NJXqWa8J1V6i7miRTxGNNN9fVK+NY9Jp1yEsbXuI4wWJ057ZJ7BLcc+rfA/nfTA
	Jpl4FSEJ31FwHpvTE5mOnMi5uCGgDn/E=
X-Gm-Gg: ASbGnctFo/DF672i/zOBGDf6kf8XFLaR2TgMlWfp0zYChgrt0K0Sg5lZYZImzTODNMz
	W5Y+fw9WuSA0t4r9qhaMtKkbxWHGb9J+dxEcrTjvhhYjXgzwPDJldB1PtswRRNRpQtrEvUbzXLv
	Qs60d8FQuarUGNgnU4NkM7wGDp++27Iq9Qp/ACGQ34owHldA==
X-Google-Smtp-Source: AGHT+IE/J/9BAftIMl+1FEUOQGntWQdQ4mWTDnxCFoSITKsZfv6wxWbm9FlWzBjCrElItY/8R8vZnLwmUaMGcthpHQU=
X-Received: by 2002:a05:6000:2010:b0:3a4:d98d:76b9 with SMTP id
 ffacd0b85a97d-3a5723aeb38mr12318525f8f.41.1750246978236; Wed, 18 Jun 2025
 04:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
 <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com> <TY3PR01MB1134654E595CF3E073FC6DB9E8672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134654E595CF3E073FC6DB9E8672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Jun 2025 12:42:31 +0100
X-Gm-Features: Ac12FXw22qhq8sskZ_hKOBwcXu-160oEzUeu6siDdolO1dG-wt2g7yzjl4vTBuM
Message-ID: <CA+V-a8t_GqGMVeC4LJKidce0BQ1_+dq_OswE+e+FqRo-FAZLUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Jun 18, 2025 at 7:21=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 17 June 2025 22:05
> > Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E suppor=
t
> >
> > Hi Geert,
> >
> > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > >
> > > Hi Biju,
> > >
> > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> w=
rote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar
> > > > > 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Ma=
r
> > > > > > > 2025 at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document
> > > > > > > > > support for the Expanded Serial Peripheral Interface
> > > > > > > > > (xSPI) Controller in the Renesas RZ/G3E
> > > > > > > > > (R9A09G047) SoC.
> > > > > > > > >
> > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > >
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-controller=
s
> > > > > > > > > +++ /renes
> > > > > > > > > +++ as,r
> > > > > > > > > +++ zg3e
> > > > > > > > > +++ -xspi.yaml
<snip>
> > Can we maybe use a unused ON index and ON bit for example 25, 0 (ie
> > 0x190) and represent this is a module clock for example for the
> > spi_clk_spix2 clock and use this in the DT and let the CPG core code ha=
ndle such turning ON/OF the
> > module clocks based on the enable count which will be handled internall=
y in the driver?
> >
> > I have some POC code for the paired clocks which will handle the enable=
 count of the paired module
> > clocks, below is the diff. Please share your thoughts.
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > index 3c5984ee27ca..8a8f59ffdb4c 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -290,10 +290,10 @@ xspi: spi@11030000 {
> >                         interrupt-names =3D "pulse", "err_pulse";
> >                         clocks =3D <&cpg CPG_MOD 0x9f>,
> >                                  <&cpg CPG_MOD 0xa0>,
> > -                                <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
> > -                                <&cpg CPG_MOD 0xa1>;
> > +                                <&cpg CPG_MOD 0xa1>,
> > +                                <&cpg CPG_MOD 0x190>;
>
> Does this dummy index need to be documented to be in bindings?
>
Yes, indeed we will have to.

> >                         clock-names =3D "ahb", "axi", "spi", "spix2";
> > -                       assigned-clocks =3D <&cpg CPG_CORE R9A09G057_SP=
I_CLK_SPI>;
> > +                       assigned-clocks =3D <&cpg CPG_MOD 0xa1>;
> >                         assigned-clock-rates =3D <133333334>;
> >                         resets =3D <&cpg 0xa3>, <&cpg 0xa4>;
> >                         reset-names =3D "hresetn", "aresetn"; diff --gi=
t
> > a/drivers/clk/renesas/r9a09g057-cpg.c
> > b/drivers/clk/renesas/r9a09g057-cpg.c
> > index 9952474bcf48..d5eef17ad5fc 100644
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -43,6 +43,7 @@ enum clk_ids {
> >         CLK_SMUX2_XSPI_CLK0,
> >         CLK_SMUX2_XSPI_CLK1,
> >         CLK_PLLCM33_XSPI,
> > +       CLK_PLLCM33_XSPIX2,
> >         CLK_PLLCLN_DIV2,
> >         CLK_PLLCLN_DIV8,
> >         CLK_PLLCLN_DIV16,
> > @@ -176,6 +177,7 @@ static const struct cpg_core_clk r9a09g057_core_clk=
s[] __initconst =3D {
> >         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3=
, smux2_xspi_clk1),
> >         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK=
1, CSDIV0_DIVCTL3,
> >                   dtable_2_16),
> > +       DEF_FIXED(".pllcm33_xspix2", CLK_PLLCM33_XSPIX2,
> > CLK_PLLCM33_XSPI, 2, 1),
>
> Will this internal core clk shows same status like core clk? For eg: XSPI=
 node is disabled the
> clk_summary reports this internal core clock is ON (while it's actually O=
FF)?
>
The internal core clock state will show as always ON.

>
> >
> >         DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> >         DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8), @=
@ -231,7 +233,6 @@ static const
> > struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D {
> >                   CLK_PLLETH_DIV_125_FIX, 1, 1),
> >         DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_RE=
F_I,
> >                   CLK_PLLETH_DIV_125_FIX, 1, 1),
> > -       DEF_FIXED("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSP=
I, 1, 2),
> >  };
> >
> >  static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D=
 { @@ -311,8 +312,10 @@ static
> > const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
> >                                                 BUS_MSTOP(4, BIT(5))),
> >         DEF_MOD("spi_aclk",                     CLK_PLLCM33_GEAR, 10, 0=
, 5, 0,
> >                                                 BUS_MSTOP(4, BIT(5))),
> > -       DEF_MOD_NO_PM("spi_clk_spix2",          CLK_PLLCM33_XSPI, 10, 1=
, 5, 2,
> > +       DEF_MOD_PAIRED("spi_clk_spi",           CLK_PLLCM33_XSPI, 10, 1=
, 5, 1,
> >                                                 BUS_MSTOP(4, BIT(5))),
> > +       DEF_MOD_PAIRED_ALIAS("spi_clk_spix2",   CLK_PLLCM33_XSPIX2, 25,=
 0, 5, 2,
> > +                                               BUS_MSTOP(4, BIT(5)),
> > + 10, 1),
> >         DEF_MOD("sdhi_0_imclk",                 CLK_PLLCLN_DIV8, 10, 3,=
 5, 3,
> >                                                 BUS_MSTOP(8, BIT(2))),
> >         DEF_MOD("sdhi_0_imclk2",                CLK_PLLCLN_DIV8, 10, 4,=
 5, 4,
> > @@ -508,7 +511,7 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __in=
itconst =3D {
> >         /* Module Clocks */
> >         .mod_clks =3D r9a09g057_mod_clks,
> >         .num_mod_clks =3D ARRAY_SIZE(r9a09g057_mod_clks),
> > -       .num_hw_mod_clks =3D 25 * 16,
> > +       .num_hw_mod_clks =3D 26 * 16,
>
>            .num_hw_mod_clks =3D 25 * 16 + 1,??
Agreed.

>
> >
> >         /* Resets */
> >         .resets =3D r9a09g057_resets,
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2=
h-cpg.c index
> > 97bcd252fcbf..847ea71df865 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -71,6 +71,12 @@
> >
> >  #define CPG_CLKSTATUS0         (0x700)
> >
> > +struct rzv2h_paired_clock {
> > +       u8 on_index;
> > +       u8 on_bit;
> > +       unsigned int enabled_count;
>
> refcount_t ??
>
Agreed.

Cheers,
Prabhakar

