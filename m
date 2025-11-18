Return-Path: <linux-renesas-soc+bounces-24748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0660C6B93F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 21:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE98535F580
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 20:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7272F746F;
	Tue, 18 Nov 2025 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hBh5+im5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TAkDQxxu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808942F7454;
	Tue, 18 Nov 2025 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497119; cv=none; b=f34SOT3GMUinpOJC7ZnmOmno9VeEfKexl8LaANZmBNC2PY4HbI+LUwDB31t2BHIaFP0IY61qUSa8u2GUa7+mpC0cvvfxsfDUQU3hO0vDaIOoEpKDVL/jYWBDhge0MoxtKpZl04uwE9v4e0nMKRFxpPWF/15sDjMEWeEdPdJdMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497119; c=relaxed/simple;
	bh=eRkDpII6rjYSk7KIY+H8PbsRsHKYbioOpUUwtTF9Hoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxbIS92oVJ5rXZoxuJs7SGAXOJ2WFrrrcw1xC3yeYGF6+doEJDtQYlognQKf8bY91Rg/g8BPhMgc0HVJbG8DO8AiEgwtpWYs3QXpIvCbWK0IN9cwRxIZNhnayv5Vs4BMfJq6YfCD0I1ucNDZSuyyF200g84a+yIIWzHCdmacBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hBh5+im5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TAkDQxxu; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 83F141D00160;
	Tue, 18 Nov 2025 15:18:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 18 Nov 2025 15:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763497115;
	 x=1763583515; bh=Ghvo2qBhwNkwTFKc797rNnBmbyb/s2ECm0pQsFFUWxM=; b=
	hBh5+im5U7Ix+kCRdSaEzIbdQB47WfrdnL/0k6g1o8Dd9KPZAZdgr1OphyDbplQu
	MBZMuv6xssAU3mPfSg9YQNmnUZBk6Ccex0qA+cGqm9myMauJcvXpJAgyZVfLufjW
	0FzCbF76EesIJuPM7//SNA4vwFHZF1BGoVgthQp8MDGsb//qjePyKzf9MKlrXc23
	LaVoILjp6W5vGRlBW0PUEitVIZrcLCgv8Gwlpc/oxcXbr/012YTToQqRPFxHkiM4
	0yYRlMPhOYQCPxuCFBsLMzipb54WoyrWz489CU9y4wpsYV7L/n0nH9CbyOihAmeK
	D1HhGdeVrs+POhkD3a0pnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763497115; x=
	1763583515; bh=Ghvo2qBhwNkwTFKc797rNnBmbyb/s2ECm0pQsFFUWxM=; b=T
	AkDQxxuDYCK9OtA7Q24Lbd2jRZWbUKUwg47+K9hQgBDRkCZak28TDzdi73i6BVHq
	eglXFIiD0hl0pHLY4torT5/qdzKcsmowdf8S5zDtsk/mtvBdDK7CUFeLJrfQOJgS
	GJXWJgTtI2NNSKTP9kaQ1cdtxfqmYdngFi1ooqTehRwPeHLI7GLuIgUThWyFt50B
	yNLMZjXOrE3JsuELWJP1vrfjuJ097fk7kcZw/wY8wEHdKx400WZqG+9MP9XwGSyp
	4ZBjvAhIdYDvmUT52z+JNmIcCuf1aW1JD21GtAjlFUEiO0BdV3cKeZCYBIPnLOUh
	LtrilwdnwQTuXms6Z7qWQ==
X-ME-Sender: <xms:mtQcae69eA7hQ84jhSz0HUHvjd1e2dt9Oc8GxAh6T2s4dVRDSxzU6A>
    <xme:mtQcaRMiYgOVpX2iHuYgHM4OFZEh0Q8rsSC4IKDpzEAf1HE9SqV4rAUYG0TqJd9oK
    rcbBy8YA4TpbxGZCkgTSniRTd7nvqZXEC0QPjf_u7wHKLdriXV0vg0>
X-ME-Received: <xmr:mtQcaUtjX-VWTpX6kxmikNj_zon0VC2w0CUB8S3BDgGx4e4yw_wFb7JQWZpCj-znb8JtnfOFqDYO0SCTc0AlzfrdE9S2i38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvddvvdehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:mtQcacbHJn-SHgkDtW-5SrMP9xkcK0HZ5BwbrXe__GjNqCXgxAGiJg>
    <xmx:mtQcaexpj-efwCcdKmMwClXib3l1ZDjv27qS90jJXRfEes-lFKT1vA>
    <xmx:mtQcacglmL0_MrFE-j6SJ6EK4EuZMQP-KIc4tV06xqAfThMWv8ngGw>
    <xmx:mtQcaSmiXZvre_A63TSRcETkvb4y7B8OyEjnNH1P4Hs3gg4_CaNxcQ>
    <xmx:m9Qcab86_vShrvsG3uTyetoebIVwFOZ_uZ3ZJ_ISYnGOWa7vDWiykYkC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Nov 2025 15:18:34 -0500 (EST)
Date: Tue, 18 Nov 2025 21:18:32 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
Message-ID: <20251118201832.GD505486@fsdn.se>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
 <20251105183242.GB3684509@ragnatech.se>
 <c4377971-173a-4af9-8566-24e5860787ae@linaro.org>
 <20251109143708.GD4126953@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251109143708.GD4126953@ragnatech.se>

