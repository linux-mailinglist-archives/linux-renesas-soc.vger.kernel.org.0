Return-Path: <linux-renesas-soc+bounces-14074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19867A54BA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373CC3AA7B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBD920CCD2;
	Thu,  6 Mar 2025 13:11:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2420B80B;
	Thu,  6 Mar 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266697; cv=none; b=kTBpBhkWglcoQgYH7yXF8/0P3Kpy77FOi8Yu/QbmHv75NJjBuQheoZQPgiL7vUbd9Hb5gPSvDkNCoLIJdEpqeqoHkH0mHSg1W6J6WxuvFYm3LHBFqPkP1ANYJJ7BvvIsgV3Gf6F6MWA+B+0ojfqniXX39EiE/Vz80iBNDyFhRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266697; c=relaxed/simple;
	bh=dRlm/a0D4kSZUE2cc0CdWRwz+YlcaHXsHWagbpDoCqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTM/WL1ajSEiJMzoiw/I/be5Fc2Z60vRqbM0jpelNX9SiNjMc7xhU7PtcG0OsMJSi4u62ghAdr6RlbOHHVDHjafIGw4ItsUgadi09tTxTgJZtte69z0i7r8e+4PbJAFqVlL0MnSd6B+wz7HTsfyIklob5ldQ6rJcwvZaS+ATurI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0e135e953so60351985a.2;
        Thu, 06 Mar 2025 05:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266693; x=1741871493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPiHpN04cRTMOdXMK76w+uvEzeoLMRWkyD4DypyWh/A=;
        b=iSkyXqfqTQS6lFPl7mG7QjV9joij0liZu/+GAsHsXB3HPut5XitttgPkwS/qMD/F9G
         nvfWZ6u+YOxnT3SmTbknMTvrpuM5hKaOtpRCKYvFNIvQJCsnrCvD+aUK1gSfnL3a7R/f
         3w5nv7veBmPDwt6k0i4mQPSJXxXVTeWPQtQs/TPfyhK1Y34UvcOIk5Jll/VttTTU6NNE
         tsQCh7yyuVilcjOpw9p438gDcw2jGLA5A8mljKIsWJFn1FUuIUXm/6N3sYAA194Y+7TH
         y9g0ZgyCpOtqmdLDqCjeKhvTDcu+Z3svS18OrqC60HqYIIxkcPJJ7LWi7HXEOKMCqAmL
         w2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVvczJX1MXiYEiJispCPCdqVeug3JdhATkuQ31DKiF7gLIe3Xzgj/DL9ap1YbKU4HgaFw3mFHEFpHHIbDc@vger.kernel.org, AJvYcCW8nXV4FujYZWulkMChupFvybDZQRubco/FCZt73oNCBkTPRTYovWBcLYR5LbArAnwUEqWzsXEHzYARk1YVdbXq3qM=@vger.kernel.org, AJvYcCWU+rd+6LbfEe1NTK/3FVIuC2xEMmMnfEaVjiL/gawox6n50pPqhh1oIXctSaiI77a8HGxSFKND@vger.kernel.org, AJvYcCXhlW3I5h/hwCaRxf4pDZlyxCT1QbalW3YfrJmYprv8k+M0O53xHadAANO070Lb1JZwky58PnCAJ8Z+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzofljd6P/pprU19KkbLYnDXU/8sJKls65U8pKO+gd1LJvGRJao
	TrQ6aHF+uSKVXzAmXEC07xpOIn1D/6Y2wfHBekJadpWMc0vEJib5kKh26FPD
X-Gm-Gg: ASbGnctaVYQmkTaWhY8oU68NpClnpo088dlAJswdXB3z2aQ4WcxBlM0gdRPkjSO6eUu
	FsJ5PkTe877FsGbjgCHJYpG6pZ/jh//7prt8+DUat01hc1r0zMr8E+g2No6dYC0Tf0W+tWvR+yu
	pb/y1ZB5EJNJ/mI1pJXRrPWGL56sLmIuuaRgYGM4ud/+pB/TiLg6hhH8oTdEwF2x/OwMJryNmdP
	wQ3YWyYOtlwCC7n2EMhdYM9BhAdzqh7c08kM43SV22pTwzO2gJ5qW2JinES9Y1zvIGjO9M38krU
	zDxDyIOoZoGAjzt8mVJaq4yBsqrOeicM66Rld2I/xbV21sjZ1yHOdg+3Cjhf+jtBnkuabaSfT8a
	uZFQjWPs=
