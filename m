Return-Path: <linux-renesas-soc+bounces-21726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2021B51931
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53AB6547660
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347C2246774;
	Wed, 10 Sep 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YV+tqzQX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cPN2vHMo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5F1684A4;
	Wed, 10 Sep 2025 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514119; cv=none; b=OOiCGl+PHoRVXEYtSpOqSYJs53X5/tvn58YudQFDLu/LaSLsEK+QzCe05ggLsckKjqfRblaOPUYShBnN2B/PfxylFktW+HXm611CPEqoqgh/ypwcbwCyexeZkxLYkjA/28ZrYqln4LMvMaXmDvX4+FJAuyM8/iJWui+az5Y3UcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514119; c=relaxed/simple;
	bh=u6aj5Kq2bKExQL9Tdl1xsBAjkzqGZvzCDA9Ry/Kd0ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drITntJosN2u2Rg9iP4p8StRQ49Wvh5V1jD60LZDNHL6A0B6UX5Ir7ev+VQ/gd3J0oNSSXHFlz4hgrQUhfpaAOJqetFHyuy/MgdAQn2I+Z5mbopaEaw7UU7UunSYBlzsOOft8n7/fOVHMxFzth+Z38ZPkPiMBwrPlQMH/fckR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YV+tqzQX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cPN2vHMo; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 65C40140036A;
	Wed, 10 Sep 2025 10:21:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 10 Sep 2025 10:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757514114;
	 x=1757600514; bh=rD5BtY2OGNIuyfBdGqMZ6IPfu1yIsfWaSQbgqRmmR6w=; b=
	YV+tqzQXyQohFN8JVLQb9+NVW+lmsOh/Y7SRyZa5pRL68+ixqwzVXnIp0yLxz4Xn
	rVuTGKUMn5Whtwf2tF6+e5QXa2iS475/VjcZA+62OoTQ06yoqgSc4E8FFi3JEVf0
	rUO3BotE795t3mSQ3FrkuPiBFpoYztoFjrPexAhOCDFT6OKM1jlygrZgD1FZb+cK
	OOQlyr3+Ggo03IY2Mf9UMUx1kgTWZ3xdYSmot86bbgS66ONYmHe3oDRfkEXze2wT
	tYR+VdY/NM8vZlupAkxMYQ4SIOzRk5VEcNQwq6iXbH5LCGibA/CJ2Iji2j0c+NMz
	FUfcKku9lB5jdW6my6SCMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757514114; x=
	1757600514; bh=rD5BtY2OGNIuyfBdGqMZ6IPfu1yIsfWaSQbgqRmmR6w=; b=c
	PN2vHMobvsguadJWY0ZQuow1rBpcjqP4NflQAlo0xesUcRgCJETHdmOE3y/SZ31Y
	z+2tETyj7VcnHjn4T05HoIjzupq1cN4yKkrAPXPdrOApN3HPazJXO6bXnS/h7krz
	Wm+3VFHobgCQZ7Z+PY9zzaYwMYMW+hSM+vwmuge6mpQ/VKutcgnf1s7HYQ6mGPKR
	WSf2kPmQW0yM1qdaBHt6+WsMu367GydEbeFF1mAq2yvQY388zBp2LD7C9g2ibaO4
	GFn0GIDX6spt+3ZRrCukNAF6k7UcgHah3/HTkKiacMB3WUm2T5uQSGRLzVOjVjHN
	++1ZvECpb+0yul5A0e2hg==
X-ME-Sender: <xms:gYnBaLi3JrrUZRFpf2v-gT9ys8Cj7Zk6aOa5KdeWJF78r1b1g2Knjg>
    <xme:gYnBaFJGQS6Q48a4UEHEPKHOK9qDwMp4t2hRI0evHh2Re9uQygcqe8L0pj2T7t3LA
    irRrABEXsvq6sGF648>
