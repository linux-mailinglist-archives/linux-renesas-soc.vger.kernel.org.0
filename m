Return-Path: <linux-renesas-soc+bounces-21126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82223B3E6A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 16:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDEA41752F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 14:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446D9335BB7;
	Mon,  1 Sep 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="O3m1IvtY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fj7ha76R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5CF1E3DCF;
	Mon,  1 Sep 2025 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735623; cv=none; b=sj07PXNEZ6cjo5+a2TrEEzqPbdruGv2yvS9r4SoOYyLWECsqMbU1hxW4LVuuOH87ArwD6bRdvysa/vc/Dxp6J3Ryqfngw5gO58B96XM0EZT7Tv1asj/hK5T8cLlxmo2CMiVLz6OxYvZYwuH2KJl9EJo2smYK2c7T8zo8t9aHglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735623; c=relaxed/simple;
	bh=CLxh3cVP0ev3XDl9vXwQrpw7QkcobSr9VFa5cwLGfMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGoVMdmYINJGR068WeV/MAmyj6lkMOxID2Wrltgkr690A3fdzUEELMkisYv95h/MI6HPK5tulqk/eXZl/MNTjsPm9FvSn6IPuGthqLhkXDU2u16KS945KnKc0zDzA0oqYpULxHg4IdFxk+bDfyZ3nRhRMcWHmiI6tjm09r2Y7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=O3m1IvtY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fj7ha76R; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id A13F8EC0506;
	Mon,  1 Sep 2025 10:06:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 01 Sep 2025 10:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756735619;
	 x=1756822019; bh=ZZ4Wx5a1AmpV1mUDjmK2Yav8zQV6KBW802NoaBfP304=; b=
	O3m1IvtY6VPW6vvy6jybh0VBPky+uisHRYxxd5Sj0rwWmza72A/88JtEvVUE2kum
	wwsedDsS8TTUeingiNWUM1N5v2oiE7hj5DDlHkyr8/ocJmczFdm0b1S/SPrDQO5D
	/J5iR+QrLjN0/1PQVP/t8XRDxuYFcAZ/hi41Rh2ZozuW/UhXRX0sGZGvhVvCdNs6
	Pw3e1Lvd8bJuJ6ykZIljxsm9nTEIT3A0FbhBk5tijq1LHifTshbcZfxr9AofRYz0
	wVOukuBLcpmkyaSGmplJmUdCEFGOxWSEE7ml7bEQiqWuW8LETwDPXwEgOM5vOUYl
	UVf0hiea63SUrJYwSyPjcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756735619; x=
	1756822019; bh=ZZ4Wx5a1AmpV1mUDjmK2Yav8zQV6KBW802NoaBfP304=; b=F
	j7ha76RT4xdNeq4iT4WSov+y2pOWPC6burNx8eok7cH2749zIHIX18e/VF6sF3cE
	Dq22UBO0aU5S/e5Yu3eYS4BtOhouMg2Ybrurz0ACpRuPOEfstigyZB7Le3m/c7rN
	/bvt2OQqfb6FtTxkUGVkk2Ref2oQYh5sNE3lRSyqrDH5QBfVIykwrDqk7EV4D5Cl
	gJXoWw+PfsNF0DsC5vurskMxRcu/AzEvSop+bpTRiOK01+Icg/AUcA/KuPwmz2cb
	+N0l09I9u2NecFdep4gS3G1RBHnfqCLkn+zFvGSOp2x7icvHVH6Ak6jO5DEGzown
	yzGlzy9NBBdPA43mMp0/Q==
X-ME-Sender: <xms:g6i1aOeFIq8t5-ML0_-UJu7K0ghRchC6VOrZPOP7m5E9zkTTXDFhPQ>
    <xme:g6i1aNYbM4EJSoOuW8b5KsHLSF28nCwfypTp-dx48STiLZFb67IpqvGDsjTwcyYvk
    7F7yxzQSvTaOudtlb4>
X-ME-Received: <xmr:g6i1aAYcxQsVE9myPWaEY7PYe3THuhIVKV3maGuV-Zss6ZWFQxRq6Lt0wLvhBMD8iLEtBM5hlxHY9wI3nBL9408TMetp5OVpDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhm
    ieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvg
    hnvghsrghssehmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhi
    nhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:g6i1aCKjZaatFVdDGegW5i6aEa8Sxd_u6XdXL8FdpxIX3k-mYzH8ag>
    <xmx:g6i1aMvh4js4mWWxn_Gdx6isnS3OCwlh2OGFzYb6gn8HbvtWzHk4qg>
    <xmx:g6i1aGVauA51JlhoPZiz7j_0VqrhKHvvie7O87g1wu8g7F5jk2FKxg>
    <xmx:g6i1aHjwXd6brqyyuuvQ5Q5174Dz8iGlhvtElBDWPGmVGqweARjPiQ>
    <xmx:g6i1aMXsP5B5UwJwDAtSXhCcXA3PF8OJT27mtSg8ma39k75zJPmqXepS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 10:06:58 -0400 (EDT)
Date: Mon, 1 Sep 2025 16:06:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250901140657.GA481255@ragnatech.se>
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se>
 <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>

Hello Geert,

On 2025-09-01 16:03:49 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Thu, 28 Aug 2025 at 00:15, Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> > pipeline behind the CSI40 Rx to be enabled to process images from the
> > sensor.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v3
> > - Use correct port@0 instead of port.
> 
> Thanks for the update!
> 
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
> >
> >  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
> >  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
> 
> Usually we keep the related parts together, but we indeed already have
> one case of interleaving.  I am not sure which style is best...

I have no real preference. The style here is only me trying to mimic 
what I seen elsewhere in the file. Want me to switch to the other style?

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

