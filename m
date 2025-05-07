Return-Path: <linux-renesas-soc+bounces-16769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61706AAE775
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28504643DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A7D28C2B0;
	Wed,  7 May 2025 17:10:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE231B422A;
	Wed,  7 May 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637851; cv=none; b=Ov5BSS0IxUoHhhWCGVt293LaAAwp6pb/4wTPhb/UjEemmfeKWXJknEXvCGve9awtB1xKRcNxYvYsb4T4YJQxGZqMXFpsNDS8Z3njCmKpZJTneb6CSmAbDfM2xawqtpXonG6zHLDcWxSAG60urjxvCCuHEMxCIdJA+Cek5yfZe10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637851; c=relaxed/simple;
	bh=GdybVPW58nHttNnn67p5Dw8Vt/zoJoYf8sjIoyBMutE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaVvhf/LBkN+b7BGBR/b28rccIllrGBt/b0rkNWrYDFvoP1TLGCUVFStOevlLQHf7lVTtj39CM468GF+jhECyHo7nP8/E5hyoybGLLG5jNbXIkfJerrDqmReKLex63ynOfnP9wI8wiYhyCZ06tURalO/QxqxUItrHVm0f3NQBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4ce8aa3113aso31468137.3;
        Wed, 07 May 2025 10:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637847; x=1747242647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6BzKJWX3OTXa7VM0gHk5m0nv8wWWmh2GA+fJcCItkM=;
        b=Mrcn6vA7QHhZ1m00+f37LZ4g+nk/EcIwnNC34gVDu/6g5p3yw7JV1TuQ8ZlRxzMDm4
         oV7S+KMu2jdpoV6ea6tgVO5jYyUz5Pke73j699URuwxi2KH0pt61YvYw2czsf/b01g6L
         6RYrExXYQ1hxZGKn5RwEOMoIG0cYuZuBI2jw95yn3FtNAr63YtJUdJIXv1r4kvxBgULX
         goUcx7p2m5pFEWck/Iojzkom8icZSB92TIOsio7hSrhhLxVwzYuSuq+CXvz+MwyaHgp2
         2eQniciwzyr1HDPUNtVtc6iGXZKV8eqiGSCAvdPA9N8+n6SS8nmKLr8EleDuVKH8RBZF
         VpSw==
X-Forwarded-Encrypted: i=1; AJvYcCV25Cd+iRKkzuE2upLHEXo5HL52KhRJhur6HWyvG5c9UeP0MaoP9a4BBngT09CzdBy4IlUc6jy778eg@vger.kernel.org, AJvYcCVVZrvS17K0eeBgy9zmsn0g5AFkiP2ft5se8Dm/O7+Mhnb5hxYIoyRobuc6Ai4423NcVZBTQS46jukTFb6w/J7CUvc=@vger.kernel.org, AJvYcCWkIoBA2MG3aIz0LJtHNXKsV08IhdJruff+kJ6eqEAo3E0Fs1wjCXYK7m8Pp4nsKNRS+LshyUWLNS86@vger.kernel.org, AJvYcCWwf1lnLmZWNf76gqulWQrVjTlwMjl737JfSq5t8Pmg1tqi3RNz82dcUAJ12uvhe/SVjKcLOZEQS8uqsoqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+BbeYny+SJRCGH6sbGrWAFYRUF6pE+oEuwBZdgO8Vsv56PSc
	/PB1T76lr7sSEYRtueGVUrsnX8+8ubSuiz6/OFwajUR5h/TnNqjHF2agzARY
X-Gm-Gg: ASbGnctWzTeGOtBvL1C7qGtyCfyuyB+4aYQIp7n0dVfoWwYk44FBKyTjqsOExGLCLoY
	Asn4yqcu+KuLF9sz15IvQKIYjSGbYFW1qGNgKUHzZHiWFPvA1sfvDo9Giw1o0PtwzVystDxD1DP
	X6qKmDzXT2hj/yW+dVpJrYADTUeW/Iq+3oHXd+vwXwyFEjWOs3o/MJBO8Fxsx7KWGMgyg+Lk2Z0
	TOdXKrbd+NpKggMMTdrLB6M9kuMTsUL/wsHVgEybC6BM1KFO+hSGPK12TcQh20UPPdyCRrOTpKV
	t1QB5yEZOnRqm/3aeGkATxLJTituwXrhJ2vD4bAoQ5B1UQMZuPMb60RphkD4SyWTDjGcISnMzmk
	swWU=
