Return-Path: <linux-renesas-soc+bounces-12434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DCFA1AB67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 21:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463E4188EE5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 20:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D661C5F1F;
	Thu, 23 Jan 2025 20:29:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27391B424B;
	Thu, 23 Jan 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664168; cv=none; b=uih7ZrwQnZYGw5rTdkWM9miB+R0ClnXxUzs0GtCkjmLg6WKhJ/4filedmWYL3blqbLCluYiOP0n8RSp8l22uHicGYREDEvfyQrTNvZojnvKtipW29X2v4YA1UoVU9IEWwCvE9c1w5JkiAgZ48KAdqq6lMfYlEPJ1MgpHEzvpA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664168; c=relaxed/simple;
	bh=pnwh62on35oF9nCa2yi0bKTQ8+BApmfGta6a4WMK9Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2qTMOyyWocvLQmFWdjh0bX4TTUD7lSvN/aHjWoT6o2fiwIHNybWPvl02Fysv6xtafRDLH3tXw6LmUjHPcUe9vWi57p51FyOBsd0fmoScvIvoPWIoZN9l+Ugp/BUKGj+/SKlwUdaO1ThUCDtOZ7VRYrpRzFT+kdTD9Wm3h5k0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51cee9d5013so826621e0c.3;
        Thu, 23 Jan 2025 12:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664164; x=1738268964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd1TkqSq28vmFyt5g4A7LX87fPOL7pqaSEPxXJnJuPk=;
        b=OxAegnkpxGAg8bDFnQgzYVCeYbR9PYu9w3mBC38V7TuUXTYXG2zWqF1Y7aHTuo87el
         8i6rJqdv67fa+CTSsHMz+p0AxlIG6vyeZ6XCfBppcw0+qhptAI687O+tuA22KU+YFRbR
         YJhfTOYBxa33BXA0cdmAxrGjOsJ3ClbBMSn12zA001243YWb+jWWNJBfrHzIBQKH6dKG
         O1uvcho67gZIMlyZTbPYmLeVsyNZ3ITZpEEEUs/wdhzSuHu36Eb09HyILj4xRLVcnsdi
         QVoIirZ9W5nRloa9SVd5wQcB/FGG9MEt/PK+JLD9xHg1XrAfi04Dh9fb+pTRH8xOJals
         cxGg==
X-Forwarded-Encrypted: i=1; AJvYcCU2xmFhR2FkDEF6DgMNvDljnjgdKGOejG5h8zh3hjeVeq+zN+gb5nogF10i2up41scT7CEK3WOeFOA=@vger.kernel.org, AJvYcCUssFhZ3SzqjOIZ9UqfP+/NshXdLsO+4PLo2Uv/CXa+aqRD1DHUuEzdZSGRWIpfvlY12zLR8jm692PoHE2t@vger.kernel.org, AJvYcCWpoNhlIEWTRFinZghzIngx5+47tLFIexs5N3xzVd0ofkM0MAi6Z6B4IaOGcSUdLaEPaWgmwrLB@vger.kernel.org, AJvYcCXqEO1Q6nLHaCqpzTI+D2MvfCPZeiLzIyt59kjCtZKOysZ+YoaJ9ZPaCpEWFvHD+aeEanF2bk7mwtYYJomNYNIjUTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33J8V9dwd463nTgNYgcfDSuCR8c/QXSsDuZcm4UA9vOItDtKu
	u5OT1ebNkJeBWu17gFEtr0maWJ06QLgBi9xZ3bfXDCnB3H4tbBfzeQqCmGsi
X-Gm-Gg: ASbGncv2WYaaHf+k0aMe/CisyxlgbbYiLVR8Nycv8muIooCEAiBI/E5DpaUZzmG2cBw
	dn4wTrvkGaE1oO8KYwnj9RgCUAtNkv68MHcAhg93NvQXLgrTMyZFAzdElCDadR5qDk8c420/uph
	mp5vyFiOw9vtu2L3wbdA6kb9MDqPw1UHOJAUb8t3kICL71Ig7IL9EYbMvPSIhX8UW8m40XXojkw
	x95r8J+Oquz+00z3JQz6e361HXFBLmJc8iuVB+wguXWIvuyT6aG1In9nEP0b7QaF+kxgzOmGOEf
	s1TNooUSkc3JkzUWqw50fkLKSTDYloIeJDf3uC97m+ihNWQ=
