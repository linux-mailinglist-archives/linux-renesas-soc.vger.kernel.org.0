Return-Path: <linux-renesas-soc+bounces-16121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27146A91F00
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 15:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D4C4461B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBEB250C1B;
	Thu, 17 Apr 2025 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E807DD5d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0516217A2F9;
	Thu, 17 Apr 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898349; cv=none; b=PRo4Q8AATC8cu0c+saHXSI0waMwkn0R6A7F27oPiz1VkeHOK03SixEVF4PIAvRdMsyC6KV6NfYNf5pzMKS808AlSuzXkBO4GV6Mot+BhbHjXC4pRSwCvnPa8F7xjWZr+H7WQ3BeOAXkVuFWnjOvOVUq5VAdFgGNgCsap/SzZU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898349; c=relaxed/simple;
	bh=rGUL0qo7t75+yf8RNhmQsbUJZyZF0FSC5DFtnCZwVl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1wWtGOCeUjG6i9+OYd4FcESw+OHECyV/XZiRavd/NV/bKjbYqVJYvd881EwGVaH5KOB9xgo0siH6h2V5Dxt50WuVwD4/E7Wv5+hJ000tVDqzs1w5CDRdY0uZL9021XTQIcIE8vHUQyHkfu1QMLbkCYruLCqWUlw+YpQAjjqKZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E807DD5d; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so7421685e9.3;
        Thu, 17 Apr 2025 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744898344; x=1745503144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ezz3Ua3ZxBHQJbbZQwDR8DVAZxhKCtk03ZvMXQdKpg=;
        b=E807DD5dptKXojt3XdInz15yurZ8y8OiX0ulaLQiAGxfsPruPL2q6W1w4ZgXnUFZR9
         xjwGiaJxyosh0VK2+5S5YFAmmU1Afyn12woVQ/nM1qnG86HZDxarv5/izjUeJlBuiM/h
         bkD97jhnXJoCBYzOJOLYpz7GElFPOTNkNiw3vqIIm4OKNJtqTTgMssPUJs07CaZ8ik59
         cGTEzYxu5TBb4Gwrwq1w+k6oYCTfjk8NZsg+kQTVuEhGjP32toP+B25/984Fo01IQjZd
         qrP6Uu9uWJrI1oifAYoI+HHSZDQVaXsCN+L+uBmSuHe2hdEPAjMH5MdpUE8EonIt8TTY
         MBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898344; x=1745503144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ezz3Ua3ZxBHQJbbZQwDR8DVAZxhKCtk03ZvMXQdKpg=;
        b=AVIvYVJ/fxdM5wgynujxzVZnzmwz3CBPYWbC/5Nlmx7ehQJY3puYpo6g2leejyLZwn
         bRblFxuABPNTD1/Zy61uhHqulV3M0P3/rJIvD6qCiF2xahKiPUdtQ16VUu5DoFK///qW
         o419cw1V6nuCS9zZNOsRszDQLpuUXye5D4yQL6BzmIZg8DyLsLevW7xzS7uzmkenDPGu
         8MMuTBlAMBRzGArVYiwPbStIlNNaaBdsZ2WY+m92+wIxDnBl6k3/n+sAV2r5l2yGp4XY
         scVPP+TDCc8Ie1p/1MnblAnSYAQ4YkBVZFumf7670OUJwgaLpfmQJeCb9ZuID63kX+G2
         3TWw==
X-Forwarded-Encrypted: i=1; AJvYcCWoQKaZqBZi+5PLoFZAeI69+HFuiGqU5OIS00W1/iiwPtlaxHAtb7xhSNVRBHMv2TTlxhyEvLC/jocjMkx6MlolODM=@vger.kernel.org, AJvYcCWoyF5CwV7X145dVmFnLVoEp6gegpVVUKPUNVpeIm/S1bAQtorNB5URvFQ9njRrfAwFIQuVvayCdO3n@vger.kernel.org, AJvYcCWumldIWgZAlkS5gIyanzfsaS2WVwaK++ndV2taGrj7F0nEC1qr70IS6O9wdCBczuebKviSYaBmUrj3@vger.kernel.org, AJvYcCXqXqgLAmBMlkjAwwwwR7Sb5klXVBKmqnvWv1y02EK6XQiTXrAGg4uT/vRJtczt2eusHaKlH6O/ReBoZU+S@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJcPcQGGKwQpMtPlQ0oLlZRjn85B0Unvjaf17ULlQuVj2ypKI
	nY7Pbb4ZP1mCd3qXuiJN2oYc7/gnGstNttgyybPToy+ANh5rGka3HlOjT+8riigazopTwnkcicn
	mW3bZSwOVuqkHJhsqUNrpkrkSzCQ=
