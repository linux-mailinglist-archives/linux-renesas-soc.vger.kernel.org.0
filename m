Return-Path: <linux-renesas-soc+bounces-18775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E2AE9D10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27FA73B0959
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6957B1BC3F;
	Thu, 26 Jun 2025 11:58:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D02F1FEC;
	Thu, 26 Jun 2025 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939096; cv=none; b=DFanh/jB2Qg2RvHTcy8Uq5ZOcVKIgR6dNJthBjGfOVOrMw7QHtrMerTT7kBw4Cbm2t0hCEiU5d7OT92rU7TQ1fjBY/dWvEqXoBABOHij105NFCvAzgQ/IsGQCFBUybPsmgOSkPWXFmV+qwTR0E3kTSgv/RX3e1NPRMlC9qKrw9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939096; c=relaxed/simple;
	bh=fbs1q+JsuaSJKXWhauDT9K8vAUjLhnIklFMIMSl/P+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSu4RGu3iOSLUbLUoK0Jnc5102GQjMSf2b0Lmrt5+6MNDSevKEFI8f23lE3HMPa5QPVxWpYh0XjGw+EBaTeEa7IXI3h2hPfLzgYFq5ADZkj6/s/VkHMaDnCHtiMKzMtasH3j/dj6xp6XxD5jsA9Gp6fQUIQhM0sWdDoLemuTL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e79dde8511so196520137.0;
        Thu, 26 Jun 2025 04:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939092; x=1751543892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5D+86CEEwzC4+/VJmAWquleszRXVYD3WE2XTmHeq9A=;
        b=gm+iReD90ppHCdzuPBB+Gg7IxUEc5grPYNNkH/WHcIjZ0W6a+OkAmdYJVNaBvgQvav
         1aWtg8x5+U5qL132bZAGverCmavMfFDY/CORFgQhsHZOzqwupwxrBMgiNv+gPWR+2jwB
         MzjQwvMbFMgLCg7XhVQsXTwu43xKFIEQbvc6etAlaArHLcZlKRH6OVAmdpAYoadZNzVu
         jkcP56hwot1Onm8p9V+hU47wk2/w3wtAdw701s2OZ6HQVpeA0HwI3xPlnD/B0GVlgCxG
         ni1h4K6aDqRZdE+nj5xWgaP8ZCais8dHatjRav1taHjHQ5kgyZ6OZgtprORE782eWjGI
         aYaA==
X-Forwarded-Encrypted: i=1; AJvYcCWKX1RQii/hHqzF+QKJbtyWiuwIHhzbMeCj4Ft8ciMIYCzVKVr/mPCuVA2bQJnXkxUFWN1vicmcDjKS@vger.kernel.org, AJvYcCXN29P/KoI7Y43ljimgZ1S0ZtvD0IdquyRSleGdazt3ghZqoMB6Tt4nLenHfclTngb9kobXwd3v8DwfVVqK9x+/8KE=@vger.kernel.org, AJvYcCXVtGjuXcEz/mShGMeLV2TivFNxH9NdaqRHKM2ntRAsFgq15Dv1XWXHldQ2fLJAQxsNR8AuCiDz/u2K2QR0@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1EcN017/nTR17jZ0d+oHv5s0/QkvXpvGuzZGBsve2A3F7v/t
	HrodVIHj+e+/syJsIPz+vVs/XDpJwNaYVLNRWT7wPm4Sl2nsMWPNsQifQJUsrA5H
X-Gm-Gg: ASbGnctHxEeGZp9uNxz207zMis2BFMSQ+kSqgAz8P9e42voNvt48JnGgILQTK55zi6J
	jRBX6N1XyjKGuONH4A7xz0kOIe7eyCDD+j9qdBW/vuTuui0mYeZENbX7Bl4hGs6HqTMfoM80zLe
	e0qUDqMzW7qlvIDG1Ps2CPlEalldjagSbBAFMVOKN4gXd9PMwdDIwFdCGHincVl48ai1RAxKwMS
	i7Sw308nRGu66B+dUstYJnl3DvBNR2DtW1VX/7iXrClfJ1VkLeL9V2qnvQpmY0J46b+MXDshMxx
	NQ7+LEkLhbegFay2jLGPcIClArlA8XwQj7hu+9xDl87LkPv1mVrQqckeOscvL6rpniU/N0XLplX
	s707LrX79WMbeIcH3nXPSzbwA
X-Google-Smtp-Source: AGHT+IE9lsdK8q4AcG0YMa9tINPYrYjS67hM7RqqbEo9bNmUzBEzC2T4fophGsPk9RiUEM/5wMF4IQ==
X-Received: by 2002:a05:6102:1610:b0:4eb:efc6:740 with SMTP id ada2fe7eead31-4ecc7688ef2mr4639546137.18.1750939092038;
        Thu, 26 Jun 2025 04:58:12 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c2e8158csm2340693137.11.2025.06.26.04.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 04:58:11 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so276911137.1;
        Thu, 26 Jun 2025 04:58:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR7MfLJ0hig21u9aYRyO+SM+xc+QGHpfCYZ80VV01Ln88v8Ar3UwOdlKPiNtMxB0X5ZF1b7aDPzaC9@vger.kernel.org, AJvYcCWwK5kQ+RlDZL49Pq4vrk5uB17zWOPzUSzDODP4pWRnXqtGn3Usd6tvBKbFbw1IaKaMpw3szMTb6GL0W1qBDm7BmDI=@vger.kernel.org, AJvYcCXmtRzNDhSpZiD3CX4RhQTd7hmCGILA48AQ/5irtO2TWf2oZ+uE4ltI0UXiosHxHuhzbm/z19/G0pTuHc0U@vger.kernel.org
