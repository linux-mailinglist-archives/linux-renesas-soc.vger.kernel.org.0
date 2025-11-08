Return-Path: <linux-renesas-soc+bounces-24360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BADDDC4297C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 09:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4850C18880B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Nov 2025 08:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034542DECB2;
	Sat,  8 Nov 2025 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA8LpOsK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2412927F015
	for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Nov 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762590847; cv=none; b=ENOvgdklNagjb0+NaM9NdXzvkJ5lrcGIZ//adATKlLs+lFt3en411OpVoLh/yO1sB4tz8zhpSIbmruARbOaggO4SaSBNFjln4RcCt28DD/mdTT8RQLcan4wdcR3FAVuTma+5IJFR8JvnrEjz6USDOAiRfVBB+4zHmX4gXr6lCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762590847; c=relaxed/simple;
	bh=HnNwRPXSXIr3vPDeNssiY+D+lEiNX4tnPtl5uSUQBAU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Pz0JhTa7xi5TuV6tnMxlKPFHqkMNsU7qJtVlIE08c0MmoNTWeccyw3751lJFFg4EzUE5IROnV043+JIBJ9c46un9ojRnBwaMEufeGb/7TgnoEsXfCTwaak0K7DIDenKSvIPP033SNyqEh1QBEseuB8V9ytev9JU0eHxnmg3JOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA8LpOsK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-641458f71ffso2273506a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 08 Nov 2025 00:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762590844; x=1763195644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
        b=hA8LpOsKe/gvz4kYfgxkwVMkNzYfJMY/xcOQxvHuOQAR6qJPTDRcbY7K5Bd0ef4ctH
         amSYwBozQikGXBDEVQTQQeT9PtM9lt+SVO2A3UMiHsiVDT2IylhEhjmxQPEkjXP1mDTt
         I23uK/RtiqC1Vm11L466ObJWVcbP/5B52Skq4dxYhQFR+5QOACjTo/WSbflr4RfVo7FT
         bKjKclVC+qXAF6uOZyK5Sn8x2LZrEAD3Dxna46ZzFOxJm+Hnnkh8wpOmrioNrrQOrtmk
         8ryPLtf3rN2B0GZ+RVXZ4jgTTL4z4pw6ZJW/iNi5knqrxFWEzTkLYWkF26Ms6MqJrI8T
         kr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762590844; x=1763195644;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2bAn/z92LSkt2g9/ex7wXFtatjYpsStSn9cf/zplSc=;
        b=P3PvS7c6ZMTtV10XXC4G6QBq2hZCxLAeXi0KQ82FqCHLdn9uffan9q3S5jDRAqCMmz
         iGq76hQFiNp7oh6gCiw1cAQRtt3/C0zFphwmYFpHVPj47fDJ332C1b7NlXZfXXUNF2ay
         y1lFF0RDI+LjOQ3SzN1hJr3wlG9j/uh+sIZP8u5piadcpcG/91FIiI8mR/I+PHH8D4dt
         SU4+8hsvJJuf0hZReY5WcaMCaDRA2JoXeKEm7g5kRkpGKwVu9Fb5m4A5WETJpSF59PYk
         xVHWAtENhD23naWew8467k31UCwV1O4lciT+CG3n5xF7u1EVcdHRCOwlj2tMhg8fDrKN
         QNsg==
X-Forwarded-Encrypted: i=1; AJvYcCXlZkl2t8PmrKbTknUCD7wkXhX3qpimtlikrhp71QbJpnmwnU7ZUFav0bKB95pD/ENN1ZMjJWChjRGpOahspz0kuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5r+D6XNqN/Zttu/HE5jdOsjFC6pSfR2FI4eNK7b9RuwALGG8F
	wYoOI7io4FKjKNBpuPhWun7X3fke1uVdR0xT33c0LUusVJ9/11BcfGEeOsrzmyEOaaxqSqTpJvz
	3roYi/CDO5oWDTiHyWztZJA7XQhIQYa0=
