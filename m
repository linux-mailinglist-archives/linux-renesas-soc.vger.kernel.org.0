Return-Path: <linux-renesas-soc+bounces-24422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B0EC47E72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 17:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 162D01881D6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0840725A340;
	Mon, 10 Nov 2025 16:16:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAF267B01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791403; cv=none; b=EGwNjv4SkA9dPo29WXSLp8qpVQw2A5cE3LLdAcVPMNPdH9mrs0xAoKuA+U3hBQ37UIU9rTdSHXCPMWdnafLod4FjXFX5KgNxG7VWiQ9M7tdb23JPjV8uAC2xZ9YHn3LHi6s/+AFh38FmFsQMEwLyopF696Jib7VX3VN6R6XO54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791403; c=relaxed/simple;
	bh=Oj+MACFttgL4DFd5A7ViUQbdwBnwgGwGclfbbcanDRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5mKyLpEOv5YzdAS0N8jh2/y52KA6OGyxP6ob2Gciukp5JkNhZugik3c6nRXyqdMC7i3arD59zFV6CU35bQpJ8soGlowdy9sQjnmk9LUT33vMvgRg2Br5IsXriOu7F8qzJl/Yz7p63qtx56q6SrMRWS/3PekAg3pL9954tFIxVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5563c36f5dfso832470e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791400; x=1763396200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/lLSXjoHK4s9dqtzRhXw91kDvxvE9lMfjhCOgxWsIE=;
        b=jlE6fJgC9zCGXGUBzF/PlFGfO6Gxrw4ankfPJb6zpYwBlcN6GP1WZP/k+jzwFJCIUg
         jlFLckhl9d+pI0Cqi9fH90Qvk6CZRrPo9SWa+ofuXMokATcbmnVCBGpkPjia2sl4iwlQ
         b4HgHIjupYscRKge1jJFbkkeBeqtMIDpxPZWI3PN/X9Fvkshrwlig6Tvk6dOeq6Hkude
         +OB1jQ+1cSG7kBqzj2l3rD1JUP3ds1uBHc0O3y/PmTUG1QKlgf4QVdAPEbcmreYREveM
         EDOdBLYbzwufThjpOHCpAzMAanSRV6TuMqIqAN5stui46RtkRfVseEriDdZLd/sfWtFf
         uLPw==
X-Forwarded-Encrypted: i=1; AJvYcCXtr/rFVGVQUGXKYw6WnuQY1djB73iqNKdxWsKHgZyf9JJh3YW5axA58VkeLifcQPpASEOlUpylv1cknlCj/GuZCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3DZPTd9XKNRupqGJfD9YwPnPyycAjVpseJ/m4Wi2XntwQ/WV
	RDGFP8WBChuP34/p7sncxi3SmsBXH0gcjzbkPHd5cvKw91Czm42hSc0jygd2l6sz
X-Gm-Gg: ASbGnctxVqkYhADSph2WXGGP98RSswX6e/PdzZ7RkRgyC1elncSR1lqkpZKB7MrQfMb
	dyvHd4ZaA/n8tQQyPG1uzbwFS+bDdyJy5XsPNQc6wRVkqcrbj6nqMJO6pE2YGGV2QxDtCogpJhM
	w6Y4OX+5st0+Dks4ANu7AwQLOOtBdxLY4y0zD//Fg4IrkuOoe0T4Qu5Yx4IxbJ/0njdm9KboZ+/
	TGgmDT9WcAbcgI3citnpCbZqbfcmYkeKdHG6vWckoe/t18c+5xmZvV7DpF7Bp6EBQK5SYF/yH9a
	aPujc7zyETXVmjdw6vR4MDzf5FVNVNLDmyU00TzIIv5kllNqx9UOsqvXELSGbY7yvjHsVpBdKeu
	fXTt1jagO+UUWn5uCGVSg8XMMaxAKTeVZczOt4Zf25S415nwT3/3ubSpUndtBuu2Ui8NTRfRTnk
	KgOYYVjlEMnHvIo/YfZvh8K/rZQSBcncT494EIe3ExD9izvFPx
