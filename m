Return-Path: <linux-renesas-soc+bounces-20620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28547B2A4CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72575E7B7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546F43375CC;
	Mon, 18 Aug 2025 13:15:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A93375AE;
	Mon, 18 Aug 2025 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522943; cv=none; b=hcY1VoLUSap1f9qBHNDHZEDRaCwepgnUq0kxAn18KTuopqJGmEsd6nzs5b4ZOSiELTLDa0UzY5BKRUM+ctJ5N2kMT6xN081HD91zfvxCP1Wcc73uBJwaymcffO3z3CiW2V+hlsuYnuL5oYZ/+CyIj53pn5qPenbsbEp3qDh7HPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522943; c=relaxed/simple;
	bh=eZGvUeGw+fPtc8+ouIsGvEN/exUL+cRr1q5bKRNvYOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRyXl7fOSfU+sZ7XeH8gz0s61w+qFYe/J1ClmU1DDvGqZs0uikVCl5PITrJgZhzGdeR5miZFYmzqTZGqq5Usf8AqGsgRiLJpbVEZDZzXCd02XOtfm4UqebWfyAvuDVqbmNTvqDPKIq7dlf06PXXm58XyLIUgB4dFGO5I0pVqPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-50f88cd722bso1178721137.1;
        Mon, 18 Aug 2025 06:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522940; x=1756127740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5pJEjXNDPDJzPITNSF2Cy+agebN0/imHucjVPw+eAg=;
        b=BY/x+Rn12+a1dzjvYeklyW0VyleNK5roGK8gU5QB+rLvWB1AMNS90V/N12HCGzyyMG
         YWkIV8fQ0mpGRlifZFFrqwLaiy9+aor/pxv20HB8RY3eXCEO1OErrB4wMexDvaLUVYYZ
         esYi3b9igvTF49VN0z64Iio7QULEDrgm0EtPPIo0YcFhasTyyt59IgIIuoDtfm9y9dWC
         OpudjC3A0KgcQpvvGtsk+4sHjdWTKRNVWQEy5k/8PcA5qKCdXiPyVWJZ+uuz8YyFDZd8
         xTHgwgo4rLgD7n7MDpz6frS/MI9mVKbd7kHkaxMbO4TrmF+IJlWNAP42d2AijshyYivF
         72zw==
X-Forwarded-Encrypted: i=1; AJvYcCUaExJbtIFeNpvVU6ivbg4QNKbpem1BH0EmkllvdTC60ldha6g5+1TDemuAE9fHf48QZLp6l9AJJzmG@vger.kernel.org, AJvYcCXe7tS1sRxjJQqT/4kxKWpvVwleL7xs5Tr82i0ad0K0d+uOc3Rf0q+6N8E6x1L+1qOSOs8YUhoVKcrScZCq@vger.kernel.org, AJvYcCXtLAYGwM/tV94sOsBhR/tUqqSJXaqtEHu6WDEWC+wDUnIXPQK9Z3C8cGh3IpGAOIVdnpJNChaMnvY0XgtCM8aUitA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaalGR9JhZwR1aZ9fCCSvqmYgkT8he4DHxtWv98P3WKcSA4US1
	tcfvf4Rl+BC6Y/heepvOhAUVP99VFGlQcZc9WjUuXgnEBCXY3wDv1c3eZcls0s3+
X-Gm-Gg: ASbGncuNQiBuum78fUbT2zkolbpzFSCqTmx7kb1iR8bIN6+0j7mivsKcOJXeM2vt/iF
	8sM5U+0rfzCnwjaJE8KFkzkU4jQVti8bUmyEgFKfadjRNLmKrGVI3e4Ly4BEDGI7uhR1TY+d2qc
	ELIsfa94L16ZU2qoc5wzmyblzZKfeiMJ8Jv1eXj6Sx94dTW4SNhxEyzoB+2TIAZVjuCA0oa11Zv
	CCG1CHVepVVMC94M7xecmNG5xTYQj9ZHI2l5tsLA4m0YLbV3r2fg3aYAxhe1D7eE0Lt5ZJ1Cmeb
	R4kJF8pomaFPiUHePpOSriGzrYOTMNewhhJzHjnBeEWlVsowX6Bo0SjUwaOPTkzuYdWaTM7NACB
	n4PyoqFHRs8ncPsG0KzYVUYMh41R43vJv3xbEnld33kq1jM6b4JMQg8VvB5u2
