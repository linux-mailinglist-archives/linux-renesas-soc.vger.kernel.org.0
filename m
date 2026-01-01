Return-Path: <linux-renesas-soc+bounces-26250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98475CED905
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 02 Jan 2026 00:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E43483000976
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 23:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9002027467F;
	Thu,  1 Jan 2026 23:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpUQrr3V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9056271A7C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jan 2026 23:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767311083; cv=none; b=Np5Bubnh3BYBauYS3UTGe2JLcUhhBbOTFZxfTCGURv9SahAIUMhzY9qq+WJTcSFVcC9M6FhM8UE7y+1ear1npNaJ7eAd2rQkgakPSOPgC7qqBVLgN62EszQBSJKpkRxtpIn/76T8GVgMt8DFTY5MM4NIGs0ICc6Wg12TWwDfTuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767311083; c=relaxed/simple;
	bh=CVEVVZwKn2IW3PdPDi5/xGnzy0HW/JS1aiLyoxpRQQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=du7/+5x3ueWfFRqkav6N9q60vgBlJpuiplISRpY6bjfSwVFydXlqcRB/dRO4poqPt7kLkZN5LFX7cqyOmta9OJF+FsHkXe/yI/pceOLSa9sXojQDvAZbYdEuks1NNIg/yLhLXxIw2Vg4hkbAx4BYDdInUPBSx2iQLiVCTyw1LP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpUQrr3V; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so75904755e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jan 2026 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767311080; x=1767915880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VaHV+fPSHbV1XYccY9PKSQ9qUgEH9z1PuWJ+g++FYU=;
        b=bpUQrr3VopmTF6RPvrMxQ3nP0d9OgdZgS43iBhMvYkH/oiG4jWkuw4aFbHMxYdnSqz
         QK3KTi9Nwh+wzEVYQc7TqTVLRlr7c1fM6GqNNQtHGZPfN9myv5mGH3VVRhMWdNVcEr+q
         IWeRkPN8BM/ybnZWhBmaEsCafmg8gnbmS8MzXC9pgnFcaLEMmhDdTduHE/DGGvUMOJPD
         yxEmUwYtrcc8sp5O+l70OT45/VKGAQ2FOQdWkkSUmRRs0VZg4KDwhfZH6QBO07SrMUar
         MZjjqI0jRnt5G02DFG255RsaHiba/Hk/QbLhlZKWI+uD+OZ7SeX6SvWTmMmlwSPYLcSO
         ETpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767311080; x=1767915880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VaHV+fPSHbV1XYccY9PKSQ9qUgEH9z1PuWJ+g++FYU=;
        b=oHCthYAW6ZanAY3HlRyk2H1xY0B8quwTLnTjO6Zy6R+vEgdui39ri0r9+uYOkhYwES
         JUMipQXO/TJRc0gZx1PQgV4YNuk+B0MLpVHQQOM+oEjy44OroY75j9QcohWZ0OVsNFlb
         BZVqholMOqqc6Z1gNVtz8PQi30G9JPCccqE8lX3PE9NoL3QNl4JehECOB09xAdcTQ8VG
         1typJtqg1qIoFECJsn1Nvn9mVsrywUhMez7RI1SkZUuzNIhMccmul3wzto0OlCiyzkXv
         sKpofCxx1Z+l3ycp7H/d1yFtPUizATZq7IWLeE62FvObFaPkm8i+qhz7liUJZQ4GXDwz
         9mXA==
X-Forwarded-Encrypted: i=1; AJvYcCV48ab+9goGCLSpn3tdE5C4SRy1KgOi6gaFQcWqiJdAJlcksqwq5MXSwWswexVFsfn3QYzatuuUPJG4YEjqeINJew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSu2h2ewczFIyc2CBgnVxqLOs8r5q1cPIDVCLoPrPXujcNX7Z/
	onL/MAy2enVyLQ6mwW1U0BsyfXsWLAr2TTIpXEx9PZ4S+Irosg8Ky3bO
