Return-Path: <linux-renesas-soc+bounces-26248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E36BCED8A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 02 Jan 2026 00:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35DBD30006C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 23:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EBA26F47D;
	Thu,  1 Jan 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7zbDUtF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D5E1A239A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jan 2026 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767309205; cv=none; b=RDpX3ltXnr8CtO+hEM+RWh6+7VSv5hrtBGecsb4URMVZxfO8vBIvQNMrJPI4ST7ggPmf1s2TqokFslDL8C081S2NU5yZMfUyxXQbWi21jjUdxvf63WlU4vUpbPMH6o5FT9dFViUvdM3apO9a8j6e11Hnc6xVJ++r5GSUpQ2lrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767309205; c=relaxed/simple;
	bh=HRQBTibTQCM91x8NiW/klwqsuqpEV9dFggJZFRsAwyA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yczkgr7T360PBpPcaikHUY3GjuWlG9H84+FzvVW2G8Nz3QWboyuln/CQuBfCkRCaMX/bpiNZc9yN8jOFi0kVKCFfGFrU3G8atEsm0nWP9J9Cd6D6K70TsBmVGcQqiLyMEKHCksG3+ADxP9464TlTPs3TsgVHMegNWTlpdysG1LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7zbDUtF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305914so7645026f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jan 2026 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767309202; x=1767914002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX9HKgNtdlmWfrvLY2GB/fq8FDIfRuG0UCvzUof1dYc=;
        b=C7zbDUtF24j8mrtFGopYOdT72k/Ii95+cKLLosUxEwqj7Q7NRLocrHl+4UoLMM5SyC
         NfLNoniFaeC8tQvm4Md0e55ulWLsB811Dq/K96Jad0v/8zgavLbpxeyhWz+8hCpFvCGn
         bRMhroOdYzjxN/E9Bsew15wGmsLJklBqPJ8r+zGyPbK0ouW+TW9T37Jzrlh23QEML1Kt
         zY31zpQHergC2+eqsT7asukAskp5fDB2pbzpdzGs1QKlJKinH0LLZUDlULvi+9SsWj3r
         3/RFykb37v8aVr7QEXzpLVUhYfO8X3oF8NIm0J1Dx3cLFzpa2dj3SyZJCCt///ZXT9N0
         25GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767309202; x=1767914002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XX9HKgNtdlmWfrvLY2GB/fq8FDIfRuG0UCvzUof1dYc=;
        b=rduDXJHQB9AWywwebim4X0MFJ8jNlFvLz4rIK6vxYSddex4zTwekU/y7e0FFvfLORl
         upZDyNyhup2e8XVDzCyE2Ez0V9GGHvxSifqhgodZIMdMJdD8mftxoO4YZWVGXD0rGtcp
         jazHGWrL8hpDr5Wsj561Wvpc4oZigCbbvYWfL7U4Rt+U2DGKWQ8spKqQ0eQQRlKY+CSy
         FhyyTCGoVaaBpWSzisfa5+TSGHykvF5NOlic1LzdeDgypofj+8lmFEysEsKsW0ohW7rv
         Y7RXg5WizzY4GyxaLpnt1t/RBBiwp6YYfW2a89xGwQqVGdpJ4e7z9IjHQ24WSBTKeEtq
         AMhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6oTCGCLKdT+INDTE6klQw3586TxQM0ElOAKfGrViteTmI0ZyEkn4UHfOXG7QVvlmQZ9oJm9TPCYuwkByUHmBtYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9rDWQd0+6Kuo2+0kvzlF/sBPI0ENyiksSsf1xAG66PGYalCh
	Pa4sBtE9t9UnAQvmJy/pjWmYMaE9aIe0PBKizOCq+sOlO2Nwd/6vIgcJ
