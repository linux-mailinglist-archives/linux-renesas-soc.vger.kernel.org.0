Return-Path: <linux-renesas-soc+bounces-19073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C7AF6F2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 11:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B551E1C4145F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FBC2DFF13;
	Thu,  3 Jul 2025 09:51:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE792BD591;
	Thu,  3 Jul 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536262; cv=none; b=SXrzrgHzbQWv1279EHOGd+JKl7S2A00hnBuA9M7JOP1b6JwiWBkYHT6F3bGLI+72TbgyYSY/q0SucSma1VCV65cR5Uc6e3TPG2BLQvu/zjDN/7WQQWcFIXAZWDq32255TsfUghVgayMyzDiBgAD+mTHtNzuEs6kZEMSzwcs2yDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536262; c=relaxed/simple;
	bh=hG8K1aWvudNlPwAN883pKE3U+4Z+u61tte9vHKVgy4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVW7Ea/tdYdJWAwJfXnPHiVeXi6nvTZu3skuVwZ2N8LZDxxi+X3I/YYjK3SzuCrnXbVoNEaNhEuWJsLlhI1lYCQEbaZsoF5zGJPbmoC5OOyRAoTXV1w7eJWpAhEOkxKL78oDou3axI0iD6PE99geAcDeU4kZm+zP7qtKAKV+4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so1504237241.1;
        Thu, 03 Jul 2025 02:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751536259; x=1752141059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqd8yGqNLo9cuGqviDpXd5FpjhJYhFTdtFhMPVsQm4U=;
        b=PBcoS4KTeCPS69Q5WSRao82An7Ii4Ytd0iRCEor2Yg7wGb+pHguLLLtNhlsG7JYvcc
         ce1w0E8Le6A+G2RXqrKnDbxwWd9MmyaK7T7vFyPrEwm5fIK5q1KIy9azGG+VRPS0/FFt
         NKUOHptQ5LdZo7/yJADwvc0tZjANdxnIu7hH4l49UeS7Z0QxOj1UyvvzUFrAyPcLtPzP
         LNFqEQC58+qRoZFXeDRePQjrf0Fsnijsr1PlJ7L8SUvVj3j6dS+Q3fHZB3zBZScL1M9X
         pJ4twZBKljuwreAkGWHe4AP9cHfFF4qp73/hGhmpCFGrGSCxIVLtkMSyuatXeZcU0HQ1
         yfTA==
X-Forwarded-Encrypted: i=1; AJvYcCVo5c0OTZvuSdOEcHSCnpFwregy5LMTos0hV+uF40yfXZidvMBC1izMvY5GU3uPI5+TfQJhkw5rH5Dz@vger.kernel.org, AJvYcCW62zE3e66MLLa030PLhedn+rrTaMhznw828iq9aLMlcCcTKnKRP2v6aao8WeXS7waaAW+iBrAfokTmMuxioNbUg5o=@vger.kernel.org, AJvYcCWWjkAR0QnZMD3AO3g87txl81cSkTLlGllUxrx60+oCCvHVoqYnBjnjl2y3s3U9/5AXFUeQ8aIRZY/hkObc@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNaJ+2KxbXtOYbvqvsgtQuUMb/CbXXubS16voVOnVg9Hi6Vx3
	u5vnONTigolmrvi3l4F8obrTXuibTbCllPjp9/5hh68u+TTNVDMDp7a+ZDSbwXQV
X-Gm-Gg: ASbGncuqGLSzzyrYAinRaHRztFo0UiHBC0pdbfvpREVhaEy8b/vBcT1oLLFFpZJRVij
	I044pytCSglCYXfLiU9QzAqb5dOf6QyEhisIG899x2tn/gGYbQOvZXMobweJviTWuhscBY7Bu/V
	fbkYk+isadVnKLeGveGdoUjgXNE+ObDhNk+0zxfcxhyfnJ2jQ/K4IaRO6GFNGrDbOBaZ9S8HDc5
	FjkD5gHI6d0hhs0vyUiVo1g9oOXXXATgBpiJ9SqIt6gi11UdBpomLDHmxg8hFQTEu3vbvvabBLP
	dv5BOtJ29C/sLxvDlC/Tnx7A10sMPSVteB5e9a8mrU+8gtO4ecb7uymDJHDbHvt3dPJSg9KrgEo
	FJWkc8oQ/qfArp762C5ghaNZZ
X-Google-Smtp-Source: AGHT+IE7pJeV6/5U5pfkFvyC1Itlb26db2mr7L8RWDfGgaa8xV9iSuoj6D4PhU808nF5kvbaUXZqDA==
X-Received: by 2002:a05:6102:4485:b0:4e9:add0:2828 with SMTP id ada2fe7eead31-4f1745a09camr2312949137.1.1751536258721;
        Thu, 03 Jul 2025 02:50:58 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c7ec2cfsm2084553137.7.2025.07.03.02.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:50:58 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so3092065137.1;
        Thu, 03 Jul 2025 02:50:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgvlUGzoKqVxTLNay+afg7ztqIsOMlIZZ/jcCRD2dzUIpL+kSS9Bek/0Q0YbXlVqyv6wmE9Dba+EWe@vger.kernel.org, AJvYcCVwmrYp5Y5Hs1XjzhmwEnMcaE6LS/fSZun8ry5XDnWYuYoLqdOIPYHJUyGu64YqWztOwFJqRFiVVEmRb5+U@vger.kernel.org, AJvYcCW2Non3VUnTyLcFAGdgVmkzAYLpWrreMLu6N86okZOeyViQ4pqk5VT9X9Y4O9alZtUlQKhVLofnllfQCqbCtpIqUsY=@vger.kernel.org
X-Received: by 2002:a05:6102:160d:b0:4eb:2eac:aaa0 with SMTP id
 ada2fe7eead31-4f17479d53fmr2481310137.19.1751536258137; Thu, 03 Jul 2025
 02:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625153042.159690-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625153042.159690-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Jul 2025 11:50:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=9q8qw69BtErOQ-=qojBEppUZWbRdAzikCNg+pbnC4w@mail.gmail.com>
X-Gm-Features: Ac12FXyFMmL_1m6_QnACLMWn2MDSc5_v8PXHpaccbRsEvJ4pd5SOniBUZ93DUFw
Message-ID: <CAMuHMdV=9q8qw69BtErOQ-=qojBEppUZWbRdAzikCNg+pbnC4w@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a09g087: Add I2C controller nodes
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
> The Renesas RZ/N2H ("R9A09G087") SoC includes three I2C (RIIC) channels.
> Adds the device tree nodes for all three I2C controllers to RZ/N2H
> SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -90,6 +90,51 @@ sci0: serial@80005000 {
>                         status = "disabled";
>                 };
>
> +               i2c0: i2c@80088000 {
> +                       compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
> +                       reg = <0 0x80088000 0 0x400>;
> +                       interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 100>;
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               i2c1: i2c@80088004 {

80088400

> +                       compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
> +                       reg = <0 0x80088400 0 0x400>;
> +                       interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 101>;
> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
> +               i2c2: i2c@81008000 {
> +                       compatible = "renesas,riic-r9a09g087", "renesas,riic-r9a09g077";
> +                       reg = <0 0x81008000 0 0x400>;
> +                       interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "eei", "rxi", "txi", "tei";
> +                       clocks = <&cpg CPG_MOD 501>;

601

> +                       power-domains = <&cpg>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +
>                 cpg: clock-controller@80280000 {
>                         compatible = "renesas,r9a09g087-cpg-mssr";
>                         reg = <0 0x80280000 0 0x1000>,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

