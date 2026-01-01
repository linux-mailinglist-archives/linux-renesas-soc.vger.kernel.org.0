Return-Path: <linux-renesas-soc+bounces-26234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19FCED0A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 14:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 503BD3000B15
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 13:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793D91DE4E1;
	Thu,  1 Jan 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV9Hze8g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ACB1CAA6C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jan 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767273591; cv=none; b=p57XO9n/Mlfeoeour69KrcqTlhx522K99lP8b1ccEz/bG2ZaBeTQPVsTLm7dhxeWoGXVKepkxVrPsoSnk7GofT1e/66Q8EWBbqWLmMahHbj679M1V6/D09wLcJw949iVbP2FaqvOxBNLlEwrmgCXzTn31ZI5LctS9WTRruZe1q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767273591; c=relaxed/simple;
	bh=dVZt8duGE7EZQRhwiuTLG91GNT45dYdHRTkXu6RRQA0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jz0JZ01umfLSnGaWjCZEpiT/bQE3N76DtYzvkAVoj2UVkFJSv7Jfl0Y7kBUxiS0bpiH6WmvQDpLLpCQw8l2s0LLklW3UWWnjKPsHngUub8Alr4KwfSidenfNSrWdEKxPm6DnGEcB0LuTtA1dTmTSe4FWnKf3uvDr03Hp73Ux/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV9Hze8g; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so2006661466b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jan 2026 05:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767273588; x=1767878388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYFcWOoKq+KBoqMm8CjRRZHSPMnEotpFNX6puxiVQPQ=;
        b=UV9Hze8g9Ag6u3SGH+UKH5mZ8w0AtZKo1bfUEgrKqfBmrMQx2L/PQrTk9EewidZZeb
         wRXfgdjdCMwYR1N9bhaL8zt+lyxo5KWT+jFM4YUwNCJ/zbOYOZVNb9PjcLAVbh4lgo0q
         izkkrpX+QoFS3rJNkIR8WSM9TIjBjBUVwQ2ca13nauoKdzSKhYiIqrW2fvdDVQDi3qWr
         t6S6YVT31rHRP6c7KAmT79sfnTQFI+uiaTt1fFAl2216lUg+4/VT/BUZZZGNfYym4JDq
         2SFnd+KSSj+w0AbKjpEu1gRWIjgS0DESUDWirVjqVV+UHiBqAompiZJNoixcbvpZs5Wx
         bEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767273588; x=1767878388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYFcWOoKq+KBoqMm8CjRRZHSPMnEotpFNX6puxiVQPQ=;
        b=UWWXNQRbAOsFv05DR5E4mATTa/4/hHDgtxIi2h3/GVMkiR7csonzETpvD7XG+1GmEx
         O7Qfx1PNIAGdN1Bk7WqnnO+SMnLJ3rOeTqAjCIK/gQ7jpp8dBUMOa6TN3Rezazc2+cD3
         S0VDSR6zQBCNSql1MS2EiNA1UMGicGVaT6De83DDIxNkmJ70Z96L79jjIqQVTMek9r0t
         Daw9rVdsU1SmOv1bhzR82Y8jdexuv3HVhRR7TcM5sncuC1+UxZj7WY1NsQx/xyjqvFZX
         JGfp+6OpghYJ18by5dOSepE9m3ALnq4G6pj+qnUCs4fXjwwB7HCHft+sOCsSRit7OC+j
         X9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXNDg2jHYdItmvaIHB1WLoVBBg0KC4/BmSVqqX9/BT4jsA5UM6oZ6ENl93PZJU6kjhN+guCaLnkM6uobYzoF69Zzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzO/XDmf2XkOdMznpEdaMkOZT4jTIXrEZ9WitPdyZnmTnHSmDX
	Ttn5tnkW4d0Sdfa96eY7Gj4g0f1sDzMzzYNqKKqKNx3YiKzFD5avaGDltaBwhQ==
X-Gm-Gg: AY/fxX4i9r9Fnfj1kAOb6KCa29O/U9k9DBAsCUf9WjFIT8VZ5m1QG7uVG+3GsoLkt/6
	kyWgGpixOiBAGDEvHj5zg/A+QHn1zgm5fgYwGJPbZvVeIUSdhUQ1mzv/f+NZLUIf/zc/Tqbc7er
	Mwt8hwFJSJ17xWCN7xZQ6IagJCSUdCZh6B0SQMd8Kc5Kja6eTrG4OvbtGmtWcYi4am4Jhh5AkJ2
	KHqb+Vhy5rlBeqhoMl2s5wGQFROOUrb2lSmvLfJp2N2rVrKcYinBbWeUu37492nkIf8GI6X79PI
	mKvxLXUD1PTTz1Di+QYzgE6rBPH+hdfTxl3RAzQgZrzB0p4YJ8K4LMKEAB9Y81g3Fc+931TsC3o
	8Lg0HIy3krV99MdwXeKRDyuVBRIuk5bTaW0prtHX/6CB6LEQ5XvFfogJKZXkypIbrwo4jLn+962
	U8VBjUo+SX2IyjrlonlZ5R6FnJ+/VkZePyogopHGefY15TB+s1ZvS1
