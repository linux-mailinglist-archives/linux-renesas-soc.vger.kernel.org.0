Return-Path: <linux-renesas-soc+bounces-18776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210EAE9D1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 14:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743FF3B9229
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39B52517AA;
	Thu, 26 Jun 2025 12:01:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD327815D;
	Thu, 26 Jun 2025 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939306; cv=none; b=WBqqHPnkCTz7k+9zZsuQUp3sJNfn+oteaTbfC+H1h1LU0RrtHBDSGpw3nPT5tcteDYsCbqpv7SWS2QIMJEpeRtzYFCYh1D9gmAwzUj2/x3uiOWKvhJmufBd9lbGSh5caWiMoOgVa2Pl/2L5q+qAFrsso33SkYBIloRrj/8/hjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939306; c=relaxed/simple;
	bh=ccTV9NggQKAjyM9bPmK/gvP/ZB7aG0OIyHo3E+Z/Pdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpp6gSJboVXhp6LUPYu0DENRc78VSKgONQV9ooRisjb8IGYF3s6iLPDCxFotxsrt75bprFYiWBBSHmKJyUveDYRz25SGBy8JWRMOEK3n/FQ7q60BKbRb4SM39rfU1XlKYtpneu3vbZ3kMqEgca7eL231zQNC02TN5gkj6zICJbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fad3400ea3so8974496d6.0;
        Thu, 26 Jun 2025 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939301; x=1751544101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9i4SKmaIffANqlW0D6lxspqaOtmcTJXmduEkrd8XVLE=;
        b=EXiPQstOQNImXbNQHhI4A9auaGvVVcZobZr0siGkC/GMuBcYz4Ymz5E9JHaOQNd5Z0
         fhLQyJLlm5xqqWK3jhkeA2BmFy9yXOnOEYx3YKG1F7EjVPJzRr7J9KMnMc/w/TynEZgn
         T5pGiKfa2cKLQqdro1QRl6u2Q4yx/3s4yTvTe0t1bo6EjppPJ5Y2QHaqYdt7AWYl/Vv1
         EnbrtksLUOsP+XluERR7aLCaOhVn9sxcrh/lw8deAn3qWHdZUEP3c1rovnT4zTx7NKLo
         m9IUaGLz9+Kwi6GLrSkbqyk917bIkOn7Jawh5BbAfotg8tJmb5Cu5I06+CIXaedGOrV0
         a8IA==
X-Forwarded-Encrypted: i=1; AJvYcCWdBYb79x5+cyMqq9rx4mBgSiVQY1/1fdmZYOs0Xh5cvXZsOfmRTL1GMZCHqCC8PwYEUuigm0LNfGjW@vger.kernel.org, AJvYcCWkxHNqmdNZ3twy4nFCUjbhQ3WXH0NpT7tL6p1EHYM7Scs7jTyGvrrB1tWrx2GIc3ibC/6pBQHrboZwh4Wy@vger.kernel.org, AJvYcCXbh1+00xrR2S+91eSWtOY+IDGyxQ9GKyCdTm2ElMVg2fQI3gvo4nmDYLhXyaq7OIEtn/hHvCQyFACIELOAfqLlONk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9gbz1XFOICr0YkhaS3VT/lnFZ0EGpSu8zJ6DCVLwIfQCqJ72
	2ZFaN00f7ONRQY36+uX84j5Y35BlXxIVXkKPxfXGSneDuTFq8i1ELC68MEBNpyin
X-Gm-Gg: ASbGnctQenGZ6YwJzeHzCfdq3hXaOj+hmInkcqmnWKLB7zk6pkKkIAnmAmg2xUozJO4
	4fO0yoq/3wPttvVYBZFjAzylxe2jZmV2qJ8imD0k2SCRRJBsHxcQ1qywVpYhPVwskCGloVuEhSl
	ewT01Gi+TxyybjMZs5CHuqAj1T8vbwZ8EY0+WnG+ZgZ8Gl1GcWd3bRDPsXDxOo/+WX/k46izlyP
	EDm00I0mll2reZrL//+2LheREC8UyYwp3iMehVpT/wFOVgPpFPqV6lh8gKfS0cSHrKPCNgWeg42
	NtExgjh23Q5yOg4jgoWsljD4asfGcE/HGxPlUlDJBbuzApDRDTOptYat+odI+hNFhJSqAqt0+C9
	P+63lCgj7s7grJPMszwt2oqL55wp2
