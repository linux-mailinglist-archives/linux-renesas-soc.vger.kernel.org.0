Return-Path: <linux-renesas-soc+bounces-18522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040DAE0137
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 11:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF92A1897D6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D8327EFF4;
	Thu, 19 Jun 2025 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KObDt8YH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F1261594;
	Thu, 19 Jun 2025 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323611; cv=none; b=e6bHpW1Dp32CkBZok6heqoTiVi7tvVMcuiYSsgqovPDEyu4E3iOGFdivKy83n6nPkUuODSFXfoIQhxzGiUbtJnsUhgt+VTlt+n/wCUUpYFVX9L53RnR39sS3W5n9Pec+1Z9KAYKaM3ARGbFYVFwdx9H+7VBFEwApsJ3LxwoIbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323611; c=relaxed/simple;
	bh=n6DT5bAQL+RAQCVZkU8+hke6RxMaD2RlMP22Za8Eif0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiV2HooPEBGCAFVuz1OPMY67dm3bbLs7Sz3j/A+Q6mcJjxEWK4hXEius5FERD75wIJ8r9txclgitY9DMJdtCrmxQRt/pXKAvPafUqUWhUCDGcrEQdm95MBjQiodFVfDzlajSYng/w/a36qVftpnzuGbwSfsoYIM/w77LrQhiD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KObDt8YH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450ce671a08so3027375e9.3;
        Thu, 19 Jun 2025 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750323607; x=1750928407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMLvtRW8lP9BVVUwuPMh8xqp/K6tyZKhWFpUJL3ALEg=;
        b=KObDt8YH3HMn60ZL8faB+4Gz+EX0KzPuXAq8CM47Kbhy7l563qYSn9WwV4rsa3w1Ll
         vf0yT0tqWa58kT7vO5i/NiIkwHTw+JEodLaoe7JK5hxS1jp5d6yb8Mm4tsJLdoOJUW49
         wPwRXX0LzcLl8sEPU8CuTc/mlf9JIgkwK5zXHg4zzRjxXdSB5rxtcdElnu4y/p5lb4xg
         Tj3Cc60LpgS+0hia6vFN6xIvnqEtlRwvAcLEuII+fPPfn3DoscGJE4pzZzLjGcUFfpMy
         wY+GZJPTIGeVjyhzw1yXwbXgCawQauumWC+TmPLB/0+yAn4DJIAj99u7LbENmGiely1P
         z48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323607; x=1750928407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMLvtRW8lP9BVVUwuPMh8xqp/K6tyZKhWFpUJL3ALEg=;
        b=SjkSb2qwcgL1PGr6sJZCZWS5xOUGqq5DhXeOuVfXdD7clhHCYBDMd5sm5DpgJjO04B
         YJn+LdrF/X45rb8zB2Lg92UKqVsqx3wvBEhppPheYyf7tZWcMOHKUCXhKRc4cKfpRIGM
         MiKoqEl8DGJ3C1RF+R1PRYSMz0cU3DwS1xopNTm310jS5BJBt/E52vZnTfB5yfRJ+A4W
         3Suh1TjtlKFEZ6ccp5I7iyEvL0qLu1+QdXqaTOHRJYYIEfuoUC8/2uamxQm4A5C+KS7Y
         lVFUXEOpCZAEqmSnNbpZyUjZ9DTgvSl0AGXocIPpDGzKCyEPKTa3E3EVdKJu5zPdHkdp
         Hmdg==
X-Forwarded-Encrypted: i=1; AJvYcCUWyb0pjbMykxab2RtPFCQpmZrT0QBrV1dAMF6MWgNC8cpvkPSMhEuMX10hBk0WTpPM+KgtGUwcUX3K@vger.kernel.org, AJvYcCWAxMdYFP4kjf+JQzDFv9Vj6OR1rhGi0OgaDPJ30PzzwxT8lKYsgTQZzhdhXe2fl0LB7+HwAY9U@vger.kernel.org, AJvYcCWgEUG9OaWYxQ6corbsRyoIOEnYHpYhgJ3xjNN4UcWfBtTnvTscBIQi4X4C/CWk8SPhupgPsFprChd5rKka@vger.kernel.org, AJvYcCWv/Fl+IedIif/+eOFCMGttsKmU9lS4hKx3XM41KcFXVxAY0xQb6/dxTVjKWeKeFeu9R0/AwZNopwVpqDLEo9E20I8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3x84n+wspTqIQB0ynqjQ9RqM1WqPW+gFj+Bx41XwpOEfmEYU
	r72g1OBDA1/tC250aHW7srHlWhx3CcRk35YxLqFYqtL1paCET27ndMI5yAhdwxfrNmAu028qmdl
	LzUviOHAex+Uq0bcFdoMXdE0oWMJCfjA=
X-Gm-Gg: ASbGncvXiSskg4erDxzDKfTOdq0HLwKuu1Qw5JZXOl1YevHU6mIO+3gCW65Zq6psg65
	4Bv7bHSgDS/EZSVaBojWGe1qmeMpEIteHGuZ+Gn1E3PXf1Ys/jA5s2Xwf1DGRQsvFcFaFfZLKOF
	rADbMRz8HiPxZgUWwo3nnDYRSAahQiwnf5cM8LvrQ2rJIgi6RCBRiJV7SFi+Qv9nHzHOai5gmZN
	QZS
