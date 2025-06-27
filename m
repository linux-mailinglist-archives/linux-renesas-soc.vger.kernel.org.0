Return-Path: <linux-renesas-soc+bounces-18852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67947AEBC82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 17:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4855E3AF936
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 15:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EC72E9EBC;
	Fri, 27 Jun 2025 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mfgw/3z0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E023208;
	Fri, 27 Jun 2025 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039519; cv=none; b=tpC7weadFjETYtab6ISKMXUvnQcj+4FjJEhWkBzyaGhH4tlzhMqwmPiFFQyL7zwuSqcszH+Y3NqRF97jMWmR7S9BMJL6Q5e3lS7Ss5b0XUez2e7pGAGEafP9J4XQVyTEJjUmQ82/L3N2IjExEw810oXy/gteeFyZtRMIm+RMIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039519; c=relaxed/simple;
	bh=bGfjl2sUihQ7mzvP4bjc2BtmGohmlSO93LcIHTk+1dM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2/XUAJ8B3AGrUY3cJvZ3Ej9oteffkmx+6jFggWOp8GU0Ia4TP1rUuUosjybuJ/h4ySpwj1KIsHhh0wNIESCAhtqYdzLS4etOyMuJgTbJ6Og8twsAFGrO/skS6xUqvjES4wLSmc4l1/Am3bKAZ/DuSOle2V+rdHmK/FGBjH2LEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mfgw/3z0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so311715e9.1;
        Fri, 27 Jun 2025 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751039516; x=1751644316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xErbCK7925kvFk/0rsz3sjYja8g59D1L7zl8Xa9niCg=;
        b=Mfgw/3z0pEnQRyy4XNoxisYgXPeK96watLz1ZkHpxUbKsRQGDvn3/NJ55GP1iweKck
         x9mGLG2HGym3AsJNmxy/Qnp4tps/TmF0hlE1qFE/WpfoYblsWlRaYWT26HNhpMRPbhM1
         uFpGKm4mmBMRS+EZuoo7pM/8m5Q8rCtzcFylNnEzZext65A6WD28U2c1FJlKTK0d+HtI
         GSE2xU2C+4VoWfWEEdmyDTedddTYzVHCYwzJj7NLw1hyi3rUskox4eHJ5FoCPRwDk2oJ
         sWNR1lCbQeNZnZftXv7c6vm9QBQzUl7vXJ9Tg6mOp2wM/JUchauWgn5mxhKPD4gcqlaD
         i5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039516; x=1751644316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xErbCK7925kvFk/0rsz3sjYja8g59D1L7zl8Xa9niCg=;
        b=VBQAQ9OBh/0eTIyg8pm8HBSN9c2WaTSK+LuEzjdhDKYD9pOTCkxXVKQ5vFlwu4WkvL
         zJpUeHgsa9Vro3qsEGTF8SaX4D9iOSWQnmAFxMPOBn5Y6mDjoTY/TO4YQ4Tfd73EFSY8
         4vy+uKRmRSiSsvBUSQBB3qBzOLYdBxxrLxyQ8E4DiWRhrWMV+X/GfApQQJW/t10nRhS0
         ZCrX25TmnPvjT6tuqdOEtVeLGPbgAtRnbYS6+0x1u8C7YDw68o/WDrEj0af8QoysYFxT
         boH3LfSQt2NMErGvTsJ+aKm0d+KJ2lTzU5awv9qIibMvA2E97CltIYDcfjSaelceCX7z
         CqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt8QDV1PGqWB2vVKLv5rC/SxfQW7H9Ot1aeb4ZOyrt7eVWkmoWmjg5xhj1rISq695Hm0XPap0Lekei@vger.kernel.org, AJvYcCX02Le5vvy4udoY/okf4+eFvTXDBC+xwCMqfpXNCEepw9b+wRwupnqmHxFYDjyRKkhOVYTpa5ZfBZ/kss+3M56Uvys=@vger.kernel.org, AJvYcCXPD/tDvGzL0QsO0pNCwOeT1KhsIEZ5wIuOVgtuOJmeFyfJeJgLTCnOJ+h6Z0fjg59VEW1B4mLSPgzQ0dGm@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1Y+GpQyQWONbSh+1C7ZcRC3dFYZyf7yim2a4GmaeY9NSbT30
	s92vVWpoPYQkDy9y/TRiEBUcsosmR3G/6RN8nfLLTorRkvwtIYo+/bM2BQ2bAh5DM8he58C7kKK
	JKB9whTc3HBSRM2vXeZ3lBTtCmHAShlHClTEvJYs=
X-Gm-Gg: ASbGncuyoGamwrLTlnpJ2L0UL4xONHA3Ie2CFsjwccA3QsBGl2QQ3W4mjdjyNbHTAU2
	YpPo/4I+flviydFDqYzH8g328af65FEBj6psv49XGW+vA+f8Ofqrmxx/+kIOpo8ecE+r6sLWbZR
	xMvWtoBKiA4xW8ieH9S1zpa+yIMk+mVRpEL6QR6BGa4P5qMDaZpBqX4D8tB9BIxtD3pK4nAqsCN
	sQ=