X-Google-Smtp-Source: AGHT+IEL/I13AxSgETqSfXM8k+ZAf1L6zU8Qw4hF4wk5UA+zAhxTyB+K6nDu48cEjZ2lboh7yrybVg==
X-Received: by 2002:a05:6102:dce:b0:518:9c6a:2c01 with SMTP id ada2fe7eead31-5189c6a33afmr136483137.28.1755522939811;
        Mon, 18 Aug 2025 06:15:39 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890277e2c70sm1751311241.6.2025.08.18.06.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:15:39 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89018fa6f6dso1204634241.1;
        Mon, 18 Aug 2025 06:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwQx+47AJPElmZ91UbXuiRJ/WM3rQd6nW9mlutGANHt+4Powy0FRyb5CrIZcdqFOHrEBnV1DYgbEaP@vger.kernel.org, AJvYcCWunSkNYNIQMo9FbVEp2j8emZ6yHZedgac1s+cKthlXmt1KnyntO+A0pUsAnNFqo4MskNsHSrjuNmqZ9+tt@vger.kernel.org, AJvYcCX9PWEoAyHvt7tJIU4w2gsnJrmfFVhXBo4n/qr2ERZDw5HkDPblRxu9u5dGQi955LmUBIsqYyYCgswmSkuAgNr8AZY=@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:4e6:ddd0:96f7 with SMTP id
 ada2fe7eead31-5126cd388e8mr4319794137.13.1755522939084; Mon, 18 Aug 2025
 06:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:15:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVi26AXwQJDtxSp8hSsmZ1Lx4_GYFsbtmq_gxJyddkqTg@mail.gmail.com>
X-Gm-Features: Ac12FXyX3G3j02_gxxBGNzChIx62VgPdJgiJgMtXXMqM8tO2f3w3kfm4CppbZcU
Message-ID: <CAMuHMdVi26AXwQJDtxSp8hSsmZ1Lx4_GYFsbtmq_gxJyddkqTg@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add
 user LEDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

Thanks for your patch!

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USER LED0-LED8, which are available on RZ/T2H EVK.

According to the schematics, only the first four are user LEDs?

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -7,10 +7,61 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +
>  #include "r9a09g077m44.dtsi"
>  #include "rzt2h-n2h-evk-common.dtsi"
>
>  / {
>         model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
>         compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led0 {

led-0

Cfr. Documentation/devicetree/bindings/leds/leds-gpio.yaml:

    # The first form is preferred, but fall back to just 'led' anywhere in the
    # node name to at least catch some child nodes.
    "(^led-[0-9a-f]$|led)":

> +                       /* SW8-9: ON, SW8-10: OFF */
> +                       gpios = <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_GREEN>;
function = LED_FUNCTION_DEBUG;
function-enumerator = <0>;

> +               };
> +
> +               led1 {
> +                       /* SW5-1: OFF, SW5-2: ON */
> +                       gpios = <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_GREEN>;
function = LED_FUNCTION_DEBUG;
function-enumerator = <1>;

> +               };
> +
> +               led2 {
> +                       gpios = <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_YELLOW>;
function = LED_FUNCTION_DEBUG;
function-enumerator = <2>;

> +               };
> +
> +               led3 {
> +                       /* SW2-3: OFF */
> +                       gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_RED>;
function = LED_FUNCTION_DEBUG;
function-enumerator = <3>;

> +               };
> +
> +               led4 {
> +                       /* SW8-3: ON, SW8-4: OFF */
> +                       gpios = <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTIVE_LOW>;

Schematics say "run", so perhaps LED_FUNCTION_ACTIVITY?

    color = <LED_COLOR_ID_GREEN>;
    function = LED_FUNCTION_ACTIVITY;

> +               };
> +
> +               led5 {
> +                       /* SW8-1: ON, SW8-2: OFF */
> +                       gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;

Schematics say "error", so

    color = <LED_COLOR_ID_RED>;
    function = LED_FUNCTION_FAULT;

> +               };
> +
> +               led6 {
> +                       /* SW5-9: OFF, SW5-10: ON */
> +                       gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;

Schematics says Ether-Cat link-activity, so LED_FUNCTION_LAN?

    color = <LED_COLOR_ID_GREEN>;
    function = LED_FUNCTION_LAN;
    function-enumerator = <0>;

> +               };
> +
> +               led7 {
> +                       /* SW5-7: OFF, SW5-8: ON */
> +                       gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_GREEN>;
function = LED_FUNCTION_LAN;
function-enumerator = <1>;

> +               };
> +
> +               led8 {
> +                       /* SW7-5: OFF, SW7-6: ON */
> +                       gpios = <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTIVE_LOW>;

color = <LED_COLOR_ID_GREEN>;
function = LED_FUNCTION_LAN;
function-enumerator = <2>;

> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

