Return-Path: <linux-renesas-soc+bounces-24182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB6C3754A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 19:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43533BDBB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 18:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4BE280A29;
	Wed,  5 Nov 2025 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="V6hdf039";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2ZMEYmDc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDE25785D;
	Wed,  5 Nov 2025 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762367571; cv=none; b=ovD5LZWqbLvY+IKw7sam/gE8lDvRwEcFMwnZDY37o9nBASR+Cj5LB4unh4r8qUuhcGY46Ou+tgBBXcEOPJt63UkDUMGqjgljz55k19iID8yqN9mzbY+JVzLDxk17cR0PE3fLQTsNQh5+EteqYtHSDTSCYtc6FyMua5ar6RNqsqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762367571; c=relaxed/simple;
	bh=4IVekppuPgE8sqD9iR7h4uZkwdOkUMOEnuFaeNv1/n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX/miQfOqZLSSNDKFHPh47Tb7lxQ+xIx9T7epV4/kLCmiFfuwZ8Hs/mINUlL+RMHWmoymtg1eW4RoKcYTIPfToAfcTzbdM6dx+8ahYGRFUVFtN+h40VIwRivpa0VSPvUh2IKeeYOpdrjBTuki1Ms6COapO9ihD+9wtcyLgO5O8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=V6hdf039; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2ZMEYmDc; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0AEC5EC01F7;
	Wed,  5 Nov 2025 13:32:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 05 Nov 2025 13:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762367566;
	 x=1762453966; bh=FTRw82VT9vq2A7yNQCLsvd0IbgrKocCjGFtxhGqbROc=; b=
	V6hdf0398IBSXoYTQLLT8N74nkv7e5cYOCTBZauBvkIoae8nst7sEzMo3Hh6OxDn
	245M+0FxMWUOLneh+sD6IjCF3DgoPkTLG0xZO/8y2q8PeDeAni3qId80ptWkeUDy
	5Mhn0nLNLWUhng5lD5bBbEgTuamPq7h2LA+lqG3xoDMMCS8RMBDIIa2WAAgFvbWs
	63qHIg2c0Lg86IH+QONmuergxNuF57y96zc2ETbUKbAed5x58/bPEMa6MujKqJgs
	GeFDYEDZMP65/oz3gcC39eoenvQoxFTWWNWPClCGb4bFhP1TwPjBdqC/y3/cShxr
	G9ATmtGHR2ApJ3T9j384WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762367566; x=
	1762453966; bh=FTRw82VT9vq2A7yNQCLsvd0IbgrKocCjGFtxhGqbROc=; b=2
	ZMEYmDcEZfqtScC3VOngvzFFI1Pb4Nvv8r0ooZxGKxviziw1SyCmd+gw0bxawDhv
	3oU1Oxh+p/jZFhnYfwDJGSeAbIfavKeyLUacSOZ9vgaoj2QvkUu0qE3AimxU6FPf
	c26PQAcAgTf0bj9urQ+2/MNZx9h3u/+4eAgVPWzyHIKiVpjouI1bKORz1JrTS1AC
	nje7Lpl9uMuNmrY+jzNIfCcG9sOGV3r+4JCmc3BEb+LAHXuP22WNdpSMoUozvjCN
	ILaXXlxeoBdDEzrZxL+i20n0cLFuWb9uowQ8jN77Fn990PvAEWqcSop53kVD0Bng
	LUpPTluDqxztkqi+64qQw==
X-ME-Sender: <xms:TZgLaXceDvJwrqDhvPecTErXPfiRWHQYOvQpUXZZDLbdZaQtEAYi-g>
    <xme:TZgLaWhSA-tpw0cKW8QdMRrYVp_jccAQIVoe0XyawrxolT1zm4J8VKid__nUfnn9h
    s6IoM4E_LlF3mXul_OzwVZEwRK21YBGFpiGas8r-7_IEeO9kWEibqk>
