Return-Path: <linux-renesas-soc+bounces-20640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EEFB2ADA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0DAE4E10E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F059C33EB0E;
	Mon, 18 Aug 2025 16:02:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AA21ADCB;
	Mon, 18 Aug 2025 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532932; cv=none; b=WnXKy593oSVh+wN9ugeQeG30A868zpoq+m7jQmx0GWCuIzpN1HxrunNexlOF2eocoxCn4+gGQCwmh021JD+URLFQSpyhS2qswlc26l7OpV1N9IuEuEOnqWK9T+JA+trcO+AsHS73GM9XEfZxdhAe6k37bx1HxW0A2J8pMeVbIpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532932; c=relaxed/simple;
	bh=u+o7uywzBhtQ4B1+3GYT78+dirZDqdbPPu+GfAS+eKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T27IAg0QmeNG4RGyuEiw4M1eg3rNvpqtx7GibCHxWAJ2uUfIJLU7bBdihBMDsAlIdp4kdJK/buBqLHYEP+rMGqPOvUpVhgP3RHl7b+d+zWNjz8zLI5LckjlgvuTJC6Pqisi26F9LYdR4P6l1w2mF+pyPYC9wWxqPrUq9HGAPqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53b174c9c79so2000755e0c.2;
        Mon, 18 Aug 2025 09:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532930; x=1756137730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIJzAXZqBHKyNXtLQvChbRZgdimP8X1A4O/KyuzgpZk=;
        b=FFmvaSmkz4mgneWWvtUEW4HRta+41Tj4smIBfysICnpLAs39EVudTE4ZEryUy1c4zR
         488kfwJV5sMPX7piS+vC37HDT7xlBqSx4IGh1NHYyRhFFvWSzJ42mPsEzAxy4MqO7eIm
         LwtSctvwjlfWiGZWW808oNp1iEcKOgdZGHwPlXEsw9MeigSpWfqxUNlLHl7y99xUiymW
         oNJBtcfShG0ulwxtdPjb4kJF5XJemE9ZK339S+2dIb97HBNdczlnupkNSO8TrTeheo6A
         StwCqP73ez0Mi9lV91dXCkX6GnTAu0sisBQo925vjJR3MlqtiOdx+TUIutsbjcvpD83w
         arew==
X-Forwarded-Encrypted: i=1; AJvYcCU6lr7UHKQdpRlijXdIg8aHQUju6JgJWRa2p/IJeC1lgFEqjTvrazGjbZXyYFRGvWKziSL/sknxnKpi+mZ5@vger.kernel.org, AJvYcCWRjSBPdiwv9XepnT3mdP1NrM6GT5jGODjHIYgGvE9n3xwomSjK/63o8WSk/phRM66XhifiyEo5eYM80EGwTaRcxXU=@vger.kernel.org, AJvYcCX0cqtP0HxT/G82FHjSzDP/YawpDnARBh9Lu3fDnSS9tveQf/Vto10pFBUUnGoDieAAslcH0A5JawyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1AMaA2lXMNPlDa6IdmI+66Y9uboS6A7v9Dbhs2OxqmP6Wfqi5
	hB5O4lX8S+sCXdo1FiIU7hTQ3u3k0tUsZ9+J5agxfH7TC0oxftdL3S0v19DCr7vQ
X-Gm-Gg: ASbGncsIjv987fK9P4sve7TmAEMS4meljKOUv+U7s0i/y5FUWzlpqGY7RaX1hL/MYrA
	4cmP04EtKd+2JZXujBRdWlKJVvr+4sPtTJF+Ni1o+KZJKdvKtHGUAlnIEGF12nV2xM0b7va9H3N
	+TfNy65WzkIRNLvjwyY+Abf9Vw+/IrOY2KU8i+IcTh2mZWqRF8z29lRyPYmCcZdTBNHmdBMfeF+
	SvhGC1UGTEGUlVlAqQ0cauLP0jp2iI/Y8wyR6yk0Ln6UWbWyvw1XjM9kUhdusy+V0TQptBZMWxp
	Nu1Q7a2DNCmZ4KFGqIB2D2Kk3idfM2c16uT13ijhS4VfisXpb0leS7HGNGDJOP8gjgKLZJH7pm9
	O3VDMWitTl/W3Ac7wnio+YGSnuenRuFvmQTdOt6ACTpWSzbJr3DTF9IbaaF4U
