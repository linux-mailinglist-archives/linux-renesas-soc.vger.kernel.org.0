Return-Path: <linux-renesas-soc+bounces-26247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB7CED5BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 22:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CFF83003FA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 21:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3591F2517B9;
	Thu,  1 Jan 2026 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VOqErh+c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E514A8E;
	Thu,  1 Jan 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767302804; cv=none; b=MhYvSK5R7Q8lsDulsJmrT0RXP53JEOktBmW0sBpxAIZKuhV3H9DWC+MM2SpsNsljtoXf0F3EzMB4BSB/ploKUGJe56Q0Wa3hE5bhoJfwaRVRYt7Ofl7yjlGtv1kZlNzYU7wptNjaALh0d42pEFYjdrrTS02C78Zwnm0Ies7/9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767302804; c=relaxed/simple;
	bh=KKMpItO7MvQpsslnkJjFva8adk7f0xXEU9keoOhtC+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8IyxLmNB6V//i6sj9I4qYQEuXtH5SXjXjnVVgPLZM/Ak5MH7yamG/FqTtcuvMNojr/1aNHoyAePpoCvg9PWQ10ccoN6LUxUwqvtns40aQbI7eYMsrccRlXyxSysc8iQcidbitt9B7XKx8qUDQEaBFMU/ee9wjVjIadFEKan7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VOqErh+c; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dj0JG4HMTz9tKy;
	Thu,  1 Jan 2026 22:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767302798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3ihUnVTOvj/hL43ZrCfPNggfUjcbRDP3scqknJMOo4=;
	b=VOqErh+c13FnDvbNP4TOdviPlFzFr/4u8oVW9o6gAqmGpOdWmiM4TBaTCuhjRC7HNef4PU
	arHd7cd2Uq9sKk8nRfr6KSbcQ70ia4pniw5CBmYGkS3gLQa0YWIcemlClhEQ/fVMo/f0Wy
	WGuUaxbqfAF2B/s0koqvXwve3ti7jIpKG9ytYMXRrg60Ol0VX3OKvp8JM45n7pLg1062tJ
	IRu+3VNwryx8phHRg02l35y1LFqTY58abmY3xJYTHHBgUwzmnhv+d84K+AfPJBDxInlcJB
	mu80gy54LM4SN5qx4YpVQl0+JGbJ6O1F6W1s5+Lf6n2XP8PodyiQV3eckulanA==
Message-ID: <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
Date: Thu, 1 Jan 2026 22:26:34 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: David Laight <david.laight.linux@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
 <20260101114221.6a401790@pumpkin>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260101114221.6a401790@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zyxatscm8nm9qguxjryjbdcwtdpmxe5i
X-MBO-RS-ID: a078551da212c2f1ba9

On 1/1/26 12:42 PM, David Laight wrote:

Hello David,

>>   static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>   				   unsigned long fin_rate,
>>   				   unsigned long fout_target,
>> -				   struct dsi_setup_info *setup_info)
>> +				   struct dsi_setup_info *setup_info,
>> +				   u16 vclk_divider)
> 
> There is no need for this to be u16, unsigned int will generate better code.

Can you please elaborate on the "better code" part ?