X-Gm-Gg: ASbGncssj7piRyM0gdRWJKZXN/Y7XWqn65XW3egepyPSX8fGoyYgAkaX28b/9ZSXPgQ
	WFO3sEzm5v5hOk3Q1vM306SZ3PcKR+i4l7NlijooCjCJnBTZPwKlN6r7sC2dH2LoYdxOhj6OzHX
	7UD7N3OYjTDi3K/+MkAi0a6A==
X-Google-Smtp-Source: AGHT+IHb0/TjDJPmSpyqqQFXbHWeMqd7UBwlvdFo5gvyGjxG22Ohjs0NrEFWsEom5D2n5l/Fi1XgmEUOTMVYIXurr94=
X-Received: by 2002:a05:6000:144a:b0:39c:142a:ed6c with SMTP id
 ffacd0b85a97d-39ee5b9ec7cmr5512894f8f.40.1744898344042; Thu, 17 Apr 2025
 06:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com>
 <CA+V-a8uSB62TSxgcGTaWbfkPsNOmxZmO31jH3TREE6g2HHtcXA@mail.gmail.com> <CAMuHMdVXjs75gVEfS3WMtvtywP_m7wWaf2HQKCwkJZqX4T5M8w@mail.gmail.com>
In-Reply-To: <CAMuHMdVXjs75gVEfS3WMtvtywP_m7wWaf2HQKCwkJZqX4T5M8w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Apr 2025 14:58:38 +0100
X-Gm-Features: ATxdqUG6uYjXHKWhsKQezb1OPsNtqdpQY3wdD6rrlwHwLvi_VvCcwM0wvHuklO8
Message-ID: <CA+V-a8sMVGjzdEiBNha8WsubZGyFrCXQDhbyUBvFqbdn3pSJvw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Apr 16, 2025 at 8:37=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 15 Apr 2025 at 21:25, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, Apr 15, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clock and reset entries for GBETH instances. Include core clock=
s for
> > > > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux cl=
ocks
> > > > used as clock sources for the GBETH IP.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > >
> > > > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =
=3D {
> > > >         {0, 0},
> > > >  };
> > > >
> > > > +static const struct clk_div_table dtable_2_100[] =3D {
> > > > +       {0, 2},
> > > > +       {1, 10},
> > > > +       {2, 100},
> > > > +       {0, 0},
> > > > +};
> > > > +
> > > > +/* Mux clock tables */
> > > > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0",=
 "et0-rxc-rxclk" };
> > > > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0",=
 "et0-txc-txclk" };
> > > > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1",=
 "et1-rxc-rxclk" };
> > > > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1",=
 "et1-txc-txclk" };
> > >
> > > The "et[01]-[rt]xc-[rt]xclk" clocks are not created by this driver.
> > > IIUIC, they are actually Ethernet PHY signals.
> > > How is this supposed to work?
> > >
> > My intention was to add support for PHY drivers to provide the clocks
> > and hook them up accordingly. Currently, for the RX clocks, we get a
> > rate of 0 since they are external.
>
> So the link would not be provided by DT?
> If these clocks are inputs to the clock controller, they should be
> listed in the clock controller's clock{,-name}s' properties...
>
> > I haven=E2=80=99t written a prototype yet for the PHY driver to provide=
 the
> > clocks, but the plan is to get the initial pieces in place and then
> > extend support for that.
> >
> > Is my understanding correct that the PHY should provide the clocks? Or
> > would you suggest a different approach?
>
> The Static Mux Control Registers (CPG_SSEL[01]) registers treat them as
> clock inputs.  However, Figure 6.3-1 ("Block Diagram of the Ethernet
> Interface") shows the TX clocks are bidirectional, so they can be used
> as either inputs or outputs?  On RGMII[1], RXC is an input (PHY-to-MAC),
> while TXC is an output (MAC-to-PHY).
>
I think the Figure 6.3-1 shows TX clocks are bidirectional because
PFC_OEN.OEN0/1 can be used to configure input/output for the TXC
pins..

I added the below POC and did some limited testing, (not the code in
PHY driver is not complete as it still needs to check interface mode
and depending on that register one/two clocks)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 76e6b658077a..08d2651eba59 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -105,6 +105,50 @@ L3_CA55: cache-controller-0 {
                };
        };