X-Gm-Gg: ASbGncu8VrePsV1S0t45ide7UigikChaxDbYB0EJvW+wNnV10dYBAfyfw2CYC4znrNC
	RfH3meFlLf0fb6L5yktT5FimH8pEhurEb1tjS2aWJVtSmJGQz/uVwAwrq1rEsx1e+iOrPJnLtVA
	5SIiTYdc5v1WenwM4U73hgatuU7Ry9kq9KaPF2GalHcnUxXVcKKATn/ZiitJk5fVJuoiTm6o851
	DIlcqkI1Rn3PTWUh0CqBkSf0wLUOTDJNZn0ZrAVflFNOvlyoup9kxePZTdYYQ==
X-Google-Smtp-Source: AGHT+IFbr8D70I5Hh0mnS7XVwXHbLqUGTeP+fYZpSbGy0noG5yKzFl2DcNr86SrLZ7RYVuNvP7KnNxLcSVBXZ7AYddg=
X-Received: by 2002:a17:907:2daa:b0:b46:6718:3f30 with SMTP id
 a640c23a62f3a-b72e04c75bcmr186480266b.51.1762590844332; Sat, 08 Nov 2025
 00:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Biju Das <biju.das.au@gmail.com>
Date: Sat, 8 Nov 2025 08:33:53 +0000
X-Gm-Features: AWmQ_bmFChOZ2gWu0OVmeSTfILZt9gLDEULm0nND2RwOlaUkwhuiTXJouqHTspM
Message-ID: <CADT+UeB9_as1=Prxsx+DWJLCrdH=tGG9OfW4_5foXzte=6f=Ug@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: "chris.brandt@renesas.com" <chris.brandt@renesas.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>, 
	"biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"hien.huynh.px@renesas.com" <hien.huynh.px@renesas.com>, "hugo@hugovil.com" <hugo@hugovil.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"nghia.vo.zn@renesas.com" <nghia.vo.zn@renesas.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Wed,  5 Nov 2025 17:25:29 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
>
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
> - Added Reviewed-by and Tested-by (Biju)
>
> v3->v4:
> - Changed <,> to <=,>=  (Hugo)
> - Removed duplicate code bock (copy/paste mistake) (Hugo)
> - Fix dummy for rzg2l_cpg_dsi_div_set_divider when CONFIG_CLK_RZG2L=n (Geert)
> - Remove comment "Below conditions must be set.." (Hugo)
> - Remove +1,-1 from pl5_intin comparison math (kernel test robot)
> - Remove default register settings (PLL5_xxx_DEF) because makes no sense
> - If any calcualtion error, print a message and return a rate of 0
> - Rename global var "dsi_div_ab" to "dsi_div_ab_desired"
> - Check the range of hsclk
> - The correct clock parent is determined by if the divider is even/odd
> - Add in all the restrictions from DIV A,B from the hardware manual
> - No more need to be a recursive function
> - DPI settings must have DSI_DIV_B be '0' (divide 1/1)
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 147 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |  12 +++
>  2 files changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 07909e80bae2..1a552ea1c535 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,17 @@
>  #define MSTOP_OFF(conf)          FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)      FIELD_GET(GENMASK(15, 0), (conf))
>

>

> +       if (dsi_div_target == PLL5_TARGET_DPI) {
> +               /* Fixed settings for DPI */
> +             priv->mux_dsi_div_params.clksrc = 0;
> +             priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +         priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +             dsi_div_ab_desired = 8;                   /* (1 << a) * (b + 1) */
This block is duplicated may be add a helper function(), if you are
planning to send another series.
> +       }

> +      /* Default settings for DPI */
> +  priv->mux_dsi_div_params.clksrc = 0;
> +  priv->mux_dsi_div_params.dsi_div_a = 3; /* Divided by 8 */
> +      priv->mux_dsi_div_params.dsi_div_b = 0; /* Divided by 1 */
> +  dsi_div_ab_desired = 8;                        /* (1 << a) * (b + 1) */
>

Cheers,
Biju

