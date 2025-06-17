Return-Path: <linux-renesas-soc+bounces-18479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADBCADDD98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 23:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221D83A7589
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 21:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AE22EF9C7;
	Tue, 17 Jun 2025 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKKwowzP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB041F461A;
	Tue, 17 Jun 2025 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194343; cv=none; b=cNd3SdXZTllfyJopv0Jx9GdzWjvQRB01WRz88e7KMRW3tRlUYko5kY8dQQHhHRq9nIP5Hful2cjSCRkFCjLrgvuMtwo2SimmUhPXdJnxLWbnvC1YX778k3JI6YZ9ZKe2IS1WCwUW6NckQaA+rA2SVRqXQLTR1XWTF8n9mXTvMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194343; c=relaxed/simple;
	bh=m3lI4MwrwFPqCNC0THOG1T1axGubrPqRqX+KUazpMtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQgAdkabLcmv2Wr+75sAFzj78457b4fIEijJ4YhCJAXsOTD2WYxjEiDz53+ghM6E7wdibuNp6SAKi0LWxX+nrvlRmHeWVsq9V8WoJT7z+ts1oLopkfSaiA2CslUJ8vOxnanyexuZzCLWZAi5CxuFatvKmEJ0lZY0rPIjFSctEkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKKwowzP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d6ade159so52128035e9.1;
        Tue, 17 Jun 2025 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750194340; x=1750799140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pI1tuxfqcUG/pqqFKGS4P0vRZPwkEZcZcsymDYP8FA=;
        b=lKKwowzP1l2vaOkHtyD81XshGTDkyIcld5AEETfLno63O3f0GHalaiop42E2rx8YLR
         26W/4kJ1969QR1+GSi+5xVtewQ8GjB/sXLJdg91m+swJHelRecUL3A7nwKwA3x1tlS91
         g/7ITXaL6/CYlJFkq5qgxEjPn7WW8a2lXsCiM+3RGhH3sMKfa4gtYfYq0ZgApvVNhzqu
         X8CJNphJ7OSiWyEk7oAVV1lSsW9zYbGxKleZ3OZOSLoRNqfBaq1keFGSfzjyeGqFHjit
         dSGJz+vua96HYaBPrNdeotQitPXxKE4fbK8nl4tLVG3xfUNSgt9sdMDVZp6C1VJm6c3s
         CMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194340; x=1750799140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pI1tuxfqcUG/pqqFKGS4P0vRZPwkEZcZcsymDYP8FA=;
        b=KD2oxkIPybHKebUl+WyRMLoUIL+hNwJo+XkjqH6urPtQSK/1IVKKLnTJt7KRKAkFX2
         7MSiWKB5hRuqfFvf3hXpBU8flzhXcLkQGmgGw/4A3JQ+8x5jAPn9Wa/QJloDBu6e9PQ9
         sQmpDtv4uywG/Hf++f6uuMMkuukQEK1kxKlye0E89+M979q79cfIki5OjbirMw+JL5GR
         wXrkgNdvvxjF1v2cz8deVJIr1DuIqcioOUphauZ76sGg+Fa81n55v1r241BzcTLqKhAa
         S2qcEppRqNNbdJTYXQmUOFuFb7zH27TuK+dB/L8I+OJ5r+zSHC/F3g89cywPyLyDcDvl
         MbSg==
X-Forwarded-Encrypted: i=1; AJvYcCV1I3yYddlR7y/Mbde9KKXA4OfSjEfba9nGgaFsjVBPiYu8raoQNuZ/7/wXsuA5zoinAwQGftANZx59@vger.kernel.org, AJvYcCWG6SpXD2vjOqjbYMWoeLZVJrNdRWIXL0BC5hjMYOx+DCnYdg+u1UWAVZ4FRzxQI7WseiHn0KuYaaq0ccEOiIWdAMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMCUwxOww2AWgcjO0NqST2NPkRXih5pkKJYOGd3leS/U/9737w
	gBSZXQtZR74XuTuZafjs9jjtFRop2F52MYMCI+AU0GyzVRxpU5ltAbrL4sn6ghztIzS83+NvFVm
	2B3TWpohXC19VLMx/EPDeE4ughAlyqwOzvkWnSdbJ4Q==