X-Google-Smtp-Source: AGHT+IHoGOIuIcCHNU7ehWANyO0hybfEtrv1QBleE6G/veH3aPXy5pDsZb/da0AHyQkIGtPpxU2PdHgkT7ypskkygzQ=
X-Received: by 2002:a05:600c:8b02:b0:453:6b3a:6c06 with SMTP id
 5b1f17b1804b1-4538ee84eeemr39416815e9.29.1751039515324; Fri, 27 Jun 2025
 08:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250620121045.56114-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXP95AsuS2E=SWvzfo89y_VtyXPWoZUKT6mjj_xeLb=Eg@mail.gmail.com>
In-Reply-To: <CAMuHMdXP95AsuS2E=SWvzfo89y_VtyXPWoZUKT6mjj_xeLb=Eg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 16:51:29 +0100
X-Gm-Features: Ac12FXyquorNg5tQJSXyw5uJ1-zkqWxkCxxP3QulkZKFjkS6d1PH2dMUnpaiPB0
Message-ID: <CA+V-a8skTzgWr3Eo1ZNH-BVyUAW8cvGMAxJEWTy9FFPoK=sWgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays
 for RZ/V2N EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 26, 2025 at 12:58=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 20 Jun 2025 at 14:10, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce device tree overlays to support the eMMC (RTK0EF0186B02000BJ)
> > and microSD (RTK0EF0186B01000BJ) sub-boards via the CN15 connector on t=
he
> > RZ/V2N EVK. These overlays enable SDHI0 with appropriate pinctrl settin=
gs,
> > regulator configurations, and GPIO handling.
> >
> > Shared DTSI fragments (rzv2-evk-cn15-emmc-common.dtsi and
> > rzv2-evk-cn15-sd-common.dtsi) provide reusable configurations for both
> > RZ/V2N and RZ/V2H EVKs, as both support the same CN15 sub-boards.
> >
> > Additionally, the base board DTS is updated to define an `mmc0` alias
> > pointing to `&sdhi0`, and to add a fixed 1.8V regulator node (`reg_1p8v=
`)
> > intended for use by the optional eMMC sub-board and, in the future, the
> > ADV7535 HDMI encoder (not yet enabled in the DTS).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree overlay for the RZ/V2N EVK with the eMMC sub-board
> > + * (RTK0EF0186802000BJ) connected to the CN15 connector.
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#define RZV2N_PA               10
>
> This is duplicated from r9a09g056.dtsi, but unused?
>
Ouch, I'll drop this and the below macro too.

> > +#define EMMC_GPIO(port, pin)   RZG2L_GPIO(RZV2N_P##port, pin)
>
> Unused?
>
> > +
> > +#include "rzv2-evk-cn15-emmc-common.dtsi"
>
> Hence you can just have a single rzv2-evk-cn15-emmc.dtso that works
> on both RZ/V2H and RZ/V2N.
>
Agreed (I will squash patch 3/3 into the same patch).

> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd=
.dtso b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
> > new file mode 100644
> > index 000000000000..6268dda138ab
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
> > @@ -0,0 +1,16 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree overlay for the RZ/V2N EVK with the SD sub-board
> > + * (RTK0EF0186B01000BJ) connected to the CN15 connector.
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#define RZV2N_PA               10
>
> This is duplicated from r9a09g056.dtsi. Can we avoid that?
> If not, I think we found the justification for moving these definitions
> to include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h...
>
> > +#define SD_GPIO(port, pin)     RZG2L_GPIO(RZV2N_P##port, pin)
> > +#define SD_PORT_PINMUX(b, p, f)        RZG2L_PORT_PINMUX(RZV2N_P##b, p=
, f)
> > +
> > +#include "rzv2-evk-cn15-sd-common.dtsi"
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/a=
rch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > index b63ee1ff18d5..795d9f6b9651 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > @@ -24,6 +24,7 @@ aliases {
> >                 i2c6 =3D &i2c6;
> >                 i2c7 =3D &i2c7;
> >                 i2c8 =3D &i2c8;
> > +               mmc0 =3D &sdhi0;
>
> While (out-of-tree) dynamic DT overlays do not support updating aliases
> yet, this logically belongs in the overlay, so please move it there.
>
Ok, I'll move it to the overlay as `mmc0 =3D "/soc/mmc@15c00000";`

> >                 mmc1 =3D &sdhi1;
> >                 serial0 =3D &scif;
> >         };
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Shared DT include for the eMMC Sub Board (RTK0EF0186B02000BJ), whic=
h
> > + * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
> > + *
> > + * Contains common pinctrl and SDHI0 definitions.
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
>
> These two directives belong in the .dtso files (and you already have
> them there).
>
Agreed, I will drop them.

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi
> > @@ -0,0 +1,67 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Shared DT include for the microSD Sub Board (RTK0EF0186B01000BJ), w=
hich
> > + * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
> > + *
> > + * Contains common pinctrl and SDHI0 definitions.
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
>
> Likewise.
>
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > +
> > +&{/} {
> > +       vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
> > +               compatible =3D "regulator-gpio";
> > +               regulator-name =3D "SDHI0 VqmmC";
> > +               gpios =3D <&pinctrl SD_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
>
> If you use a macro to abstract the GPIO number, please include the
> bank and port number in the abstraction.
>
> Alternatively, as both RZ/V2H and RZ/V2N use PA0, you can use
> RZG2L_GPIO(10, 10) directly.  That just leaves us with a desire to
> express "A" instead of 10...
>
> Note that you end up with the exact same .dtbo for RZ/V2H and RZ/V2N
> again...
>
Good point, I will switch to RZG2L_GPIO(10, x).

Cheers,
Prabhakar

