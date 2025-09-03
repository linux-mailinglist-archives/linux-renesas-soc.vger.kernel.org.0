Return-Path: <linux-renesas-soc+bounces-21303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A585CB429BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 21:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CDCC2076D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 19:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873E236933A;
	Wed,  3 Sep 2025 19:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPIpySx6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05D362093;
	Wed,  3 Sep 2025 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756927268; cv=none; b=t8T5QJtvYUWaVprxnn3PYajGNqqzYvzLDCye9rDfKD8lf4nWPV65pnAHWfQfygbTTtAVp4u/jYTXeTZv6HTI1nhq1MXxUbonMuT0pdw8bsve6N55Oy84galRgYvSGTVJc7NLkWLBPKzJP9OHSlpnGjux/E62Px6e3Od4yf9nbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756927268; c=relaxed/simple;
	bh=H0blxvgKqdF+z7wMSjRxqIZJx7TB++VHHhFX8ZACF88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouyCH+VYPHUFUE99RUPfC3RZ+1MsJJ8szqC85/GIb5J+FJ4DgoqIU3NzaZCs9Zh8PVcYtviYz7acq1iH1GvrPBHcpigyQ1THRRPIS11hUqzSoCWn1+NgQlnQKJWYmJH0yq2HkgFeHnRTyCBSQiSSRurPrGbqJJeRgin/Rt1t+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPIpySx6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3df2f4aecc7so40685f8f.2;
        Wed, 03 Sep 2025 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756927265; x=1757532065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19Pr1MGdDLvchgGX6czOMvY7fgs0lYkPLWZnauWbuMk=;
        b=NPIpySx6Sj+MJpWgXyRrhtNS5ryRnx+57Pko8QyivMYnGkq0sr/QUpCpcYvik+jf2d
         0D3+xwO5n/Zo1DAgx97Po05bDCey1LiUn4HE9tR9pgBgzAIXJUljvFgwBWb51HB1n0fW
         pu4dbJRt4rf+85ClexEbjIMfTYdc0NNfHqroiP1bvx+DC0d0jNnKIv4g0ZlxZoptEYUN
         7cuQOBKnjAAks38OwnN3IV1zD64E81nZr7A+mev6wvk0ZsnbX5ivf9Ye6kCxbT++oAho
         92cJzCnBx3XnevEX6b829/CWDianTPELp6bnXb2++HzXe+Q7CdY5jMqAWJTIks/mQlcT
         H1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756927265; x=1757532065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19Pr1MGdDLvchgGX6czOMvY7fgs0lYkPLWZnauWbuMk=;
        b=IXbgRanAwAhv6ltJK4NElulfqJEOSWVKwWnw85xW14Q+QmzA+fC9xBP2+xzqCfNyTj
         YXYWfCw0b+7ZeKsnArAv7albiQQVhZjdLMKlxGXhjLsm5bHKXUESsSOz3lYjDTuBugym
         z9h8OnAL0C5JUY86ADfHB+tamhiAoe0SQoabXNGPb7PAg2hrZEXzKOqJ6LkUMQ0thmFK
         6cP5lUesVQcJDWNUtWfxCnlaB3x7rQO3lKtFIfVweFdGewIDnFdYvH6nny9IuxtVDVig
         n9vpTupqZAUjsYk80BNeqRO7fg7IcxI2zMZtBhyaYid0X5IYtcGAbBU6PyJnwc90opTv
         4MXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlEe5eiqNQWIFwzAL6FviNfF81vIaC0gxwJpNsy/uXhwtMcpPRXe3sTjvA+G90x5W0ZjvAhEOfZKdlxThk@vger.kernel.org, AJvYcCW1IOBnoDpB436WklnwZwFCwynjf5f2vdwOD5AyV98MxYCJTdOZWqGdQbP5k0DXlJH7tb93XM4hAhcL+tNJGjyXXOo=@vger.kernel.org, AJvYcCW2nu+hKu27fs25GJ0JR8qpH1h57F4nHo3dMP4ISmty52yQIyD2zgNYwv3FZSCAXFgk5TrablbQyydL@vger.kernel.org
X-Gm-Message-State: AOJu0YwHch+NMxqO9lbWNpXCUtWpEhAnq9fyVzWYdfoYaSyFBzYS7k0r
	I4Z+/uc3E6uM7WOdj3tBkVnQFgRhBehR8wn826qb0S3nsUYJp5if++Ao2gjrTgDLDRHNuFI72H6
	4uVximj3Mi1/Y3+xIAKWUH4IYPNR8RZc=