>>   {
>>   	unsigned int best_err = -1;
>>   	const struct rcar_mipi_dsi_device_info *info = dsi->info;
>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>   			if (fout < info->fout_min || fout > info->fout_max)
>>   				continue;
>>   
>> -			fout = div64_u64(fout, setup_info->vclk_divider);
>> +			fout = div64_u64(fout, vclk_divider);
> 
> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
> So pass the bit number instead.

While I agree this is a shift in the end, it also makes the code harder 
to understand. I can add the following change into V2, but I would like 
input from Tomi/Laurent on whether we should really push the 
optimization in that direction:

"
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c 
b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 875945bf8255b..c2a0c89b97d93 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -351,7 +351,7 @@ static void rcar_mipi_dsi_pll_calc(struct 
rcar_mipi_dsi *dsi,
  				   unsigned long fin_rate,
  				   unsigned long fout_target,
  				   struct dsi_setup_info *setup_info,
-				   u16 vclk_divider)
+				   unsigned int div)
  {
  	unsigned int best_err = -1;
  	const struct rcar_mipi_dsi_device_info *info = dsi->info;
@@ -373,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct 
rcar_mipi_dsi *dsi,
  			if (fout < info->fout_min || fout > info->fout_max)
  				continue;

-			fout = div64_u64(fout, vclk_divider);
+			fout >>= div;

  			if (fout < setup_info->clkset->min_freq ||
  			    fout > setup_info->clkset->max_freq)
@@ -405,7 +405,6 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,
  	unsigned int i;
  	unsigned int div;
  	unsigned int err;
-	u16 vclk_divider;

  	/*
  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
@@ -429,18 +428,10 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,

  	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);

-	switch (dsi->info->model) {
-	case RCAR_DSI_V3U:
-	default:
-		vclk_divider = BIT_U32(div);
-		break;
-
-	case RCAR_DSI_V4H:
-		vclk_divider = BIT_U32(div + 1);
-		break;
-	}
+	if (dsi->info->model == RCAR_DSI_V4H)
+		div++;

-	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, 
vclk_divider);
+	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, div);

  	/* Find hsfreqrange */
  	setup_info->hsfreq = setup_info->fout * 2;
@@ -456,7 +447,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,
  	dev_dbg(dsi->dev,
  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error 
%d.%02u%%)\n",
  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
-		vclk_divider, setup_info->fout, fout_target,
+		BIT_U32(div), setup_info->fout, fout_target,
  		err / 100, err % 100);

  	dev_dbg(dsi->dev,
"

>>   
>>   			if (fout < setup_info->clkset->min_freq ||
>>   			    fout > setup_info->clkset->max_freq)
>> @@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>>   	unsigned long fout_target;
>>   	unsigned long fin_rate;
>>   	unsigned int i;
>> +	unsigned int div;
>>   	unsigned int err;
>> +	u16 vclk_divider;
>>   
>>   	/*
>>   	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
>> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>>   
>>   	fin_rate = clk_get_rate(clk);
>>   
>> +	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
>> +
>>   	switch (dsi->info->model) {
>>   	case RCAR_DSI_V3U:
>>   	default:
>> -		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
>> +		vclk_divider = BIT_U32(div);
>>   		break;
>>   
>>   	case RCAR_DSI_V4H:
>> -		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
>> +		vclk_divider = BIT_U32(div + 1);
>>   		break;
>>   	}
>>   
>> -	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
>> +	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>>   
>>   	/* Find hsfreqrange */
>>   	setup_info->hsfreq = setup_info->fout * 2;
>> @@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>>   	dev_dbg(dsi->dev,
>>   		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
>>   		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
>> -		setup_info->vclk_divider, setup_info->fout, fout_target,
>> +		vclk_divider, setup_info->fout, fout_target,
>>   		err / 100, err % 100);
>>   
>>   	dev_dbg(dsi->dev,
>> @@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>>   	switch (dsi->info->model) {
>>   	case RCAR_DSI_V3U:
>>   	default:
>> -		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
>> +		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
> 
> What is going on here?
> 	rcar_mipi_dsi_vclk_divider() is (setup_info->clkset->vco_cntrl >> 4) & 0x3
> 	VCLKSET_DIV_V3U(n)		FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
> 	VCLKSET_DIV_V3U_MASK is		GENMASK_U32(5, 4)
> Looks like a very complicated way of saying:
> 		vclkset |= setup_info->clkset->vco_cntrl & VCLKSET_DIV_V3U_MASK;
> 
> It might be a semi-accident that the bit numbers match.
> But I also suspect it is also semi-deliberate.

The bitfield placement does match here, it does not match for the V4H 
below anymore. The vco_cntrl is a precalculated value for a bitfield 
that is written into another register, this bitfield here uses a subset 
of it and must be kept in sync with the other register. The FIELD_PREP 
usage here is correct.

>>   		break;
>>   
>>   	case RCAR_DSI_V4H:
>> -		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>> +		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
> 
> That one looks like it needs the 'subtract one' done somewhere.
> Maybe:
> 		vclkset |= (setup_info->clkset->vco_cntrl - (1u << 3)) &
> 			VCLKSET_DIV_V4U_MASK;
> Although you may want to write the '8' in a different (longer) way :-)
Please see hunk "@@ -412,18 +427,20 @@ static void 
rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi," above, that 
one removes the +1 part, so the -1 has to be removed here too.

Thanks

