Return-Path: <linux-renesas-soc+bounces-21288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B1B4245B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 17:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4974B3A77FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 15:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9C530BF77;
	Wed,  3 Sep 2025 15:04:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DA2D6604;
	Wed,  3 Sep 2025 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911872; cv=none; b=tXdymkTTTw0S0uvOPF2ScTYfxtYDZPoQIFtjZjRCKt2rbW7sqqwI6pnxYnpQ13FVWGSd8jR/hMm2yU+rkEGYp/V5B/+T6BiyP0gBS7CDpGG/B+Rn9SheUl/k096PM3pggWPvYNvhIeXRrNp4t5uzlNaCu1Y84kyoZrN2FPw7Rkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911872; c=relaxed/simple;
	bh=h8smzc7ZHq9Va/r9ZxrqhulE3gzpiaWyH0i/4kfVPa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXydPInGHRidGiv2nXanxuOc0HY4fCjmcoGfFo9U8zpIO+G6xwAxxQOS5DQLGiJt5sJuGfHHe7oI4VAMb2LWB2/bKtXiCqwEBIOVNY0eYNccT/oQul2okX1dj/ZHIsupqg/czBRmOqZ5p+ztzzopRhQuyYpkZZ2pBf4nqqCbLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d601859f5so218677b3.0;
        Wed, 03 Sep 2025 08:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911869; x=1757516669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfxaat4ZLKZU69SwdrM/SBfl8rybrnaouM8vw93evjg=;
        b=KDBooPf4lN3mzH/HxenEb1q3gi6f3WVkOlZ66+gsCCU+161a0Y9k47iGWZovxZ05Lw
         mVK+8T7SJM71Vuhzg28rlo9uErEMnP3asLsYzR6CXEOZ9KdmKiTAsnPWTnOc7+IB4zca
         EPSLgDdd5wFSDqVHsKxHUtTHtzDE7hCSdmltv4pKjceVOyW4cZgiRCzDL+kjBOtXJl7s
         1z1tFDn3nOal8ZIbMt1Be1fpQpcuMWWI0K44TLzGK0ItTcmHB/ULpzZFBQTheFu5PbEV
         4zXHs8uMmspgf2mZjcuNqOk+MgtEZLzml6jmvH9+OaPcPirLY0h0YMAVuR05WJ7nik2F
         6wiA==
X-Forwarded-Encrypted: i=1; AJvYcCUHz9I9268WEmVvBWQ+jI5JDPcrSAKRftEbMHpTgruoUVe4Xq3kU6s95VDg6v6OkLrck/qLt3FG8SfF@vger.kernel.org, AJvYcCUN9EAfAlumyyFce7CiHnl/upvikF+jh0bFQeseBGpzV1hM28PfX+nh32OrO+K19GBnKmNairlYaUL+w5aG+z2It9U=@vger.kernel.org, AJvYcCVQSK+meWbvPXJPLh/+PzBdR/y3J2dqanPXovRkr7h/tF3Lc/BscKw5QDDAuK67bj5lvdPLollFaffEHZb/@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZs9fNA8ceeQCgxV4gd3hbS+9PqPwpmR23bFKLYOn/V6f3YMo
	v/cqy2hUetNh4TXHxxa+71kCaHGzaDtSSY5SlV9GyKT9ldfAaYH0Ey424caVmnja
X-Gm-Gg: ASbGncvGjXsbt5bf/KG69ILeYKpiuXTBO+Ajq+MgW4dJh/B38zfB515u6ps1wOz9BCV
	8Ga+M/tX5ATitItdsoimqy+88Eg06FrVULnG1Ku7MW7jrlgS+2CyTyYn2qAu9E8G5yh/EH6j5pV
	fuYlSeekX15gVxTFF7skGvUHF3r/BhGYYqJYSYyD1xzeHgvYBprg0BdOA+a501tOBZpPyyru43Z
	tPEzexT6WSccm5YqlQ4+yvolnbUunlPcfBZE9yNsol5M19H/nxp1c8qSgrpbYBD68kSRGJRojKZ
	glYvzcgyh5VjVPFBAyzbniLYG2kI9Jr0dx4FLzEKKvk/ZnOSTva1+Dm+YFun9zKweut4LL1DEVn
	DajwlfRBGei6QWOeNHgBEx0UttB7Iftq8buTdht4fOByHT6AqnAhR5HUm7sD3r6l8
