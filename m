Return-Path: <linux-renesas-soc+bounces-22700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C5BBE044
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 14:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C04A189718D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 12:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293F727F724;
	Mon,  6 Oct 2025 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="T94CrnWg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qUODGQrE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24327E07E;
	Mon,  6 Oct 2025 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753425; cv=none; b=or7DmFA3giCTz6Yt2SLayu9z1UTMOSqxjlvn4ePX0YA4ZbxX8CUit8zYG4d6f/76kr7QyjY+yLJQ+8u73ENUI2+ZAwEcmxt4wxvaBBuDBiXwmxv1y1Smg6STFM/bqV74bEP6tML9IZYu8I1FG7Z60pFB+CC7okjmR0IRPVzEPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753425; c=relaxed/simple;
	bh=JW9AjJTwskhiSsvLHVksjR4Yh5RYY8J5kRftJwvfmGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvfKhDs7BbFyjkSiPbYDyfUJwdgx6aVeJDbsJQGtwNcEulnVttGNC5Iz2+hm1j+ar9J+4UwFslKhjCznD6ImDvrMJBpB23wvNjgPdG95vGQqU7cpaH5o8MWQ5rMLuYdPIEfaquNYsKpALmfgVMU+r5CmdV5KLqnlLGUF2CIhB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=T94CrnWg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qUODGQrE; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AA6C21D001B3;
	Mon,  6 Oct 2025 08:23:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 06 Oct 2025 08:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759753421;
	 x=1759839821; bh=HHRWfj9nZcHamSWr5nC9AW7Sli28G72oI6+akm7FbLM=; b=
	T94CrnWgc1JcZE/Rf8GzgKs6EWo8qdGo3AiLlErzMY1icYyXRncMtx0SE5kGsEkW
	LIgUMTzYVZhnuvxVXL7WyQp5UWNvH6JoMMUhYeWK2Kcwez97INuJDZH2Ry1A1lYP
	/kTqPuLWw2038hhaEORhZgVo2pYNSCZQ+lwzt7rRYvPFFMeF/fnp2GYTBLq4YI7T
	4jJPviVrAfemPOEmZh3CNOu1A7jUJ/MOVrSR7BZOQvYOQAJoPX/dJgL3aWUd4BM4
	pQWSFqZABDi3521tONUtaohOjnHJ3ppHxMG9CEkDg9NovB34WKRsnVruvnZSNgNi
	/O0VaBqlxWE45z0aIPuAhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759753421; x=
	1759839821; bh=HHRWfj9nZcHamSWr5nC9AW7Sli28G72oI6+akm7FbLM=; b=q
	UODGQrEFJ4qjDn6ZzQWyUPcx3IpG1SWnPhBsRUAdd4vZoemaSvGf4HpzYfWKxY8S
	2vPI48i3R4A4hAK/r3+Z14z30V3Mqk4vhDa+6A7IhyM9j2Lg91a+05HJ1mt+Whia
	eSp6nS6ARUI6amS4jbTLZ0fpZMM9DIhPxAGZ+BYEbqGiMYq+3QpewgHR4cHV3NzZ
	JGwncdSROfC03nVQju/y3t16cYcAYl80a66J+Xp+lZHYbzEddtV8JRjex3Xj5X6U
	y8+EiU1V6iZYqrYr1iBml/EMEAYxBmGUP93UpkogG9swKhK2rfwFdoC2wrisZ9Uq
	I55c4GkMrfBI13Glbt+Lw==
X-ME-Sender: <xms:zbTjaKVIQ5qktna8xDBB62H1tKRfc3rcDt-Fv7BoAwuDcZY9o5kHdw>
    <xme:zbTjaP6b8xM8DqagGNPug77LUYm2mXm9YYlvYp5SDSjHMdmgsbUQErIPE8d4HKcj8
    z84xW53iF1Im4RUyyBPwhACLs2wtdYJvfCbyt7seuUkzgLVcAXrGgND>
X-ME-Received: <xmr:zbTjaFpufdU6mINeQ3b3vQIWg8gfbQWV0SVb73YTXQ8zmr6lKc32PUSjyKwm1JzUaEnNgAlNryUaL9rHDBuJ0hZtH44e04M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeljeehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepmhgr
    rhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrghdprhgtphhtth
    hopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    mhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehssghohi
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhs
    ohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zbTjaCn3tO28sM7Yj-Xf5uQlEgY2CJabFEtq9d9m9jrXBUOU7lxhTw>
    <xmx:zbTjaBOJ8EHkOVAxfjU-mZHj79YAg0RLnrZij4Rf2F2YNoyxasovSA>
    <xmx:zbTjaGNz4wQv7jR4lqPqmlC9pUnWn7ypJ0IUhB-Hwp0xFRxPSwm8Hw>
    <xmx:zbTjaCjvCpPEpHLrFjIpK8ubVqT00CugGlO-OZuhWGKeY7rwmXFm-g>
    <xmx:zbTjaDYSIbdD0V9I570XDYqloI1BqBUIYgENDEZcZ3BNLrB3zL0pv8QT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Oct 2025 08:23:40 -0400 (EDT)
Date: Mon, 6 Oct 2025 14:23:38 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
Message-ID: <20251006122338.GB1353934@ragnatech.se>
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>

On 2025-10-06 13:53:34 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, 3 Oct 2025 at 17:08, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > after reset has been asserted by writing a matching reset bit into register
> > > SRCR, it is mandatory to wait 1ms.
> > >
> > > This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> > > whether S4 is affected as well. This patch does apply the extra delay on
> > > R-Car S4 as well.
> > >
> > > Fix the reset driver to respect the additional delay when toggling resets.
> > > Drivers which use separate reset_control_(de)assert() must assure matching
> > > delay in their driver code.
> > >
> > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> > >       /* Reset module */
> > >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > >
> > > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> > > -     udelay(35);
> > > +     /*
> > > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > +      * On older SoCs, delay after SRCR has been written is 35us
> > > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > +      */
> > > +     if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > +             usleep_range(1000, 2000);
> > > +     else
> > > +             usleep_range(35, 1000);
> >
> > I rebased the R-Car ISP work to renesas-drivers today and it included
> > this change, and I seem to have hit an issue with the switch form
> > udelay() to usleep_range() I'm afraid. I can't find any other good
> > reproducer of the issue however.
> 
> Yeah, AFAIK we didn't have any callers of reset_control_assert() from
> atomic context, but I was already afraid one was going to pop up...
> 
> > THe core of the issue seems to be that if a reset is issued from an
> > atomic context bad things happen if you try to sleep. I get this splat
> > and the board is completer dead after it, needing a power cycle to
> > recover.
> >
> > If I revert this patch things work as expected.
> >
> > [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002
> 
> > [   29.265595]  reset_control_reset+0x4c/0x160
> > [   29.265604]  risp_core_start_streaming+0x100/0x440
> > [   29.265609]  risp_io_start_streaming+0x74/0x108
> 
> The existing udelay(2000) after the call to reset_control_reset() is
> also a bit gross.

Haha, I agree :-)

> I understand you are using a spinlock because you
> need to synchronize with an interrupt handler.  Would converting to a
> threaded interrupt handler and using a mutex (which the code already
> uses) instead be an option?

Yes and no. For the current use-case where the ISP is used in off-line 
mode, that is userspace dequeue images from VIN and then queues them to 
the ISP, it could work. But if we ever want to support the ISP in 
in-line mode, that is the CSI-2 Rx queues the frames directly to the ISP 
I think a threaded interrupt handler would be to slow to change ISP 
parameters between each frame.

But that can also be a future problem, I will see what I can do.

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