X-Gm-Gg: ASbGncuYrUzt/g8rL022UKilt9Fbevxtl53FQSo1zzF6NlseH7wlmq2pkYgDUJHOZY1
	hGN5Urey1cEXqyde4eJqnl6mLFSh06XVJqksmxtJcH9sy7YjyOx3/WW/QxTXyWH10kviXJko9AW
	htePjTNmQD2lXZx9aJxARCElD9m2hEm1d+5I6uCjNdFw==
X-Google-Smtp-Source: AGHT+IHmZ/ilvOtgzckFZlaRsqXLleOx61cSwb1rq4ewujHCBkPaQvxTrgH651nkxDpauExRvHd4ZmQEOuFT6dV0Sm4=
X-Received: by 2002:a05:600c:1d1f:b0:440:68db:9fef with SMTP id
 5b1f17b1804b1-4534f9f165amr61507245e9.20.1750194339293; Tue, 17 Jun 2025
 14:05:39 -0700 (PDT)
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
In-Reply-To: <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jun 2025 22:05:13 +0100
X-Gm-Features: Ac12FXx4l0psOATA1UadDXFVVwFZx9WUvhUFhaH17fjvW-APFDKlmgMD-Wui-gs
Message-ID: <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Biju,
>
> On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> wrote=
:
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.com> w=
rote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar 20=
25
> > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document support =
for
> > > > > > > the Expanded Serial Peripheral Interface (xSPI) Controller in
> > > > > > > the Renesas RZ/G3E
> > > > > > > (R9A09G047) SoC.
> > > > > > >
> > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/memory-controllers/re=
nes
> > > > > > > +++ as,r
> > > > > > > +++ zg3e
> > > > > > > +++ -xspi.yaml
> > > > >
> > > > > > > +    spi@11030000 {
> > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000000 0x10000000=
>;
> > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > > > > +        interrupt-names =3D "pulse", "err_pulse";
> > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
> > > > > >
> > > > > > On the next version I am going to update spix2 clk as <&cpg
> > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
>
> According to the RZ/G3E clock system diagram, (the parent of) clk_spi
> is derived from (the parent of) clk_spix2, not the other way around?
> So you can model clk_spi as a fixed divider clock with parent clk_spix2
> and factor two.  I.e. provide a new core clock R9A09G047_SPI_CLK_SPI
> instead of your proposed R9A09G047_SPI_CLK_SPIX2?
>
With this approach when R9A09G047_SPI_CLK_SPI is used as a core clock
and XSPI node is disabled the clk_summary reports the core clock is ON
(while it's actually OFF).

root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
          .smux2_xspi_clk1           0       0        0
320000000   0          0     50000      Y            deviceless
              no_connection_id
             .pllcm33_xspi           0       0        0
40000000    0          0     50000      Y               deviceless
                 no_connection_id
                spi_clk_spix2        0       0        0
40000000    0          0     50000      N                  deviceless
                    no_connection_id
                spi_clk_spi          0       0        0
20000000    0          0     50000      Y                  deviceless
                    no_connection_id
             spi_aclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
             spi_hclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
          .smux2_xspi_clk0           0       0        0
533333333   0          0     50000      Y            deviceless
              no_connection_id

Can we maybe use a unused ON index and ON bit for example 25, 0 (ie
0x190) and represent this is a module clock for example for the
spi_clk_spix2 clock and use this in the DT and let the CPG core code
handle such turning ON/OF the module clocks based on the enable count
which will be handled internally in the driver?

I have some POC code for the paired clocks which will handle the
enable count of the paired module clocks, below is the diff. Please
share your thoughts.

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 3c5984ee27ca..8a8f59ffdb4c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -290,10 +290,10 @@ xspi: spi@11030000 {
                        interrupt-names =3D "pulse", "err_pulse";
                        clocks =3D <&cpg CPG_MOD 0x9f>,
                                 <&cpg CPG_MOD 0xa0>,
-                                <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
-                                <&cpg CPG_MOD 0xa1>;
+                                <&cpg CPG_MOD 0xa1>,
+                                <&cpg CPG_MOD 0x190>;
                        clock-names =3D "ahb", "axi", "spi", "spix2";
-                       assigned-clocks =3D <&cpg CPG_CORE R9A09G057_SPI_CL=
K_SPI>;
+                       assigned-clocks =3D <&cpg CPG_MOD 0xa1>;
                        assigned-clock-rates =3D <133333334>;
                        resets =3D <&cpg 0xa3>, <&cpg 0xa4>;
                        reset-names =3D "hresetn", "aresetn";
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c
b/drivers/clk/renesas/r9a09g057-cpg.c
index 9952474bcf48..d5eef17ad5fc 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -43,6 +43,7 @@ enum clk_ids {
        CLK_SMUX2_XSPI_CLK0,
        CLK_SMUX2_XSPI_CLK1,
        CLK_PLLCM33_XSPI,
+       CLK_PLLCM33_XSPIX2,
        CLK_PLLCLN_DIV2,
        CLK_PLLCLN_DIV8,
        CLK_PLLCLN_DIV16,
@@ -176,6 +177,7 @@ static const struct cpg_core_clk
r9a09g057_core_clks[] __initconst =3D {
        DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1,
SSEL1_SELCTL3, smux2_xspi_clk1),
        DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI,
CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
                  dtable_2_16),
+       DEF_FIXED(".pllcm33_xspix2", CLK_PLLCM33_XSPIX2,
CLK_PLLCM33_XSPI, 2, 1),

        DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
        DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
@@ -231,7 +233,6 @@ static const struct cpg_core_clk
r9a09g057_core_clks[] __initconst =3D {
                  CLK_PLLETH_DIV_125_FIX, 1, 1),
        DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
                  CLK_PLLETH_DIV_125_FIX, 1, 1),
-       DEF_FIXED("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1=
, 2),
 };

 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
@@ -311,8 +312,10 @@ static const struct rzv2h_mod_clk
r9a09g057_mod_clks[] __initconst =3D {
                                                BUS_MSTOP(4, BIT(5))),
        DEF_MOD("spi_aclk",                     CLK_PLLCM33_GEAR, 10, 0, 5,=
 0,
                                                BUS_MSTOP(4, BIT(5))),
-       DEF_MOD_NO_PM("spi_clk_spix2",          CLK_PLLCM33_XSPI, 10, 1, 5,=
 2,
+       DEF_MOD_PAIRED("spi_clk_spi",           CLK_PLLCM33_XSPI, 10, 1, 5,=
 1,
                                                BUS_MSTOP(4, BIT(5))),
+       DEF_MOD_PAIRED_ALIAS("spi_clk_spix2",   CLK_PLLCM33_XSPIX2, 25, 0, =
5, 2,
+                                               BUS_MSTOP(4, BIT(5)), 10, 1=
),
        DEF_MOD("sdhi_0_imclk",                 CLK_PLLCLN_DIV8, 10, 3, 5, =
3,
                                                BUS_MSTOP(8, BIT(2))),
        DEF_MOD("sdhi_0_imclk2",                CLK_PLLCLN_DIV8, 10, 4, 5, =
4,
@@ -508,7 +511,7 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info
__initconst =3D {
        /* Module Clocks */
        .mod_clks =3D r9a09g057_mod_clks,
        .num_mod_clks =3D ARRAY_SIZE(r9a09g057_mod_clks),
-       .num_hw_mod_clks =3D 25 * 16,
+       .num_hw_mod_clks =3D 26 * 16,

        /* Resets */
        .resets =3D r9a09g057_resets,
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cp=
g.c
index 97bcd252fcbf..847ea71df865 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -71,6 +71,12 @@

 #define CPG_CLKSTATUS0         (0x700)

+struct rzv2h_paired_clock {
+       u8 on_index;
+       u8 on_bit;
+       unsigned int enabled_count;
+};
+
 /**
  * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
  *
@@ -87,6 +93,8 @@
  * @rcdev: Reset controller entity
  * @dsi_limits: PLL DSI parameters limits
  * @plldsi_div_parameters: PLL DSI and divider parameters configuration
+ * @pair_clks: Array of paired clocks
+ * @num_pair_clks: Number of paired clocks in pair_clks[]
  */
 struct rzv2h_cpg_priv {
        struct device *dev;
@@ -102,6 +110,9 @@ struct rzv2h_cpg_priv {

        atomic_t *mstop_count;

+       struct rzv2h_paired_clock *pair_clks;
+       unsigned int num_pair_clks;
+
        struct reset_controller_dev rcdev;

        const struct rzv2h_pll_div_limits *dsi_limits;
@@ -131,6 +142,11 @@ struct pll_clk {
  * @mon_index: monitor register offset
  * @mon_bit: monitor bit
  * @ext_clk_mux_index: mux index for external clock source, or -1 if inter=
nal
+ * @paired: indicates if this clock is paired with another clock ie it sha=
res
+ *          the same ON bit and has a separate MON bit.
+ * @alias: indicates if this clock is paired and has been given dummy ON b=
it
+ * @pair_clk: pointer to paired clock structure if this clock is paired,
+ *           otherwise NULL.
  */
 struct mod_clock {
        struct rzv2h_cpg_priv *priv;
@@ -142,6 +158,9 @@ struct mod_clock {
        s8 mon_index;
        u8 mon_bit;
        s8 ext_clk_mux_index;
+       bool paired;
+       bool alias;
+       struct rzv2h_paired_clock *pair_clk;
 };

 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
@@ -853,8 +872,13 @@ static int rzv2h_mod_clock_is_enabled(struct clk_hw *h=
w)
                        return 0;
        }

-       offset =3D GET_CLK_ON_OFFSET(clock->on_index);
-       bitmask =3D BIT(clock->on_bit);
+       if (clock->alias) {
+               offset =3D GET_CLK_ON_OFFSET(clock->pair_clk->on_index);
+               bitmask =3D BIT(clock->pair_clk->on_bit);
+       } else {
+               offset =3D GET_CLK_ON_OFFSET(clock->on_index);
+               bitmask =3D BIT(clock->on_bit);
+       }

        return readl(priv->base + offset) & bitmask;
 }
@@ -870,24 +894,57 @@ static int rzv2h_mod_clock_endisable(struct
clk_hw *hw, bool enable)
        u32 value;
        int error;

-       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
-               str_on_off(enable));
+       if (clock->alias) {
+               reg =3D GET_CLK_ON_OFFSET(clock->pair_clk->on_index);
+               bitmask =3D BIT(clock->pair_clk->on_bit);
+       }

-       if (enabled =3D=3D enable)
+       if (clock->paired)
+               dev_err(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
+                       str_on_off(enable));
+
+       if (enabled =3D=3D enable) {
+               if (clock->paired && enable && clock->pair_clk->enabled_cou=
nt) {
+                       clock->pair_clk->enabled_count++;
+                       dev_err(dev, "1: CLK_ON 0x%x/%pC %s cnt:%u\n",
+                               reg, hw->clk, str_on_off(enable),
+                               clock->pair_clk->enabled_count);
+               }
                return 0;
+       }

        value =3D bitmask << 16;
        if (enable) {
+               if (clock->paired && clock->pair_clk->enabled_count) {
+                       clock->pair_clk->enabled_count++;
+                       dev_err(dev, "2: CLK_ON 0x%x/%pC %s cnt:%u\n",
+                               reg, hw->clk, str_on_off(enable),
+                               clock->pair_clk->enabled_count);
+                       goto check_mon;
+               }
                value |=3D bitmask;
                writel(value, priv->base + reg);
                if (clock->mstop_data !=3D BUS_MSTOP_NONE)
                        rzv2h_mod_clock_mstop_enable(priv, clock->mstop_dat=
a);
+               if (clock->paired)
+                       clock->pair_clk->enabled_count++;
        } else {
+               if (clock->paired) {
+                       if (clock->pair_clk->enabled_count)
+                               clock->pair_clk->enabled_count--;
+                       dev_err(dev, "3: CLK_ON 0x%x/%pC %s cnt:%u\n",
+                               reg, hw->clk, str_on_off(enable),
+                               clock->pair_clk->enabled_count);
+                       if (clock->pair_clk->enabled_count > 0)
+                               goto check_mon;
+               }
+
                if (clock->mstop_data !=3D BUS_MSTOP_NONE)
                        rzv2h_mod_clock_mstop_disable(priv, clock->mstop_da=
ta);
                writel(value, priv->base + reg);
        }

+check_mon:
        if (!enable || clock->mon_index < 0)
                return 0;

@@ -918,6 +975,55 @@ static const struct clk_ops rzv2h_mod_clock_ops =3D {
        .is_enabled =3D rzv2h_mod_clock_is_enabled,
 };

+static int rzv2h_mod_clk_get_paired_cfg(struct rzv2h_cpg_priv *priv,
+                                       struct mod_clock *clock,
+                                       const struct rzv2h_mod_clk *mod)
+{
+       unsigned int i;
+       u8 on_index;
+       u8 on_bit;
+
+
+       if (!clock->paired)
+               return 0;
+
+       /* Get the paired clock configuration */
+       if (clock->alias) {
+               on_index =3D mod->alias_on_index;
+               on_bit =3D mod->alias_on_bit;
+       } else {
+               on_index =3D clock->on_index;
+               on_bit =3D clock->on_bit;
+       }
+
+       for (i =3D 0; i < priv->num_pair_clks; i++) {
+               if (priv->pair_clks[i].on_index =3D=3D on_index &&
+                   priv->pair_clks[i].on_bit =3D=3D on_bit) {
+                       clock->pair_clk =3D &priv->pair_clks[i];
+                       pr_err("cpg: 2: register paired clock %s
on_index %u on_bit %u num:%u\n",
+                       clock->hw.init->name, on_index, on_bit,
+                       priv->num_pair_clks);
+                       return 0;
+               }
+       }
+
+       priv->num_pair_clks++;
+       priv->pair_clks =3D devm_krealloc(priv->dev, priv->pair_clks,
+                                       sizeof(*priv->pair_clks) *
priv->num_pair_clks, GFP_KERNEL);
+       if (!priv->pair_clks)
+               return -ENOMEM;
+
+       pr_err("cpg: register paired clock %s on_index %u on_bit %u num:%u\=
n",
+              clock->hw.init->name, on_index, on_bit,
+              priv->num_pair_clks);
+       priv->pair_clks[priv->num_pair_clks - 1].on_index =3D on_index;
+       priv->pair_clks[priv->num_pair_clks - 1].on_bit =3D on_bit;
+       priv->pair_clks[priv->num_pair_clks - 1].enabled_count =3D 0;
+       clock->pair_clk =3D &priv->pair_clks[priv->num_pair_clks - 1];
+
+       return 0;
+}
+
 static void __init
 rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
                           struct rzv2h_cpg_priv *priv)
@@ -966,7 +1072,13 @@ rzv2h_cpg_register_mod_clk(const struct
rzv2h_mod_clk *mod,
        clock->priv =3D priv;
        clock->hw.init =3D &init;
        clock->mstop_data =3D mod->mstop_data;
-
+       clock->paired =3D mod->paired;
+       clock->alias =3D mod->alias;
+       ret =3D rzv2h_mod_clk_get_paired_cfg(priv, clock, mod);
+       if (ret) {
+               clk =3D ERR_PTR(ret);
+               goto fail;
+       }
        ret =3D devm_clk_hw_register(dev, &clock->hw);
        if (ret) {
                clk =3D ERR_PTR(ret);
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cp=
g.h
index bce131bec80b..87b62fc908ba 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -223,6 +223,11 @@ enum clk_types {
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
  * @ext_clk_mux_index: mux index for external clock source, or -1 if inter=
nal
+ * @paired: indicates if this clock is paired with another clock,
i.e., it shares
+ *          the same ON bit and has a separate MON bit.
+ * @alias: indicates if this clock is paired and has been given dummy ON b=
it
+ * @alias_on_index: For paired clocks, the index of the alias ON bit
+ * @alias_on_bit: For paired clocks, the index of the alias ON bit
  */
 struct rzv2h_mod_clk {
        const char *name;
@@ -235,10 +240,15 @@ struct rzv2h_mod_clk {
        s8 mon_index;
        u8 mon_bit;
        s8 ext_clk_mux_index;
+       bool paired;
+       bool alias;
+       u8 alias_on_index;
+       u8 alias_on_bit;
 };

 #define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, =
\
-                    _onbit, _monindex, _monbit, _ext_clk_mux_index) \
+                    _onbit, _monindex, _monbit, _ext_clk_mux_index, _paire=
d, \
+                    _alias, _alias_on_index, _alias_on_bit) \
        { \
                .name =3D (_name), \
                .mstop_data =3D (_mstop), \
@@ -250,23 +260,40 @@ struct rzv2h_mod_clk {
                .mon_index =3D (_monindex), \
                .mon_bit =3D (_monbit), \
                .ext_clk_mux_index =3D (_ext_clk_mux_index), \
+               .paired =3D (_paired), \
+               .alias =3D (_alias), \
+               .alias_on_index =3D (_alias_on_index), \
+               .alias_on_bit =3D (_alias_on_bit), \
        }

 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mst=
op) \
-       DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex,
_onbit, _monindex, _monbit, -1)
+       DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit=
, \
+                    _monindex, _monbit, -1, false, false, 0, 0)

 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex,
_monbit, _mstop) \
-       DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex,
_onbit, _monindex, _monbit, -1)
+       DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex,
_onbit, _monindex, \
+                    _monbit, -1, false, false, 0, 0)

 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex,
_monbit, _mstop) \
-       DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex,
_onbit, _monindex, _monbit, -1)
+       DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex,
_onbit, _monindex, \
+                    _monbit, -1, false, false, 0, 0)

 #define DEF_MOD_MUX_EXTERNAL(_name, _parent, _onindex, _onbit,
