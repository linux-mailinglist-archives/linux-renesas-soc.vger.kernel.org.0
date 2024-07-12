Return-Path: <linux-renesas-soc+bounces-7292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8C92F9CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 14:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380DC2810E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 12:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1F915ECF8;
	Fri, 12 Jul 2024 12:00:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492638DCC;
	Fri, 12 Jul 2024 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785648; cv=none; b=lwlm2R9GsYe54DdFVuVYyMg8UQqQepZvX9GZKAQYhcDyNUbkdAFwLj7qFXBl3WFTdzK2RfvZNeRwVgvK7JuZUSZTS8G9Ml/vSpyttBJgBPEj/W0K11YWYiuakh5I4H7oFDcoUig3WbV1iHUT7hGyscoUHzTyHPNmpwgkWqLGVrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785648; c=relaxed/simple;
	bh=In64+BK1f95T8kQ3bF8ZWFRLmfrggmOQVRLQ1JlCY38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzV99z3ltveFtgnywDk5eb7aU3+zFwbGWwQavIeucP2qJf9JuPYBuo1lXF5/PEx464nhml1PzGvscxfwPJWcYL+fExcUE9IN2M1ZcEgTJ3rqesoryW/CHC/8s6dEeCCj3aIaT8puhKYwFHo4I2fPcJXJkr7drJhBhh2pmyAwgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b417e1511so18983707b3.3;
        Fri, 12 Jul 2024 05:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720785645; x=1721390445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4Wd774CAaehOrbdx8VCAr7EdqZrXN0YFUIfMg8Pkdk=;
        b=YMPu2q3I8B/RvUCL82jHV6MgX1EAVwaVCdNa2K6l4YaaX9xFtuHnVaf34ZftVWxb28
         PFtHvBM1/s635gDO4tKgY1HbSjxQUYjg5kr0X5Zj1+Xi69MzWAYvcDAdMkb7TWHDq+5N
         519DKDX0/Miz+rLxmSJUlCCLJWA18+ESal7OsuYTHElEPCZMGn8GqXTWe31d/MWdHZyJ
         B/tOUH33xpEJDjPEZWDuiBxjgTEHq774xWU0RKUN/EN7jC/d9LnGoGH1G2otKc4LrXf1
         yRoc+P5/gEWs5Mg+pEKu/s7UyjP7kEAH8ICxrELWDHhFTq9mABy2EwNiwpMPZ49n6txe
         j8FA==
X-Forwarded-Encrypted: i=1; AJvYcCVHXwey8llu/WOCzkI7DDwSUkwbNMD+eAy3gKbHH5CTTevDI/D2SeOLOG9DWIdJMVPm2iB+IPxiNxiHJ3/egkfA1o4WLuN4lKWkQpJBHmg1MBRlgKyDnai3ikKWtlC0ktth95tXcgCehDV52vFSdvPZvw14QczWcs8SK/dmZ5/xlgJC4sC0Tue4sjnDG8l1003zYR+D9OTi/C5XHwe7vqUxS+LgBPb7
X-Gm-Message-State: AOJu0YzicLG6lzta/NaskiCTltIITnK2vYFE8q04Pj+sWkfMesZnz+bp
	g1c6aEmELIN/8psRn/WTZFAKMRS16Lxeye49eLsqmEvTjMVAisAPBANcuMZA
X-Google-Smtp-Source: AGHT+IHhpLR3kvHemArCQTx3acNRJmito+FVEQ8fbnMfIQfCV8IxM0kzewzCcqSH75hJXTSijSm5pg==
X-Received: by 2002:a05:690c:6c84:b0:651:79ee:d14b with SMTP id 00721157ae682-658ef24bc7fmr133580527b3.29.1720785615423;
        Fri, 12 Jul 2024 05:00:15 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e6ad81f4sm14722237b3.122.2024.07.12.05.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 05:00:14 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-65240d22f7cso17599367b3.0;
        Fri, 12 Jul 2024 05:00:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvkrjfV0d1QpRa8i2d9mJkRXfcMiuWeOfzbYNJOstwNv8LEg2EnSNLv/5qC8d5A5c2TfREJl3DXvwh1+BBQDkGnFQD5N8yuR7yOCyVxZRaBbY6vLoESEhKaeqENeUJXQ/BSD2NO+TKj5eNtlMGR+I77n5T0wwSZ7k/zan3tke+CiTz+zu9+eBfwY5tUP32735fvzFQ1iz7xlcN69v1Bpusi79iz9gl
X-Received: by 2002:a81:84d0:0:b0:64a:3d7c:2782 with SMTP id
 00721157ae682-658f02f4b2dmr123670157b3.41.1720785614119; Fri, 12 Jul 2024
 05:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240627161315.98143-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240627161315.98143-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 14:00:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Pyy=5-N9nUZZSOnnpGf2Kp3miDMM5H3b+ah2QUUMtA@mail.gmail.com>
Message-ID: <CAMuHMdV5Pyy=5-N9nUZZSOnnpGf2Kp3miDMM5H3b+ah2QUUMtA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RZ/V2H(P) CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Added CLK_PLLDTY
> - Added core clocks sys_0_pclk and iotop_0_shclk
> - Dropped r9a09g057_crit_mod_clks

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> +static const struct cpg_core_clk r9a09g057_core_clks[] __initconst =3D {
> +       /* External Clock Inputs */
> +       DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
> +       DEF_INPUT("rtxin", CLK_RTXIN),
> +       DEF_INPUT("qextal", CLK_QEXTAL),
> +
> +       /* PLL Clocks */
> +       DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
> +       DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
> +       DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
> +
> +       /* Internal Core Clocks */
> +       DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16=
),
> +

Missing comment "/* Core Clocks */"?

> +       DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
> +       DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_D=
IV16, 1, 1),
> +};
> +
> +static const struct rzv2h_mod_clk r9a09g057_mod_clks[] =3D {

__initconst

> +       DEF_MOD("scif_0_clk_pck",               CLK_PLLCM33_DIV16, 8, 15,=
 4, 15),
> +};
> +
> +static const struct rzv2h_reset r9a09g057_resets[] =3D {
> +       DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
> +};
>
> +const struct rzv2h_cpg_info r9a09g057_cpg_info =3D {

With my suggested changes to [2/3], these two can be __initconst, too.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

