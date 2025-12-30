Return-Path: <linux-renesas-soc+bounces-26215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F1CEAD74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 00:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6B3F30559D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 23:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26371330337;
	Tue, 30 Dec 2025 23:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlDyMz8b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB62E7180
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135776; cv=none; b=gurIWwoRLPSk6NIokMMOVqi16kjBLSq6y6W9vmggJqHvKd6o3jTa6+BoQdvaCstUofVbWlBjVhh2GUYnUHZTEQeeQ63LdZslrn1otKvUHBFziSGEXiU7VkvVU/ThbqlUeCqI3TlprQkVTAy7VqMNcyxaPIrexe9h2Qu3G1TwOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135776; c=relaxed/simple;
	bh=DwgcHJTsdtuweFiGkDIuevI8OrioEheTVFTwW+4LULI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYetCHFgyX26NAlZjPbOZHxg0ttNqboZ3TdyDEt18Kw70RoAyv6u1GUGFTt+vm2hfjjKpf4JlQKDhfpbgh8SnNnbKwNrt+xahFbS6E/PxND3yP5WsRmqHbWsVC/q3NVuD95RDfiJ/khnMd1QIRqKhxvw5sBQMPLJatshnHmzVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlDyMz8b; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso26530325e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 15:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767135771; x=1767740571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0lEzxvu1Nqm7D2jQWg12ivsnM74PDBIKxJJ29viKyQ=;
        b=RlDyMz8bcXb4We4imZXROkX+fA2PXsZM4oHOlCJeQdPnkh67F1aadFbkcWiKyjXIEu
         tEmIOY8fMeFMNDmJ7LTadt1jwl3byp/VFs+ssAJmZOGdGKI8g5czItCtaODiOrRO8k1R
         0jNrzN/2WkfQmKcnOjRy8h5bEQlOs5vpIJ50oyNybCBFRfiKfNCTGHwe/KkFa+JbXg5X
         3p+2DVTo4cW8kq/vGt55HvG1ZeX9iCY7BkE7Xc2h5a3qeD+ge/dDUkPziS4N9NeTpP2G
         VQJPoJWmhvnojt4EvSlsDVl0V+XTVFamxqcwbgEgk0tYDmHZkGUd1DjAuActRoY5H5Eh
         1HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135771; x=1767740571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0lEzxvu1Nqm7D2jQWg12ivsnM74PDBIKxJJ29viKyQ=;
        b=cQNkx3jCKY0bUapsTjzFsj8Q+8Javf0qwVcgp0E5/R5Y9LNIrRDsIzOJM2zhNgxsoW
         UZOlNgdCrqMVg+njcMWeK2snkVuCpHGqNU3+NEjtBcQgWrhT2BjYOIb2hpCfEE0zczBv
         kCXNs5alutf6vV4vuv/EhqcO2yqo9bO3Jjhdfph9s18ZkyJTspbXuNDaAN01oj/kViXz
         FXl8L+kwzH161QVaQotQYloFmeIwlJFHxKUJG9oEZ9p1YpRhy/CEgDQhZOUZrp6ajtr8
         towM5vSOmEHzYZtqQA5eHwSSSp1z9zuMdKb75qdzAeIjkr3Tjo4d+bTycfTYHh9LjNYh
         oGYg==
X-Forwarded-Encrypted: i=1; AJvYcCXuBCzNQzANMW7x+ZD8HMpWBY4EZVMGuG8cezo8ImLWUaLPZ+ROmfM4yuXnC5KvXmPNeCh4mY3fbMmSlrULmHFM0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/B4GCsvoIfEgXi2IUVPLb9eI3TkwCchHtunGovFF9tvtz5qS
	Wy0L0cYi/FKJ6ew48Hqni6US8+BeVNBwh5ZeXk+wEKjAFeRoHO/5hzZa
X-Gm-Gg: AY/fxX4PPEQmbNMndcKlRLkKYdB1E+R2NPyCh5YXzIhYrBR5IgKfM/0XF9RkV8qjaoY
	T9CpMQNzwMLTiTxHTy3rrtpEa0GmhREf6LkBqg+k88g6gMavBbffuRChPn+Sklpn0kkcE5oUr8J
	KJqHZXiUcNapiXEDC7fAXmTJAYCzo4GbE7UyqKThV8NpuOGpO8NGRFuC7Xmx1MhH/6QOtlLFHUN
	SeD6RYkOxwGA6VGLKA9oA2nIvBbkHGYETWY3OOaQ7FEVD+dcfrRHl1OYyswXLT+m3Z8bM5VOHCV
	UtNfoHutYpH+zBWw5gVX8h8uOKuxs30A9epsXCNZW+w4XY6hiujmgV8AmquZoqwWFzvCQlfEUvX
	flDoXWOWf/usi2XIS4LHGCzfEOcndKc6ahAOdgVIqdHEFxhSwCd5g3kIAF0qHMVkv/OpwA9pVoa
	3rQf+KSmbGyuBjnJtotYAnEhlT15zVyvd8UHyMiu6RCo1ikTsF7+2f
X-Google-Smtp-Source: AGHT+IFNIz9fMiQU+sEbhrSBFjx7o0t/N6ZX/ns67CaymYXLxNfejMXOiLk6TzCcG4/T/Xh5ziYWIA==
X-Received: by 2002:a05:600c:8b0c:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-47d19555796mr393557875e9.9.1767135770800;
        Tue, 30 Dec 2025 15:02:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm72592513f8f.17.2025.12.30.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:02:50 -0800 (PST)