X-Google-Smtp-Source: AGHT+IFiCAwvXt8gl25yKEJU0gCavGCSDLg0XodGdzKYmmpRtx0j2wJ4m2KrjE1Bx8VgeE6d4KPvLA==
X-Received: by 2002:a05:690c:7203:b0:721:6b2e:a07a with SMTP id 00721157ae682-72276580c26mr179495857b3.51.1756911868268;
        Wed, 03 Sep 2025 08:04:28 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a82d6ad1sm14215087b3.5.2025.09.03.08.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:04:27 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d601859f5so218047b3.0;
        Wed, 03 Sep 2025 08:04:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8+vmMZ6MmT22g++OKN3YZ/5XBPfo076vi7LpsNzs3FlIdj34YnJ0mfw59eHX4LVvCyQX3HZYPGD3BK5sHSQEd5n8=@vger.kernel.org, AJvYcCVBeaJFeXjBMxGNYJoRBPWL8jvHwXBM0BCP+uPS4AHfehKGHXkzsvFen/yXMKIdsLXvKdEQ0jIwgdSxbmLo@vger.kernel.org, AJvYcCVrCG8joKwYrtjFMKazErtAkAh5r9F9Pll8l22lzzamwR5VgAYnFrkP37T/EGtPi7mZHJNII3vpg8nE@vger.kernel.org
X-Received: by 2002:a05:690e:4281:20b0:604:3849:9be9 with SMTP id
 956f58d0204a3-6043858ff35mr196806d50.13.1756911867549; Wed, 03 Sep 2025
 08:04:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250821161946.1096033-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821161946.1096033-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 17:04:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVb_5+gVDCUYYZ2Xj55gXzZATx+5vaY6uS1TuCNYb9Qeg@mail.gmail.com>