X-ME-Received: <xmr:TZgLaXxVyZry8wUInNIfYbkluMt5Ef6pyFpHx1Kh2-tJg1izVsQJUxR8xphIiSNrcxPAdEVt51VWg5hN-qIaRXRBiv4V5OE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeegieefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:TZgLaaPsBrCS9DJYV1-b306Pzwc45ZYnASdkkizTi9EykqZbceIqzQ>
    <xmx:TZgLaQWq2bmnFF9o0bqotflDhN7JojlEla3Xj9CoaSV6vQ1OeqYN0Q>
    <xmx:TZgLaW3m18EluYNTb8eOGk1DOjCHojyzcCQlgMGcn_RqPbccevZ2NA>
    <xmx:TZgLaWrmsl8pZ7uSzOM04E3Kzghbu4IsSNb0s51ecAilKXY9MCZM8w>
    <xmx:TpgLaXCyHm3OXojEzpPAVdAfUifCn8MajSK9rJDM2_j1RDRpF1sHaQNW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 13:32:45 -0500 (EST)
Date: Wed, 5 Nov 2025 19:32:42 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] clocksource/drivers/sh_cmt: Always leave device
 running after probe
Message-ID: <20251105183242.GB3684509@ragnatech.se>
References: <20251016182022.1837417-1-niklas.soderlund+renesas@ragnatech.se>
 <c07ae384-4042-43f4-b876-7207b72260f7@linaro.org>
 <20251105160627.GA3684509@ragnatech.se>
 <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae167c7f-c32f-422b-9eb2-72889cbafef0@linaro.org>

Hi Daniel,

Thanks for your feedback.

On 2025-11-05 17:39:14 +0100, Daniel Lezcano wrote:
> On 11/5/25 17:06, Niklas Söderlund wrote:
> > On 2025-11-05 16:36:15 +0100, Daniel Lezcano wrote:
> > > On 10/16/25 20:20, Niklas Söderlund wrote:
> > > > The CMT device can be used as both a clocksource and a clockevent
> > > > provider. The driver tries to be smart and power itself on and off, as
> > > > well as enabling and disabling its clock when it's not in operation.
> > > > This behavior is slightly altered if the CMT is used as an early
> > > > platform device in which case the device is left powered on after probe,
> > > > but the clock is still enabled and disabled at runtime.
> > > > 
> > > > This has worked for a long time, but recent improvements in PREEMPT_RT
> > > > and PROVE_LOCKING have highlighted an issue. As the CMT registers itself
> > > > as a clockevent provider, clockevents_register_device(), it needs to use
> > > > raw spinlocks internally as this is the context of which the clockevent
> > > > framework interacts with the CMT driver. However in the context of
> > > > holding a raw spinlock the CMT driver can't really manage its power
> > > > state or clock with calls to pm_runtime_*() and clk_*() as these calls
> > > > end up in other platform drivers using regular spinlocks to control
> > > > power and clocks.
> > > 
> > > So the fix is to remove PM management in the driver ?
> > 
> > Yes. As I understand it we can't do runtime pm in these drivers as the
> > core calls into the functions with the raw spinlock held. I hope we can
> > improve this in future.
> 
> 
> IIUC, the changes done for PREEMPT_RT prevent to use pm_runtime by functions
> running in atomic context because the spinlocks are actually mutexes.

My understanding is that the core issue is that the clockevent core uses 
raw spinlocks, so all operations done from the callbacks in drivers need 
to use them too.

The Renesas CMT and TMU (which I intend to fix too once we find a way 
forward for CMT) are the only clockenvet drivers attempting to do 
runtime pm.

    $ git grep -l pm_runtime_get -- drivers/clocksource
    drivers/clocksource/sh_cmt.c
    drivers/clocksource/sh_mtu2.c
    drivers/clocksource/sh_tmu.c
    drivers/clocksource/timer-ti-dm.c

The timer-ti-dm.c driver do not register a clockevent device.

> 
> But if PREEMPT_RT is not set, then everything is running as usual.

I still get LOCKDEP warnings.

> 
> This change drops the PM while it should be working for kernel compiled
> without PREEMPT_RT.
> 
> I suggest to handle the case with/out PREEMPT_RT.
> 
> Hopefully pm_runtime will be fixed with PREEMPT_RT and you won't have to
> reintroduce pm_runtime in this driver but just remove the PREEMPT_RT case.

The problem is not really PREEMPT_RT. The problem is the clockevents 
core require drivers to use raw spinlocks as itself uses them.

I would prefer to get the driver in a state without splats, warnings and 
potential PREEMPT_RT issues. Especially if the cost is to disable 
runtime pm.

As I understand it most systems where CMT exists, who don't use it, keep 
them disabled in DT. And the devices that use them have 
is_sh_early_platform_device() set so they already disable runtime pm.

Once we have that fixed we can work on enabling it without the quirks.  
In your opinion am I missing something where this approach is a bad idea?

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