Date: Tue, 30 Dec 2025 23:02:49 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <20251230230249.7767dd92@pumpkin>
In-Reply-To: <84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>
References: <202512051834.bESvhDiG-lkp@intel.com>
	<84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 03:47:17 +0100
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 12/5/25 11:16 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
> > commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> > date:   5 weeks ago
> > config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/config)
> > compiler: arc-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from <command-line>:
> >     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':  
> >>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field  
> 
> [...]
> 
> >     rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
> >        vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> >                   ^~~~~~~~~~~~~~~  
> I don't think this condition can occur.

The value of vclk_divider makes no difference.
The compiler has generated a code path where a constant is passed to
FIELD_PREP().

At a guess 'arc' doesn't have a definition for __ffs(x) so the compiler
builtin in used (I've forgotten its name), but that probably has looks like:
#define __ffs(x) (__builtin_ffs(x) - 1)
where (effectively):
#define __builtin_ffs(x) (!x ? 0 : 1 + count_trailing_zeros(x))
That ?: condition ends up in the code and gcc moves the FIELD_PREP()
into it (gcc likes optimising arithmetic on constants).
So you end up with FIELD_PREP(mask, -1) - and hence the error.

> 
> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
> - rcar_mipi_dsi_startup() calls rcar_mipi_dsi_parameters_calc() which is 
> the only site that assigns setup_info.vclk_divider this way:
> 
>   415         switch (dsi->info->model) {
>   416         case RCAR_DSI_V3U:
>   417         default:
>   418                 setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>   419                 break;
>   420
>   421         case RCAR_DSI_V4H:
>   422                 setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>   423                 break;
>   424         }
> 
> In case of V3U, vclk_divider is 1 << (0..3) .
> In case of V4H, vclk_divider is 1 << (1..8) .
> 
> In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
> - rcar_mipi_dsi_startup() later contains the offending code:
> 
>   653         switch (dsi->info->model) {
>   654         case RCAR_DSI_V3U:
>   655         default:
>   656                 vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
>   657                 break;
>   658
>   659         case RCAR_DSI_V4H:
>   660                 vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>   661                 break;
>   662         }
> 
> This does the reverse of the code that assigned the value above, so:
> 
> In case of V3U, field value is (0..3) .
> In case of V4H, field value is (0..7) .
> 
> Finally in drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h :
> 
> 256 #define VCLKSET_DIV_V3U_MASK            GENMASK_U32(5, 4)
> 257 #define VCLKSET_DIV_V3U(n) FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
> 258 #define VCLKSET_DIV_V4H_MASK            GENMASK_U32(6, 4)
> 259 #define VCLKSET_DIV_V4H(n) FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
> 
> The masks fit exactly. For V3U the mask is 2-bit, or V4H the mask is 3-bit .

The only other use I can see is:
			fout = div64_u64(fout, setup_info->vclk_divider);

ISTM that there is an unnecessary '1 << n' and __ffs().
Perhaps you should be saving the 'bit number' not the shifted value.
The div64_u64() is then just a >> and fine on 32bit systems.

	David

> 
> ...
> 
> I can however rewrite the code in this way, which should also mitigate 
> this warning. Do you think this makes the code any better ?
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c 
> b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed7..20e2a4cae5b86 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -84,7 +84,6 @@ struct dsi_setup_info {
>   	unsigned long fout;
>   	u16 m;
>   	u16 n;
> -	u16 vclk_divider;
>   	const struct dsi_clk_config *clkset;
>   };
> 
> @@ -338,7 +337,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct 
> rcar_mipi_dsi *dsi,
>   static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>   				   unsigned long fin_rate,
>   				   unsigned long fout_target,
> -				   struct dsi_setup_info *setup_info)
> +				   struct dsi_setup_info *setup_info,
> +				   u16 vclk_divider)
>   {
>   	unsigned int best_err = -1;
>   	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> @@ -391,6 +391,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
> rcar_mipi_dsi *dsi,
>   	unsigned long fin_rate;
>   	unsigned int i;
>   	unsigned int err;
> +	u16 vclk_divider;
> 
>   	/*
>   	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> @@ -415,15 +416,15 @@ static void rcar_mipi_dsi_parameters_calc(struct 
> rcar_mipi_dsi *dsi,
>   	switch (dsi->info->model) {
>   	case RCAR_DSI_V3U:
>   	default:
> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +		vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>   		break;
> 
>   	case RCAR_DSI_V4H:
> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +		vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>   		break;
>   	}
> 
> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, 
> vclk_divider);
> 
>   	/* Find hsfreqrange */
>   	setup_info->hsfreq = setup_info->fout * 2;
> @@ -439,7 +440,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
> rcar_mipi_dsi *dsi,
>   	dev_dbg(dsi->dev,
>   		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error 
> %d.%02u%%)\n",
>   		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
> -		setup_info->vclk_divider, setup_info->fout, fout_target,
> +		vclk_divider, setup_info->fout, fout_target,
>   		err / 100, err % 100);
> 
>   	dev_dbg(dsi->dev,
> @@ -653,11 +654,11 @@ static int rcar_mipi_dsi_startup(struct 
> rcar_mipi_dsi *dsi,
>   	switch (dsi->info->model) {
>   	case RCAR_DSI_V3U:
>   	default:
> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
> +		vclkset |= VCLKSET_DIV_V3U((clk_cfg->vco_cntrl >> 4) & 0x3);
>   		break;
> 
>   	case RCAR_DSI_V4H:
> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> +		vclkset |= VCLKSET_DIV_V4H((clk_cfg->vco_cntrl >> 3) & 0x7);
>   		break;
>   	}
> 