+       et0_rxclk: et0-rxclk {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <0>;
+               /*
+                * This value must be overridden by the board depending
+                * on PHY connection
+                */
+               status =3D "disabled";
+       };
+
+       et0_txclk: et0-txclk {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <0>;
+               /*
+                * This value must be overridden by the board depending
+                * on PHY connection
+                */
+               status =3D "disabled";
+       };
+
+       et1_rxclk: et1-rxclk {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <0>;
+               /*
+                * This value must be overridden by the board depending
+                * on PHY connection
+                */
+               status =3D "disabled";
+       };
+
+       et1_txclk: et1-txclk {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <0>;
+               /*
+                * This value must be overridden by the board depending
+                * on PHY connection
+                */
+               status =3D "disabled";
+       };
+
        gpu_opp_table: opp-table-1 {
                compatible =3D "operating-points-v2";

@@ -266,8 +310,12 @@ pinctrl: pinctrl@10410000 {
                cpg: clock-controller@10420000 {
                        compatible =3D "renesas,r9a09g057-cpg";
                        reg =3D <0 0x10420000 0 0x10000>;
-                       clocks =3D <&audio_extal_clk>, <&rtxin_clk>,
<&qextal_clk>;
-                       clock-names =3D "audio_extal", "rtxin", "qextal";
+                       clocks =3D <&audio_extal_clk>, <&rtxin_clk>,
<&qextal_clk>,
+                                <&et0_txclk>, <&et0_rxclk>,
+                                <&et1_txclk>, <&et1_rxclk>;
+                       clock-names =3D "audio_extal", "rtxin", "qextal",
+                                     "et0_txclk", "et0_rxclk",
+                                     "et1_txclk", "et1_rxclk";
                        #clock-cells =3D <2>;
                        #reset-cells =3D <1>;
                        #power-domain-cells =3D <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index d0160ae4d4cd..3f9c9cf1a468 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -136,6 +136,11 @@ &audio_extal_clk {
        clock-frequency =3D <22579200>;
 };

+&cpg {
+       clocks =3D <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+                <&phy0 0>, <&phy0 1>, <&phy1 0>, <&phy1 1>;
+};
+
 &cru0 {
        status =3D "disabled";
 };
@@ -248,6 +253,8 @@ mdio {

                phy0: ethernet-phy@0 {
                        compatible =3D "ethernet-phy-id0022.1640",
"ethernet-phy-ieee802.3-c22";
+                       #clock-cells =3D <1>;
+                       clock-output-names =3D "et0_rxclk", "et0_txclk";
                        reg =3D <0>;
                        rxc-skew-psec =3D <0>;
                        txc-skew-psec =3D <0>;
@@ -279,6 +286,8 @@ mdio {

                phy1: ethernet-phy@1 {
                        compatible =3D "ethernet-phy-id0022.1640",
"ethernet-phy-ieee802.3-c22";
+                       #clock-cells =3D <1>;
+                       clock-output-names =3D "et1_rxclk", "et1_txclk";
                        reg =3D <0>;
                        rxc-skew-psec =3D <0>;
                        txc-skew-psec =3D <0>;
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c
b/drivers/clk/renesas/r9a09g057-cpg.c
index 94c959577f03..5a0f0b9e62c6 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -23,6 +23,10 @@ enum clk_ids {
        CLK_AUDIO_EXTAL,
        CLK_RTXIN,
        CLK_QEXTAL,
+       CLK_ET0_RXCLK,
+       CLK_ET0_TXCLK,
+       CLK_ET1_RXCLK,
+       CLK_ET1_TXCLK,

        /* PLL Clocks */
        CLK_PLLCM33,
@@ -128,16 +132,20 @@ static const struct clk_div_table dtable_16_128[] =3D=
 {
 };

 /* Mux clock tables */
-static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0",
"et0-rxc-rxclk" };
-static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0",
"et0-txc-txclk" };
-static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1",
"et1-rxc-rxclk" };
-static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1",
"et1-txc-txclk" };
+static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0", "et0_rx=
clk" };
+static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0", "et0_tx=
clk" };
+static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "et1_rx=
clk" };
+static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "et1_tx=
clk" };

 static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D {
        /* External Clock Inputs */
        DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
        DEF_INPUT("rtxin", CLK_RTXIN),
        DEF_INPUT("qextal", CLK_QEXTAL),
+       DEF_INPUT("et0_rxclk", CLK_ET0_RXCLK),
+       DEF_INPUT("et0_txclk", CLK_ET0_TXCLK),
+       DEF_INPUT("et1_rxclk", CLK_ET1_RXCLK),
+       DEF_INPUT("et1_txclk", CLK_ET1_TXCLK),

        /* PLL Clocks */
        DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 71fb4410c31b..79245b81a8dc 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -20,6 +20,7 @@
  */

 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/ethtool_netlink.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -362,6 +363,13 @@
 /* Delay used to get the second part from the LTC */
 #define LAN8841_GET_SEC_LTC_DELAY              (500 * NSEC_PER_MSEC)

+struct micrel_phy_clk {
+       struct phy_device *phydev;
+       struct clk_hw clk[2];
+};
+
+static struct micrel_phy_clk phy_clk;
+
 struct kszphy_hw_stat {
        const char *string;
        u8 reg;
@@ -1527,7 +1535,11 @@ static int ksz9131_read_status(struct phy_device *ph=
ydev)
        if (ret < 0)
                return ret;

-       return genphy_read_status(phydev);
+       ret =3D genphy_read_status(phydev);
+       clk_set_rate(phy_clk.clk[0].clk, rgmii_clock(phydev->speed));
+       clk_set_rate(phy_clk.clk[1].clk, rgmii_clock(phydev->speed));
+       return ret;
 }

 static int ksz9131_config_aneg(struct phy_device *phydev)
@@ -2272,6 +2284,41 @@ static int ksz8061_suspend(struct phy_device *phydev=
)
        return kszphy_suspend(phydev);
 }

+static struct clk_hw *kszphy_of_clk_get(struct of_phandle_args *clkspec,
+                                       void *data)
+{
+       unsigned int idx =3D clkspec->args[0];
+       struct clk_hw **clkout_hw =3D data;
+
+       if (idx >=3D ARRAY_SIZE(phy_clk.clk))
+               return ERR_PTR(-EINVAL);
+
+       return clkout_hw[idx];
+}
+
+static unsigned long phy_clk_recalc_rate(struct clk_hw *hw, unsigned
long parent_rate)
+{
+       if (phy_clk.phydev->speed =3D=3D SPEED_1000)
+               return 125000000UL;
+       else if (phy_clk.phydev->speed =3D=3D SPEED_100)
+               return 25000000UL;
+       else if (phy_clk.phydev->speed =3D=3D SPEED_10)
+               return 2500000UL;
+       else
+               return 0;
+}
+
+static long phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+                              unsigned long *parent_rate)
+{
+       return clamp(rate, 2500000UL, 125000000UL);
+}
+
+static const struct clk_ops phy_clk_ops =3D {
+       .recalc_rate   =3D phy_clk_recalc_rate,
+       .round_rate    =3D phy_clk_round_rate,
+};
+
 static int kszphy_probe(struct phy_device *phydev)
 {
        const struct kszphy_type *type =3D phydev->drv->driver_data;
@@ -2329,7 +2376,32 @@ static int kszphy_probe(struct phy_device *phydev)
                priv->rmii_ref_clk_sel_val =3D true;
        }

-       return 0;
+       phy_clk.phydev =3D phydev;
+       /* Register clk outputs */
+       for (u8 i =3D 0; i < 2; i++) {
+               struct clk_init_data init;
+               const char *name;
+               int ret;
+
+               phy_clk.clk[i].init =3D &init;
+               ret =3D of_property_read_string_index(phydev->mdio.dev.of_n=
ode,
+                                                   "clock-output-names",
+                                                   i, &name);
+               if (ret) {
+                       phydev_err(phydev, "Failed to get clock name %d\n",=
 i);
+                       return ret;
+               }
+               init.name =3D name;
+               init.ops =3D &phy_clk_ops;
+               init.flags =3D 0;
+               init.parent_names =3D NULL;
+               init.num_parents =3D 0;
+               ret =3D devm_clk_hw_register(&phydev->mdio.dev, &phy_clk.cl=
k[i]);
+               if (ret)
+                       return ret;
+       }
+
+       return devm_of_clk_add_hw_provider(&phydev->mdio.dev,
kszphy_of_clk_get, &phy_clk.clk);
 }

 static int lan8814_cable_test_start(struct phy_device *phydev)


Below are the logs:
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep gbeth_0
       gbeth_0_clk_rx_180_i          1       1        0
125000000   0          0     50000      Y         15c30000.ethernet
           rx-180
       gbeth_0_clk_rx_i              1       1        0
125000000   0          0     50000      Y         15c30000.ethernet
           rx
                gbeth_0_clk_tx_180_i 1       1        0
125000000   0          0     50000      Y
15c30000.ethernet               tx-180
                gbeth_0_clk_tx_i     1       1        0
125000000   0          0     50000      Y
15c30000.ethernet               tx
             gbeth_0_clk_ptp_ref_i   1       1        0
125000000   0          0     50000      Y
15c30000.ethernet               ptp_ref
          gbeth_0_aclk_i             1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              stmmaceth
          gbeth_0_aclk_csr_i         1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              pclk
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# [   44.853189] kauditd_printk_skb: 5 callbacks suppressed
[   44.853204] audit: type=3D1334 audit(1744888354.247:22): prog-id=3D18 op=
=3DUNLOAD
[   44.865320] audit: type=3D1334 audit(1744888354.247:23): prog-id=3D17 op=
=3DUNLOAD
[   44.872331] audit: type=3D1334 audit(1744888354.247:24): prog-id=3D16 op=
=3DUNLOAD

root@rzv2h-evk:~#
root@rzv2h-evk:~# ethtool -s end0 speed 100
[   97.153939] renesas-gbeth 15c30000.ethernet end0: Link is Down

[  101.258899] renesas-gbeth 15c30000.ethernet end0: Link is Up -
100Mbps/Full - flow control rx/tx
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep gbeth_0
       gbeth_0_clk_rx_180_i          1       1        0
25000000    0          0     50000      Y         15c30000.ethernet
           rx-180
       gbeth_0_clk_rx_i              1       1        0
25000000    0          0     50000      Y         15c30000.ethernet
           rx
                gbeth_0_clk_tx_180_i 1       1        0
25000000    0          0     50000      Y
15c30000.ethernet               tx-180
                gbeth_0_clk_tx_i     1       1        0
25000000    0          0     50000      Y
15c30000.ethernet               tx
             gbeth_0_clk_ptp_ref_i   1       1        0
125000000   0          0     50000      Y
15c30000.ethernet               ptp_ref
          gbeth_0_aclk_i             1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              stmmaceth
          gbeth_0_aclk_csr_i         1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              pclk
root@rzv2h-evk:~# ethtool -s end0 speed 10
root@rzv2h-evk:~# [  117.300170] renesas-gbeth 15c30000.ethernet end0:
Link is Down
[  119.338798] renesas-gbeth 15c30000.ethernet end0: Link is Up -
10Mbps/Full - flow control rx/tx

root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep gbeth_0
       gbeth_0_clk_rx_180_i          1       1        0        2500000
    0          0     50000      Y         15c30000.ethernet
   rx-180
       gbeth_0_clk_rx_i              1       1        0        2500000
    0          0     50000      Y         15c30000.ethernet
   rx
                gbeth_0_clk_tx_180_i 1       1        0        2500000
    0          0     50000      Y                  15c30000.ethernet
            tx-180
                gbeth_0_clk_tx_i     1       1        0        2500000
    0          0     50000      Y                  15c30000.ethernet
            tx
             gbeth_0_clk_ptp_ref_i   1       1        0
125000000   0          0     50000      Y
15c30000.ethernet               ptp_ref
          gbeth_0_aclk_i             1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              stmmaceth
          gbeth_0_aclk_csr_i         1       1        0
200000000   0          0     50000      Y            15c30000.ethernet
              pclk


Cheers,
Prabhakar

