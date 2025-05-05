Return-Path: <linux-renesas-soc+bounces-16684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E96AA933C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 14:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42E13B0B72
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 May 2025 12:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74019D8BC;
	Mon,  5 May 2025 12:34:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84A2745E;
	Mon,  5 May 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448475; cv=none; b=cN2G2H27jtpRx9VnyE7FM4qvHwyDOWXie6Cf39OF/0jJtOArIc0TsL75QYvc9zJ6hgufWBFxcPJsiUsldLfgH7MOuJYS8i7f753jCw16W33E7F4YyoPfKYyx2GHjaM+ZrYbqfsQmN7tudp5ncFUhIweGKs2Gigdm5bu+w/C+47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448475; c=relaxed/simple;
	bh=c/WymaZNCmun97LV9ufNBaljbi2XnsROnz0Xbw3V8HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kyc4dDLXP2ayHVtSz64C23Fbjqj4hWV0zdCDnROaXUhvWvc1/C9xQ5IonY0f1TmE2sPNaDGYXdY0Eyvfw5QmWswUnreNE0r/l5RvPptYBTR9qhvvfCJPmeSgtOZ87mIrHXE0GOJ+b+iI64Fc28AsI3ABjXSoriloBkiXhHDTSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so2690232241.1;
        Mon, 05 May 2025 05:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448471; x=1747053271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGFd6d5wkAAByXLyC1HEjiWtD1BkTZ+hLPpKkf60af4=;
        b=FgpyHECNh3/BfnKzDeAOw/Er76dSI7qy1dGxaxBTkmQhhPsek73Ohu/VghB/DM0Ik8
         HdogH8nbeV3Ab58XaUl/D8VOi8NY1lfdMvxv4/24fjq5Ce4+6rLoufBg3ky5hwx46AeT
         ns0+bT1KJcEBsIGTobBOn7PK+ANjTWnWz0DC84Po+BEJ4zyhDpzpq4z5k231ybDEw0Pe
         MOXifYrjv/JAhfX4TGWOeJaZJK9S0XBwz5q70+e7mbJ9ad0wAAWYuikZOGVltjVnNsUJ
         YOr0siaXRfqZVlGiQqagpkkyMckwg0CUX62ttTayagBdHDdvtdBMBII1c2PvTkCNp0T5
         yNYw==
X-Forwarded-Encrypted: i=1; AJvYcCUcijjVVVk+fWGMSePziX0ZPOYkEmH1aasSdgwS4vrBGKrgE0vdEpEp67nojyx9Rgd8hQGB2reiNQ9J@vger.kernel.org, AJvYcCVI3mzAF6bIsjwMVddSGe4qR3irGz13RCfB9nvGoWGQSubSihZ0zcCF1ed8u7GWwBoUszYiO1G5VbFWrW3kkO/18GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8cjkYFdnvVUSFFt9o3rw/x2DFZ0Un9gH5LUejTwRjNYsPpqpM
	lmd7XwRAR1XvzQYbt+q5H8cYb6h5113THnGdKwhooyBKUyn/wyKaVGlDGLOm
X-Gm-Gg: ASbGncvISc5zLTHjLgVb5fyVcxEmE/fSybU5lAVhz2p94J9/tLIlDsrVgSQLTenS7Xb
	BuGfGOeFtdz3tZNBi0z77QL2hb70y23SQMGyP7bSE8L6Q9y75NmwoeRVwTrFOjmhQX1H9UN3IbW
	bCd2t2igSBsJ7+DYYPg30AKaM+PCNsTSDgeLFrhOOmD5eV2DdlTyFJKByKEBs6hfj6JnFMRx9Fc
	Li9Z5S93QLjkupuq1Snsghg9tUHSJ+iYu0s2RDG0SqVzIcj07TfeNQIdM+C/cTgCdOqz7rgZICV
	WqFL+LNjbH4o4mfgBODffx28yNK+mke77x+vMcZ0RB9DYOPO/U4O0ZMrry/9phP8hdCHrTij/GA
	gLggBSv1kYiJ67w==
