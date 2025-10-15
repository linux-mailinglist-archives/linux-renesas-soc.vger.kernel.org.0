Return-Path: <linux-renesas-soc+bounces-23064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A172BDE8CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F9D334E316
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEB31DD525;
	Wed, 15 Oct 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="UpIatez4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PBlbwjV3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7878118E1F;
	Wed, 15 Oct 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760532837; cv=none; b=RZIh2pK1pujEqi+AS2ZzKpCWR2Z5RGZ4s9ZjzXZOFbnnaxZnuP/jfG5ob2JgDv+ucQsgXlwc6gDPfxPnsRdazvQnokIjbUflDoN7MUsPXHa0LJ3IJhpUVKJf4yOjR2GAmf4IRr3rnaWKKeDbRhn7fWA+kzg5c1GUdS0/XosFUWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760532837; c=relaxed/simple;
	bh=uJZNOKO/SC/UjBzL5NrjhSpXoFBu1Otmg7C5BAFhkBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHX3gFaCTZ5mVPoQBeD51Stt0DHWlWV76npLtAsn+uU9dHGKXz3ZN+p8H+pddu1Eimhipyoa+r8IfV5cnukjrKOvUfJHtHl4/0fdAdXTYv5U1Z6QUBlos6bKgffDfAFcMGHmW/m/9IdzAJDchPQzdr+9aj/G4k96k87rJY0MC/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=UpIatez4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PBlbwjV3; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 869C27A01B5;
	Wed, 15 Oct 2025 08:53:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 15 Oct 2025 08:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760532833;
	 x=1760619233; bh=qwHU3H2dFBWiHBx0OCGb48HsMp6UrVcE9zk5vRHvjfY=; b=
	UpIatez4AjmUt1vA23jjnrX0n0tdcaw1QOKpJ8YQ3bgsX36eXCLKORSBRIL/HCke
	nUT0ffVAJ+W9yKQhvY382xIQ2aAqQ485f9jxF0JaCd5lwXASwZIOqHvKDDauwR+X
	kNM2BUvdwBpRWLwqpZjPg15j7pVcusZlrrVslb2TJgutxOzFSjEOQJ4SIOPsypv9
	hiqoiZmRpRNcEKYr+in1La+6Ft4OHFBlbKY/S+/Zm5IS49IcXcaQh7gUjaybEe39
	HPGKFGN84OY7cMnHCG0Hk6zL849f3eNQZYpYE5yfxWPqO2PR5yhfyx6DwCI6M4VM
	MTf1dAyPgkIWqPZ0an7l1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760532833; x=
	1760619233; bh=qwHU3H2dFBWiHBx0OCGb48HsMp6UrVcE9zk5vRHvjfY=; b=P
	BlbwjV3efQtaVd56NvL8RMdgWA0jcKmEacOpvLYBUafdFiJ2F10Pq/ItCaMvKrEA
	fBSDD48zCDGo99u3IYPuA6WtvaNrQFD0+H0Ay75uvtq/NQvIzEbbHy4uKSngxZPV
	U36NZW7A9UjYoYGypKzSrbNW/+KGxycseLgju2S4sHYOnaKMpNpEE2USSywkiX4D
	Du46meU83048BxdSB5HfoqbQwFYwx98D3tdNsV5ChpalS+t6nRpggCrx4jpjHOIe
	bMHrXoONNJ2Wiap5EH7ExA0HSu7TajwOSd0yOKIyyEAftgI42V3HPZKe+p1RSEVn
	fEUvkAyuGynjCgcNClafA==
X-ME-Sender: <xms:YJnvaIUBwXXW4hf1aveNEuwybe-XL41n-NQYR5iy9_ODnAhZ6vjDbg>
    <xme:YJnvaOFNyMw73XTl5d_j1OfoYRt-jYspRE-gBwXIxPGAeYomVKZd-LDRVME0viaZU
    eBp9-OP9E4JHMk0xEvyzg6ZraaRYLuStyxkCZ6SadXoty0Gn70mow>
X-ME-Received: <xmr:YJnvaMcLw0U6sLReuoB5xHV7dQKpnBzjXmznMjikirgSB_hFJOe9RAjPNzIPZ9IjsrE1m5vlh0-9-lEI82a1ZUj9ABYkWC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    ehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhm
    ieekkhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrh
    hordhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:YZnvaHInEWKRVeApQAUXB-JAmwVESqSx6ZTNHlmg_FIXoJ3uOHhDeA>
    <xmx:YZnvaJF_D7pjHMQ6oOjhjPRL-QYBS9SrZIZjqgVaL1CRIvY10E0Fkw>
    <xmx:YZnvaCDYUnRV5fzy8nNhr0_B9O2DRqlLuFrC-eSmprWOZOEkhV3arA>
    <xmx:YZnvaE8gtjtiXcOrsRrQw2VSUxERVk9BMOt8FUdrWMK4y2qceCxcpQ>
    <xmx:YZnvaMeFWQUrAO3BsheKY-fQ5_TKTcVyDJldxfjxUAtiJcUpaVafrBzV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 08:53:52 -0400 (EDT)
Date: Wed, 15 Oct 2025 14:53:50 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] clocksource/drivers/sh_cmt: Always leave device running
 after probe
Message-ID: <20251015125350.GA439570@ragnatech.se>
References: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXJfSoU-160BmD-obd7YZRdKT4z-P1YnrvvR1dq7XKaDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXJfSoU-160BmD-obd7YZRdKT4z-P1YnrvvR1dq7XKaDg@mail.gmail.com>

Hi Geert,

Thanks for your feedback and test!

On 2025-10-15 14:43:03 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Sun, 12 Oct 2025 at 11:10, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The CMT device can be used as both a clocksource and a clockevent
> > provider. The driver tries to be smart and power itself on and off, as
> > well as enabling and disabling its clock when it's not in operation.
> > This behavior is slightly altered if the CMT is used as an early
> > platform device in which case the device is left powered on after probe,
> > but the clock is still enabled and disabled at runtime.
> >
> > This have worked for a long time, but recent improvements in PREEMPT_RT
> 
> has
> 
> > and PROVE_LOCKING have highlighted an issue. As the CMT register itself
> 
> registers
> 
> > as a clockevent provided, clockevents_register_device(), it needs to use
> 
> provider
> 
> > raw spinlocks internally as this is the context of which the clockevent
> > framework interacts with the CMT driver. However in the context of
> > holding a raw spinlock the CMT driver can't really manage its power
> > state or clock with calls to pm_runtime_*() and clk_*() as these calls
> > end up in other platform drivers using regular spinlocks to control
> > power and clocks.
> >
> > This mix of spinlock contexts trips a lockdep warning.
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
> > For non-PREEMPT_RT builds this is not really an issue, but for
> > PREEMPT_RT builds where normal spinlocks can sleep this might be an
> > issue. Be cautious and always leave the power and clock running after
> > probe.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks, I gave this a try on various boards, no issues seen.
> I also force-disabled the TMU on R-Mobile A1, to make sure its known
> splat is not hiding any other locking problems.

Once we are happy with the CMT fix I will do something similar for TMU 
too.

> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

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

