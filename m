Return-Path: <linux-renesas-soc+bounces-23568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA460C04B99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 09:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4C604E8F27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 07:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963FE2DEA71;
	Fri, 24 Oct 2025 07:31:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991782DECA0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291079; cv=none; b=RpuhHtlsvV3BXUMovrOnf1oBJJVqJ0hTzWYuLmB6kJLGF1e1aQr6ir9qxxgwf4Nl0py9p+YMPBGDYfRDgltOtgXYt1GP8YIegwzX6WwG5ecxE5eqyV0qSeoRkD2K4sOAx8DA0IKa0saKvKWjAmXkaF12ljRNa8qttWp4rUb2xsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291079; c=relaxed/simple;
	bh=gUGiB1llxABWmePU3+TscZZyVisC3oSIs+3uF6fFgTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ocfii9poFxCmNbYpzwTmPm3Cl0y8stDSEhjKMrupwl64TCwni4M5xKrRqcN/4a07rMpkhzWTSu+sUZgxCzYLWqqU672HVqgIse0BRLbZ3Fubdbs1BzQ5fq+U0cpJDlULrUwH20ZcnL97Ainlnzck/QPBLvekyHk8Wt29vTfp7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932bc48197bso780605241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 00:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291076; x=1761895876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbjF3fYBru7mg7PwcFMgCH2adsCiWE8jEZcxNXnQxiE=;
        b=QNmrLEFRrI0QCFsM43GYAgKRpJKFCrjEc/ncJV0o80fumJ5Nd5zq+NjbAIEeMGKjXY
         G+4lcPjtKxW+KABVzYizaRJWl3zEz1wyP/lIE8JGMNjfNDrf9u+4G42mQoYr6BC4S4Uu
         LO+Ok/PMWNnS3M38jndym2U2hun0lqkLLdxdJnpv64LRwd/blVaNjHaOWmuwGmQ1CnGh
         AJ9RwMMHjSArgnBt4hULGpWiLCyMHZO+NFkYEInj9wfNdSmZcsA4iO4VzcFMc8n5ruP4
         79buAsCMO7P8Nwc3caAa6IsY07FWfKACG9VXoPBnyIj6xpKQpR8ybfJP9cjLUjs430Lh
         5k9g==
X-Forwarded-Encrypted: i=1; AJvYcCVsuELpFn3hhJYQAgaOBWTHGCnPKtiH/8AcCDA+9UXZUkoGPqzw2c6O0eTTHzzDKi9xh0y7yHq8LJxUTQHkotMCXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzys/VM55h87qDI1TDagwqSRzb0o0J5zPRnezItlRcnvTW/x2Ia
	O00kR9p1pH6fbyu1EExPUo0a++JDsjBG6o9dJqPTgxKR+DcVIJohgsAv4NvSYxco
X-Gm-Gg: ASbGncueA+URZnKPRn57SOrWoQWzQNnWyBndlL/HokFzqPTnWPsV+HONx81OyvlAXt4
	CieThwnJcXZD7t5i58CxmWWn7P44dqa/UvBYIOsuJXD6fFLHHFNsSK+UmZFEZSGhm82Eqr99rEJ
	RKd19zLD1jxIab/vKk9cAl6yD2QMQhGAVUzEVmpAfcleUCK/+z4viIVc+rK4sh9M5xcxRiE1aEW
	zkK3I31QT5RRVXtL58xhbdCUWMQhzuzycYVWlYIcfVYPlLvog4s1y0ZqNi00QuTS79JwHw/j7yA
	KoV0PkwlJ7a3Ioj8zJErK+VmZYenGAnVflQhzU9ficVRG7NnuG6TW2ezHOEduxkyWaEMzbWTwVN
	tJ2RcbAvuhlWX+fuUrT1Vwf5GRsoqXwS3p+QScuPHsXhrBmFiJo14Ydl/eYsJ+RknpFc6g2mQPb
	zibuBVIr/xg15eh1fP/OE150XNabrtib58g77LNw==
X-Google-Smtp-Source: AGHT+IHtVA+0DuWwFZ68RqXrYSB6bl40FRTeC6LV6zDsgL/lI2UtgGXRZXdUWVUNahm0AK8uuGBoKg==
X-Received: by 2002:a05:6102:374b:b0:5db:3552:6de9 with SMTP id ada2fe7eead31-5db35527593mr1381314137.43.1761291076162;
        Fri, 24 Oct 2025 00:31:16 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934abaae96asm1768914241.8.2025.10.24.00.31.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:31:15 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db2d2030bbso753229137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 00:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+ub5XK9RZkSky82f1r66Zyrf0lBg05kHUpkR59MRlpZftUK8AMEuGAFfjvjjsIIDF6pZ3XraHwk6sISeMTRv4ug==@vger.kernel.org
X-Received: by 2002:a05:6102:c08:b0:5db:2b3c:eb9e with SMTP id
 ada2fe7eead31-5db2b3cf1b1mr2162722137.37.1761291075525; Fri, 24 Oct 2025
 00:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022235903.1091453-1-chris.brandt@renesas.com> <20251022235903.1091453-2-chris.brandt@renesas.com>
In-Reply-To: <20251022235903.1091453-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
X-Gm-Features: AWmQ_bl2d7bwxn3o_AI0y5I2A2WSBvgxEYlOh2d7MohygC2Sb449e6tQyb1BgRI
Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Thu, 23 Oct 2025 at 01:59, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)'

Thanks for the update!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -16,6 +16,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};
> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -32,4 +37,10 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev    NULL
>  #define cpg_mssr_detach_dev    NULL
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +#else
> +#define rzg2l_cpg_dsi_div_set_divider  NULL

static inline void rzg2l_cpg_dsi_div_set_divider(int divider, int target) { }

For cpg_mssr_attach_dev and friends, NULL is suitable because these
are only used to populate function pointers.

> +#endif

Blank line please.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