X-Google-Smtp-Source: AGHT+IEqK/bcRTd5ZU8GCV/UH4WiYWic+ZWbXJmEADMsHfchEIs64bGYplgijkpPSQ8TkugROIdkGg==
X-Received: by 2002:a05:6102:158d:b0:4c1:83c4:8562 with SMTP id ada2fe7eead31-4db14823503mr2828689137.13.1746448471473;
        Mon, 05 May 2025 05:34:31 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4daf234a8ecsm1424223137.14.2025.05.05.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:34:31 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4c301b1df82so1168182137.0;
        Mon, 05 May 2025 05:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNOgHBcnuOlh9GqjJzC1U2KFwQBe/lqmgQ5m+ZizwSxpa+qATtIVgyFP3AVdp9kSgKIJe3rGlGoQSvdYvVCwZ/NbM=@vger.kernel.org, AJvYcCVoNMoMej3sQxNGmok0/Mshoid66UFtr3PA10G171SK4WupoKyLc+VlvM3FMrmqkdvWwBmAvKJDnnDp@vger.kernel.org
X-Received: by 2002:a05:6102:4b03:b0:4cb:5e02:7538 with SMTP id
 ada2fe7eead31-4db1495be63mr3034496137.22.1746448470950; Mon, 05 May 2025
 05:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 May 2025 14:34:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
X-Gm-Features: ATxdqUF3RhhLMxUL05o0XGs4umBt8dW4lTChMwIx06Fylk7PRQ4fF7_fTpwr1S4
Message-ID: <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 14 Apr 2025 at 17:38, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G3E SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3. Add a DT node in device tree to instantiate the gpio-keys driver
> for these buttons.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, which conflicts with your CANFD patch that
I have just applied.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -8,9 +8,18 @@
>  /dts-v1/;
>
>  /* Switch selection settings */
> +#define SW_LCD_EN              0
>  #define SW_SD0_DEV_SEL         0
>  #define SW_SDIO_M2E            0
>
> +#define PMOD_GPIO4             0
> +#define PMOD_GPIO6             0
> +#define PMOD_GPIO7             0
> +
> +#define  KEY_1_GPIO            RZG3E_GPIO(3, 1)
> +#define  KEY_2_GPIO            RZG3E_GPIO(8, 4)
> +#define  KEY_3_GPIO            RZG3E_GPIO(8, 5)

Please drop the extra spaces after the define keywords.

> +
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
>  #include "r9a09g047e57.dtsi"
> @@ -33,6 +42,24 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>         };
>  };
>
> +&keys{
> +#if PMOD_GPIO4
> +       /delete-node/ key-1;
> +#endif
> +
> +#if SW_LCD_EN || PMOD_GPIO6
> +       /delete-node/ key-2;
> +#endif
> +
> +#if SW_LCD_EN || PMOD_GPIO7
> +       /delete-node/ key-3;
> +#endif
> +};
> +
> +#if SW_LCD_EN && PMOD_GPIO4 && PMOD_GPIO6 && PMOD_GPIO7

"PMOD_GPIO4 && (SW_LCD_EN || (PMOD_GPIO6 && PMOD_GPIO7))"?

> +       /delete-node/ keys;
> +#endif
> +
>  &pinctrl {
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> index fd82df8adc1e..84fb955ad77b 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -12,8 +12,13 @@
>   * SW_SDIO_M2E:
>   *     0 - SMARC SDIO signal is connected to uSD1
>   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
> + *
> + * GPIO keys are enabled by default. Use PMOD_GPIO macros to disable them
> + * if needed.
>   */
>
> +#include <dt-bindings/input/input.h>
> +
>  / {
>         model = "Renesas RZ SMARC Carrier-II Board";
>         compatible = "renesas,smarc2-evk";
> @@ -27,6 +32,31 @@ aliases {
>                 serial3 = &scif0;
>                 mmc1 = &sdhi1;
>         };
> +
> +       keys: keys {
> +               compatible = "gpio-keys";
> +
> +               key-1 {
> +                       interrupts-extended = <&pinctrl KEY_1_GPIO IRQ_TYPE_EDGE_FALLING>;

So you are using them as interrupts. Don't you need to configure pin
control for that (function 15 = IRQ14)?
Alternatively, can't you use them as gpios with interrupt facilities?

> +                       linux,code = <KEY_1>;
> +                       label = "USER_SW1";
> +                       debounce-interval = <20>;
> +               };
> +
> +               key-2 {
> +                       interrupts-extended = <&pinctrl KEY_2_GPIO IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code = <KEY_2>;
> +                       label = "USER_SW2";
> +                       debounce-interval = <20>;
> +               };
> +
> +               key-3 {
> +                       interrupts-extended = <&pinctrl KEY_3_GPIO IRQ_TYPE_EDGE_FALLING>;
> +                       linux,code = <KEY_3>;
> +                       label = "USER_SW3";
> +                       debounce-interval = <20>;
> +               };
> +       };
>  };
>
>  &scif0 {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

