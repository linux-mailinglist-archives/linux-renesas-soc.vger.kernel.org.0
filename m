Return-Path: <linux-renesas-soc+bounces-11871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4AA0226B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9EE23A45B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A931DAC95;
	Mon,  6 Jan 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HhBjymCD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ru4rw7PA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B61D934D;
	Mon,  6 Jan 2025 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157762; cv=none; b=nEiPmuFYxKF5QXYVyVInYksNUzfps5DCtrUuzth54K45yv+2oGbcT6F2KkYTrztRbHc0mM2BD4BxTK9Oi6rnTD79bv1FghdHMGee/eFoR9RXQbpiSYCwBjQc/shvUoDFMxTMJZ7JsdMr5SBGxg7L94yyJqfPvn7glejKC+if/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157762; c=relaxed/simple;
	bh=UeotYQxbXGtaRMDr5CfbUhkqtpbvfnqNMQwNf5ywoi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOXNYbbFy9P1b69AcaMEO1qOXuW2VuNHfE+R2DFbmzNxws8xzv2h+5aOrQ59d5vl4baGUQzV05aqETvL5JRlScz33hK/kloOWu5OdSSnmb1gSDbTMjNRNyICzSiLwoz83/S1QDbOrb09TiY5E99dDbbR/gbgNsd7jaw8vEqyRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HhBjymCD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ru4rw7PA; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A7662540158;
	Mon,  6 Jan 2025 05:02:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 06 Jan 2025 05:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736157756;
	 x=1736244156; bh=o4NZIf3WxppxFXzutKt4JwQ1jjjFXtzx03iU1/8Gzq4=; b=
	HhBjymCDeV8Os295yCwrt4Hr3/PHCvGuAqlhWKdB9rMm7OITcEf24nEx+7rzk49J
	XQoiGkNrzBFSYIi5lDpnX8A+qZZsQCV+3aRjFjRbKbXctPoKsKaAF69hZ7pjpgtu
	A/XruuVv6X9hFNoy34+lgVRWJ9GQAJIQguRjO07Ib+bSYVP55ULW1HrlLIB/Lh4W
	+qcXPrWOLmKoOqpLiO8OKc08I+MAuzB+qG3ApNTuoAwj8Oq8fMTBNWhFqEPbsMjR
	1HkCUbvnQHXMC3K6UUX6FbER4AJkr0G+8RsiWq43thYEADx8RtukWLwuQN2VG2KO
	kbwrm9O5/CXSTpifQY5WNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736157756; x=
	1736244156; bh=o4NZIf3WxppxFXzutKt4JwQ1jjjFXtzx03iU1/8Gzq4=; b=R
	u4rw7PAE0clthsMU1si1SK2apyKrjO2cqU0An0rF6wn9CJQqeFPatAHxVFHpl6N8
	YI/QypJk6rYtcRn39AbAsbSZLRzfMfRMyZh73sWZdMVewCF72gGQf0IgvEJt9gF4
	qCVZBmSPPIHx4dUL0E+iQ5K/OYqYJ2px5AdFyCbjs6+wpR5NWExtUxc+/axNsKWG
	LcBBj1ZAkZbyvyy/GQxH6UkzSH1HAGqILY5m7efnq6q0+DjgarG8ZkT9pfsvhIuo
	/hsYvRX0TAlSiYA8nu0sXvlKHGAQM/1MrJ5fajmbkQsgUNKyC9JwJ944e16RTaqS
	qo2d9IEVFeaKofr3Tv1ug==
X-ME-Sender: <xms:O6p7Z9s8nd0xScaaH92IhlCADeQPBR0EtfY9T5m-GEih1PJiplprig>
    <xme:O6p7Z2fHeexK7cluKrQU20GOXnxHnwJIoHqP8wnclxEZLNCh8CXQkjxCrStHIEDVr
    TQbv9WK3xnLSoCbDKY>
X-ME-Received: <xmr:O6p7ZwzJVDX9SDo0WssC2MAY3y1q-zr6rFUrImfmldvHsXkNHO9ViNZIKQyB9fLbaDXFXuzpeiS1yWII24P0zo1V9AwV_VJaPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepshgrkhgrrhhird
    grihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    gvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:O6p7Z0POreU7lLL35y5lfRP8HzOZWVDECqJHb-3B-00mlbEoGKjq2w>
    <xmx:O6p7Z9_IWG5JxAPN2hKpt3Vgog7RHSxqwdSedT4bUSzBhUx2ui6BlQ>
    <xmx:O6p7Z0V9wNDx9i82qfOxaFDdGHgH40tKp_GzUAHi1pqr5i3sr5Z_dw>
    <xmx:O6p7Z-flupZdgIuVtWjbfUlgReOL1OrHV9F9nHhA7h4aUCirWZ8dAg>
    <xmx:PKp7Z0VrtGMiBLk2uDIBVZqTFKM09u_dbq43fjiYmPp7tTRoP384Ebbp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 05:02:34 -0500 (EST)
Date: Mon, 6 Jan 2025 11:02:32 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define
 CSI-2 data line orders
Message-ID: <20250106100232.GA2766897@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>
 <20250104121700.GF808684@ragnatech.se>
 <CAMuHMdWxmMXe7dhFNGmr90AkRovW-Pov_0DA8-=RgDa9j_FWiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWxmMXe7dhFNGmr90AkRovW-Pov_0DA8-=RgDa9j_FWiQ@mail.gmail.com>

Hi Geert,

On 2025-01-06 10:45:51 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Jan 4, 2025 at 1:17 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > On 2024-12-27 14:22:31 +0100, Geert Uytterhoeven wrote:
> > > On Thu, Nov 21, 2024 at 2:41 PM Niklas Söderlund
> > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > The second CSI-2 C-PHY data-lane have a different line order (BCA) then
> > > > the two other data-lanes (ABC) for both connected CSI-2 receivers,
> > > > describe this in the device tree.
> > > >
> > > > This have worked in the past as the R-Car CSI-2 driver did not have
> > >
> > > has
> > >
> > > > documentation for the line order configuration and a magic value was
> > > > written to the register for this specific setup. Now the registers
> > > > involved are documented and the hardware description as well as the
> > > > driver needs to be corrected.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > Thanks for your patch!
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > > > @@ -21,6 +21,9 @@ csi40_in: endpoint {
> > > >                                 bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
> > > >                                 clock-lanes = <0>;
> > > >                                 data-lanes = <1 2 3>;
> > > > +                               line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
> > > > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
> > > > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
> > > >                                 remote-endpoint = <&max96712_out0>;
> > > >                         };
> > > >                 };
> > > > @@ -41,6 +44,9 @@ csi41_in: endpoint {
> > > >                                 bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
> > > >                                 clock-lanes = <0>;
> > > >                                 data-lanes = <1 2 3>;
> > > > +                               line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
> > > > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
> > > > +                                              MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
> > > >                                 remote-endpoint = <&max96712_out1>;
> > > >                         };
> > > >                 };
> > >
> > > Using the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions has a hard
> > > dependency on commit 91a7088096a49eb4 ("media: dt-bindings: Add property
> > > to describe CSI-2 C-PHY line orders") in media/master, hence I cannot
> > > take this patch in renesas-devel until that dependency is resolved.
> > >
> > > However, according to the cover letter, commit 573b4adddbd22baf ("media:
> > > v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in media/master
> > > causes a regression in the absence of the line-orders properties
> > > (which I had missed before, unfortunately).
> > > So I think it is best if this patch goes in through the media tree,
> > > which already has the prerequisites and the regression:
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Alternatively, I can:
> > >   1. Cherry-pick commit 91a7088096a49eb4 first,
> > >   2. Replace the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions by
> > >      their numerical values.
> > >
> > > Please let me know if you prefer option 1 or 2.
> > > Thanks!
> >
> > My preference would be for this patch to go thru the media tree with
> > your tags to create the least churn, if Sakari is OK with that ofc.
> >
> > If not I leave it up to Sakari which option is most preferable to him,
> > I'm OK with both alternatives.
> 
> Note that it's getting a bit late for the alternatives, as I plan to send
> my PRs for soc today, or tomorrow the latest.

Thanks for letting us know. As we all are slowly wakening from the 
holiday season maybe the best alternative is to go with option 2, 
numerical values to avoid the issue? Then in next cycle follow up with 
using the defines?

-- 
Kind Regards,
Niklas Söderlund