X-Google-Smtp-Source: AGHT+IGimF6TUu1cMoDQrONU1Ab7Rs5QAQJLrtl/KtQ89lsurPMKXNHVtQXgZ2kB2X4ZnuV+d+uJGg==
X-Received: by 2002:a05:6122:1d0c:b0:538:d227:a364 with SMTP id 71dfb90a1353d-53b2b749e13mr4182568e0c.3.1755532917529;
        Mon, 18 Aug 2025 09:01:57 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bdeb9d3sm1968293e0c.15.2025.08.18.09.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 09:01:57 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f8b94c6adso1017581137.3;
        Mon, 18 Aug 2025 09:01:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmzIU5yfxz3UaysPYjFl4v5kYNR6nqJwzqZ8rTfXuJ+pOrHT2HbcKlcU+RLeknKB9pUgfZYV59sim/yqEDni7hFD4=@vger.kernel.org, AJvYcCVxMF5+3xP1uZl8+QE/naUno6DHE2AxXKZwzl5QJ+rqXwLHqTF6pPs55PIEiM0nlQW1pM0Ds5FqJOO5@vger.kernel.org, AJvYcCXzDd/64AfvzzOo9SRb1vuS6uoqTw8D+0GELvvcr1IP5p0YX4mvaI2QTW9QPvUFBD7br0RsRiMbjgkuesCa@vger.kernel.org
X-Received: by 2002:a05:6102:292b:b0:4fd:53e0:b519 with SMTP id
 ada2fe7eead31-5126d30e725mr4194493137.19.1755532914495; Mon, 18 Aug 2025
 09:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 18:01:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeLewbDu-pge0ee0+AKzicKuS7fzce7d0pNc20h6CoGQ@mail.gmail.com>
X-Gm-Features: Ac12FXx3qMFgaF2nF2T4iYSOKFZFo5L9Q1hwQ-O9k-imvY-zp3thjThQzN5WK1w
Message-ID: <CAMuHMdUeLewbDu-pge0ee0+AKzicKuS7fzce7d0pNc20h6CoGQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable eMMC on RZ/T2H and RZ/N2H EVKs. As SDHI0 can be connected to
> either eMMC0/SD0 `SD0_EMMC` macro is added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -10,6 +10,15 @@
>  #include <dt-bindings/gpio/gpio.h>
>
>  #include "r9a09g087m44.dtsi"
> +
> +/*
> + * SD0 can be connected to either eMMC (U33) or SD card slot CN21
> + * Lets by default enable the eMMC, note we need the below SW settings
> + * for eMMC.
> + * DSW5[1] = ON; DSW5[2] = ON
> + */

Both SD0 and eMMC also need DSW17[5] = OFF; DSW17[6] = ON.

> +#define SD0_EMMC       1
> +
>  #include "rzt2h-n2h-evk-common.dtsi"
>
>  /*

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

> @@ -44,6 +63,34 @@ sci0_pins: sci0-pins {
>                 pinmux = <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
>                          <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
>         };
> +
> +#if SD0_EMMC
> +       sdhi0-emmc-iovs-hog {
> +               gpio-hog;
> +               gpios = <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "SD0_IOVS";
> +       };
> +#endif
> +
> +       sdhi0_emmc_pins: sd0-emmc-group {
> +               sd0-emmc-data-pins {

No need for repeated sd0-emmc-prefixes in the subnodes.


> +                       pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
> +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
> +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
> +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
> +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
> +               };
> +
> +               sd0-emmc-ctrl-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> +                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
> +               };
> +       };
>  };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