X-Received: by 2002:a05:6102:2909:b0:4e9:c7c8:5dff with SMTP id
 ada2fe7eead31-4ecc766bedcmr5187924137.15.1750939091232; Thu, 26 Jun 2025
 04:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250620121045.56114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250620121045.56114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 13:57:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXP95AsuS2E=SWvzfo89y_VtyXPWoZUKT6mjj_xeLb=Eg@mail.gmail.com>
X-Gm-Features: Ac12FXzRz_hjrthcj_xKPSNqDepD5CqeREFVrqO6uKI-zZQfrqwm2e12re8273g
Message-ID: <CAMuHMdXP95AsuS2E=SWvzfo89y_VtyXPWoZUKT6mjj_xeLb=Eg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays
 for RZ/V2N EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 20 Jun 2025 at 14:10, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce device tree overlays to support the eMMC (RTK0EF0186B02000BJ)
> and microSD (RTK0EF0186B01000BJ) sub-boards via the CN15 connector on the
> RZ/V2N EVK. These overlays enable SDHI0 with appropriate pinctrl settings,
> regulator configurations, and GPIO handling.
>
> Shared DTSI fragments (rzv2-evk-cn15-emmc-common.dtsi and
> rzv2-evk-cn15-sd-common.dtsi) provide reusable configurations for both
> RZ/V2N and RZ/V2H EVKs, as both support the same CN15 sub-boards.
>
> Additionally, the base board DTS is updated to define an `mmc0` alias
> pointing to `&sdhi0`, and to add a fixed 1.8V regulator node (`reg_1p8v`)
> intended for use by the optional eMMC sub-board and, in the future, the
> ADV7535 HDMI encoder (not yet enabled in the DTS).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree overlay for the RZ/V2N EVK with the eMMC sub-board
> + * (RTK0EF0186802000BJ) connected to the CN15 connector.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#define RZV2N_PA               10

This is duplicated from r9a09g056.dtsi, but unused?

> +#define EMMC_GPIO(port, pin)   RZG2L_GPIO(RZV2N_P##port, pin)

Unused?

> +
> +#include "rzv2-evk-cn15-emmc-common.dtsi"

Hence you can just have a single rzv2-evk-cn15-emmc.dtso that works
on both RZ/V2H and RZ/V2N.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
> new file mode 100644
> index 000000000000..6268dda138ab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree overlay for the RZ/V2N EVK with the SD sub-board
> + * (RTK0EF0186B01000BJ) connected to the CN15 connector.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#define RZV2N_PA               10

This is duplicated from r9a09g056.dtsi. Can we avoid that?
If not, I think we found the justification for moving these definitions
to include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h...

> +#define SD_GPIO(port, pin)     RZG2L_GPIO(RZV2N_P##port, pin)
> +#define SD_PORT_PINMUX(b, p, f)        RZG2L_PORT_PINMUX(RZV2N_P##b, p, f)
> +
> +#include "rzv2-evk-cn15-sd-common.dtsi"
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> index b63ee1ff18d5..795d9f6b9651 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> @@ -24,6 +24,7 @@ aliases {
>                 i2c6 = &i2c6;
>                 i2c7 = &i2c7;
>                 i2c8 = &i2c8;
> +               mmc0 = &sdhi0;

While (out-of-tree) dynamic DT overlays do not support updating aliases
yet, this logically belongs in the overlay, so please move it there.

>                 mmc1 = &sdhi1;
>                 serial0 = &scif;
>         };
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Shared DT include for the eMMC Sub Board (RTK0EF0186B02000BJ), which
> + * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
> + *
> + * Contains common pinctrl and SDHI0 definitions.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;

These two directives belong in the .dtso files (and you already have
them there).

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Shared DT include for the microSD Sub Board (RTK0EF0186B01000BJ), which
> + * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
> + *
> + * Contains common pinctrl and SDHI0 definitions.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;

Likewise.

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +&{/} {
> +       vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SDHI0 VqmmC";
> +               gpios = <&pinctrl SD_GPIO(A, 0) GPIO_ACTIVE_HIGH>;

If you use a macro to abstract the GPIO number, please include the
bank and port number in the abstraction.

Alternatively, as both RZ/V2H and RZ/V2N use PA0, you can use
RZG2L_GPIO(10, 10) directly.  That just leaves us with a desire to
express "A" instead of 10...

Note that you end up with the exact same .dtbo for RZ/V2H and RZ/V2N
again...

> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios-states = <0>;
> +               states = <3300000 0>, <1800000 1>;
> +       };
> +};
> +
> +&pinctrl {
> +       sdhi0-pwr-en-hog {
> +               gpio-hog;
> +               gpios = <SD_GPIO(A, 1) GPIO_ACTIVE_HIGH>;

Likewise.

> +               output-high;
> +               line-name = "sd0_pwr_en";
> +       };
> +
> +       sdhi0_pins: sd0 {
> +               sd0-cd {
> +                       pinmux = <SD_PORT_PINMUX(A, 5, 15)>; /* SD0_CD */

Likewise.

> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