X-Gm-Features: Ac12FXzyG34U6XPHgyKHtYspSpPi6ndMXIbD2Xuo0m32dAbQoSis4tQUVb1Fekc
Message-ID: <CAMuHMdVb_5+gVDCUYYZ2Xj55gXzZATx+5vaY6uS1TuCNYb9Qeg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 21 Aug 2025 at 18:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable USB2.0 support on RZ/T2H and RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -29,6 +29,28 @@
>   */
>  #define SD1_MICRO_SD   1
>
> +/*
> + * USB Pin Configuration:
> + *
> + * This board is equipped with three USB connectors: Type-A (CN80), Mini-B (CN79),
> + * and Micro-AB (CN33). The RZ/T2H SoC has a single USB channel, so either the USB
> + * host interface or the USB function interface can be used, but not both at the
> + * same time.

Please reflow the text to fit in 80 columns.

The last sentence applies to the CN80 and CN79 connectors only, right?

> + *
> + * By default, the Type-A (CN80) and Mini-B (CN79) connectors are enabled.
> + * Configure the switches as follows:
> + *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] = ON
> + *   - USB_VBUSIN (used for USB function): SW7[7] = OFF; SW7[8] = ON
> + *   - USB_VBUSEN (used for USB_HF_VBUSEN): SW7[9] = OFF; SW7[10] = ON
> + *
> + * To enable the Micro-AB (CN33) USB OTG connector, set the following macro to 1
> + * and configure the switches as follows:
> + *   - P00_0 - P00_2 (control signals for USB power supply): SW1[5] = ON
> + *   - USB_VBUSIN (used for USB OTG): SW7[7] = ON; SW7[8] = OFF
> + *   - USB_VBUSEN (used for USB_OTG_VBUSEN): SW7[9] = ON; SW7[10] = OFF
> + */
> +#define USB_OTG                0
> +
>  #include "rzt2h-n2h-evk-common.dtsi"
>
>  / {
> @@ -145,4 +167,18 @@ i2c1_pins: i2c1-pins {
>                 pinmux = <RZT2H_PORT_PINMUX(5, 0, 0x17)>, /* SDA */
>                          <RZT2H_PORT_PINMUX(4, 7, 0x17)>; /* SCL */
>         };
> +
> +#if USB_OTG
> +       usb-exicen-hog {
> +               gpio-hog;
> +               gpios = <RZT2H_GPIO(0, 2) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "usb_exicen_a";
> +       };
> +#endif
> +
> +       usb_pins: usb-pins {
> +               pinmux = <RZT2H_PORT_PINMUX(0, 0, 0x13)>, /* VBUS */

s/VBUS/VBUSEN/?

> +                        <RZT2H_PORT_PINMUX(0, 1, 0x13)>; /* OVRCUR */
> +       };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> index 80f358fb2d74..b98b0f7c1128 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -33,6 +33,33 @@
>   */
>  #define SD1_MICRO_SD   1
>
> +/*
> + * USB Pin Configuration:
> + *
> + * This board is equipped with three USB connectors: Type-A (CN7), Mini-B (CN8),
> + * and Micro-AB (CN9). The RZ/N2H SoC has a single USB channel, so either the USB
> + * host interface or the USB function interface can be used, but not both at the
> + * same time.

Please reflow the text to fit in 80 columns.

The last sentence applies to the CN7 and CN8 connectors only, right?

> + *
> + * By default, the Type-A (CN7) and Mini-B (CN8) connectors are enabled.
> + * Configure the switches as follows:
> + *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;

s/DSW2[6]/DSW2[5]/?

> + *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
> + *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
> + *   - USB_VBUSIN (used for VBUS of CN8 for function): DSW16[1] = OFF; DSW16[2] = ON
> + *   - USB_VBUSEN (used for USB_HF_VBUSEN): DSW16[3] = OFF; DSW16[4] = ON
> + *
> + * To enable the Micro-AB (CN9) USB OTG connector, set the following macro to 1
> + * and configure the switches as follows:
> + *   - P02_2 - P02_3 (control signals for USB power supply): DSW2[6] = OFF;

s/DSW2[6]/DSW2[5]/?

> + *     - P02_2 (used for VBUSEN): DSW14[5] = OFF; DSW14[6] = ON
> + *     - P02_3 (used for USB_OVRCUR): DSW14[1] = OFF; DSW14[2] = ON
> + *   - USB_VBUSIN (used for VBUS of CN9 for OTG): DSW16[1] = ON; DSW16[2] = OFF
> + *   - USB_VBUSEN (used for USB_OTG_VBUSEN): DSW16[3] = ON; DSW16[4] = OFF
> + *   - USB_EXICEN (used for USB OTG EXICEN): DSW14[3] = OFF; DSW14[4] = ON

Looks like you could use P00_0 - P00_2 instead of P02_2 - P02_3, like
on the RZ/T2H EVK?
But you don't want to do that because you want to use these pins for Ethernet?

> + */
> +#define USB_OTG                0
> +
>  #include "rzt2h-n2h-evk-common.dtsi"
>
>  /*
> @@ -185,4 +212,18 @@ i2c1_pins: i2c1-pins {
>                 pinmux = <RZT2H_PORT_PINMUX(3, 3, 0x17)>,
>                          <RZT2H_PORT_PINMUX(3, 4, 0x17)>;
>         };
> +
> +#if USB_OTG
> +       usb-exicen-hog {
> +               gpio-hog;
> +               gpios = <RZT2H_GPIO(2, 4) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "usb_exicen_a";
> +       };
> +#endif
> +
> +       usb_pins: usb-pins {
> +               pinmux = <RZT2H_PORT_PINMUX(2, 2, 0x13)>, /* VBUS */

s/VBUS/VBUSEN/?

> +                        <RZT2H_PORT_PINMUX(2, 3, 0x13)>; /* OVRCUR */
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

