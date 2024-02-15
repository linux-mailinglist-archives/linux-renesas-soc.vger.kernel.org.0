Return-Path: <linux-renesas-soc+bounces-2862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AD856CC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 19:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEE5C1C2329A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 18:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B3C1386DE;
	Thu, 15 Feb 2024 18:32:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F22595;
	Thu, 15 Feb 2024 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708021969; cv=none; b=lm9H+Sjwc29MgV2/DtiAplZstGQPbMXAvE8nZnX++vF6SuYwKo9znMQMLBzeLRSD7cnAky6hRQFvCgR8n7kvKgKnGt/Z5Q/NckQQQMyhYPyY5LA6xxzky3z8FZYR7xmXM0vPmaA2cSikg3ualJNapGW4Hgf8jaXcaIXYcwghkfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708021969; c=relaxed/simple;
	bh=8bX8sUa/QMdFGXFIR5EKiBenOtE9zCdY6CLRnbf/DFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pubi04d6RcCe6n/e3PgblYdlTp+TmskAJQQvSVhvqI+oIePLbblg91IURsTPrTuzfYGUuULhG51oYPsx7VytyqQTIaEwJn5rDXEVBPtieTNFVohPSaVIfMQUpfdsKuzIJtKDHHMe3BQ+Xkc+sgTpJD1IIpiL9LSqmPxLd8BAaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607d633381fso7867317b3.1;
        Thu, 15 Feb 2024 10:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708021965; x=1708626765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUzKro4h+poZtCq/E+eskrxeGxu0ZNl3fsZ0awzJ8rc=;
        b=d/t3v2mB8lwuDx/mPZeb7z64BJ+/8IGfOaXT9lIhHI6FYWxsa3+g2uaw0JbBjURDkp
         VTwvzOIgZ+MoTtvUI+WyWyT2RmbQtpYG9PkIy8k7F8uxtyDM73Z1ym/TCK/xUE+f6pDa
         QntUEzmg1Ug7TZL6XDrtv9a0sbdaVrefwrFxy6Nm1/uplzJQYdNuYwp3Yw3PFHmXJc3Z
         MrCewPVAyF13bVtfZw6OLzKPFYXLdpWxVSKLMhRY7qXWY4UMFkEaigt6paKMH+3x6aRr
         61u3rMdntGyr0HQsM4KgGqsnq+m/MdL0MHazdlC/ebAjmxuUbLInh4aMBJuxpUHheOEI
         Nang==
X-Forwarded-Encrypted: i=1; AJvYcCWgwGx70ur6iIxxBXrQ4Z/JYTTI3DqI/jrukggih8wVSuqmtfMxfzcPm1bis55zNrQAZGugTg46LYTum510jc2K5Ykmqz3Ca81mLw==
X-Gm-Message-State: AOJu0YxHIlelRrG8xjHh8sk8decqfEql0rOXRv3JoR4blV33y00RS3kA
	b2zqoBlxuU6BdJCUnDhrc6nqhvYQ5eacN0HiqVb5wBgLVP/2ezyyuzDX5E4KwBEHaA==
X-Google-Smtp-Source: AGHT+IER2xJCrtidN5PHSUSflSrddR1Erylm4W9CU+U8aKYBVvxz5Ra7AMQQjaGpMZlcVeYo+AuUhw==
X-Received: by 2002:a81:4902:0:b0:607:a98c:81a6 with SMTP id w2-20020a814902000000b00607a98c81a6mr2502103ywa.44.1708021965313;
        Thu, 15 Feb 2024 10:32:45 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id y79-20020a81a152000000b006079deec8easm357668ywg.58.2024.02.15.10.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 10:32:44 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607aafb2cb4so13328687b3.0;
        Thu, 15 Feb 2024 10:32:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj7zLpW7J1gACtcS2PUuBYW3D5PRXsAyHIeSLcTSz/3HtomrtMuCf5AtOm3vJ7qLvWkm80mnZ8qRqAi+bkl1tBwBx9SkHN/X6FAA==
X-Received: by 2002:a81:72c6:0:b0:5ff:a3df:9ba4 with SMTP id
 n189-20020a8172c6000000b005ffa3df9ba4mr2451754ywc.48.1708021964711; Thu, 15
 Feb 2024 10:32:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123145354.1571800-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240123145354.1571800-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Feb 2024 19:32:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXxA1K7G5a84WkTCqa2WGPp4ZvjOZR_9SBgEkXOUm8f9A@mail.gmail.com>