X-Google-Smtp-Source: AGHT+IHSjWs9CYZhcvdj5cVVkaLc3zVulfavOSCCOSt0EHKf4IbpPpsINQxiuTLxCgXpJTSjqhF04w==
X-Received: by 2002:a05:600c:350b:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47d1958ef07mr422127645e9.29.1767267743033;
        Thu, 01 Jan 2026 03:42:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19362345sm691419225e9.6.2026.01.01.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 03:42:22 -0800 (PST)
Date: Thu, 1 Jan 2026 11:42:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Message-ID: <20260101114221.6a401790@pumpkin>
In-Reply-To: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 15:56:10 +0100
Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:

> Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
> in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
> is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
> in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
> is passed to __ffs() to calculate back the divider out of the value again.
> 
> Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
> function and call the function from both rcar_mipi_dsi_parameters_calc()
> and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
> and avoid unnecessarily storing the divider value in setup_info at all.
> 
> This rework has a slight side-effect, in that it should allow the compiler
> to better evaluate the code and avoid compiler warnings about variable
> value overflows, which can never happen.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 4ef2e3c129ed7..875945bf8255b 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -84,7 +84,6 @@ struct dsi_setup_info {
>  	unsigned long fout;
>  	u16 m;
>  	u16 n;
> -	u16 vclk_divider;
>  	const struct dsi_clk_config *clkset;
>  };
>  
> @@ -335,10 +334,24 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
>   * Hardware Setup
>   */
>  
> +static unsigned int rcar_mipi_dsi_vclk_divider(struct rcar_mipi_dsi *dsi,
> +					       struct dsi_setup_info *setup_info)
> +{
> +	switch (dsi->info->model) {
> +	case RCAR_DSI_V3U:
> +	default:
> +		return (setup_info->clkset->vco_cntrl >> 4) & 0x3;
> +
> +	case RCAR_DSI_V4H:
> +		return (setup_info->clkset->vco_cntrl >> 3) & 0x7;
> +	}
> +}
> +
>  static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  				   unsigned long fin_rate,
>  				   unsigned long fout_target,
> -				   struct dsi_setup_info *setup_info)
> +				   struct dsi_setup_info *setup_info,
> +				   u16 vclk_divider)

There is no need for this to be u16, unsigned int will generate better code.

>  {
>  	unsigned int best_err = -1;
>  	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>  			if (fout < info->fout_min || fout > info->fout_max)
>  				continue;
>  
> -			fout = div64_u64(fout, setup_info->vclk_divider);
> +			fout = div64_u64(fout, vclk_divider);

Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
So pass the bit number instead.

>  
>  			if (fout < setup_info->clkset->min_freq ||
>  			    fout > setup_info->clkset->max_freq)
> @@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	unsigned long fout_target;
>  	unsigned long fin_rate;
>  	unsigned int i;
> +	unsigned int div;
>  	unsigned int err;
> +	u16 vclk_divider;
>  
>  	/*
>  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  
>  	fin_rate = clk_get_rate(clk);
>  
> +	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
> +
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +		vclk_divider = BIT_U32(div);
>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +		vclk_divider = BIT_U32(div + 1);
>  		break;
>  	}
>  
> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>  
>  	/* Find hsfreqrange */
>  	setup_info->hsfreq = setup_info->fout * 2;
> @@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>  	dev_dbg(dsi->dev,
>  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
>  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
> -		setup_info->vclk_divider, setup_info->fout, fout_target,
> +		vclk_divider, setup_info->fout, fout_target,
>  		err / 100, err % 100);
>  
>  	dev_dbg(dsi->dev,
> @@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
>  	default:
> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
> +		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));

What is going on here?
	rcar_mipi_dsi_vclk_divider() is (setup_info->clkset->vco_cntrl >> 4) & 0x3
	VCLKSET_DIV_V3U(n)		FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
	VCLKSET_DIV_V3U_MASK is		GENMASK_U32(5, 4)
Looks like a very complicated way of saying:
		vclkset |= setup_info->clkset->vco_cntrl & VCLKSET_DIV_V3U_MASK;

It might be a semi-accident that the bit numbers match.
But I also suspect it is also semi-deliberate.

>  		break;
>  
>  	case RCAR_DSI_V4H:
> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> +		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));

That one looks like it needs the 'subtract one' done somewhere.
Maybe:
		vclkset |= (setup_info->clkset->vco_cntrl - (1u << 3)) &
			VCLKSET_DIV_V4U_MASK;
Although you may want to write the '8' in a different (longer) way :-)

	David
			
>  		break;
>  	}
>  


