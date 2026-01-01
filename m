Return-Path: <linux-renesas-soc+bounces-26249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A7CED8CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 02 Jan 2026 00:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5479930088B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 23:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B5C26CE04;
	Thu,  1 Jan 2026 23:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A9HM6twq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26713239E7E;
	Thu,  1 Jan 2026 23:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767309964; cv=none; b=koaBDxw/KYOkGhkdUXLNV39+xY/syKdi0Kno9Jp2ZqZQM7jxinhZIpHSml+/Gb9wTaOP1YnzyP2mn2cf3LUo8yXDqkkO1rQf0jvB+jINenGnc9z+IxdF39/dMlF8iMXqMdvOGfpHyA3uhg+BDe5owt8ZvJ1YRFewjd1W2xp79Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767309964; c=relaxed/simple;
	bh=7R8akBXVW2krckiu6Jp8feNnUWv5330hk2xKllYR4Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLnQeogFRQJn7DO1/WXuQgwOxPiEq2fAVIlf24jswV0piAkjkAC/LBp7Imn7GjJNUe1RN3R4Uy0ynARG5xsKgahPV/johrUbIdc9xVVS8LAHiiWqRoz2P2H7+3BUiUpyY9Orjyg8ZCseTS1JoLU8DeuiYf05kMYzGCHYEOag/wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A9HM6twq; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dj2xy2rRtz9svD;
	Fri,  2 Jan 2026 00:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767309958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2j6AdpI5VEIuPetVKSFH+Svwx51VlD+55ROYZGbANBs=;
	b=A9HM6twquaWTkRWvSF51TTgJFQVyADowMlBI6F6nseSVfTB1aQ15mkQfq8/RsbtGSt02Wl
	sj1vf5E7btKa0l10pEWKFjKg/UzgqXM/OqBU1GSW3YcjLewuGPyCgoZ4uNFlxfbeZDdR3Y
	y5l/FnrkZ8M0yOyXCVFWCnG/PYwrsE7MHmTARv5jIu7IALDwsafuAbzKLXNsYochiNATkj
	O0UZjLkRy4n4jHBNT6I68+gboFLq3b+MpAIrKf1QiF6hJ6BHsNewyH8HUGvQahOUm+Cdlc
	m/4nZUl9fGhY4KOSP1hSweMksiIKqA+O7SoW1UJisIttIwd/cqMNvsYCn1NaAw==
Message-ID: <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
Date: Fri, 2 Jan 2026 00:25:54 +0100
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
 <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
 <20260101231320.16766226@pumpkin>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260101231320.16766226@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4ekdrdoty6i6dc5b8irwgj4qjt3u8mtq
X-MBO-RS-ID: aa9340bd8078d65737b

On 1/2/26 12:13 AM, David Laight wrote:
> On Thu, 1 Jan 2026 22:26:34 +0100
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
>> On 1/1/26 12:42 PM, David Laight wrote:
>>
>> Hello David,
>>
>>>>    static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>    				   unsigned long fin_rate,
>>>>    				   unsigned long fout_target,
>>>> -				   struct dsi_setup_info *setup_info)
>>>> +				   struct dsi_setup_info *setup_info,
>>>> +				   u16 vclk_divider)
>>>
>>> There is no need for this to be u16, unsigned int will generate better code.
>>
>> Can you please elaborate on the "better code" part ?
> 
> Basically the compiler has to generate extra code to ensure the value
> doesn't exceed 65535.
> So there will be a mask of the function parameter (passes in a 32bit register).
> Any arithmetic needs similar masking of the result.
> You won't see the latter (as much) on x86 (or m68k) because the compiler
> can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
> But pretty much no other cpu can do that, so extra instructions are needed
> to stop the value (in a 32bit register) exceeding the limit for the variable.
> 
> Remember that while C variables can be char/short the values they contain
> are promoted to 'signed int' before (pretty much) anything is done with
> the value, any calculated value is then truncated before being assigned back.
> For on-stack values this is fine - but modern compilers was to keep values
> in registers as much as possible.
> 
>>
>>>>    {
>>>>    	unsigned int best_err = -1;
>>>>    	const struct rcar_mipi_dsi_device_info *info = dsi->info;
>>>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>    			if (fout < info->fout_min || fout > info->fout_max)
>>>>    				continue;
>>>>    
>>>> -			fout = div64_u64(fout, setup_info->vclk_divider);
>>>> +			fout = div64_u64(fout, vclk_divider);
>>>
>>> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
>>> So pass the bit number instead.
>>
>> While I agree this is a shift in the end, it also makes the code harder
>> to understand. I can add the following change into V2, but I would like
>> input from Tomi/Laurent on whether we should really push the
>> optimization in that direction:
> 
> The shift really is a lot faster.
> Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
> AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
> doesn't slow things down (it does on the Intel cpu).
> Don't even think about what happens on 32bit cpus.
> I don't know about other architectures.
> Just comment as 'x >> n' rather than 'x / (1 << n)'
Please note that this code is built primarily for arm64 , so discussing 
x86 or m68k optimizations doesn't make much sense here.

