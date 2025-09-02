Return-Path: <linux-renesas-soc+bounces-21185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535CB401DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B881885B7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279172DAFAC;
	Tue,  2 Sep 2025 13:01:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B5D28489B;
	Tue,  2 Sep 2025 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818090; cv=none; b=WEJT0JzIg6gJk7dDrIodJ6lg7XSuGyATKHu1Z9pooZaqIQBWXgMt4ZvEmYcsvFF3T/a6t8tbUHwFPR+NhpKZKVepFmxZvGZ7410bSU7gqjIAM47dWqqS927HnD8a2DfcxdpzIcAvwqGnT87w4uf6TEb/12HAvauVu2jdaAFCiPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818090; c=relaxed/simple;
	bh=HN+nMcYPoksRrGAHVUWlYcHpXEDY8JS8DIy7EzngbU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luTHjUVnCCvs/NG8jwu627hq8Rvn5CJAVIz5P8X8tGeqM89cv9XQC4BvuOZw0y8WOiYqiGHOJBXaOJv2UvlYQx2Fw40grPzvXcyIGNB0nTBBVl/nVw5QqLKB8LuT4+/pMICDRN4qHmqxBQYmj1Ckt4edTgNxlpIVW1JmpQB+dyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018e97232so1476579241.0;
        Tue, 02 Sep 2025 06:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818087; x=1757422887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ipUT4LuA3Uq+03zAJhzQACV0/Bh2/IfW3yvD+DhtEs=;
        b=KySn/fb/+/FqG7KmglWzA+gLk8+a95u3T3m2/Nj0HK4TsU4Z+jYxbpIi5LTwg/56Pu
         PAVnKJ5SExsiTNV2HI8VAruwPa2WHb2qttptsH7gZ71dnFAjeB9ReuWd3V7ZQPaP1USz
         FPhg5WTDJPF1SYihIxKmS5rWv9ENQvrecOwN+EQ/YVY5zHIjmJKWL+h1AafIu/y8FoEy
         yhTXn2U8HBVentAotlQmFWfMuwbo7a07P9QLsAM60iDXLVT0wkoexgXKROBaF868J8kh
         nWFN6KMbSvwr23U1+tjAGbh++raPFnJZwkXu94XfrZnoFlsCiWPJs8S5Rvx1yy9u9ZTf
         lpmg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSJBwDXvH5ruO+aQKJjzyI6EvJ7Dx1gMQcJ2nYI+GQ/ACOLCbfVa+GQKRH9Qk7QVU4NH3u23E/mpSUpyNKgqD6Yw=@vger.kernel.org, AJvYcCUwtUiL403lbPwQxEPF8BlI6Aq+Jy9tvKrpfTDwjFcqThOZ0aVdjHg/+odjmLuXg3jemrOVOJXMa/J1@vger.kernel.org, AJvYcCX1sUXQ9x1BiOsByD9UWYGWhO5x7Yl2wkDELeKmqT3DlSRrF/8tXm6CwWkOtZHQPRGEuQX92NVIPgzY@vger.kernel.org, AJvYcCXuaVViOAAkSU3U9Chl62MRzR/hNuabYQ2hZ9MuBpaZkd2ZGpnxUeJtiWd3BOR1Hn9W+MoVmYc+ShWBXFG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxhxdcVWZKdIrBkSTJfQpHCQiAoWrDESGm4fE/PO4swYDHNs4gT
	QzUGiMwzf1bi3RIO2oiv27o6anRlm1h5y3iDHUSfi+qONVvKfHT3u5qkGJ1i6LQC
X-Gm-Gg: ASbGncv2tzi7RoSOb0XQUbSl6v2xHPyHRxja21gzuwx32dv7GGEaUT/28Wa/YqRMbA4
	cduq+ZupGbuJ16SqylpsNEi18wAK/Kl4D3/rZDXxLSYclJfGNLcmCS9Y18lFlMst83jOxeT7OeW
	JEkhQM/iZCT+R/SA6CejubM/WQGHNKp+pd/dfaEb07EBx7KIfJb85yMqHXAcnaEKbzpoROYLbuZ
	k75KJlOnO81BVFjWPki+mmc3ZLLZnSsriJKHoZNvwhX9THKapFdtlX3gFnS6FJWSyrjCt0t3iDM
	SFUzb0+0N73xp9uhAxa5I61yUD2a3EXDs6akNgfSpM+WCdnVgkeDPXJK/9+fT7zkLNTCgfWBbr4
	kbmZkl6ILSemu6UnGsqn9H6MPlJbMKySKGHvsm727V0N9t0i4JGGnG5hmYM0egeKddY301kI=
