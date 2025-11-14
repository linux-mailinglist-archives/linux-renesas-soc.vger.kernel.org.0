Return-Path: <linux-renesas-soc+bounces-24630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C27C5C5A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 46C183571C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2233090FF;
	Fri, 14 Nov 2025 09:37:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7963306488
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763113076; cv=none; b=TMledI53UNkbE0vzTQDHscdM8Q3QeSB+vI87/GNKJOlr19B8Ywu1QZVfZVbHN/ctN0sNhKvymQvj4g+SSRWylW7m4a+Gp+2PlafFtRfIR87ywEPaInTvUjardQYU5U/SI66H8kFR/IfCSBm/csdHrdZ7JVq+hm/If5Jnyw5O/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763113076; c=relaxed/simple;
	bh=wTzVYr5CLMbxZcELo4IOLIgxiHBUFwH2iRqyR1aLWAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6xKeQ9aMtuW8KmVwO9yKBjw8hglvKeZwRl23QQjF6szVYJqaguNbMceH0Jbnchxk1e/wqzYfWEyErZVO8vTKj+su+3tu3xO4GvaMFQZvFN/vHkGhKjHW4eMaQjk3EYlFN/SH0hPCJHypCtJZenp5sBNLd1dehYT+f5qTXTdu7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so211505e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113073; x=1763717873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAUhmj06/ScrYHjhgghrsX3axL4gTCjs2QTqxYaasK8=;
        b=EDEmJMYkEC+ZjTG53XStIZWTJHU5J/Lc93Q2TfUEfM3Z7G+eW8Gilo7t1XWbEwX3mS
         jL1sBDxSP7WqCbpJws7RkNnmN8cmZOTfLJ65LmmgO28RYON4z9KumOLGBPpXHemjF1yO
         YgJeY9sbOhMQbr28mY646kTjm0AruabrNkd1prqInfzem7unKoHGTNaxf3G+mt3hGFBR
         UI7jXgQYz2QeLc5n2ENDYUDsbk0tfETwZ4zgs49ol78/kozakSIKLfun4AC7vrGDA5e8
         j6h7ENf/zK6RqvT1hwvb/C3JbI+DZ2x1BJerZzSIW7wFeLX7EAo+64TEk9apxt/LEBKm
         q1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXHJ7BiVwcd8HsfSs+DSIYm6ntAWpmuYVo2TYedKmqC1F8xKUCyM8NCW+BrOej815xVMtdvMK5WGLk07rzmJgj8iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmkPsm0ENN8Z/XDIli0GEJiR7dmBD8pxuWmi6VBxu9ihbr9a/1
	rM97SHwYgahfW23LiFlxyFEMucJzRM5anwN0NiUHrGVSpcVfBDL9okof1rL5nO9q
X-Gm-Gg: ASbGnctDnNlKX7g/dP4F9krsKvD2upTihqjhNTIq+q/L085BYskBYxE8Qc5XD2JKjzx
	R+lJy/4dh5pInN8lEFMkQk4qW+MULHYqXmqO2NcH0KoT7qe1xpGUnsumkJWn/xpIBWr3j3DAaiw
	XLLsb1gmWKI01tVbpLpgPvNUnzMWMw8LOym9Gj1bc36G1yCnC1YC2hye4olG5LMZYBsa+ssUi+p
	YCqoQoxZnNRLMEKoJfKOzZjygvZSRL1hE57ng11Uk0aKRnz+tDzh8+i1yiFJoHLvL5rGadGRYVH
	MZrnrqaGYLYrvEPOKlQ2OJkLf8T+dqFS0L+DqOomNO0YVYffThTbg6HAc271CtAKJ4vz+UjQIiY
	D9YYN26OWHOEtTp4+Pde1V8CTXB3SpTUyMp+kqykHuWAAaCUrIPcR8xFoTLiDENcCF1rwxQSnCt
	jFEe7GARxWeeTqovh3WrtG/ikXmCI6ems8B2cR4UEeNmEWAGYbG8OT
X-Google-Smtp-Source: AGHT+IGQSwwEKQQM/sOU05oFE46kX6FsBEFUWEZwnUyiiUZLoSuUJ4tG/lkIjRZ+nhzTbTwVXz0p9A==
X-Received: by 2002:a05:6122:d0f:b0:552:3366:e822 with SMTP id 71dfb90a1353d-55b1bd7e7b7mr896370e0c.1.1763113073138;
        Fri, 14 Nov 2025 01:37:53 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f46234fsm1497402e0c.18.2025.11.14.01.37.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 01:37:52 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5deb0b2f685so1674853137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 01:37:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXNnf0PTKxhj352rjK8vJEE3U6/FELkghvdeoAfd8iDE3i4u4paMdP+QYRB+PfLt/HO/TU14j7CfnIpITZMsK5Mg==@vger.kernel.org
X-Received: by 2002:a05:6102:800d:b0:5db:f897:59f0 with SMTP id
 ada2fe7eead31-5dfb41e268cmr2558400137.11.1763113071580; Fri, 14 Nov 2025
 01:37:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com> <20251027123601.77216-9-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-9-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Nov 2025 10:37:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULa3Myv5M13mZnBfGRfpnCasRbDFSFsh-Yji+Gw3gycA@mail.gmail.com>
X-Gm-Features: AWmQ_bllwARgosfbTXod6oIXQrjpImVz4Lng-lsiZr7z4SHhmighCo7rwlxoBpU
Message-ID: <CAMuHMdULa3Myv5M13mZnBfGRfpnCasRbDFSFsh-Yji+Gw3gycA@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Mon, 27 Oct 2025 at 13:36, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -534,6 +534,14 @@ gpio0a: gpio-port@0 {
>                                 #gpio-cells =3D <2>;
>                                 snps,nr-gpios =3D <32>;
>                                 reg =3D <0>;
> +
> +                               interrupt-controller;
> +                               interrupt-parent =3D <&gpioirqmux>;
> +                               interrupts =3D < 0  1  2  3  4  5  6  7
> +                                              8  9 10 11 12 13 14 15
> +                                             16 17 18 19 20 21 22 23
> +                                             24 25 26 27 28 29 30 31 >;

I would drop the spaces after/before the angle brackets.

> +                               #interrupt-cells =3D <2>;
>                         };
>
>                         /* GPIO0b[0..1]   connected to pins GPIO1..2   */

> @@ -620,6 +644,23 @@ gpio2b: gpio-port@1 {
>                         };
>                 };
>
> +               gpioirqmux: interrupt-controller@51000480 {
> +                       compatible =3D "renesas,r9a06g032-gpioirqmux", "r=
enesas,rzn1-gpioirqmux";
> +                       reg =3D <0x51000480 0x20>;
> +                       #interrupt-cells =3D <1>;
> +                       #address-cells =3D <0>;
> +                       interrupt-map-mask =3D <0x7f>;
> +
> +                       /*
> +                        * Example mapping entry. Board DTs need to overw=
rite
> +                        * 'interrupt-map' with their specific mapping. C=
heck
> +                        * the irqmux binding documentation for details.
> +                        */
> +                       interrupt-map =3D <0 &gic GIC_SPI 103 IRQ_TYPE_LE=
VEL_HIGH>;
> +
> +                       status =3D "disabled";

So this is disabled by default (despite the driver being enabled by
default), because the board has to provide the proper real interrupt-map
anyway.  Makes sense.

> +               };
> +
>                 can0: can@52104000 {
>                         compatible =3D "renesas,r9a06g032-sja1000", "rene=
sas,rzn1-sja1000";
>                         reg =3D <0x52104000 0x800>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