X-Google-Smtp-Source: AGHT+IEmFHm0p2zXtB8YEuzmXa3WZ7yLgz1DqsBBUHz6/UWa1AMJaWTkrExgMKRo8lhEI8sPmEvL0A==
X-Received: by 2002:a05:6123:2e9:b0:559:6694:42ac with SMTP id 71dfb90a1353d-559b32b73c5mr3133716e0c.10.1762791400387;
        Mon, 10 Nov 2025 08:16:40 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5599663c493sm7209818e0c.5.2025.11.10.08.16.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 08:16:38 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dd83dec0b3so1077910137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 08:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc195F3sLel0CBQzz1eH5PW+3QCEkq2RiDmy1FDznsebTrQMKXcyv3313eiz+5LOVtc4NxXnJlKi8qyAqzk/DbJQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3706:b0:5db:debf:658f with SMTP id
 ada2fe7eead31-5ddc4677cafmr2517889137.19.1762791398206; Mon, 10 Nov 2025
 08:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028175458.1037397-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028175458.1037397-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 17:16:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4YTdy7zCiTyYbTY_t84q_xjjf0+XpDcyuGqB-zv6r5g@mail.gmail.com>
X-Gm-Features: AWmQ_bnUV9390k-yS-D893D2ukJvmbPbtHpKrPkw-Xw6URCIb2kBicAa71zpzl8
Message-ID: <CAMuHMdU4YTdy7zCiTyYbTY_t84q_xjjf0+XpDcyuGqB-zv6r5g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: rzt2h-n2h-evk: Enable
 Ethernet support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 28 Oct 2025 at 18:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable Ethernet support on the RZ/T2H and RZ/N2H EVKs.
>
> Configure the MIIC converter in mode 0x6:
>   Port 0 <-> ETHSW Port 0
>   Port 1 <-> ETHSW Port 1
>   Port 2 <-> GMAC2
>   Port 3 <-> GMAC1
>
> Enable the ETHSS, GMAC1 and GMAC2 nodes. ETHSW support will be added
> once the switch driver is available.
>
> Configure the MIIC converters to map ports according to the selected
> switching mode, with converters 0 and 1 mapped to switch ports and
> converters 2 and 3 mapped to GMAC ports.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