Hi Daniel,

On 2025-11-09 15:37:12 +0100, Niklas Söderlund wrote:
> Hi Daniel,
> 
> On 2025-11-07 10:53:41 +0100, Daniel Lezcano wrote:
> > On 11/5/25 19:32, Niklas Söderlund wrote:
> > > Hi Daniel,
> > > 
> > > Thanks for your feedback.
> > > 
> > > On 2025-11-05 17:39:14 +0100, Daniel Lezcano wrote:
> > > > On 11/5/25 17:06, Niklas Söderlund wrote:
> > > > > On 2025-11-05 16:36:15 +0100, Daniel Lezcano wrote:
> > > > > > On 10/16/25 20:20, Niklas Söderlund wrote:
> > > > > > > The CMT device can be used as both a clocksource and a clockevent
> > > > > > > provider. The driver tries to be smart and power itself on and off, as
> > > > > > > well as enabling and disabling its clock when it's not in operation.
> > > > > > > This behavior is slightly altered if the CMT is used as an early
> > > > > > > platform device in which case the device is left powered on after probe,
> > > > > > > but the clock is still enabled and disabled at runtime.
> > > > > > > 
> > > > > > > This has worked for a long time, but recent improvements in PREEMPT_RT
> > > > > > > and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
> > > > > > > as a clockevent provider, clockevents_register_device(), it needs to use
> > > > > > > raw spinlocks internally as this is the context of which the clockevent
> > > > > > > framework interacts with the CMT driver. However in the context of
> > > > > > > holding a raw spinlock the CMT driver can't really manage its power
> > > > > > > state or clock with calls to pm_runtime_*() and clk_*() as these calls
> > > > > > > end up in other platform drivers using regular spinlocks to control
> > > > > > > power and clocks.
> > > > > > 
> > > > > > So the fix is to remove PM management in the driver ?
> > > > > 
> > > > > Yes. As I understand it we can't do runtime pm in these drivers as the
> > > > > core calls into the functions with the raw spinlock held. I hope we can
> > > > > improve this in future.
> > > > 
> > > > 
> > > > IIUC, the changes done for PREEMPT_RT prevent to use pm_runtime by functions
> > > > running in atomic context because the spinlocks are actually mutexes.
> > > 
> > > My understanding is that the core issue is that the clockevent core uses
> > > raw spinlocks, so all operations done from the callbacks in drivers need
> > > to use them too.
> > > 
> > > The Renesas CMT and TMU (which I intend to fix too once we find a way
> > > forward for CMT) are the only clockenvet drivers attempting to do
> > > runtime pm.
> > > 
> > >      $ git grep -l pm_runtime_get -- drivers/clocksource
> > >      drivers/clocksource/sh_cmt.c
> > >      drivers/clocksource/sh_mtu2.c
> > >      drivers/clocksource/sh_tmu.c
> > >      drivers/clocksource/timer-ti-dm.c
> > > 
> > > The timer-ti-dm.c driver do not register a clockevent device.
> > > 
> > > > 
> > > > But if PREEMPT_RT is not set, then everything is running as usual.
> > > 
> > > I still get LOCKDEP warnings.
> > 
> > Ah ok, you get the LOCKDEP warning because it identifies the called code to
> > be invalid in case the PREEMPT_RT is compiled-in but does not reflect a real
> > problem with !PREEMPT_RT.
> > 
> > [ ... ]
> > 
> > > The problem is not really PREEMPT_RT. The problem is the clockevents
> > > core require drivers to use raw spinlocks as itself uses them.
> > > 
> > > I would prefer to get the driver in a state without splats, warnings and
> > > potential PREEMPT_RT issues. Especially if the cost is to disable
> > > runtime pm.
> > > 
> > > As I understand it most systems where CMT exists, who don't use it, keep
> > > them disabled in DT. And the devices that use them have
> > > is_sh_early_platform_device() set so they already disable runtime pm.
> > > 
> > > Once we have that fixed we can work on enabling it without the quirks.
> > > In your opinion am I missing something where this approach is a bad idea?
> > 
> > If you prefer to remove the PM in the driver, I'm fine with that.
> 
> I'm not super fond of removing it, but for now I think it is the best 
> way to ensure correct operation in all cases. If anybody have ideas I'm 
> all ears. Specially as I will need to do a similar fix for the TMU 
> driver once we have found a acceptable way for CMT.
> 
> Once we I'm out of the woods and not worried about whats currently in 
> tree can have issues I think it's time to start thinking, if and how we 
> can improve tings in the core so we can enable some or all of the PM CMT 
> and TMU.
> 
> I really appreciate you pushed back on this, I agree removing runtime PM 
> support is kind of a last resort here. But I see no other path.

Just wanted to check if you plan to take this patch in this cycle, no 
rush. But I don't want to start trying similar fixes for TMU before we 
have agreed on this one.

> > 
> > 
> > -- 
> > <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs
> > 
> > Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> > <http://twitter.com/#!/linaroorg> Twitter |
> > <http://www.linaro.org/linaro-blog/> Blog
> 
> -- 
> Kind Regards,
> Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