Message-ID: <CAMuHMdXxA1K7G5a84WkTCqa2WGPp4ZvjOZR_9SBgEkXOUm8f9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: eagle: Add capture overlay for
 expansion board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Jan 23, 2024 at 3:54=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The Eagle board supports an optional expansion board. The expansion

The title page of the schematics document calls this the "Function
expansion board".

> board adds support for HDMI OUT, HDMI capture from two different sources
> and eMMC.
>
> This change only adds support for the two HDMI capture sources.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -62,6 +62,8 @@ dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a77965-ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) +=3D r8a77965-ulcb-kf.dtb
>
>  dtb-$(CONFIG_ARCH_R8A77970) +=3D r8a77970-eagle.dtb

Please add

    dtb-$(CONFIG_ARCH_R8A77970) +=3D r8a77970-eagle-expansion.dtbo

so that the .dtbo is considered for installation, too.

> +r8a77970-eagle-expansion-dtbs :=3D r8a77970-eagle.dtb r8a77970-eagle-exp=
ansion.dtbo
> +dtb-$(CONFIG_ARCH_R8A77970) +=3D r8a77970-eagle-expansion.dtb
>  dtb-$(CONFIG_ARCH_R8A77970) +=3D r8a77970-v3msk.dtb
>
>  dtb-$(CONFIG_ARCH_R8A77980) +=3D r8a77980-condor.dtb

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso

This is a rather generic name.
What about r8a77970-eagle-function-expansion.dtso?

> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Eagle V3M expansion board.

... Function expansion board?

> + *
> + * Copyright (C) 2024 Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.=
se>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>

Please move the includes below the /.../; markers.

> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +       /* CN4 */
> +       /* Eagle: SW18 set to OFF */
> +       cvbs-in-cn4 {
> +               compatible =3D "composite-video-connector";
> +               label =3D "CVBS IN CN4";
> +
> +               port {
> +                       cvbs_con: endpoint {
> +                               remote-endpoint =3D <&adv7482_ain7>;
> +                       };
> +               };
> +       };
> +
> +       /* CN3 */
> +       /* Eagle: SW18 set to OFF */
> +       hdmi-in-cn3 {

Please use alphabetical sort order for nodes without unit addresses.

> +               compatible =3D "hdmi-connector";
> +               label =3D "HDMI IN CN3";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_in_con: endpoint {
> +                               remote-endpoint =3D <&adv7482_hdmi>;
> +                       };
> +               };
> +       };
> +
> +       /* CN2 */
> +       /* Eagle: SW35 set 5, 6 and 8 to OFF */
> +       hdmi-in-cn2 {
> +               compatible =3D "hdmi-connector";
> +               label =3D "HDMI IN CN2";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_in_con2: endpoint {
> +                               remote-endpoint =3D <&adv7612_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +/* Disconnect MAX9286 GMSL i2c. */

I2C

> +&i2c3 {
> +       status =3D "disabled";
> +};
> +
> +/* Connect expansion board i2c. */

I2C

> +&i2c0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       io_expander_27: gpio@27 {
> +               compatible =3D "onnn,pca9654";
> +               reg =3D <0x27>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               vin0_adv7612_en {
> +                       gpio-hog;
> +                       gpios =3D <0x3 0x0>;

Please use symbolic values for GPIO flags, i.e. GPIO_ACTIVE_HIGH.

> +                       output-low;
> +                       line-name =3D "VIN0_ADV7612_ENn";

Given this signal is active-low, you probably want:

    gpios =3D <3 GPIO_ACTIVE_LOW>;
    output-high;

> +               };
> +       };
> +
> +       dmi-decoder@4c {

hdmi-decoder

According to the schematics, the primary address is 0x4d?

> +               compatible =3D "adi,adv7612";
> +               reg =3D <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
> +               reg-names =3D "main", "afe", "rep", "edid", "hdmi", "cp";
> +               interrupt-parent =3D <&gpio3>;
> +               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               default-input =3D <0>;

> +       };
> +
> +       adv7482_70: video-receiver@70 {

Do you see a future user for this label?
Just wondering, as some nodes have labels, others haven't.

> +               compatible =3D "adi,adv7482";
> +               reg =3D <0x70 0x71 0x72 0x73 0x74 0x75
> +                      0x60 0x61 0x62 0x63 0x64 0x65>;
> +               reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repe=
ater",
> +                           "infoframe", "cbus", "cec", "sdp", "txa", "tx=
b" ;
> +               interrupt-parent =3D <&gpio3>;
> +               interrupts =3D <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVE=
L_LOW>;
> +               interrupt-names =3D "intrq1", "intrq2";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

