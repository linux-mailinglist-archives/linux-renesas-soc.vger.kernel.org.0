Return-Path: <linux-renesas-soc+bounces-22847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F3BCA8C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D8774847F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFAE24DCFD;
	Thu,  9 Oct 2025 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="od93zvom";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pLthQ6Mu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32924BD03;
	Thu,  9 Oct 2025 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033577; cv=none; b=g5rJUM/BRroep2eYzj7qTLMX6ShEk7rUOTAwZtA4v3z+axpZig+iGTkM3+fvcMwoDjKIZJFhT0Wv5QhjqcxcBkDffmrroYHYEezdfg3aLPUqWII3vNp4u8SMuXklNocx7WBdmQ3F4iN4HfvaUe8Ip/gGGWXGMOtrjJ+G0Jib6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033577; c=relaxed/simple;
	bh=iXj2HYV1s3ATEkhcscqNZs7/IKnrkOl0Nwe/bos6hBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENWpDYtkpFuObhshLENvBy9Ryw0vSwu3Q4J3yaszByT69ZNMS49EBJx931wlzE7SfxqSOngIs9jSrLL7BXSOJ6fyxGh61Gzm+4gwWNmdKNfgNnnTnOQBJ2bGm0uAmOb/erWiI/My62QFzHSRxU2WLE9G9J0f4EN0g8mrubvrs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=od93zvom; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pLthQ6Mu; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 759BB1D0003C;
	Thu,  9 Oct 2025 14:12:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 09 Oct 2025 14:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760033573;
	 x=1760119973; bh=2ARSzrDkgF/WLyQlIcPcdMxriBnwEIQrbWwts1neh+8=; b=
	od93zvomj56Xm3dV0itATqt/d6MSb0ZNCucalnxN0/SvAwF/mBjxP2+CGh01Z1wl
	dDJRVzG2cILIVzTdNxuIishUFkEdH8CkkWUcXL9AGKFX+/gvCRGo7jbWmKFg4ezY
	7Hu2MWQf9+GBisQELZcZjswNvMHMgY6fkvIU+95X/m4qJRgMOQwt0286xzWt9wU7
	jW8RrLLXYj0nGp7kXAsdt257PYybshhvwkUmpWeYUQiOXs4RQhD8BfiupDLdYvUY
	Y/tLZ+kPCbGxVLRy+LKn5fCGHpnmHX5Y2PFj83KSngYkZ2fidiF4DDbmdC6FbJZe
	X5pSH3GUZIRQtE2mkgCUdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760033573; x=
	1760119973; bh=2ARSzrDkgF/WLyQlIcPcdMxriBnwEIQrbWwts1neh+8=; b=p
	LthQ6Murzp57zj6mK+lfJrNEHcmz25Q8vEvLAwmJSQ7Cjw/QARRQAQnUVvTxv/+r
	lhjfIjB+bikp2h/WKT/HtES5FlRBaoBFqmYLowJJQ/i/1JQbrmCnxdD6t1W7kzdQ
	uFMTxNxdFfNwIPrQqvIbli6PnQZV2XVd5SOqL+eB5odxhtB77VwI1Q59k+eVkiMX
	OkYjk09iq9Zq0zjizZj71F/YM61sMb4qAevwzJDx6zydw7idKK7HhK/6G6l8Bz6l
	4ZRaJfDc78OEO2dO4SvQTTHo6bhodKUPbpD7ITtdFW37Id9BEoPqe7tqmHrWY7/A
	qUZMn1hfIfOlGCCuf++/g==
X-ME-Sender: <xms:JPvnaIaJfmIleBe2TL4CmVDNBBY7UDPsDSUprixJKwCiXN-ysMQ_Xg>
    <xme:JPvnaMth5H4afVo1xMo-G3vKGPUD0X6g-m8UFv_co2cgPp7Dr07-PfZ9d0ogtwtoX
    6NksiY81itxvN6P79TTQUB4nftu1TNADlBU3gEKu-VHuszXuL66mFw>