_monindex, _monbit, _mstop, \
                             _ext_clk_mux_index) \
        DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex,
_onbit, _monindex, _monbit, \
-                    _ext_clk_mux_index)
+                    _ext_clk_mux_index, false, false, 0, 0)

-/**
+#define DEF_MOD_PAIRED(_name, _parent, _onindex, _onbit, _monindex,
_monbit, _mstop) \
+       DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex,
_onbit, _monindex, \
+                    _monbit, -1, true, false, 0, 0)
+
+#define DEF_MOD_PAIRED_ALIAS(_name, _parent, _onindex, _onbit,
_monindex, _monbit, _mstop, \
+                            _alias_on_index, _alias_on_bit) \
+       DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex,
_onbit, _monindex, _monbit, -1, \
+                    true, true, _alias_on_index, _alias_on_bit)
+
+
+ /**
  * struct rzv2h_reset - Reset definitions
  *
  * @reset_index: reset register index



# Output when module is loaded
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
             spi_hclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
          .smux2_xspi_clk0           1       1        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        1       1        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        2       2        0
133333334   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spi       1       2        0
133333334   0          0     50000      Y
11030000.spi                    spi
                   .pllcm33_xspix2   1       1        0
266666668   0          0     50000      Y
deviceless                      no_connection_id
                      spi_clk_spix2  1       2        0
266666668   0          0     50000      Y
11030000.spi                    spix2


# Output when module is unloaded
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
             spi_hclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
          .smux2_xspi_clk0           0       0        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        0       0        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        0       0        0
133333334   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spi       0       0        0
133333334   0          0     50000      N
deviceless                      no_connection_id
                   .pllcm33_xspix2   0       0        0
266666668   0          0     50000      Y
deviceless                      no_connection_id
                      spi_clk_spix2  0       0        0
266666668   0          0     50000      N
deviceless                      no_connection_id
root@rzv2h-evk:~#
root@rzv2h-evk:~#


Cheers,
Prabhakar