X-Gm-Gg: ASbGnctRryeplCP7AQWliPe/ctrEdaIulWYQZCSv3gNMdObgrf1XyGKr8IzjwaN+lCv
	xRlfR3gYvrtdwonGo1AMAwZICz8b2hcMQ1KusIvJ1mJqdPxzprrLcSXBAxDIk+XD7X0/Z/jDJ1b
	V5PHHdO7tFY6BtFJ5ZfyhDGonvHljhoesXW1zwWegDTNLEXgYPoWhklfVPg75c2noZLPRBrrXh8
	U/IcVH+
X-Google-Smtp-Source: AGHT+IHjtoq6mcZ3QbGqhycjoyKVBb6XINlgyo2koJpGfSEkVCsOTjVf+agUTaWlD4U319mdW+SBQGTuYkpZZ8DbU7A=
X-Received: by 2002:a05:6000:2911:b0:3ce:f0a5:d597 with SMTP id
 ffacd0b85a97d-3d1e04bd373mr14364132f8f.47.1756927264689; Wed, 03 Sep 2025
 12:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250821161946.1096033-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVb_5+gVDCUYYZ2Xj55gXzZATx+5vaY6uS1TuCNYb9Qeg@mail.gmail.com>
In-Reply-To: <CAMuHMdVb_5+gVDCUYYZ2Xj55gXzZATx+5vaY6uS1TuCNYb9Qeg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 20:20:38 +0100
X-Gm-Features: Ac12FXyX2A73WqrQeYc_lGRiAwMi0uxqfLbPhBENpm6-vmgysmJBrRBstooJIQ4
Message-ID: <CA+V-a8vdktLyjojLbA10SwfL71S+ELSyuVJyozrQdGp8X398tw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
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

