Return-Path: <linux-renesas-soc+bounces-12225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D78A1549B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 17:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3411883D8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2025 16:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB32633062;
	Fri, 17 Jan 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eB7IjQnQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="yfavyIiG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B919E7F9;
	Fri, 17 Jan 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132293; cv=none; b=IKCHsvGT8JHEBD7vtez8WH8e9+M4rl/7h61tXgmjxkD3abtuJFQZ8lSkBY+C24iJ2vpwUWnkURmJZ+KJXe9Y9J8D5bh5SJkzTLEn+xTTKzMKtlX6uKkwvUJ2VCGwPRDI99RsFz/n0G3jm8ceImi7k6AF+hgi002Fs2tW4mNkWc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132293; c=relaxed/simple;
	bh=9Q3yRNfJco0VNAltRjiGFW/vgNXLbGHK4M13NZ3uLtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHAQXLf9+760jAuTCdRtwMp4IMTetmCTJjBDU1s+zFhNsftHTqfJwDasNMpyJLSD9dopATstSyXPZz+WD38+Pg0JHfZgn9upbzoDo/Mle9zJsTLXPpo6up69APyMPmwZGE1O1x+GpPa9Z/Lg+97cHqiIMwhZCgNk8vR3z+0Z7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eB7IjQnQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=yfavyIiG; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6EA1E11401B8;
	Fri, 17 Jan 2025 11:44:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jan 2025 11:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1737132287;
	 x=1737218687; bh=1wbw0VK9aM1Y3lOusn6yLhQR4rGsHCgdXds7DS9tL7c=; b=
	eB7IjQnQZSPGPkwYeZH7VXWoKmpLKss8V2kDxglhfNJsAVGZ0c8Ovk5OB6CIGvmY
	VBcHGg8mlyDbsOR3kTDvMXomr7ICBzg9glvSJ/EE4CS+b1gYVNADojOLV6xhOPVC
	E2bfyApoi7h36POxQ0SAfLFnIQyXwutmaMbgcynDVazw9W2pdbPSSfw8jc///PNg
	6QFZrFYDmfzMa/h1f+vg8vWcSrRVbnwKoCnS7jGHUUGAyd2yURlAtyqMlESkJ0+g
	SeE4Dff+laq4/LBgltKenQlS8DlRzjJRtnQ1ktZAcyabFWW8SwPma1L3BtNZwP8G
	io2bFET4PxXruWORU7kqtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737132287; x=
	1737218687; bh=1wbw0VK9aM1Y3lOusn6yLhQR4rGsHCgdXds7DS9tL7c=; b=y
	favyIiGe7W1SzEHsMb4slzN2Vk1RiaxVcMPhRagVFEDxbkGyxuB9YOirf08++9Ie
	F9h32qI6uZ7R2p001Y1foIJlQNU+6gDzXqQGtgOvjmkeR27IN1P4mKdPeBA+CSZf
	qz4PpRlX9v7WyHTmDTbveTNnCnD/zSd8SisDabSzWRjRKxUZtOY6OsTLZ05fF7nA
	5TPcOnrsclFzR6WqPBOab3SXVnFymnicabWRl2TjX/CPzfV7wOEViXqoMQpLxpc0
	OzChsaqL5XUPLLpfbhs1Z1qqCuUkX7mX5T3+NKvk73KB/kjeGtUEaXYEXClh3SLy
	WLR4b9JfiqhNG21G9fIVg==
X-ME-Sender: <xms:_4iKZ0l0RiQExZ1XRSRlQvhO9uq9Z_JrizwAew6Cuta2ZoUcmMYDvA>
    <xme:_4iKZz01u4ejWlsBoWjSHMbcBtfFWWiBqrYi-kUj7I1EWUgFcv-3UR8BUePA7aQgm
    jZOKtr4qtNG-JT1UP0>
X-ME-Received: <xmr:_4iKZyrRJu7OifUG6S0nsOI_Wdl3WfhwgZH_ETRA0E4NlAYCwgY7y05wH1ON8YrWkzYvTmC52w3SVSpu8IVmURB2x0goLfqTEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
    vggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvg
    hnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_4iKZwk3Dsqxz-t95oFbZXuZ0CZ0Ky2BpZqPgdwARz3-kGUqLIr78g>
    <xmx:_4iKZy1JD5Q0xgDBwQ-OZErtRmPP7_NKWpPkfMd7sDUmBnV65LbXQw>
    <xmx:_4iKZ3syo8Loeawc04iqbEwobf6BF4nB0uIfH28eROgjAOEbJN9w8Q>
    <xmx:_4iKZ-WR2CTqRvqyil1hLUa9cwSr0rSrvvLS2mqdZgsr4cbl4y4dDA>
    <xmx:_4iKZ3xM0wk-AHxeJ4fo7w13SzKuEQIBY4xg-jtlMud-nCINLtMVSZE0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jan 2025 11:44:46 -0500 (EST)
Date: Fri, 17 Jan 2025 17:44:43 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: r8a779h0: Add FCPVX clock
Message-ID: <20250117164443.GF873961@ragnatech.se>
References: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se>
 <20250115175927.3714357-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUgRJB03rGrVzG2Ft3XJ+0eXbHMHtxbpOkh2A5vRzRhtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUgRJB03rGrVzG2Ft3XJ+0eXbHMHtxbpOkh2A5vRzRhtA@mail.gmail.com>

Hello Geert,

Thanks for your feedback.

On 2025-01-17 17:29:21 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Jan 15, 2025 at 6:59 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add the FCPVX modules clock for Renesas R-Car V4M.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.15.
> 
> > --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > @@ -239,6 +239,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
> >         DEF_MOD("pfc1",         916,    R8A779H0_CLK_CP),
> >         DEF_MOD("pfc2",         917,    R8A779H0_CLK_CP),
> >         DEF_MOD("tsc2:tsc1",    919,    R8A779H0_CLK_CL16M),
> > +       DEF_MOD("fcpvx0",       1100,   R8A779H0_CLK_S0D4_VIO),
> 
> Any specific reason you are not using S0D1, like on R-Car V4H?
> I can update this while applying.

Nice catch it should be S0D1. I picked it since it listed both FCPVX and 
VSPX, and I compared it to S0D2 which only lists FCPVX. Checking the 
datasheet again now after your feedback I see indeed S0D1 also lists 
both FCPVX and VSPX.

Thanks for fixing this while applying, same comment for 2/2.

> 
> >         DEF_MOD("ssiu",         2926,   R8A779H0_CLK_S0D6_PER),
> >         DEF_MOD("ssi",          2927,   R8A779H0_CLK_S0D6_PER),
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

