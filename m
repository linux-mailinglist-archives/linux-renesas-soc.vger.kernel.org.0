Return-Path: <linux-renesas-soc+bounces-24369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C671BC44058
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 09 Nov 2025 15:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5AC6188BAA4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Nov 2025 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0372D2DF149;
	Sun,  9 Nov 2025 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JOMxotIX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hwohoQHX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8B18027;
	Sun,  9 Nov 2025 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699037; cv=none; b=o6dT1hU1T8vFnnuBXn71UD68U+aFSoC5yo/vMYqtDUqLerqlNnDEi89aWMiZpIYddhrt7UC34msAQC6fp7+XHbK7bhSUCD7SpgpMZtKAnDtkBngH2Rbv38L4BEW3Cz3N5vWDbfrC5IBF3SdKGuftS1fjhymTJqrDHgbGPX4+9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699037; c=relaxed/simple;
	bh=y1XzxB4cxLOtgqM9iW/1pwq4IajwoALOAC6J6EHxfq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fmuw0TvDv30Dklh5Tj8YpI+TH96miAm7xKg0RWnQ+2ZWMlEK69WtkVfWwhCnteG1z9DWJ8erZHCSK/4IQCzDBQsnoCIqQwsCs4IE0oc0ATtZjuDff1ck/gkC6kqE6Tcploqus6rybvY4y5Rx1h/dqrfWwCYG1HzgzAd+GlrjmVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JOMxotIX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hwohoQHX; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0143E7A0091;
	Sun,  9 Nov 2025 09:37:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 09 Nov 2025 09:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762699031;
	 x=1762785431; bh=Co862sBr7FxEy0IOO1grCt0h3yVF3T4y2yphEC5DydM=; b=
	JOMxotIXbwd1gW7ipHxll8LopLXbQ1q8WDOZj/I2nP1Ki/NvZwoYVWVu/JyV75zA
	W6m7RbuhBEW7dkvLIpY5J9MmOm96ap4GiiijRU9W1PlcX5dmDOkt3z7fWcJkrQBe
	ichFwfm7b8/dlNZiKpgit01T0xMH5coyyBAAEt9Rgcnt5OjbOOvEnWnf2wthY+8e
	khMosXvMdSYdbaUCkZ50itfw8WJtUywVKHRmzyvsM4W4WxK8DoRhpOzBh1ZNlw9k
	6CgdBU3w6icacCesECiNWwzQlQlz0WJAUNN5iDFXeYFbw733xavKZgNB2nDQrCnS
	9378y7KmxMWW3Bv6T6Uxxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762699031; x=
	1762785431; bh=Co862sBr7FxEy0IOO1grCt0h3yVF3T4y2yphEC5DydM=; b=h
	wohoQHX//ETZURmSoe1XPqSPa+DHwQKVNYA2GRuAXu6GMnt/y7CsOTea86uZhowX
	czGqiXLyJTBeGPgsK3iny7/ZhI7WcZAUrmaIhTtTwDSQV1zyYD+IjMYKTkbILJgG
	fiBvotG7BNzG5/UbYy7rKeuGihrauUQNAY6WWlZvbjyOq272ImnGbaAq6ll0PNSV
	N9LimnO7bG61Mk8aLKSv3u61hQL29n/LznR+Wh2KazpjGkTBOPZGwydmT5VGWkvm
	is3QUL4svgHw82QYrEm9NpJE75t0nyB9J4NgqCcqyL6fTMJfCnJ2SOR5HLycoAjC
	Jvc8pZYm2yIMskmhI8Y9w==
X-ME-Sender: <xms:F6cQaUNB5w-SzXJmXWoXOlndJs5NMWimOe3hHLbrFzmUj7atOpr2uA>
    <xme:F6cQaURryrHBIyqEl74N3sNyINH-dP5NqZg2xygTPdZ8iy7lCm0h9gAIogfsEPbG-
    stmhD1WE-w-H80P3pALrV5vDD7jhoX5cyaDzTWMGwcuBpon4wH6Xg>
X-ME-Received: <xmr:F6cQaSiTtNCOObU45dLpJBgVodRdGEFMT3BmmqKhScmXAKM6ZtNZ3E5HMXKSPKRqQMevNsbdq6SRCPcmFTn7vj0B365IE8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleehieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeejveehuddtgfet
    uedtffefheehtdefleejgeffudettddtveffudevudelvddugeenucffohhmrghinheplh
    hinhgrrhhordhorhhgpdhfrggtvggsohhokhdrtghomhdpthifihhtthgvrhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhn
    sggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnih
    gvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehl
    ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehg
    lhhiuggvrhdrsggv
