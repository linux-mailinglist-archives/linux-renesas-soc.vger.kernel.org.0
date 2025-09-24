Return-Path: <linux-renesas-soc+bounces-22308-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D030BB99266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 11:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1803BB073
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 09:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3C828152A;
	Wed, 24 Sep 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AOXDa/JS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E302sa9u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F95323C516;
	Wed, 24 Sep 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758706303; cv=none; b=g5ZocITtt460UTRQl6XBBrztWHqdosOejHnH5sd5t8AhjPNeIBNRDulE7jbmKvDadEPa7sjawzTtTyyHQnONoiKqjwrRgDDU4r31JSXyKL+jmm68ZQAAr3JyaT5Tm5XgwCeawpEvnKTkK7iE3039uhhQFt9yaYHxvSfsZIvlSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758706303; c=relaxed/simple;
	bh=CcIEs/GJMzf7K6kVzw9dCTGNUpyCxlX0WmH7ntOcZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0bDstz77I7r+3p99Hgift0MD/UUf0VgtcVFgW9nLCVXh1PP8gja92hVMkP0SP9fHKM8HOsN0Jx9Ykr9kPPZJfPlbAulqmo41UM17yNX1ke2uqg6zV5ounNKi1FprZ4YJjbsa8W+efHlC/HFt1Pw8cbQjd26j8+ClULGy718jeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AOXDa/JS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E302sa9u; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 4DF8B1D0007F;
	Wed, 24 Sep 2025 05:31:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 24 Sep 2025 05:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758706296;
	 x=1758792696; bh=P6QfaC0TlJK2Y4jx621mIF5+iuLxN/2Jm+ND4DQ4N8w=; b=
	AOXDa/JSdGnutqwAXU8Z++iunS6AkmUjlzqUotAkvgu1X4uOjoyubokOfI69oKVa
	QnC7YNUybWMBc4mkXUWsrETuY0y8T6Cp5oedGh9VMHrCAGcZ2PHBKvcGKeaZOCqS
	MPPwqpdd/7XAWke2k0nzvQUUaE2PUK3qquCqn8f39g3C9zL1HwGyYfBHzNlJ1izc
	A7z/2/tpoP7p+mHPUBQ2qNnVwoJTSu8Mjeoyyw0m7t0v60LFhLupicoo/P+zTOc0
	ZiMaF4ize9biwbgwLjWNMl27kv+ZTYAe+BJHkpub4gKG2Xed8i/seQDsF4OvZt96
	pFMyoMx31vAlsfSa3dV+qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758706296; x=
	1758792696; bh=P6QfaC0TlJK2Y4jx621mIF5+iuLxN/2Jm+ND4DQ4N8w=; b=E
	302sa9uUOJxIWnDyrHMb7ti8cn/h77StzB++JOFW7mv3dEeY0LWGuleyfrpXB60w
	dr7ieqcZ8ZhE5hDQhK/sOYYBZdCAmzyvy5XDURxYJKifYTxtkvnvULNyypNiuzgn
	dgJN0jBy+ujx6I/HivoifvUJRt9NyxRUuNsi36SrYqmD5642PTwy0i7BZGVzPn52
	4srkObeAUdicke7S6vAULIWwV/4qDr+0PUxgc3445rBqEhEj5fRLjdGkVmHl2EhU
	kTyc8MjZMiVOtfDN0m7vefypQDKpP+sVs1oC5uCDb/WlPWVmtmDX+A4TAQM8xeKC
	fsZlMbTfPd7UWGYxxolLQ==
X-ME-Sender: <xms:d7rTaFOrqpVHG1T6WZJBP03rsV1neP0RS4_Ay4MhFP2BecGGXBgEIQ>
    <xme:d7rTaJeuvH9yYsgtJ4eHSJzVThk-IUrrEmexmHEcpTZfuuOOK62nsVGYDrdxdh5Qh
    VHGC5UBiDRJONr0r86FZ3KzILpes4f-hpukWHFRJ_lMBF3gr9Qzp1g>
X-ME-Received: <xmr:d7rTaEW9ewK5dSWMbT3J5EpbNYMBXYyWcmpB5d9ysaFI18x4bI6S1PVKchj5duLRWvBk72G4mfvyuXIVpHpOAFdaiy-XZw0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeifedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepjeevhedutdfgteeu
    tdfffeehhedtfeeljeegffdutedttdevffduveduledvudegnecuffhomhgrihhnpehlih
    hnrghrohdrohhrghdpfhgrtggvsghoohhkrdgtohhmpdhtfihithhtvghrrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgs
    pghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivg
    hlrdhlvgiitggrnhhosehlihhnrghrohdrohhrghdprhgtphhtthhopehgvggvrhhtsehl
    ihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnih
    igrdguvgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:d7rTaBjuU5A8IShszKu2O7n-L1gnJ7s62w4FLUJpaPUSPuuFkgt_wQ>
    <xmx:d7rTaD84_3-7dfbnWem4ICLJ8bTzjqJ2Ho-OTwYRkQ_4yPL7dSl63Q>
    <xmx:d7rTaDbOuD9uIwLb-X6iHbxyMMMyobQ97aUintgOehSWyB6Jr7Eq3A>
    <xmx:d7rTaK2rf2Fx_A2Ur_dnJ70Jg3O4WRdqfLXJUQjaopUr-ehidvEKQQ>
    <xmx:eLrTaH0fFP6cCnJMm4tJGUKoIq6ZU-HUNUCKIrkceCXWy6l97x0yxEBZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 05:31:35 -0400 (EDT)