I found the mapping between GMACx, ETHy, PHYz, and board connector
rather hard to follow.  Some suggestions for improvement are included
below...

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -149,7 +149,77 @@ &i2c1 {
>         status = "okay";
>  };
>
> +&phy2 {
> +       /*
> +        * PHY2 Reset Configuration:
> +        *
> +        * SW6[1] = OFF; SW6[2] = ON; SW6[3] = OFF;
> +        * P17_5 is used as GMAC_RESETOUT2#
> +        */
> +       reset-gpios = <&pinctrl RZT2H_GPIO(17, 5) GPIO_ACTIVE_LOW>;
> +};
> +
> +&phy3 {
> +       reset-gpios = <&pinctrl RZT2H_GPIO(32, 3) GPIO_ACTIVE_LOW>;
> +};
> +
>  &pinctrl {
> +       /*
> +        * ETH2 Pin Configuration:
> +        *
> +        * SW2[6] = OFF: MDC and MDIO of Ethernet port 2 are connected to GMAC2
> +        * SW2[7] = ON:  Pins P29_1-P29_7, P30_0-P30_4, and P31_2-P31_5 are used for Ethernet port 2

Please split this long line.

> +        */
> +       eth2_pins: eth2-pins {

Perhaps s/eth2/gmac2/, to make the mapping easier to follow?

> +               pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
> +                        <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD[0] */
> +                        <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD[1] */
> +                        <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD[2] */
> +                        <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD[3] */

The documentation doesn't use square brackets in the signal names.

> +                        <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
> +                        <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
> +                        <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD[0] */
> +                        <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD[1] */
> +                        <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD[2] */
> +                        <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD[3] */
> +                        <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
> +                        <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
> +                        <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
> +                        <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
> +                        <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
> +                        <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* ETH2_MDC */
> +                        <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* ETH2_MDIO */

The documentation calls these GMAC2_{MDC,MDIO}.

> +                        <RZT2H_PORT_PINMUX(31, 0, 0x02)>; /* ETH2_REFCLK */

Please settle on a common convention for formatting pinmux settings:
either use 0x2 here (no leading zero), or 0x0f in the other entries.

> +       };
> +
> +       /*
> +        * ETH3 Pin Configuration:
> +        *
> +        * SW2[8] = ON, P27_2, P33_2-P33_7, P34_0-P34_5, P34_7 and P35_0-P35_5

P27_2 and P35_3-P35_5 don't seem to be muxed by SW2[8]?

> +        * are used for Ethernet port 3
> +        */
> +       eth3_pins: eth3-pins {
> +               pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD[0] */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD[1] */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD[2] */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD[3] */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD[0] */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD[1] */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD[2] */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD[3] */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* ETH3_MDC */
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* ETH3_MDIO */
> +                        <RZT2H_PORT_PINMUX(34, 6, 0x02)>; /* ETH3_REFCLK */
> +       };
> +
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> index d698b6368ee7..7ebc89bafaf1 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -186,7 +186,86 @@ &i2c1 {
>         status = "okay";
>  };
>
> +&phy2 {
> +       /*
> +        * PHY2 Reset Configuration:
> +        *
> +        * DSW8[1] = ON; DSW8[2] = OFF
> +        * DSW12[7] = OFF; DSW12[8] = ON
> +        * P03_1 is used as GMAC_RESETOUT2#
> +        */
> +       reset-gpios = <&pinctrl RZT2H_GPIO(3, 1) GPIO_ACTIVE_LOW>;
> +};
> +
> +&phy3 {
> +       /*
> +        * PHY3 Reset Configuration:
> +        *
> +        * DSW12[5] = OFF; DSW12[6] = ON
> +        * P03_2 is used as GMAC_RESETOUT3#
> +        */
> +       reset-gpios = <&pinctrl RZT2H_GPIO(3, 2) GPIO_ACTIVE_LOW>;
> +};
> +
>  &pinctrl {
> +       /*
> +        * ETH2 Pin Configuration:
> +        *
> +        * DSW5[6] = OFF, P21_4-P21_5 are used for Ethernet port 2

MDC and MDIO of Ethernet port 2 are connected to GMAC2

> +        * DSW5[7] = ON, P29_1-P29_7, P30_0-P30_4, P30_7, P31_2, P31_4
> +        * and P31_5 are used for Ethernet port 2
> +        */
> +       eth2_pins: eth2-pins {

Perhaps s/eth2/gmac2/, to make the mapping easier to follow?

> +               pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
> +                        <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD[0] */
> +                        <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD[1] */
> +                        <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD[2] */
> +                        <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD[3] */
> +                        <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
> +                        <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
> +                        <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD[0] */
> +                        <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD[1] */
> +                        <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD[2] */
> +                        <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD[3] */
> +                        <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
> +                        <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
> +                        <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */

31, 1, 0xf

> +                        <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
> +                        <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
> +                        <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* ETH2_MDC */
> +                        <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* ETH2_MDIO */

The documentation calls these GMAC2_{MDC,MDIO}.

> +                        <RZT2H_PORT_PINMUX(31, 0, 0x02)>; /* ETH2_REFCLK */

> +
> +       };
> +
> +       /*
> +        * ETH3 Pin Configuration:
> +        *
> +        * DSW5[8] = ON, P00_0-P00_2, P33_2-P33_7, P34_0-P34_6, are used for Ethernet port 3
> +        * DSW12[1] = OFF;DSW12[2] = ON, P00_3 is used for Ethernet port 3
> +        */
> +       eth3_pins: eth3-pins {

Perhaps s/eth3/gmac1/, to make the mapping easier to follow?

> +               pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
> +                        <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD[0] */
> +                        <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD[1] */
> +                        <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD[2] */
> +                        <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD[3] */
> +                        <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
> +                        <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
> +                        <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD[0] */
> +                        <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD[1] */
> +                        <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD[2] */
> +                        <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD[3] */
> +                        <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
> +                        <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
> +                        <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
> +                        <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
> +                        <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
> +                        <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* ETH3_MDC */
> +                        <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* ETH3_MDIO */

The documentation calls these GMAC1_{MDC,MDIO}.

> +                        <RZT2H_PORT_PINMUX(34, 6, 0x02)>; /* ETH3_REFCLK */
> +       };
> +
>         /*
>          * I2C0 Pin Configuration:
>          * ------------------------
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index 924a38c6cb0f..c608d97586ff 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -7,10 +7,14 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/mscc-phy-vsc8531.h>
> +#include <dt-bindings/net/renesas,r9a09g077-pcs-miic.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
>
>  / {
>         aliases {
> +               ethernet0 = &gmac1;

Is this the port labeled "Ethernet(ETH3) Connector" in the Board's
User Manual?  Shouldn't that be "ethernet3"?

> +               ethernet1 = &gmac2;

Is this the port labeled "Ethernet(ETH2) Connector" in the Board's
User Manual?  Shouldn't that be "ethernet2"?

>                 i2c0 = &i2c0;
>                 i2c1 = &i2c1;
>                 mmc0 = &sdhi0;
> @@ -70,10 +74,34 @@ &ehci {
>         status = "okay";
>  };
>
> +&ethss {
> +       status = "okay";
> +
> +       renesas,miic-switch-portin = <ETHSS_GMAC0_PORT>;
> +};
> +
>  &extal_clk {
>         clock-frequency = <25000000>;
>  };
>
> +&gmac1 {
> +       pinctrl-0 = <&eth3_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy3>;
> +       phy-mode = "rgmii-id";
> +       pcs-handle = <&mii_conv3>;
> +       status = "okay";
> +};
> +
> +&gmac2 {
> +       pinctrl-0 = <&eth2_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy2>;
> +       phy-mode = "rgmii-id";
> +       pcs-handle = <&mii_conv2>;
> +       status = "okay";
> +};
> +
>  &hsusb {
>         dr_mode = "otg";
>         status = "okay";
> @@ -87,6 +115,48 @@ eeprom: eeprom@50 {
>         };
>  };
>
> +&mdio1 {
> +       phy3: ethernet-phy@3 {

Ah, the "3" corresponds to the PHY address in this mdio node...
Perhaps "mdio1_phy", to make it easier to match mdio and phy nodes?

> +               compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
> +               reg = <3>;
> +               vsc8531,led-0-mode = <VSC8531_LINK_ACTIVITY>;

VSC8531_ACTIVITY?

> +               vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
> +               reset-assert-us = <2000>;
> +               reset-deassert-us = <15000>;
> +       };
> +};
> +
> +&mdio2 {
> +       phy2: ethernet-phy@2 {

mdio2_phy?

> +               compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
> +               reg = <2>;
> +               vsc8531,led-0-mode = <VSC8531_LINK_ACTIVITY>;

VSC8531_ACTIVITY?

> +               vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
> +               reset-assert-us = <2000>;
> +               reset-deassert-us = <15000>;
> +       };
> +};
> +
> +&mii_conv0 {
> +       renesas,miic-input = <ETHSS_ETHSW_PORT0>;
> +       status = "okay";
> +};
> +
> +&mii_conv1 {
> +       renesas,miic-input = <ETHSS_ETHSW_PORT1>;
> +       status = "okay";
> +};
> +
> +&mii_conv2 {
> +       renesas,miic-input = <ETHSS_GMAC2_PORT>;
> +       status = "okay";
> +};
> +
> +&mii_conv3 {
> +       renesas,miic-input = <ETHSS_GMAC1_PORT>;
> +       status = "okay";
> +};
> +
>  &ohci {
>         dr_mode = "otg";
>         status = "okay";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

