Return-Path: <linux-renesas-soc+bounces-16116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D550BA91B10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 13:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B4919E47D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 11:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6686D23F405;
	Thu, 17 Apr 2025 11:39:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079D8460;
	Thu, 17 Apr 2025 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889971; cv=none; b=AlnzH6w3aVOAJmoTlITifhqzm7GV5pVtjvfaPAt+9P9jL+xXKQo4VoBT3S3Z/Bt6Bs0OlY4Ch7NumBWh+iSB+f1afHDZcRzDKu52sqtMYexeFzHGSD4pNWTbOltaJugdyrS6rMJXLmPE/Af/Eb9AlW+UhpGOVNObCdXqutCXOKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889971; c=relaxed/simple;
	bh=YVQ/pvg26srlj9DXUW5XJhmrO2CQ8c6hMQOqX4uJVSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+Kcfqy2i4pd7OaK/xSNlhzhmfCHpiH/og0beTEX2KPAOws55CH3lJXA2jBgFhN6lwKtbcZeNn5mBpuFpDMy6Gj9HlYLmTruclXieqRpMLmdtDR8GNjVoYDJw2B3X+MCXeegtWpuJ9oqCqomVP5w9lp3au0wDxFkCqgrUdbJXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-525b44ec88aso321151e0c.3;
        Thu, 17 Apr 2025 04:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889967; x=1745494767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TDM51vN8/XTY4uBgXl9J+04Nfc4FihKDZ7BxNx1+pc=;
        b=VzT5r4HCfee+6yYOJJsktJtwcs3/3+HmX5sQ1/HbFMWEb7CEWmUO8XM6lIngHc1CbZ
         ghZYQn6ePBQFM2c15fXmX8rJS3CNQW68zJolsBhkKq+/02gfglQDoz07C7Xabthj7AgD
         5+Y40ywVP0uDtMPZUdcFftke/5awXzWDwpIg/bUkr8ffOccpWduzMJenBsidUMqvw5Nu
         F4uMA1k2buPDmzEr96RnshDL3mbWED3EX1kyg8ctrY1xqLK66E0Ydi+V4XF93/rKMs/N
         Kkc+Z0jvIDQTr/yudo2/xvpk830ddZaXjvIwcVYbB+V5ah1wlypbB7QU6Un60lqtsmC0
         LFJg==
X-Forwarded-Encrypted: i=1; AJvYcCVR+sW6urIOpuVsjx0a0TJ/y/+DaSGe3XLeKUcP2wff1sIK+AJPqP1hIvlpIh6+UYq0jvaJLLs8EnST7g==@vger.kernel.org, AJvYcCXjwBelAq2akxnA/1QP6agHKo50TGIOU4x44ETOpn959EjAH4B/ESi6hECY4ZjaXirQR0eZmjupZ7i0@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTnKqtQVDbco6M+b1wQbzh7RB0bdauiPFCCrm1AFOjh7+y/hH
	T/GQ+hScBSRcSKPm1undxupxDffMofHQbIGVwyw1JQJScOaKk+88aHmok8Sw
X-Gm-Gg: ASbGncu+vJlZ3y3fSAkUtjXRXfgi+I6IgGyQRtU9TzlOFt2TASUqJD0t2xGsi1SmrV6
	mH1K8UtEnCikOppxa/e4q7yFwMoq/UvISvI7u4mhtA/k83PeklA/1JrtGy4ECErrkMybIhG3e7j
	99u9K37t4YUdUmFtzBI/C1HfSNDFTY0A7eyecBBanNn8ToJ9wxu+m/Pj1+TYUlDf+iRPnlJ4LWB
	ZNMYCI4llq0KGdo6lryF6OtYHJ4hP/rwzWkmCvKZYLOZ4f/xoUNLEItjIQ+17JruiPEQa6Bzvn1
	epZ+CQIkEUHRgOiHLxn6APY0w4qd8exGoT4tgmCVIfnUJtr3FtfMYXIEx+ivZBLssJIU6c1ImfN
	X+NBc/xqfETfJew==
X-Google-Smtp-Source: AGHT+IGTL6ka8IiZP8arNa7v46loquIuYbxUYhLquvGEgUsqa4sIWNyrV0fPLz3RxV72EP2I1JisQw==
X-Received: by 2002:a05:6122:319f:b0:523:9ee7:7f8e with SMTP id 71dfb90a1353d-5290deca7d3mr4724675e0c.4.1744889967017;
        Thu, 17 Apr 2025 04:39:27 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd9b4b6sm3576558e0c.24.2025.04.17.04.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:39:26 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso261932241.2;
        Thu, 17 Apr 2025 04:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHERUFXyZg/y8R7oaVuiTh9yLxzZw8BBLxpAGQ1YyzmkIDEaOiKKH18l0B7Ws2eulYU0H3C3uz59rC@vger.kernel.org, AJvYcCVLuCSvQSULZXm6Bvgx++jbnqBv0rB6UxTPVusCAMYb5LeDpo1blYUT1VqDS49GXgHCi8RNYG27gho6lw==@vger.kernel.org
X-Received: by 2002:a05:6102:5c15:b0:4c1:9159:859c with SMTP id
 ada2fe7eead31-4cb5920e43bmr3114332137.15.1744889966312; Thu, 17 Apr 2025
 04:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 13:39:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
X-Gm-Features: ATxdqUFlu9IZYdJIjyIVutR9wgobLiBxloCgifVv7PKcZV8Xi5kT6GQ3M-kSlTY
Message-ID: <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-leds <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

CC leds

On Thu, 17 Apr 2025 at 11:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * using function, color, function-enumerator properties now
>
> Honestly, this is better than using node names? With V2, the LEDs were
> named as in the schematics, now they are called:
>
> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
> lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
> ...
>
> Which gets even more confusing if we might later add LEDs not on this
> board, but on the expansion board. 'green:programming-8' sits where?
>
> I really wonder, but if this is the official way now...

Good point!  So I'm inclined to take v2...

Let's raise this with the LED people. I don't want to fight Pavel when
v2 hits the CiP tree ;-)

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/net/pcs-rzn1-miic.h>
>  #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
>
> @@ -86,7 +87,74 @@ switch-8 {
>                         debounce-interval = <20>;
>                         gpios = <&pca9698 15 GPIO_ACTIVE_LOW>;
>                 };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
>
> +               led-dbg0 {
> +                       gpios = <&pca9698 0 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <0>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg1 {
> +                       gpios = <&pca9698 1 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <1>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg2 {
> +                       gpios = <&pca9698 2 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <2>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg3 {
> +                       gpios = <&pca9698 3 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <3>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg4 {
> +                       gpios = <&pca9698 4 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <4>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg5 {
> +                       gpios = <&pca9698 5 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <5>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg6 {
> +                       gpios = <&pca9698 6 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <6>;
> +                       default-state = "keep";
> +               };
> +
> +               led-dbg7 {
> +                       gpios = <&pca9698 7 GPIO_ACTIVE_HIGH>;
> +                       color = <LED_COLOR_ID_GREEN>;
> +                       function = LED_FUNCTION_PROGRAMMING;
> +                       function-enumerator = <7>;
> +                       default-state = "keep";
> +               };
>         };
>  };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

