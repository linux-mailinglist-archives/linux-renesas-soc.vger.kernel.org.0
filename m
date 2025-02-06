Return-Path: <linux-renesas-soc+bounces-12890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12160A2A3BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2FE01883FAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E1D2040B5;
	Thu,  6 Feb 2025 09:00:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470D015B10D;
	Thu,  6 Feb 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738832444; cv=none; b=G1A7Q1q0OEsOkiCFF+wLJYrVz4buEro92zbkej6Kt4cZRaq7LaAMyQ/i0h+OOmWV7t9PXyECgXHErWatwj1PTGZBNoR5h0gBjm75F1dVeA/zxt7oFDK+bQbIgkJNdOHA4xCPOAOV94B+fKHCMiupIkBBZ078TjLBHEvRpa58g30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738832444; c=relaxed/simple;
	bh=tNGp6AnmMtIsCmEnYFKaMlbkh9Gdfbixuud1uF6c9WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeEyM8GUarBYCmGptv/fX4Z2MgnQwppaOZ7Nod5FIEjFL2tLzmQEGaeWjEC5/h/NH1d/RGxqnX7SJIIg5wE2KA3cUzb/nG156ubelK3EgTYnvJ7rhixMMde8GIPqrXfGHn4uk2MMGzs38xLuhsqLgaAcYbnSuAFQr1hvv9zZJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c436db302so391117241.0;
        Thu, 06 Feb 2025 01:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738832440; x=1739437240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3ehC4vTUdT8yYHtUdAmhQ8vVz5MIbtBfCbdfqQHxzk=;
        b=ho14n2HNjBWxOgmIByrJdxn35EbII6V+Ngx9LIfAPDYmYiK0fv5tXUq+zMyzzKZwBe
         DES5Z0RGnwWXg0peP3eHvnG9ujURNLCQFwIYh/SEWNHABR8xxGB0oMcn+uCkHPuMYVbl
         kITk51MIW+UgAojjJ87I+ZttNJ5DiF1KLNFprtJOAzvj5BL5JDQ/+ZQ/jr95H8MVqq91
         VhV/7Njg2g9tailVK2mlMhtOV0rUq7jjhn5cQoe9NZgwHD9c1veSDBvfwYFcAgc2Tch8
         WDWB6zXtdTr+r64B2Ou+BWIaaMt5qGq3Rfkvs0EVY/YPega5xjzui1VjBZD+sK1DPwTD
         sK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNIrIuKI5W7RlXxeWyhdMY12X3TV8PKyD6k8uCPQW7os/GtNYPBiky0VGYTPry5jKwhOp0VN+43xP9@vger.kernel.org, AJvYcCWjlCEuR/kopREo7dS06e3MM50mAIF23w6pspwUWFqVXVxxiDS5WRmU5IvQtEIDydjjoBrORKOotEUTToW2M61efFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwklcJs5iYUMDb5BAsei0EzQd2YE/+HJrdd8Sv9WN5KMi8gUebi
	PKjllOJcd3cvoYgsT9hZZsuxvGaZ1Lv76MCxHiSzcmpyqIDC180zKImcpFCP
X-Gm-Gg: ASbGncvLjQ2+rI/x/YyCthtapjB3a5eAmIj6UnmrrMdm9sMRyP2LMoGgZUDY8eQtiZw
	drH27Wq8bO9guFi5uVA8eZk7KEvmhTe3Rts+uMdHr9nESM5dIvbRxAUPPOkUTl/EGMa8Un+JwPR
	6yBh0JNWAcF/0yI9GdwTZcnlAenJmCRglIXemnRuRZer0/mZT6Ecbj8XfVKcmmQ1J9VOwDuaHR3
	HyUDbnVZTRoLujbHOq5VrrlQEQeRNnbwH9lNG8ML2ijAKlozx9KJI5LuLLu1HcObLU6lcean+T7
	TTcXJs4HcstEUMFenoBGRlTYlK3Y3h7VWBE2sfLBA5kPaeX1tZNAbg==
