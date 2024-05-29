Return-Path: <linux-renesas-soc+bounces-5660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED268D3B10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7987284969
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982471802B1;
	Wed, 29 May 2024 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FmfrGmOs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X7bxMkxN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfout5-smtp.messagingengine.com (wfout5-smtp.messagingengine.com [64.147.123.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A51591EC;
	Wed, 29 May 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996845; cv=none; b=T+6va54Y55h8MgSqoZWXn4KqpwAvlagi0gNKvQ7ad2dE6Df+JFq7zQBombQ+KgVwntfGfM9LdSlHBNsNS7bnm1H1+8RzdLRhn0fXbulM1K2756x3Aa9h2MmjCKMTyu5UVNXlNDi5AH2I09qFoKcyMifky7zl254H1Uo+kJlS604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996845; c=relaxed/simple;
	bh=xy2CgRWU2cL/KLJYR9p+sU9xLeAPmS9Czd0hJlj8kUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBAMAGl6nYpUQTri9lNG53oZV42QBkte68upORwV5IfL1vTqcIOvAfxcWEQ/1uE7r2q7KlTntA1KR6PTWerEAO+oRYpt16OJ3cTZzwkLWpIkRP+U6+WsC472CqIctGNY+a853WH9WAfODLUJHw2vCaw9qnmEp6wn6yNHNflLhPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FmfrGmOs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X7bxMkxN; arc=none smtp.client-ip=64.147.123.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id ADA3F1C00101;
	Wed, 29 May 2024 11:34:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 29 May 2024 11:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716996841;
	 x=1717083241; bh=Vz4iRPJgNKY4N27uJG0KVDwrEYi1ulOBt0/1OZe3FG4=; b=
	FmfrGmOsHrZhhVyFFM9702ba7wI70xs/FK/axv75rYDu5Cq2f+VYDbV6Lm80LBfJ
	2Xptj/uA4zYbUu67uKFpNHqaG5DIsObL5BcTuLHBkjpM7NTLkE1hPUnV3MhyOpRx
	vJqhgYe9gpj0gtVvp1e+WRktYJ/HHv382XEW4aYeMIBuEasN6iEflNLh2NuAAA5K
	LCUuTGRFJbPmAuD0E13Blp2BpCNj8gqt2ExMFRrHkhRRI+GU7TZFQXi/D4m3/Af2
	cj2xf4r3+2B4ry1/g9HClOX0yoKKMxkC6cad4H2I45h5Ojq0JzMgA9a7J4u83uLG
	BmLZjblv1So/Kh9LfG8HIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716996841; x=
	1717083241; bh=Vz4iRPJgNKY4N27uJG0KVDwrEYi1ulOBt0/1OZe3FG4=; b=X
	7bxMkxNVQFbiTYhxx+UT2GgtTxR3WeCbsqOAqzfw6IOo+96eCi5FHEReH49yjB2I
	BY9CTj5ifGDVUbSasvz2Xd0+8MA9apw2fVNjsYaeNpTcPU4qjWglhkwYOMMo4xKC
	XaZEXDYBT5F3jwmDiTsaonEnIWEhIh3uKavMK2BuDemohE9ZFX+xwJhwdqNMXuzb
	2oLJtRy8QxRvRQdC0M50/CTzlQcv5EXOBv4/EeBtbImxM0SO8D4uwktk0sOrCAnP
	XwxWlbdrYaErj+d6p+ZkspCvgvpS5IDw9050B+eaA2z8HGKr0l0af6Kd8pK5jaL+
	2ClvKqScUi5886B4JyKkQ==
X-ME-Sender: <xms:6UpXZqwAfrF_L0bEHptZD_jtFyxedBS7yTc66LS109xyAfYjoA7sYg>
    <xme:6UpXZmTtxtU7cqwY36-d1yPn3z4gQJxQqlkpwZC8ZSkQ21dzxjwjbSOvNfehlhjdh
    AHxjzFW_SxnrqQBnyI>
X-ME-Received: <xmr:6UpXZsVDi0a8cu50yV0eh3oEMAwk5r57Tttu9dhiDmGSUJSr8OV-O7Fe2GegpWOOJ-13hNxroQf6giHfvDSTp3lV5pen7Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:6UpXZghFrrwuyMq77fgFlU9TeUDm_b_ykCr7v5KrLJPYR1Y55911Fw>
    <xmx:6UpXZsBY3Ld0s46Wu5yBG-LK-Cx2yQ8PTBjx4KQBTSGCknhJdhkVSQ>
    <xmx:6UpXZhLmdBKuVRHUz5erchYq1duAmqk4VZ590fmRGqkECIwOOfSOhg>
    <xmx:6UpXZjCzrwkbZBUeOp1bTDcmgTmyV_ARztQLMvVfLnT6ahrF4jrpbg>
    <xmx:6UpXZvM7OVCtuFDoZSayl9a8S73o7JC-P8b3RYQgso5cfXU4GiIowvNO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 May 2024 11:34:00 -0400 (EDT)
Date: Wed, 29 May 2024 17:33:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: renesas: r8a779h0: Add VIN clocks
Message-ID: <20240529153359.GB710180@ragnatech.se>
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527131541.1676525-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUyZGE6p2D-LRiZHOZn2wiB0=qK3n4DtOQSboc16-=KtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUyZGE6p2D-LRiZHOZn2wiB0=qK3n4DtOQSboc16-=KtA@mail.gmail.com>

Hi Geert,

Thanks for your review.

On 2024-05-29 17:01:20 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, May 27, 2024 at 3:16 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add the VIN module clocks, which are used by the VIN modules on the
> > Renesas R-Car V4M (R8A779H0) SoC.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > @@ -188,6 +188,22 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
> >         DEF_MOD("sdhi0",        706,    R8A779H0_CLK_SD0),
> >         DEF_MOD("sydm1",        709,    R8A779H0_CLK_S0D6_PER),
> >         DEF_MOD("sydm2",        710,    R8A779H0_CLK_S0D6_PER),
> > +       DEF_MOD("vin0",         730,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin1",         731,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin2",         800,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin3",         801,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin4",         802,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin5",         803,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin6",         804,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin7",         805,    R8A779H0_CLK_S0D1_VIO),
> 
> According to the documentation for the Module Stop Control Registers
> 7 and 8, these are called "vin0[1-7]" instead of "vin[1-7]".

Will fix.

> 
> > +       DEF_MOD("vin10",        806,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin11",        807,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin12",        808,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin13",        809,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin14",        810,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D1_VIO),
> > +       DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D1_VIO),
> 
> According to Table 8.1.4a ("Lists of CPG clocks generated from PLL1")
> the parent clock is S0D4_VIO.

Will fix.

> 
> >         DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
> >         DEF_MOD("pfc0",         915,    R8A779H0_CLK_CP),
> >         DEF_MOD("pfc1",         916,    R8A779H0_CLK_CP),
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