X-Google-Smtp-Source: AGHT+IGA0GTYfX576MPrdqnHBlogSbW8SR1edIWkOXKogDfOZQ6pkY1+USZcuGd+loTgkgECL7a8ig==
X-Received: by 2002:a05:620a:269f:b0:7c3:c88d:18c1 with SMTP id af79cd13be357-7c3d8e66f9bmr1030108385a.20.1741266693511;
        Thu, 06 Mar 2025 05:11:33 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e551102csm88766085a.101.2025.03.06.05.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:11:33 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd1962a75bso4025606d6.3;
        Thu, 06 Mar 2025 05:11:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2MYLlw7ibN328iY5WGHKJTJpB+zWFNru5IAPIHmM21e7jrvkYc0WDyJj94OTsIPEt4UA8RvHeJfrf@vger.kernel.org, AJvYcCUdqSgErJufchJQecfeWd7YjxtB7WXDRI70ZyBgPSKkH0h9o4Uhd/lqZWXzTM3s72r9lMaqAzZBv/v7q5lqv9xY0gc=@vger.kernel.org, AJvYcCUhF4j3BVecZX9BHCqBAvWCxFIYHsbcqke8PbFjK3281XKv02uN0ELyGzeVBGapm2nyAZZZ3+SwLjBVLPIa@vger.kernel.org, AJvYcCWtxKQ8KqjsI7hZKAscaiWJe0wF8x42oNcJ4tCmlRoYj+hVnSQmTfvAPqOAbP7ocdb23ouWw7j5@vger.kernel.org
X-Received: by 2002:a05:6214:5002:b0:6e8:ddf6:d122 with SMTP id
 6a1803df08f44-6e8e6cffefdmr107547366d6.3.1741266692832; Thu, 06 Mar 2025
 05:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 14:11:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-JwWQfU_hOXY5d_YEzGkyEV-VzFYhrCBFhYtTGEOh1Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jo9HIe02gzNttfvx4VNon6UEuLOlgjv2g1CM1n3RdjpdbNeDlaqNVgo36U
Message-ID: <CAMuHMdX-JwWQfU_hOXY5d_YEzGkyEV-VzFYhrCBFhYtTGEOh1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Sun, 2 Mar 2025 at 19:18, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Renesas RZ/V2H(P) SoC is equipped with Synopsys DesignWare Ethernet
> Quality-of-Service IP block version 5.20. This commit adds DWMAC glue
> layer for the Renesas GBETH found on the RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

A few early comments...

> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>           This selects the Qualcomm ETHQOS glue layer support for the
>           stmmac device driver.
>
> +config DWMAC_RENESAS_GBETH
> +       tristate "Renesas RZ/V2H(P) GBETH support"
> +       default ARCH_RENESAS

This auto-enables DWMAC_RENESAS_GBETH when building a kernel for e.g
RZ/N1D, which uses stmmac with DWMAC_RZN1.  So I'll have to disable
this explicitly in shmobile_defconfig.  This is not a big issue,
we already have similar constructs (DRM_RCAR_USE_MIPI_DSI defaults to
DRM_RCAR_DU, but is not used on R-Car Gen1/2).

> +       depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +       help
> +         Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +         RZ/V2H(P) SoCs.
> +
> +         This selects the Renesas RZ/V2H(P) Soc specific glue layer support
> +         for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>         tristate "Rockchip dwmac support"
>         default ARCH_ROCKCHIP

> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

> +static const char *const renesas_gbeth_clks[] __initconst = {

WARNING: modpost: vmlinux: section mismatch in reference:
renesas_gbeth_probe+0x1e0 (section: .text) -> renesas_gbeth_clks
(section: .init.rodata)

Please drop the __initconst.

> +       "rx", "rx-180", "tx-180",
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