X-ME-Received: <xmr:gYnBaKH2jEqnOnl-osw5wAZ_aJLiRailZrPu2zr6cPVAYiCzISYlxWV23g8CP1zvN9emtbITdkXWaJRbq4Y7tsaUvxGheXkmew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghroh
    drohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:gYnBaJTwPrSGvy4s_OnqK2tyvOH7hpZY6gVK5EsbtrcN2EDsRRkSGg>
    <xmx:gYnBaGeo0mJLJCQS089OZVvZJWF5T6mgHbnjKkZppkYgq7txDKmQfg>
    <xmx:gYnBaIqYtTBDPKDLkrIO4XrLZzN53JgcvzCB-t4AaTCbiUEQaYFY1A>
    <xmx:gYnBaH9egxPQXKlBgPdHkHlLt3SSh3_gooWUsApGbOAKvWZ28UWhGg>
    <xmx:gonBaMlXNheBcdcT2U06SurnfaoIwTwpUcFjXEq-2ovSKrwhv3JaNs8L>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 10:21:53 -0400 (EDT)
Date: Wed, 10 Sep 2025 16:21:51 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC/PATCH 0/2] clocksource/drivers/sh_cmt: Improve clock event
 design
Message-ID: <20250910142151.GB3518415@ragnatech.se>
References: <20250828214403.1765311-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWOXZkffbadZnHEwzohc738W4fyKU+zP0M5Ak7M7n=Kwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWOXZkffbadZnHEwzohc738W4fyKU+zP0M5Ak7M7n=Kwg@mail.gmail.com>

Hi Geert,

On 2025-09-09 14:17:16 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, 30 Aug 2025 at 23:10, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > This RFC/PATCH tries to address an issue with the Renesas CMT driver
> > design. The driver do PM and clock handling in struct clock_event_device
> > callbacks. This leads to LOCKDEP warnings and I think hints at a larger
> > issue.
> >
> >     =============================
> >     [ BUG: Invalid wait context ]
> >     6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
> >     -----------------------------
> >     swapper/1/0 is trying to lock:
> >     ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
> >     ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
> >     other info that might help us debug this:
> >     ccree e6601000.crypto: ARM ccree device initialized
> >     context-{5:5}
> >     2 locks held by swapper/1/0:
> >      #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
> >      #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
> >     usbcore: registered new interface driver usbhid
> >     , at: sh_cmt_start+0x30/0x364
> >     stack backtrace:
> >     CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
> >     Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> >     Call trace:
> >      show_stack+0x14/0x1c (C)
> >      dump_stack_lvl+0x6c/0x90
> >      dump_stack+0x14/0x1c
> >      __lock_acquire+0x904/0x1584
> >      lock_acquire+0x220/0x34c
> >      _raw_spin_lock_irqsave+0x58/0x80
> >      __pm_runtime_resume+0x38/0x88
> >      sh_cmt_start+0x54/0x364
> >      sh_cmt_clock_event_set_oneshot+0x64/0xb8
> >      clockevents_switch_state+0xfc/0x13c
> >      tick_broadcast_set_event+0x30/0xa4
> >      __tick_broadcast_oneshot_control+0x1e0/0x3a8
> >      tick_broadcast_oneshot_control+0x30/0x40
> >      cpuidle_enter_state+0x40c/0x680
> >      cpuidle_enter+0x30/0x40
> >      do_idle+0x1f4/0x26c
> >      cpu_startup_entry+0x34/0x40
> >      secondary_start_kernel+0x11c/0x13c
> >      __secondary_switched+0x74/0x78
> >
> > This series tries to address this by instead doing PM and clock
> > management at probe time, and leaving them on for the CMT channels that
> > are used as clock events. The CMT design is a bit messy as channels can
> > be used both as clock sources and events. And the design to do the
> > housekeeping for clock sources seems to be valid and is kept.
> >
> > This is posted as an RFC as there is one other driver in-tree that
> > suffers form similar issues. I intend to try and refactor that away too,
> > but would like to try and get some feedback first.
> >
> > The work is tested on R-Car M3N.
> >
> > Niklas Söderlund (2):
> >   clocksource/drivers/sh_cmt: Split start/stop of clock source and
> >     events
> >   clocksource/drivers/sh_cmt: Do not power down channels used for events
> 
> Thanks for your series!
> 
> I can confirm this fixes the issue on e.g. R-Car Gen3, where the CMT
> can be used for clock events or as a clock source, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for testing this.