X-ME-Proxy: <xmx:F6cQad-2KAEjouHkJAeOj4NF6ibmVLNjinbp20U2nWk_HAc7gWvMIw>
    <xmx:F6cQaZGtPhin_DWOD187YHctEHstsdVLZ2isJmkczA9mG6KOQ2pBvw>
    <xmx:F6cQaQkxGmFnOoAnxnfwKEM1HjT5ZB_x6-NCDiZ_FnGPvbybDUOASA>
    <xmx:F6cQadbSxM2s3xpvYez9EE1lLQ-JsAtxHI3F_dqyBMHu6lpiqtjTMw>
    <xmx:F6cQaRzCX80OZwPqlnoWtHFxf_kjERE0crmU4Zn_TzIX-03DO3LEgIl_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Nov 2025 09:37:10 -0500 (EST)
Date: Sun, 9 Nov 2025 15:37:08 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
Message-ID: <20251109143708.GD4126953@ragnatech.se>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
 <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>

Hi Daniel,

On 2025-11-07 10:53:41 +0100, Daniel Lezcano wrote:
> On 11/5/25 19:32, Niklas Söderlund wrote:
> > Hi Daniel,
> > 
> > Thanks for your feedback.
> > 
> > On 2025-11-05 17:39:14 +0100, Daniel Lezcano wrote:
> > > On 11/5/25 17:06, Niklas Söderlund wrote:
> > > > On 2025-11-05 16:36:15 +0100, Daniel Lezcano wrote:
> > > > > On 10/16/25 20:20, Niklas Söderlund wrote:
> > > > > > The CMT device can be used as both a clocksource and a clockevent
> > > > > > provider. The driver tries to be smart and power itself on and off, as
> > > > > > well as enabling and disabling its clock when it's not in operation.
> > > > > > This behavior is slightly altered if the CMT is used as an early
> > > > > > platform device in which case the device is left powered on after probe,
> > > > > > but the clock is still enabled and disabled at runtime.
> > > > > > 
> > > > > > This has worked for a long time, but recent improvements in PREEMPT_RT
> > > > > > and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
> > > > > > as a clockevent provider, clockevents_register_device(), it needs to use
> > > > > > raw spinlocks internally as this is the context of which the clockevent
> > > > > > framework interacts with the CMT driver. However in the context of
> > > > > > holding a raw spinlock the CMT driver can't really manage its power
> > > > > > state or clock with calls to pm_runtime_*() and clk_*() as these calls
> > > > > > end up in other platform drivers using regular spinlocks to control
> > > > > > power and clocks.
> > > > > 
> > > > > So the fix is to remove PM management in the driver ?
> > > > 
> > > > Yes. As I understand it we can't do runtime pm in these drivers as the
> > > > core calls into the functions with the raw spinlock held. I hope we can
> > > > improve this in future.
> > > 
> > > 
> > > IIUC, the changes done for PREEMPT_RT prevent to use pm_runtime by functions
> > > running in atomic context because the spinlocks are actually mutexes.
> > 
> > My understanding is that the core issue is that the clockevent core uses
> > raw spinlocks, so all operations done from the callbacks in drivers need
> > to use them too.
> > 
> > The Renesas CMT and TMU (which I intend to fix too once we find a way
> > forward for CMT) are the only clockenvet drivers attempting to do
> > runtime pm.
> > 
> >      $ git grep -l pm_runtime_get -- drivers/clocksource
> >      drivers/clocksource/sh_cmt.c
> >      drivers/clocksource/sh_mtu2.c
> >      drivers/clocksource/sh_tmu.c
> >      drivers/clocksource/timer-ti-dm.c
> > 
> > The timer-ti-dm.c driver do not register a clockevent device.
> > 
> > > 
> > > But if PREEMPT_RT is not set, then everything is running as usual.
> > 
> > I still get LOCKDEP warnings.
> 
> Ah ok, you get the LOCKDEP warning because it identifies the called code to
> be invalid in case the PREEMPT_RT is compiled-in but does not reflect a real
> problem with !PREEMPT_RT.
> 
> [ ... ]
> 
> > The problem is not really PREEMPT_RT. The problem is the clockevents
> > core require drivers to use raw spinlocks as itself uses them.
> > 
> > I would prefer to get the driver in a state without splats, warnings and
> > potential PREEMPT_RT issues. Especially if the cost is to disable
> > runtime pm.
> > 
> > As I understand it most systems where CMT exists, who don't use it, keep
> > them disabled in DT. And the devices that use them have
> > is_sh_early_platform_device() set so they already disable runtime pm.
> > 
> > Once we have that fixed we can work on enabling it without the quirks.
> > In your opinion am I missing something where this approach is a bad idea?
> 
> If you prefer to remove the PM in the driver, I'm fine with that.

I'm not super fond of removing it, but for now I think it is the best 
way to ensure correct operation in all cases. If anybody have ideas I'm 
all ears. Specially as I will need to do a similar fix for the TMU 
driver once we have found a acceptable way for CMT.

Once we I'm out of the woods and not worried about whats currently in 
tree can have issues I think it's time to start thinking, if and how we 
can improve tings in the core so we can enable some or all of the PM CMT 
and TMU.

I really appreciate you pushed back on this, I agree removing runtime PM 
support is kind of a last resort here. But I see no other path.
> 
> 
> -- 
> <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> 
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

-- 
Kind Regards,
Niklas Söderlund