X-Gm-Gg: AY/fxX6ddYzML2QcSeDwnrrd/T2eJlfkjA/sUw06LrRGN1Z0C9eGo51SOlXzQTNq3NF
	4V6Qs118f046Dzh8Ve1TkyIfgBmk7IIvKOYILF5IOmVo+VCAMM8rchZ0KzrAME+K4sTMKWuZzEj
	SirnCRiMG9NHr6bWQdVogyCSWwakwM04daw3Cufxjy+pVhQBxtU09vdo8gC2+NUIrfUb08RbxNj
	0kZPg9X69/iBeU6VAM9qihjWYKzaPgLs+6r3VfgpAk53qBG1lhBsB+1tBOmIHh3o0FcUyRY+Pzo
	w1tvadRGGD3RCh3AKmLRNa9SI+KD3Zb8e0HttteikFkAyZRB49U4yxfUQhTYcmvpCF/NyZcEKim
	Grr5j3msjkFqsFAoFwWo7BxcmQ3OGxzNYkXn/9osBsvguSOidRUkDRG38DR7Tu5F1WG6xyi6bGk
	VW20kZY1DVDjxEPmh4+X2GIYalMDd9Lms6S6AZ53dlIG6Wbct93UHBDA1vvIcqGlI=
X-Google-Smtp-Source: AGHT+IHXkr2lbC80Zn7hP1J5nTM92i3wkwwhT9Omhmn5jdpQQIdtVx9uILZue6GcYU98GN1FGqcvCg==
X-Received: by 2002:a05:600c:4e42:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47d1958fcbcmr470283665e9.27.1767311079946;
        Thu, 01 Jan 2026 15:44:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm742449455e9.14.2026.01.01.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 15:44:39 -0800 (PST)
Date: Thu, 1 Jan 2026 23:44:38 +0000
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
Message-ID: <20260101234438.504b3c48@pumpkin>
In-Reply-To: <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
	<20260101114221.6a401790@pumpkin>
	<15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
	<20260101231320.16766226@pumpkin>
	<4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Jan 2026 00:25:54 +0100
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 1/2/26 12:13 AM, David Laight wrote:
> > On Thu, 1 Jan 2026 22:26:34 +0100
> > Marek Vasut <marek.vasut@mailbox.org> wrote:
> >   
> >> On 1/1/26 12:42 PM, David Laight wrote:
> >>
> >> Hello David,
> >>  
> >>>>    static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>>>    				   unsigned long fin_rate,
> >>>>    				   unsigned long fout_target,
> >>>> -				   struct dsi_setup_info *setup_info)
> >>>> +				   struct dsi_setup_info *setup_info,
> >>>> +				   u16 vclk_divider)  
> >>>
> >>> There is no need for this to be u16, unsigned int will generate better code.  
> >>
> >> Can you please elaborate on the "better code" part ?  
> > 
> > Basically the compiler has to generate extra code to ensure the value
> > doesn't exceed 65535.
> > So there will be a mask of the function parameter (passes in a 32bit register).
> > Any arithmetic needs similar masking of the result.
> > You won't see the latter (as much) on x86 (or m68k) because the compiler
> > can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
> > But pretty much no other cpu can do that, so extra instructions are needed
> > to stop the value (in a 32bit register) exceeding the limit for the variable.
> > 
> > Remember that while C variables can be char/short the values they contain
> > are promoted to 'signed int' before (pretty much) anything is done with
> > the value, any calculated value is then truncated before being assigned back.
> > For on-stack values this is fine - but modern compilers was to keep values
> > in registers as much as possible.
> >   
> >>  
> >>>>    {
> >>>>    	unsigned int best_err = -1;
> >>>>    	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> >>>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>>>    			if (fout < info->fout_min || fout > info->fout_max)
> >>>>    				continue;
> >>>>    
> >>>> -			fout = div64_u64(fout, setup_info->vclk_divider);
> >>>> +			fout = div64_u64(fout, vclk_divider);  
> >>>
> >>> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
> >>> So pass the bit number instead.  
> >>
> >> While I agree this is a shift in the end, it also makes the code harder
> >> to understand. I can add the following change into V2, but I would like
> >> input from Tomi/Laurent on whether we should really push the
> >> optimization in that direction:  
> > 
> > The shift really is a lot faster.
> > Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
> > AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
> > doesn't slow things down (it does on the Intel cpu).
> > Don't even think about what happens on 32bit cpus.
> > I don't know about other architectures.
> > Just comment as 'x >> n' rather than 'x / (1 << n)'
>
> Please note that this code is built primarily for arm64 , so discussing 
> x86 or m68k optimizations doesn't make much sense here.

ARM definitely only has 32 and 64bit maths - so you will see masking
instructions for arithmetic on char/short values (unless the compiler
can tell that the values cannot get too large.)

Divide performance is cpu dependant - the only arm cpu I've used only
had software divide (but a fast barrel shifter).
If you think that Intel haven't thrown much silicon at integer divide
it isn't that likely that arm will have a divide that is much faster
than 1 clock for each bit in the quotient.
(Of course I might be wrong...)

	David