X-Google-Smtp-Source: AGHT+IGGJiuza2WKqf/DAOCyy6Z3Y5LBgEHtF1/Z60kZDO5dquAtevhDRAGBW9Y3q4zjGatvEjVGvw==
X-Received: by 2002:a67:f150:0:b0:4b4:5e9b:3c30 with SMTP id ada2fe7eead31-4ba7209077amr1077223137.9.1738832440305;
        Thu, 06 Feb 2025 01:00:40 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76ef5337sm154373137.13.2025.02.06.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:00:40 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c436db302so391107241.0;
        Thu, 06 Feb 2025 01:00:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6EwSfDYMn4q6A9cYZYhQvHvIVC/N0Z4lsgRE63JuYB5yI/Bz/3t0TMZWGjJqXmdTlusBAvIFP0o5ymCb3GdvXdD4=@vger.kernel.org, AJvYcCU8UiVX7popESwO1Rbi3XAl2TwZJmlUeV08SDspOHRdRXdoQT25TM/ekeCvY+BpIbZ8yJJmDk3dZfsb@vger.kernel.org
X-Received: by 2002:a67:fd72:0:b0:4b5:b20d:9613 with SMTP id
 ada2fe7eead31-4ba7209019emr961371137.7.1738832439620; Thu, 06 Feb 2025
 01:00:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com> <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 10:00:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1PFgdvMBrQrgdwmeNutM6arxZtzdE1rnrwWKtWvPVhg@mail.gmail.com>
X-Gm-Features: AWEUYZnTgiTlyZq258RomMQ0wekaxyOv0U0s3kHMxKKVEKvnvz3L7o5gLRcV264
Message-ID: <CAMuHMdU1PFgdvMBrQrgdwmeNutM6arxZtzdE1rnrwWKtWvPVhg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:29, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for enabling SDHI internal regulator, by overriding the
> status on the board DTS, when needed.
>
> While at it, rename the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpio
> to avoid conflicts with internal regulator node names.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -602,6 +602,13 @@ sdhi0: mmc@15c00000  {
>                         resets = <&cpg 0xa7>;
>                         power-domains = <&cpg>;
>                         status = "disabled";
> +
> +                       vqmmc_sdhi0: vqmmc-regulator {

sdhi0_vqmmc

> +                               regulator-name = "SDHI0-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
>                 };
>
>                 sdhi1: mmc@15c10000 {
> @@ -615,6 +622,13 @@ sdhi1: mmc@15c10000 {
>                         resets = <&cpg 0xa8>;
>                         power-domains = <&cpg>;
>                         status = "disabled";
> +
> +                       vqmmc_sdhi1: vqmmc-regulator {

sdhi1_vqmmc

> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
>                 };
>
>                 sdhi2: mmc@15c20000 {
> @@ -628,6 +642,13 @@ sdhi2: mmc@15c20000 {
>                         resets = <&cpg 0xa9>;
>                         power-domains = <&cpg>;
>                         status = "disabled";
> +
> +                       vqmmc_sdhi2: vqmmc-regulator {

sdhi2_vqmmc

> +                               regulator-name = "SDHI2-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 0b705c987b6c..1ecea3872e94 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -53,7 +53,7 @@ reg_3p3v: regulator1 {
>                 regulator-always-on;
>         };
>
> -       vqmmc_sdhi1: regulator-vccq-sdhi1 {
> +       vqmmc_sdhi1_gpio: regulator-vccq-sdhi1 {
>                 compatible = "regulator-gpio";
>                 regulator-name = "SDHI1 VccQ";
>                 gpios = <&pinctrl RZV2H_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
> @@ -244,7 +244,7 @@ &sdhi1 {
>         pinctrl-1 = <&sdhi1_pins>;
>         pinctrl-names = "default", "state_uhs";
>         vmmc-supply = <&reg_3p3v>;
> -       vqmmc-supply = <&vqmmc_sdhi1>;
> +       vqmmc-supply = <&vqmmc_sdhi1_gpio>;
>         bus-width = <4>;
>         sd-uhs-sdr50;
>         sd-uhs-sdr104;

And then there is (a) no need to change the names here, and (b) no
build failure in arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

