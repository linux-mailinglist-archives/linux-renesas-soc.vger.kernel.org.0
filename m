Return-Path: <linux-renesas-soc+bounces-19075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90566AF6F7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC311C82033
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D8B2E2EF1;
	Thu,  3 Jul 2025 09:56:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD612E266C;
	Thu,  3 Jul 2025 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536618; cv=none; b=sWGEJ/Bmu4PlFVcQFtOHdEIya5fKmFoLpFQ1zldQE7mSvknJ0wd5gEkc7VMbL9kvZnFRstsdis4883ryMGesnn5IwGaYg2198ZMRza2i7HcGm8Q7bj4NzVwSWyh4ByZIP4JUBgcMEcxSFTdmsfoJGbWuif/bSwvpX4EjpewncXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536618; c=relaxed/simple;
	bh=eNDQVSH8v0uC/hwjkbPHcqXX9/2fnwj+diBc34svhKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZttUNgONYOsPFEXO+aCVEk8PMy0ClBo0H/xW+tcUffFvR1Z88mtezwrH2WTpYcUgM23mr2tA2HQnGemNzcfh5/r9Bn+EmYeUseki6nU3ZkZzoXI0bWYLA7qfG/Y0jM5tvoYCNqYAgH48M7bZADCxWRfkfnAONI2LBRvxl+IySU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5314b486207so1699605e0c.2;
        Thu, 03 Jul 2025 02:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536614; x=1752141414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8fCFmqiRtYjx8NxRrvwOc9lKPDy8QiuCPlA93ibkU4=;
        b=Ix7XuhjLsxrLw2AHKCrOjgnKj08lWg0IQ5AiRDrDmMP8pvRDMAJco482uGq1YxpFfH
         e+cjOU5sg5cZt7ozlvcQhZdjkX9QjN+jkkow8+dBgfP11SYvUXTXeZVq1RCyKU+ED1qE
         1A6IeHXpIZMN1mSVQS38LTWdLXxMBI4i69BCOkNEMWVPUOIbEl+wpLH7wL8qbkklV4G1
         MnjhhkwdsQS8fJPEholpP+dKwGv0MTWCx/+TwadkprWN1/9ePenXcMX5Go9y0OIQu8mi
         GBof6+NyWpJuPRY9OoyeWlHlqrLEO0zi+8jW/T5eZfAV2IV8nTrmwixhToX/lEUg8CnI
         FT8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPDdcCwDHLulnnRquA+vVjCE32tycKrtjTKAq0UbzIOQu1/yp5u2sHlqvBwaADyG1E85zlltYH0uMGOszz0x47W4s=@vger.kernel.org, AJvYcCW7ElAt9cSrAsgnwgoPJcA23OGASh9shN3f2cGhNH4NPZNLaAEju0DFEQZ1Zw8k04MDbHvwtBCRQ96QNGwW@vger.kernel.org, AJvYcCXGQgwc6wD2DdNz1V15hnPv8ZAYmBP26mHjVimriklkflyvj2N4bt8FJPGK1oX+t4PLINClMnuj5SFM@vger.kernel.org
X-Gm-Message-State: AOJu0YzfrmmdFDBF/hONswvEDp9ugop0dOdssMIwLqjByjvl55ibkOgO
	3QHx6tP2jDQSmPHrn1DZaGW+5H3MDs2hFLC7VvxAzj/5zsYYkuYjNN1+Cn+A9v5z
X-Gm-Gg: ASbGnctz0xToSEAzGrK8bcRUazV40UR3nO1RJhLROv5Ph36cgeCaree90jhccoiaWnp
	7aEFu1y6JrZuYoHo8Z8aXajIRYPWokTHVokxjo6uyWUTIUfOYhOZrHXcBIvwsi/akLJSjn2xzhQ
	EzG6p6pFmDu944s1PefY6c5AxY9beQHFxzzle0lV+b63Nzmj2KUYnzttUGnVaZGR9VCIeJY4XmQ
	y71eANasdkXDTU/zADmfiqBM7oA+7fJ0HdbAed/GH7d47KaBi6pxltZLMIKUVsP3sGM0ALhvuqK
	dF8D/SGr1IlOgmv9lQ69kzQe4OY4sDu0BKTFPFimAXeAfXhJjDxty28nZMD9U2b9h9BLiwQqRNc
	Ynhh1ANiaFOfflRXPki1RxUix
X-Google-Smtp-Source: AGHT+IHOzpSSPWUwa9G8ZY9dCfLbcfBQ6bG6coj3guRdRNSXdQhjdxHUy3p2ruURVt7S7WOgxD3nww==
X-Received: by 2002:a05:6122:30a1:b0:52f:47de:3700 with SMTP id 71dfb90a1353d-5346677b5b3mr1968399e0c.5.1751536613861;
        Thu, 03 Jul 2025 02:56:53 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53309079316sm2434504e0c.6.2025.07.03.02.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:56:53 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7ade16082so1422115137.1;
        Thu, 03 Jul 2025 02:56:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOfSf53TyAjHHC+RdeW6YARtfHbpvAz8EqVFHuxPAxvLuiGD3JKK9TkZDb5RUORgC4xDTJXR7ANdJS@vger.kernel.org, AJvYcCUcHytCR3UB7ncyzw6H85j6/mjsdJ6d8T5IRgH2U2d+l7w58R46j+aCI//mOkUrKvjRBIkYjESZWqlOu3rU@vger.kernel.org, AJvYcCVVvVaZt/i08dUm2dZ+0TUUUMJ2IRot/un1DPxC2iUxxD8BEWhkaVHWx0lD+HDFxtp/HVrX98f+Lb4brBRD4nr/rRw=@vger.kernel.org
X-Received: by 2002:a05:6102:292c:b0:4eb:f003:a636 with SMTP id
 ada2fe7eead31-4f174707381mr2600388137.0.1751536612823; Thu, 03 Jul 2025
 02:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625153042.159690-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625153042.159690-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 11:56:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuqwo5Q2SuB=GBMLVYr1yNTB0hoOCohV=HeQ09NE32xw@mail.gmail.com>
X-Gm-Features: Ac12FXwDFXpvJZ6kxdhFAuOGQAkK_IU-1R3OV7hX30hnHfp4LknSluCwrqzk5X8
Message-ID: <CAMuHMdUuqwo5Q2SuB=GBMLVYr1yNTB0hoOCohV=HeQ09NE32xw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r9a09g087: Add SDHI nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI1 nodes to RZ/N2H ("R9A09G087") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
>                         interrupt-controller;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@92080000  {
> +                       compatible = "renesas,sdhi-r9a09g087",
> +                                    "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x92080000 0 0x10000>;
> +                       interrupts = <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 1212>,

1112?

> +                                <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
> +                       clock-names = "aclk", "clkh";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi0_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI0-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               sdhi1: mmc@92090000 {
> +                       compatible = "renesas,sdhi-r9a09g087",
> +                                    "renesas,sdhi-r9a09g057";
> +                       reg = <0x0 0x92090000 0 0x10000>;
> +                       interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 1213>,

1113?

> +                                <&cpg CPG_CORE R9A09G087_SDHI_CLKHS>;
> +                       clock-names = "aclk", "clkh";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi1_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               status = "disabled";
> +                       };
> +               };
>         };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