X-Google-Smtp-Source: AGHT+IGhu8co19gsbnewWhNefXxhKDeZw+yRoWO6wb7/e+7qCs6ACRJfdkx53ZLyixNkwCGavN9xkSNMsCx1jFBc7Uo=
X-Received: by 2002:a05:600c:46cc:b0:453:b1c:442a with SMTP id
 5b1f17b1804b1-4533cb53989mr181220065e9.27.1750323607211; Thu, 19 Jun 2025
 02:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com> <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Jun 2025 09:59:41 +0100
X-Gm-Features: Ac12FXxEbSDhRUhp-8lwipAqXbd42CO72LWVe4CbodNCzZQmHjti3RncJNUk7JY
Message-ID: <CA+V-a8uizu5MCur_=g5vJyWbWSTSP2J6FkQ89JB8ges7GWdsjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net, 
	edumazet@google.com, geert+renesas@glider.be, krzk+dt@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org, 
	john.madieu@gmail.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

Thank you for the patch.

On Wed, Jun 11, 2025 at 7:20=E2=80=AFAM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
> Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SM=
ARC EVK
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-smarc-som.dtsi
> index f99a09d04ddd..4b4c7f3381ad 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -26,6 +26,8 @@ / {
>         compatible =3D "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "r=
enesas,r9a09g047";
>
>         aliases {
> +               ethernet0 =3D &eth0;
> +               ethernet1 =3D &eth1;
>                 i2c2 =3D &i2c2;
>                 mmc0 =3D &sdhi0;
>                 mmc2 =3D &sdhi2;
> @@ -77,6 +79,74 @@ &audio_extal_clk {
>         clock-frequency =3D <48000000>;
>  };
>
> +&eth0 {
> +       phy-handle =3D <&phy0>;
> +       phy-mode =3D "rgmii-id";
> +
> +       pinctrl-0 =3D <&eth0_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               compatible =3D "snps,dwmac-mdio";
> +
> +               phy0: ethernet-phy@7 {
> +                       compatible =3D "ethernet-phy-id0022.1640",
> +                                    "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <7>;
> +                       interrupts-extended =3D <&icu 3 IRQ_TYPE_LEVEL_LO=
W>;
> +                       rxc-skew-psec =3D <1400>;
> +                       txc-skew-psec =3D <1400>;
> +                       rxdv-skew-psec =3D <0>;
> +                       txdv-skew-psec =3D <0>;
> +                       rxd0-skew-psec =3D <0>;
> +                       rxd1-skew-psec =3D <0>;
> +                       rxd2-skew-psec =3D <0>;
> +                       rxd3-skew-psec =3D <0>;
> +                       txd0-skew-psec =3D <0>;
> +                       txd1-skew-psec =3D <0>;
> +                       txd2-skew-psec =3D <0>;
> +                       txd3-skew-psec =3D <0>;
> +               };
> +       };
> +};
> +
> +&eth1 {
> +       phy-handle =3D <&phy1>;
> +       phy-mode =3D "rgmii-id";
> +
> +       pinctrl-0 =3D <&eth1_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       mdio {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               compatible =3D "snps,dwmac-mdio";
> +
> +               phy1: ethernet-phy@7 {
> +                       compatible =3D "ethernet-phy-id0022.1640",
> +                                    "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <7>;
> +                       interrupts-extended =3D <&icu 16 IRQ_TYPE_LEVEL_L=
OW>;
> +                       rxc-skew-psec =3D <1400>;
> +                       txc-skew-psec =3D <1400>;
> +                       rxdv-skew-psec =3D <0>;
> +                       txdv-skew-psec =3D <0>;
> +                       rxd0-skew-psec =3D <0>;
> +                       rxd1-skew-psec =3D <0>;
> +                       rxd2-skew-psec =3D <0>;
> +                       rxd3-skew-psec =3D <0>;
> +                       txd0-skew-psec =3D <0>;
> +                       txd1-skew-psec =3D <0>;
> +                       txd2-skew-psec =3D <0>;
> +                       txd3-skew-psec =3D <0>;
> +               };
> +       };
> +};
> +
>  &gpu {
>         status =3D "okay";
>         mali-supply =3D <&reg_vdd0p8v_others>;
> @@ -103,6 +173,42 @@ raa215300: pmic@12 {
>  };
>
>  &pinctrl {
> +       eth0_pins: eth0 {
> +               pinmux =3D <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +                        <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +                        <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2=
) */
> +                        <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                        <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                        <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                        <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
> +                        <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                        <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                        <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                        <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                        <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                        <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
> +                        <RZG3E_PORT_PINMUX(B, 1, 1)>, /* TXC */
> +                        <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
like RZ/V2H on RZ/G3E PFC_OEN BITS(0,1) need to be configured based on
RGMII/MII mode?

Cheers,
Prabhakar

> +       };
> +
> +       eth1_pins: eth1 {
> +               pinmux =3D <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
> +                        <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
> +                        <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ1=
5) */
> +                        <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
> +                        <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
> +                        <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
> +                        <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
> +                        <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
> +                        <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
> +                        <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
> +                        <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
> +                        <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
> +                        <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
> +                        <RZG3E_PORT_PINMUX(E, 1, 1)>, /* TXC */
> +                        <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
> +       };
> +
>         i2c2_pins: i2c {
>                 pinmux =3D <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
>                          <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
> --
> 2.25.1
>
>