X-Gm-Gg: AY/fxX4z9WFk9UWCPpwVFj/TraQXmdhBU7QZE4c6YPJF/5lfx484MvAdTw3nIjyP+LV
	kRoKV1D64udoOSmIuvjaqkKz2XPQ2JH2ZIYiTJt8M9tEiyHlMVZu/Elx0k0oZ4W6nQC1NfALVAn
	DBjT6VA4wHCFiGv/+6hI+79uhLrOTQiOMlvkdaEo5+WpkReX1IrAzm7qwTh70prARksk5DvB8nU
	B8yblM7IreqaHitofYN9Z91UPh+SMg9z5Q85ABfO3UpJNQzXR1/7sEtkOI87Qcnlp5pflxsWwGX
	R+eRUSw4qq5+ElkizeNsxOn4I2joc/5XtOsx+kide1iS/KSHlDL+3mQ6YVzFCDtdDPk0LmDG7L4
	wn1nIf9ys3zbBv9eJ/xHKHWwEHkeYXmdNUBCn4+kjnUPiCp3D3TSVrTYvMhVHHY4bLyHPfgHjOq
	Pbs3duzCIqFCKN0lgBFhcCJDnvRIKZ3S0z/S06kDdy7S2CPG5pTI9x
X-Google-Smtp-Source: AGHT+IGRdJAwC31J1FgOs4yAwsXAwWHqkwrMGWpNW8TLxnN+r0x0jJ2mKENNBTKFctDl0fT7gW7U/g==
X-Received: by 2002:a05:6000:1843:b0:431:327:5dcc with SMTP id ffacd0b85a97d-4324e50ebcamr47059470f8f.43.1767309202163;
        Thu, 01 Jan 2026 15:13:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm83437898f8f.27.2026.01.01.15.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 15:13:21 -0800 (PST)
Date: Thu, 1 Jan 2026 23:13:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
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
Message-ID: <20260101231320.16766226@pumpkin>
In-Reply-To: <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
	<20260101114221.6a401790@pumpkin>
	<15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Jan 2026 22:26:34 +0100
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 1/1/26 12:42 PM, David Laight wrote:
> 
> Hello David,
> 
> >>   static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>   				   unsigned long fin_rate,
> >>   				   unsigned long fout_target,
> >> -				   struct dsi_setup_info *setup_info)
> >> +				   struct dsi_setup_info *setup_info,
> >> +				   u16 vclk_divider)  
> > 
> > There is no need for this to be u16, unsigned int will generate better code.  
> 
> Can you please elaborate on the "better code" part ?

Basically the compiler has to generate extra code to ensure the value
doesn't exceed 65535.
So there will be a mask of the function parameter (passes in a 32bit register).
Any arithmetic needs similar masking of the result.
You won't see the latter (as much) on x86 (or m68k) because the compiler
can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
But pretty much no other cpu can do that, so extra instructions are needed
to stop the value (in a 32bit register) exceeding the limit for the variable.

Remember that while C variables can be char/short the values they contain
are promoted to 'signed int' before (pretty much) anything is done with
the value, any calculated value is then truncated before being assigned back.
For on-stack values this is fine - but modern compilers was to keep values
in registers as much as possible.

> 
> >>   {
> >>   	unsigned int best_err = -1;
> >>   	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> >> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>   			if (fout < info->fout_min || fout > info->fout_max)
> >>   				continue;
> >>   
> >> -			fout = div64_u64(fout, setup_info->vclk_divider);
> >> +			fout = div64_u64(fout, vclk_divider);  
> > 
> > Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
> > So pass the bit number instead.  
> 
> While I agree this is a shift in the end, it also makes the code harder 
> to understand. I can add the following change into V2, but I would like 
> input from Tomi/Laurent on whether we should really push the 
> optimization in that direction:

The shift really is a lot faster.
Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
doesn't slow things down (it does on the Intel cpu).
Don't even think about what happens on 32bit cpus.
I don't know about other architectures.
Just comment as 'x >> n' rather than 'x / (1 << n)'

	David