X-Google-Smtp-Source: AGHT+IF4XQnFDpryUyUxKHSd8nFgnv74mJpWqBi5fNrfYem1Mn2hoXW0oYA40WC9rrT53ivpNfOgIQ==
X-Received: by 2002:a05:6102:5f02:b0:4da:d874:d30d with SMTP id ada2fe7eead31-4ddad09406amr249937137.17.1746637847397;
        Wed, 07 May 2025 10:10:47 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780af50ec4sm2230162241.0.2025.05.07.10.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:10:47 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-879e8e2237dso51441241.0;
        Wed, 07 May 2025 10:10:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJLkjrJFclZZmVj+xT6qtig0DlK0v9BAUlyEpzgSXKf6v6kajsVSlLOgGUFQEZLx74bhuWj7GwxT56@vger.kernel.org, AJvYcCV5c+OZFiTJ6hdhOz7Tx7Kid+QLjboQKiD/S/Q1DDzzro177gtGKGYHjBFMGgsmc2wEw5vS/D4aYh0ElAYg@vger.kernel.org, AJvYcCXJT16mpwsbtd3Bci8QnKniXTH3zuxTKrFoHGdq3D7Jjl2clwV8qnramJz4ormhSm+q+iVI6F/Nf5FT@vger.kernel.org, AJvYcCXme2XPZFngeCgItDVVq4PgBxOUjQmUpJbXGeqxf/ZeZ1HqVsI4MLY9ScP5OgxECIFVBd28qqLq1MG3/Cgad6pWslA=@vger.kernel.org
X-Received: by 2002:a67:e704:0:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4ddacfcbee5mr428862137.15.1746637847030; Wed, 07 May 2025
 10:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 19:10:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpy=89g0=-U4E4Kg=M_gS96RP26xDj_mUp=Lb1sjOHMg@mail.gmail.com>
X-Gm-Features: ATxdqUESjN3wxYT2D9YZnj32scz4-tPbBJdl0WBAykKaKzN-N28EwVRRrUAF1yI
Message-ID: <CAMuHMdVpy=89g0=-U4E4Kg=M_gS96RP26xDj_mUp=Lb1sjOHMg@mail.gmail.com>
Subject: Re: [PATCH 4/7] clk: renesas: r9a08g045: Drop power domain instantiation
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain instantiations.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -192,59 +192,105 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
>  };
>
>  static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {

> +       DEF_MOD("dmac_aclk",            R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0,
> +                                       MSTOP(BUS_REG1, BIT(2))),
> +       DEF_MOD("dmac_pclk",            R9A08G045_DMAC_PCLK, CLK_P3_DIV2, 0x52c, 1,
> +                                       MSTOP(BUS_REG1, BIT(3))),

The documentation is not very clear about the mapping to the 4 MSTOP
bits related to DMA. Can you enlighten me?

> @@ -294,78 +340,6 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
>  };
>
> -static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
> -       /* Keep always-on domain on the first position for proper domains registration. */
> -       DEF_PD("always-on",     R9A08G045_PD_ALWAYS_ON,
> -                               DEF_REG_CONF(0, 0),
> -                               GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
> -       DEF_PD("gic",           R9A08G045_PD_GIC,
> -                               DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
> -                               GENPD_FLAG_ALWAYS_ON),
> -       DEF_PD("ia55",          R9A08G045_PD_IA55,
> -                               DEF_REG_CONF(CPG_BUS_PERI_CPU_MSTOP, BIT(13)),
> -                               GENPD_FLAG_ALWAYS_ON),
> -       DEF_PD("dmac",          R9A08G045_PD_DMAC,
> -                               DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
> -                               GENPD_FLAG_ALWAYS_ON),

[...]

> -       DEF_PD("rtc",           R9A08G045_PD_RTC,
> -                               DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7)), 0),

These MSTOP bits are no longer controlled. Is that intentional?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