> 
> On R-Mobile A1, the CMT is also used for periodic clock events.
> Your series seems to fix one invalid context, and expose a "new" one
> (lockdep shuts down after the first report):

Interesting find. Indeed this patch solves on issue just to uncover the 
next one. I have reworked the order of when the CMT is enabled in the 
probe call path to also solve this new uncovered issue and will post a 
v2.

Thanks for finding it, and for allowing me access to a R-Mobile A1 so I 
could fix it.

Please note when you test v2 on R-Mobile A1 you will still hit a splat 
"BUG: Invalid wait context" as fixing all CMT issues moves on and 
exposes issue with TMU (a different driver)... I intend to fix them too 
as soon as this CMT solution is acked as I suspect TMU have very similar 
issue as I try to fix in CMT with this work.

> 
>     sh_cmt e6138000.timer: ch0: used for clock events
>     sh_cmt e6138000.timer: ch0: used for periodic clock events
> 
>     =============================
>     [ BUG: Invalid wait context ]
>     6.17.0-rc5-armadillo-06055-g57d9d685e295 #872 Not tainted
>     -----------------------------
>     swapper/0/1 is trying to lock:
>     c0e5ae28 (enable_lock){....}-{3:3}, at: clk_enable_lock+0x38/0xc4
>     other info that might help us debug this:
>     context-{5:5}
>     2 locks held by swapper/0/1:
>      #0: c218e488 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xd8/0xf8
>      #1: c2201038 (&ch->lock){....}-{2:2}, at: sh_cmt_probe+0x598/0x780
>     stack backtrace:
>     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.17.0-rc5-armadillo-06055-g57d9d685e295 #872 NONE
>     Hardware name: Generic R8A7740 (Flattened Device Tree)
>     Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x44/0x74
>      dump_stack_lvl from __lock_acquire+0x41c/0x17e8
>      __lock_acquire from lock_acquire+0x208/0x28c
>      lock_acquire from _raw_spin_lock_irqsave+0x50/0x64
> 
>    - _raw_spin_lock_irqsave from __pm_runtime_resume+0x54/0x80
>    - __pm_runtime_resume from sh_cmt_start+0x60/0x26c
>    - sh_cmt_start from sh_cmt_clock_event_set_state+0x60/0xe8
>    - sh_cmt_clock_event_set_state from clockevents_switch_state+0x90/0x138
>    - clockevents_switch_state from clockevents_register_device+0x78/0xe8
>    - clockevents_register_device from sh_cmt_probe+0x588/0x700
>    + _raw_spin_lock_irqsave from clk_enable_lock+0x38/0xc4
>    + clk_enable_lock from clk_core_enable_lock+0xc/0x2c
>    + clk_core_enable_lock from sh_cmt_enable+0x28/0x1c8
>    + sh_cmt_enable from sh_cmt_probe+0x5a4/0x780
> 
>      sh_cmt_probe from platform_probe+0x58/0x90
>      platform_probe from really_probe+0x128/0x28c
>      really_probe from __driver_probe_device+0x16c/0x18c
>      __driver_probe_device from driver_probe_device+0x2c/0xa8
>      driver_probe_device from __driver_attach+0xe4/0xf8
>      __driver_attach from bus_for_each_dev+0x84/0xc8
>      bus_for_each_dev from bus_add_driver+0xd0/0x1d8
>      bus_add_driver from driver_register+0xb8/0x100
>      driver_register from do_one_initcall+0x74/0x1cc
>      do_one_initcall from kernel_init_freeable+0x224/0x294
>      kernel_init_freeable from kernel_init+0x14/0x12c
>      kernel_init from ret_from_fork+0x14/0x28
>     Exception stack(0xe0851fb0 to 0xe0851ff8)
>     1fa0:                                     00000000 00000000
> 00000000 00000000
>     1fc0: 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
>     1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund

