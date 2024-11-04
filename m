Return-Path: <linux-renesas-soc+bounces-10284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A489BB6C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50361C2349E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7816242AB1;
	Mon,  4 Nov 2024 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WK1qZUBl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N3mxGdu7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B88BEE;
	Mon,  4 Nov 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728361; cv=none; b=TIYkhlEziDW+bRhVTZXFkHNChkScaEXbtAiWMyupb3zrtxD8Zc385xOAX8J9ArIMYkV3t3BHNbuPHzDvVwCBfdLhB9Ca3Wjz3ybQn+bQVhnEKi0nrcxdS9F0ScO/itc9TjRgfFgXxJhU8gImNgkIoxKLW6tNtkT/rrEtC76lDwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728361; c=relaxed/simple;
	bh=J22m2dLEM2JGyWrp4WebPPffap8OOMB8riKgDP5fgac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiWMUe81NojejeUGgwKxMmVod8+OVGaMkqC2ZOCYNQGVasfqOZrX2pIHEmg1v5iL6MV0s3okAtQ0eIrUABNb2y9VpsZNhZ8UPJmD8gCG0CPcs4ufDeyOwUQYkggxdoo0e9vY3Yb7gmWVyJqIzgv2FAskxBnfVogdAIzPB3Sz3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WK1qZUBl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N3mxGdu7; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D37E72540128;
	Mon,  4 Nov 2024 08:52:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 04 Nov 2024 08:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730728356;
	 x=1730814756; bh=t3hv5FyYoK/FoE76EWjkfZ5QNQpmqNitzCQSghPf7Po=; b=
	WK1qZUBleEqrByBVM2YO0riZGuhv+1GED5ZkKXYTREoXL+g43LbiiS6/N0Rek1eK
	lFSuIGmdmsVbRbSqbE8/+kv/uH0rLfNyuGU8Vwl21B6PMhxsM2OLYQyT6V3GSAI/
	ZDputWGo4CqLvuSqMSP/spsg1n2gH9ETVO2pliw6z9MPGwWop3vrvlE5hDFn3RRs
	aNeJqn6R5XMbUQMUdqdnpcy9a+m/YCarhc6GZHMdYysTAG+QWLWk1JvqhtSgXi/G
	i3lm05S24HQ/SNaGd5UtYcvOULYJimcCei2n7rlUU4Jyw7bFGHqosyRB2qVFLiVN
	u4MJYnOUJVm8im08of8wIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730728356; x=
	1730814756; bh=t3hv5FyYoK/FoE76EWjkfZ5QNQpmqNitzCQSghPf7Po=; b=N
	3mxGdu7IQMmiAbUQXBUHYOXWTNHqk3OqKkWWKEZgwMtYUdWcf3GEpantFguCx7Vp
	fZzdshJLWwnM1Hz1It9DwAR/gr+iUEw90pB51UvDYyVBTGMTn2YVaKRKcNthYfuR
	RtAKdGaYezcfzZAnKpuBo0EQQDDtaLfvJSgjFd6trjKPt9urm4OnAynggKbaMZTF
	VGAsKtBabRelp9oCYUfU1kRcFng6eFfYhApZDYQDFqGxQV0p64Hnq3h4IsaxhmkC
	TXBJEe5XBmwcskT0uS1YZbN0Xl7g9198f29dRhfBzqKm8TS4jYpI+I9tLtEMjqP5
	Daq+Ix4NEQAUo390egWtg==
X-ME-Sender: <xms:o9EoZzzojBFRkjS0Z5uTvL7liO38I1TTH8axlDIt75ONdtDTe_PfBQ>
    <xme:o9EoZ7Tl6ni9am858tfZEkDnAHXY2zFnecTXSAPASX82kFsUcsCPR9QDU8O_PrgKc
    8LqwBKr89OvFAXlfhA>
X-ME-Received: <xmr:o9EoZ9Xds1dc2b20h0Enl1ulrS1N2VQhTeiU5vf3m4Ugcq2AfMDHDcMEO81AedBKobRWiWmvyuMDMMzX-2t80XjK7QRew_jf7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeliedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghhrvghgkhhhse
    hlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepphgruhhlrdgsrghr
    khgvrhdrtghtsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegtlhgruhguih
    hurdgsvgiinhgvrgdruhhjsegsphdrrhgvnhgvshgrshdrtghomhdprhgtphhtthhopeih
    ohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtph
    htthhopehjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhh
    ihhprdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhope
    hsvghrghgvihdrshhhthihlhihohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:o9EoZ9g9Imy5zpkaamTBldUakMTK9wCE6gASpAUZ_fXyxRsybZ5eLQ>
    <xmx:o9EoZ1ApiF35blTJnIZoLcnBj_c3EPYAPAXThN8yGfcnew1hhQ77bA>
    <xmx:o9EoZ2ITvh6v8O-2-cESy9qn_KOFWKllHtuY2ny9bee8wu792-DLIg>
    <xmx:o9EoZ0DeTSmHvNTkWJwuxgfP9LkcEhaPxEYD13hh6kyDcGB3_Z0tTw>
    <xmx:pNEoZ_T-8K6bRs6tP-ccbwflyo9rJ3qmfyRmmQQG73je8WJcvre1J90T>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 08:52:35 -0500 (EST)
Date: Mon, 4 Nov 2024 14:52:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH/RFC v2] MAINTAINERS: Re-add cancelled Renesas driver
 sections
Message-ID: <20241104135232.GB1412590@ragnatech.se>
References: <90447fa332b6f73bffcb486ccfe2515c59546253.1730717649.git.geert+renesas@glider.be>
 <20241104114007.GA1412590@ragnatech.se>
 <CAMuHMdW49dFp=-HDC4w8peQA+8phbJOsJZLE1OJtJ6tpTmAuLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW49dFp=-HDC4w8peQA+8phbJOsJZLE1OJtJ6tpTmAuLA@mail.gmail.com>

Hi Geert,

On 2024-11-04 14:33:59 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Mon, Nov 4, 2024 at 12:40 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2024-11-04 12:05:07 +0100, Geert Uytterhoeven wrote:
> > > Removing full driver sections also removed mailing list entries, causing
> > > submitters of future patches to forget CCing these mailing lists.
> > >
> > > Hence re-add the sections for the Renesas Ethernet AVB, R-Car SATA, and
> > > SuperH Ethernet drivers.  Add people who volunteered to maintain these
> > > drivers (thanks a lot!).
> > >
> > > Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Reviewed-by: Simon Horman <horms@kernel.org>
> > > Acked-by: Niklas Cassel <cassel@kernel.org>
> > > ---
> > > To be applied to renesas-fixes for v6.12 after v6.12-rc7, unless a
> > > better solution is found.
> > >
> > > v2:
> > >   - Add Acked-by, Reviewed-by,
> > >   - Add M:-entries.
> > > ---
> > >  MAINTAINERS | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 13f4c23281f89332..b04d678240e80ec9 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19578,6 +19578,16 @@ S:   Supported
> > >  F:   Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
> > >  F:   drivers/i2c/busses/i2c-emev2.c
> > >
> > > +RENESAS ETHERNET AVB DRIVER
> > > +M:   Paul Barker <paul.barker.ct@bp.renesas.com>
> > > +M:   Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > I'm happy to look after the RAVB driver together with Paul. However
> > please don't add my +renesas tag email for new entries in the
> > MAINTAINERS file.
> >
> > With this fixed for RAVB and SUPERH ETHERNET,
> >
> > Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thank you, I will make that change.
> Are you OK with marking both entries "S: Supported"?

Sure, no problem.

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