X-ME-Received: <xmr:JPvnaKPUs8511TbgPielHdsu6sTVQehMhU8ibXbRW8FWJenTSGHnibM0X6eA1u5e_vFBkalNP7u8UcKmminwZt68GtFjaec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdeikeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehm
    rghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhgpdhrtghpth
    htoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsoh
    ihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdq
    shhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JPvnaD4aEIP8dAC91VGsYedzba1DREgXPdqgV4uSjUa_LPWTx5rWmw>
    <xmx:JPvnaARXn0hRYz4yBebk4kJtjfTI60rMReTOxsmfhEE20PeJrYf5EQ>
    <xmx:JPvnaACpg8LrRBwptd9MqOkjd0Xi4dobqFm40qBjQSt-VfNGgjD2UA>
    <xmx:JPvnaAHRKNP1IuKq6BBFmy1gI1lFp1rBRv3PeXwW_fGiqdYHQW2rCg>
    <xmx:JfvnaF9e0FIU2o0rQQoy8wwPGHhDQd3GJ34LsxNwBvo_bNWdLOjGvD67>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Oct 2025 14:12:52 -0400 (EDT)
Date: Thu, 9 Oct 2025 20:12:50 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
Message-ID: <20251009181250.GB2550463@ragnatech.se>
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se>
 <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
 <20251006122338.GB1353934@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006122338.GB1353934@ragnatech.se>

Hello,

On 2025-10-06 14:23:42 +0200, Niklas Söderlund wrote:
> On 2025-10-06 13:53:34 +0200, Geert Uytterhoeven wrote:
> > Hi Niklas,
> > 
> > On Fri, 3 Oct 2025 at 17:08, Niklas Söderlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> > > > after reset has been asserted by writing a matching reset bit into register
> > > > SRCR, it is mandatory to wait 1ms.
> > > >
> > > > This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> > > > whether S4 is affected as well. This patch does apply the extra delay on
> > > > R-Car S4 as well.
> > > >
> > > > Fix the reset driver to respect the additional delay when toggling resets.
> > > > Drivers which use separate reset_control_(de)assert() must assure matching
> > > > delay in their driver code.
> > > >
> > > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > 
> > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> > > >       /* Reset module */
> > > >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > >
> > > > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> > > > -     udelay(35);
> > > > +     /*
> > > > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > +      * On older SoCs, delay after SRCR has been written is 35us
> > > > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > > +      */
> > > > +     if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> > > > +             usleep_range(1000, 2000);
> > > > +     else
> > > > +             usleep_range(35, 1000);
> > >
> > > I rebased the R-Car ISP work to renesas-drivers today and it included
> > > this change, and I seem to have hit an issue with the switch form
> > > udelay() to usleep_range() I'm afraid. I can't find any other good
> > > reproducer of the issue however.
> > 
> > Yeah, AFAIK we didn't have any callers of reset_control_assert() from
> > atomic context, but I was already afraid one was going to pop up...
> > 
> > > THe core of the issue seems to be that if a reset is issued from an
> > > atomic context bad things happen if you try to sleep. I get this splat
> > > and the board is completer dead after it, needing a power cycle to
> > > recover.
> > >
> > > If I revert this patch things work as expected.
> > >
> > > [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002
> > 
> > > [   29.265595]  reset_control_reset+0x4c/0x160
> > > [   29.265604]  risp_core_start_streaming+0x100/0x440
> > > [   29.265609]  risp_io_start_streaming+0x74/0x108
> > 
> > The existing udelay(2000) after the call to reset_control_reset() is
> > also a bit gross.
> 
> Haha, I agree :-)
> 
> > I understand you are using a spinlock because you
> > need to synchronize with an interrupt handler.  Would converting to a
> > threaded interrupt handler and using a mutex (which the code already
> > uses) instead be an option?
> 
> Yes and no. For the current use-case where the ISP is used in off-line 
> mode, that is userspace dequeue images from VIN and then queues them to 
> the ISP, it could work. But if we ever want to support the ISP in 
> in-line mode, that is the CSI-2 Rx queues the frames directly to the ISP 
> I think a threaded interrupt handler would be to slow to change ISP 
> parameters between each frame.
> 
> But that can also be a future problem, I will see what I can do.

With a bit of work I have reworked the ISP driver to reset the core from 
a context that can sleep. Without the need for a threaded interrupt 
handler. Thanks for all the tips shared on IRC Geert and Marek.

I now have no known case where usleep_range() in cpg_mssr_reset() causes 
issues. If I trip any more I will let you guys know.

> 
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > -- 
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> 
> -- 
> Kind Regards,
> Niklas Söderlund

-- 
Kind Regards,
Niklas Söderlund