Date: Wed, 24 Sep 2025 11:31:32 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
Message-ID: <20250924093132.GA1062104@ragnatech.se>
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se>
 <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
 <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8672a8c1-26b2-4b65-a30e-a4c3e0f1f32e@linaro.org>

Hi Daniel,

On 2025-09-24 11:19:21 +0200, Daniel Lezcano wrote:
> 
> Hi Geert,
> 
> On 23/09/2025 16:56, Geert Uytterhoeven wrote:
> > Hi Niklas,
> > 
> > On Wed, 10 Sept 2025 at 16:27, Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The CMT do runtime PM and call clk_enable()/clk_disable() when a new
> > > clock event is register and the CMT is not already started. This is not
> > > always possible as a spinlock is also needed to sync the internals of
> > > the CMT. Running with PROVE_LOCKING uncovers one such issue.
> > > 
> > >      =============================
> > >      [ BUG: Invalid wait context ]
> > >      6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
> > >      -----------------------------
> > >      swapper/1/0 is trying to lock:
> > >      ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume+0x38/0x88
> > >      ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400001/0xDCC63000, Driver version 5.0
> > >      other info that might help us debug this:
> > >      ccree e6601000.crypto: ARM ccree device initialized
> > >      context-{5:5}
> > >      2 locks held by swapper/1/0:
> > >       #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_control+0xa4/0x3a8
> > >       #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
> > >      usbcore: registered new interface driver usbhid
> > >      , at: sh_cmt_start+0x30/0x364
> > >      stack backtrace:
> > >      CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 PREEMPT
> > >      Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> > >      Call trace:
> > >       show_stack+0x14/0x1c (C)
> > >       dump_stack_lvl+0x6c/0x90
> > >       dump_stack+0x14/0x1c
> > >       __lock_acquire+0x904/0x1584
> > >       lock_acquire+0x220/0x34c
> > >       _raw_spin_lock_irqsave+0x58/0x80
> > >       __pm_runtime_resume+0x38/0x88
> > >       sh_cmt_start+0x54/0x364
> > >       sh_cmt_clock_event_set_oneshot+0x64/0xb8
> > >       clockevents_switch_state+0xfc/0x13c
> > >       tick_broadcast_set_event+0x30/0xa4
> > >       __tick_broadcast_oneshot_control+0x1e0/0x3a8
> > >       tick_broadcast_oneshot_control+0x30/0x40
> > >       cpuidle_enter_state+0x40c/0x680
> > >       cpuidle_enter+0x30/0x40
> > >       do_idle+0x1f4/0x26c
> > >       cpu_startup_entry+0x34/0x40
> > >       secondary_start_kernel+0x11c/0x13c
> > >       __secondary_switched+0x74/0x78
> > > 
> > > Fix this by unconditionally powering on and enabling the needed clocks
> > > for all CMT channels which are used for clock events. Do this before
> > > registering any clock source or event to avid having to take the
> > > spin lock at probe time.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > > * Changes since v1
> > > - Move the unconditional power on case before registering any clock
> > >    source or event to avoid having to use the spinlock to synchronize the
> > >    powerup sequence in probe.
> > 
> > Thanks for your patch, which is now commit cfbc0f1d24030ff9
> > ("clocksource/drivers/sh_cmt: Do not power down channels used for
> > events") in clockevents/timers/drivers/next.
> > 
> > Unfortunately this commit introduces an s2ram regression on e.g.
> > Atmark Techo Armadillo-800EVA with R-Mobile A1: the system wakes
> > up immediately.  There is no evidence of a wake-up event shown in
> > /sys/kernel/debug/wakeup_sources.  This happens with or without
> > console_suspend enabled.
> > 
> > Reverting this commit fixes the issue.  I suspect the system wakes up
> > because the periodic clock event fires, and causes an interrupt.
> 
> I'm about to send a PR.
> 
> Shall I drop this change which fixes a lock issue or keep it ?
> 
> What has the higher priority ?

If it's not too late I think we should drop it. The issue this work 
tries to solve is a lockdep blurb which highlights a design issue in the 
driver. But the driver have function properly in the past. So I think 
it's better I work on solving the blurb without any regressions.

Thanks for checking.

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