On Wed, Sep 3, 2025 at 4:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable USB2.0 support on RZ/T2H and RZ/N2H EVKs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> > @@ -29,6 +29,28 @@
> >   */
> >  #define SD1_MICRO_SD   1
> >
> > +/*
> > + * USB Pin Configuration:
> > + *
> > + * This board is equipped with three USB connectors: Type-A (CN80), Mi=
ni-B (CN79),
> > + * and Micro-AB (CN33). The RZ/T2H SoC has a single USB channel, so ei=
ther the USB
> > + * host interface or the USB function interface can be used, but not b=
oth at the
> > + * same time.
>
> Please reflow the text to fit in 80 columns.
>
Ok, I will reflow it to 80 columns
> The last sentence applies to the CN80 and CN79 connectors only, right?
>
Yes,  I'll reword it to say `but not both at the same time while using
CN79 and CN80 connectors.`

> > + *
> > + * By default, the Type-A (CN80) and Mini-B (CN79) connectors are enab=
led.
> > + * Configure the switches as follows:
> > + *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] =
=3D ON
> > + *   - USB_VBUSIN (used for USB function): SW7[7] =3D OFF; SW7[8] =3D =
ON
> > + *   - USB_VBUSEN (used for USB_HF_VBUSEN): SW7[9] =3D OFF; SW7[10] =
=3D ON
> > + *
> > + * To enable the Micro-AB (CN33) USB OTG connector, set the following =
macro to 1
> > + * and configure the switches as follows:
> > + *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] =
=3D ON
> > + *   - USB_VBUSIN (used for USB OTG): SW7[7] =3D ON; SW7[8] =3D OFF
> > + *   - USB_VBUSEN (used for USB_OTG_VBUSEN): SW7[9] =3D ON; SW7[10] =
=3D OFF
> > + */
> > +#define USB_OTG                0
> > +
> >  #include "rzt2h-n2h-evk-common.dtsi"
> >
> >  / {
> > @@ -145,4 +167,18 @@ i2c1_pins: i2c1-pins {
> >                 pinmux =3D <RZT2H_PORT_PINMUX(5, 0, 0x17)>, /* SDA */
> >                          <RZT2H_PORT_PINMUX(4, 7, 0x17)>; /* SCL */
> >         };
> > +
> > +#if USB_OTG
> > +       usb-exicen-hog {
> > +               gpio-hog;
> > +               gpios =3D <RZT2H_GPIO(0, 2) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "usb_exicen_a";
> > +       };
> > +#endif
> > +
> > +       usb_pins: usb-pins {
> > +               pinmux =3D <RZT2H_PORT_PINMUX(0, 0, 0x13)>, /* VBUS */
>
> s/VBUS/VBUSEN/?
>
OK.

> > +                        <RZT2H_PORT_PINMUX(0, 1, 0x13)>; /* OVRCUR */
> > +       };
> >  };
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/a=
rch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > index 80f358fb2d74..b98b0f7c1128 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > @@ -33,6 +33,33 @@
> >   */
> >  #define SD1_MICRO_SD   1
> >
> > +/*
> > + * USB Pin Configuration:
> > + *
> > + * This board is equipped with three USB connectors: Type-A (CN7), Min=
i-B (CN8),
> > + * and Micro-AB (CN9). The RZ/N2H SoC has a single USB channel, so eit=
her the USB
> > + * host interface or the USB function interface can be used, but not b=
oth at the
> > + * same time.
>
> Please reflow the text to fit in 80 columns.
>
OK.

> The last sentence applies to the CN7 and CN8 connectors only, right?
>
Yes. I'll reword it to say `but not both at the same time while using
CN7 and CN8 connectors`

> > + *
> > + * By default, the Type-A (CN7) and Mini-B (CN8) connectors are enable=
d.
> > + * Configure the switches as follows:
> > + *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] =
=3D OFF;
>
> s/DSW2[6]/DSW2[5]/?
>
The above is correct,

DSW2[5] is OFF, P00_0 to P00_2 are connected to BSC2(CN43) and GPT0(CN49).
DSW2[5] is ON, P00_0 to P00_2 are used as control signals for the USB
power-supply IC.

But we are using P02_2 and P02_3
DSW2[5] is OFF, P01_0, P01_2, P01_4 to P01_7, and P02_0 to P02_3 are
connected to ENCIF0(CN44) and GPT0(CN49), and used as control signals
for the USB power-supply IC.

> > + *     - P02_2 (used for VBUSEN): DSW14[5] =3D OFF; DSW14[6] =3D ON
> > + *     - P02_3 (used for USB_OVRCUR): DSW14[1] =3D OFF; DSW14[2] =3D O=
N
> > + *   - USB_VBUSIN (used for VBUS of CN8 for function): DSW16[1] =3D OF=
F; DSW16[2] =3D ON
> > + *   - USB_VBUSEN (used for USB_HF_VBUSEN): DSW16[3] =3D OFF; DSW16[4]=
 =3D ON
> > + *
> > + * To enable the Micro-AB (CN9) USB OTG connector, set the following m=
acro to 1
> > + * and configure the switches as follows:
> > + *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] =
=3D OFF;
>
> s/DSW2[6]/DSW2[5]/?
>
ditto.

> > + *     - P02_2 (used for VBUSEN): DSW14[5] =3D OFF; DSW14[6] =3D ON
> > + *     - P02_3 (used for USB_OVRCUR): DSW14[1] =3D OFF; DSW14[2] =3D O=
N
> > + *   - USB_VBUSIN (used for VBUS of CN9 for OTG): DSW16[1] =3D ON; DSW=
16[2] =3D OFF
> > + *   - USB_VBUSEN (used for USB_OTG_VBUSEN): DSW16[3] =3D ON; DSW16[4]=
 =3D OFF
> > + *   - USB_EXICEN (used for USB OTG EXICEN): DSW14[3] =3D OFF; DSW14[4=
] =3D ON
>
> Looks like you could use P00_0 - P00_2 instead of P02_2 - P02_3, like
> on the RZ/T2H EVK?
> But you don't want to do that because you want to use these pins for Ethe=
rnet?
>
Yes, I plan to use them for Ethernet.

> > + */
> > +#define USB_OTG                0
> > +
> >  #include "rzt2h-n2h-evk-common.dtsi"
> >
> >  /*
> > @@ -185,4 +212,18 @@ i2c1_pins: i2c1-pins {
> >                 pinmux =3D <RZT2H_PORT_PINMUX(3, 3, 0x17)>,
> >                          <RZT2H_PORT_PINMUX(3, 4, 0x17)>;
> >         };
> > +
> > +#if USB_OTG
> > +       usb-exicen-hog {
> > +               gpio-hog;
> > +               gpios =3D <RZT2H_GPIO(2, 4) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "usb_exicen_a";
> > +       };
> > +#endif
> > +
> > +       usb_pins: usb-pins {
> > +               pinmux =3D <RZT2H_PORT_PINMUX(2, 2, 0x13)>, /* VBUS */
>
> s/VBUS/VBUSEN/?
>
OK.

Cheers,
Prabhakar