X-Google-Smtp-Source: AGHT+IEDDNim0mhLlvIjVt2siNgv/QtHXeypnRx6Wuqh6seNOZUp3lmNqR4BALbh8w93GzWLWSyerw==
X-Received: by 2002:a05:6102:44c4:20b0:52d:a7d9:b5d2 with SMTP id ada2fe7eead31-52da7e8fcdfmr2486960137.10.1756818086638;
        Tue, 02 Sep 2025 06:01:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89608759c3bsm2344957241.9.2025.09.02.06.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:01:26 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89a079e029bso117995241.1;
        Tue, 02 Sep 2025 06:01:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1LMkaWA4/vInKNFm5ADaCjIgPvK/b0Rslahvn91q6bJSiidsYjZ8lMEhLBkWTny+ZrKYZ7j+I1hNJ@vger.kernel.org, AJvYcCVZmpExeFoMho6P3xhPAbUL1BHpehbka6IKOheKXHkd0JKe/wgQDHxc61g5EU+fz2m91CB/DdAZhCws@vger.kernel.org, AJvYcCVzQmziZHFaR224pqyRyECQvzuOlcxGfXPnGH5WEh5CUd15WiDmuSOmfnBQ7ROnxRsSkAcUxnThGwp8zY8E@vger.kernel.org, AJvYcCXVIKOQPl1IUjQdy9injBkXbZi13AT6F3b3PeE/mLNaMP0rOUpkn4+QSUaVILfCKfPCMGHSzATLyCvzNhue3p+rWVU=@vger.kernel.org
X-Received: by 2002:a05:6102:5127:b0:525:df9e:9365 with SMTP id
 ada2fe7eead31-52b1b4eb9e6mr3639297137.16.1756818084823; Tue, 02 Sep 2025
 06:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250901183000.1357758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250901183000.1357758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Sep 2025 15:01:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWARu=9__pqcHXUq92LYuxAQPZNJ6Fn_b7Z6x78i4twDw@mail.gmail.com>
X-Gm-Features: Ac12FXzZPa2GVjpzvF9yIAcXM1iwq6wK-qbmTfdCcNVih-2ufoqsXBW2Vj2qGg8
Message-ID: <CAMuHMdWARu=9__pqcHXUq92LYuxAQPZNJ6Fn_b7Z6x78i4twDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem
 core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 1 Sept 2025 at 20:30, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
> Ethernet MAC (GMAC), Ethernet Switch (ETHSW).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -72,7 +72,7 @@ enum rzt2h_clk_types {
>
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
> -       LAST_DT_CORE_CLK = R9A09G077_USB_CLK,
> +       LAST_DT_CORE_CLK = R9A09G077_GMAC2_PCLKAH,
>
>         /* External Input Clocks */
>         CLK_EXTAL,
> @@ -166,11 +166,21 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
>                 dtable_1_2),
>         DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
> +       DEF_FIXED("PCLKH", R9A09G077_CLK_PCLKH, CLK_SEL_CLK_PLL1, 4, 1),
>         DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
>         DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
> +       DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
>         DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
>         DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
>         DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
> +       DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
> +       DEF_FIXED("ETCLKB", R9A09G077_ETCLKB, CLK_SEL_CLK_PLL1, 8, 1),
> +       DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
> +       DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
> +       DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> +       DEF_FIXED("GMAC0_PCLKH", R9A09G077_GMAC0_PCLKH, R9A09G077_CLK_PCLKH, 1, 1),
> +       DEF_FIXED("GMAC1_PCLKH", R9A09G077_GMAC1_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),
> +       DEF_FIXED("GMAC2_PCLKH", R9A09G077_GMAC2_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),

Do you need these? I can't seem to find them in the documentation,
so they are not just for aiding the casual reader.  As their
multipliers/dividers are 1/1, you can just use R9A09G077_CLK_PCLKH
resp. R9A09G077_CLK_PCLKAH in the DTS?

>  };
>
>  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
> @@ -181,7 +191,12 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
>         DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
>         DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
>         DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> +       DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
> +       DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),

According to Table 7.13 ("Overview of Clock Generation Circuit
Specifications (Internal Clock)"), ETCLKA is used as the operating
clock for ETHSW?

> +       DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
>         DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
> +       DEF_MOD("gmac1", 416, R9A09G077_CLK_PCLKAM),
> +       DEF_MOD("gmac2", 417, R9A09G077_CLK_PCLKAM),
>         DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
>         DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
>         DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),

The rest LGTM.  But as the full wiring is not clear to me, I guess
I'll have to wait for the DTS...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