X-Google-Smtp-Source: AGHT+IH8F6T3pSt4b8Iz2Cd+gpXCdkjmY7sPGojh10558iCx8zJK4Br6lshcz/1GXywHHfRgpJK7Tw==
X-Received: by 2002:a05:6214:19ce:b0:6f9:201a:c05d with SMTP id 6a1803df08f44-6fd5efc90e6mr92198706d6.33.1750939300318;
        Thu, 26 Jun 2025 05:01:40 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a5782sm709391585a.26.2025.06.26.05.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 05:01:40 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d3f192a64eso84978185a.2;
        Thu, 26 Jun 2025 05:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTxD/xTVBv5FERV6dWqOBCQWN8Z1gVYxuaHyssUf+/qVLQPKdqPv1xGtnKiRg1bzK1NsBI9LaQzepV@vger.kernel.org, AJvYcCXVGzoUWoDUeoO5zA+NT2pdmx2DnSQUzgGBwqZFloFpicUy/M2SO73Qq75RYNfdi3t3k+xa80EozcRn+AUo@vger.kernel.org, AJvYcCXY2MPI0q+zAWuVfdR7xynDQ2r+DDDj6GyE3umTArMnYt5vekQUgTwNN2CXi+/uIfwhJiwm3LlMOFod3SauI37PbFU=@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:4e5:9867:14fb with SMTP id
 ada2fe7eead31-4ecc76b6d4cmr5243277137.24.1750939288180; Thu, 26 Jun 2025
 05:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250620121045.56114-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250620121045.56114-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 14:01:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKBwL2OOLMajVp35BfbKA7PXLP4tER9OE_LKM=VjPq8A@mail.gmail.com>
X-Gm-Features: Ac12FXzZ6yod9dodFBSBqO2RJbcMejU3LoEJnqqQrw9WQiGXb2I_hA9FF1sQjdk
Message-ID: <CAMuHMdXKBwL2OOLMajVp35BfbKA7PXLP4tER9OE_LKM=VjPq8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays
 for RZ/V2H EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 20 Jun 2025 at 14:10, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce device tree overlays to support the eMMC (RTK0EF0186B02000BJ)
> and microSD (RTK0EF0186B01000BJ) sub-boards via the CN15 connector on the
> RZ/V2H EVK. These overlays make use of shared DTSI fragments
> (`rzv2-evk-cn15-emmc-common.dtsi` and `rzv2-evk-cn15-sd-common.dtsi`)
> that encapsulate common CN15-specific configurations, including pinctrl
> settings, SDHI0 setup, and required regulators.
>
> Additionally, the base board DTS is updated to define an `mmc0` alias
> pointing to `&sdhi0`, and to add a fixed 1.8V regulator node (`reg_1p8v`)
> intended for use by the optional eMMC sub-board and, in the future, the
> ADV7535 HDMI encoder (not yet enabled in the DTS).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree overlay for the RZ/V2H EVK with the eMMC sub-board
> + * (RTK0EF0186802000BJ) connected to the CN15 connector.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#define RZV2H_PA               10
> +#define EMMC_GPIO(port, pin)   RZG2L_GPIO(RZV2H_P##port, pin)
> +
> +#include "rzv2-evk-cn15-emmc-common.dtsi"
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso
> new file mode 100644
> index 000000000000..47cb581c1add
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree overlay for the RZ/V2H EVK with the SD sub-board
> + * (RTK0EF0186B01000BJ) connected to the CN15 connector.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#define RZV2H_PA               10
> +#define SD_GPIO(port, pin)     RZG2L_GPIO(RZV2H_P##port, pin)
> +#define SD_PORT_PINMUX(b, p, f)        RZG2L_PORT_PINMUX(RZV2H_P##b, p, f)
> +
> +#include "rzv2-evk-cn15-sd-common.dtsi"

These two generate the exact same .dtbo as for RZ/V2N.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 01b2e0c7c7db..219347d73753 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -25,6 +25,7 @@ aliases {
>                 i2c6 = &i2c6;
>                 i2c7 = &i2c7;
>                 i2c8 = &i2c8;
> +               mmc0 = &sdhi0;

Please move to the (common) .dtso in patch 1.

>                 mmc1 = &sdhi1;
>                 serial0 = &scif;
>         };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