X-Google-Smtp-Source: AGHT+IF0JpaP7SycLmVKkQh1KNy+m9jRLyyph1u4m940IjB+Y+5hMfRDVxoUPPhCjVaAHFbdqZOfpA==
X-Received: by 2002:a05:6122:2105:b0:51b:8949:c9a8 with SMTP id 71dfb90a1353d-51d5b33f5d8mr24670094e0c.9.1737664163943;
        Thu, 23 Jan 2025 12:29:23 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebea36esm115107e0c.41.2025.01.23.12.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:29:23 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso796124e0c.2;
        Thu, 23 Jan 2025 12:29:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/YCHJICbnZ0HqxdBKHzMfvT4tehptGEzafgzr03dlaaDX+Al7PR4RAPGvnFgU9bTLFCHuT5ntkhA=@vger.kernel.org, AJvYcCUuecueWimRVO1oMpyRXI2rSuYMTQJOKty1+ZfVgjOM+bbgNbM/yCrMLWyy6lI/BpCsvWIcocD6wRBRSowH+Wa63UU=@vger.kernel.org, AJvYcCXVzzKnF7QS5Zq/rpqPLAaqnoe8s9pGPjcwsVVgoi0wr7A6ORbdaOdmmpDeu2wp1Q9IgCSNFzrM@vger.kernel.org, AJvYcCXmeQxGgIfyXCHczOkLqlPUf0ZWdV1TgJ1OwNhHiTOS+sZ3iVk5g70jzKBSi9xtF0thHhNl/J8u0ypmAOdi@vger.kernel.org
X-Received: by 2002:a05:6102:2ad0:b0:4af:597b:ef with SMTP id
 ada2fe7eead31-4b690bb51d3mr23979878137.8.1737664163332; Thu, 23 Jan 2025
 12:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122100828.395091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250122100828.395091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 21:29:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP8LrqAYK7sPJqiB+Fagk=CrhSwX1CixKOxoiGgyDEoQ@mail.gmail.com>
X-Gm-Features: AWEUYZnkzUSG80PrWtV5m7mXIgljPubn8AIQbb5HVVIJvBFGHO3N8MKYLmuYOUM
Message-ID: <CAMuHMdVP8LrqAYK7sPJqiB+Fagk=CrhSwX1CixKOxoiGgyDEoQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g043: Fix HP clock source for RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Wed, Jan 22, 2025 at 11:08=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> According to the Rev.1.20 hardware manual for the RZ/Five SoC, the clock
> source for HP is derived from PLL6 divided by 2. This patch corrects the
> implementation by configuring HP as a fixed clock source instead of a MUX=
.
>
> The `CPG_PL6_ETH_SSEL` register, which is available on the RZ/G2UL SoC, i=
s
> not present on the RZ/Five SoC, necessitating this change.

While the register is not documented to exist, it reads back the same
default value as on RZ/G2UL, selecting the right parent that does exist.

> Fixes: 95d48d270305ad2c ("clk: renesas: r9a07g043: Add support for RZ/Fiv=
e SoC")
> Cc: stable@vger.kernel.org
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> @@ -138,7 +138,11 @@ static const struct cpg_core_clk r9a07g043_core_clks=
[] __initconst =3D {
>         DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dtabl=
e_1_32),
>         DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
>         DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
> +#ifdef CONFIG_ARM64
>         DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),

When building with W=3D1 on non-ARM64:

    error: =E2=80=98sel_pll6_2=E2=80=99 defined but not used

so sel_pll6_2 [] needs to be protected by an #ifdef too (or __maybe_unused,
but the rest of the file uses __ifdef).

> +#else

The rest of the file uses:

    #endif
    #ifdef CONFIG_RISCV

instead of #else, so please use the same construct for consistency.

> +       DEF_FIXED("HP", R9A07G043_CLK_HP, CLK_PLL6_250, 1, 1),
> +#endif
>         DEF_FIXED("SPI0", R9A07G043_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
>         DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
>         DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, se=
l_sdhi,

The actual change LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

