Return-Path: <linux-renesas-soc+bounces-5226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A968BFB93
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 13:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A61A41C21235
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 11:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FCA81749;
	Wed,  8 May 2024 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CqBJr5bt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yqj/OSOe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BFD26AFF;
	Wed,  8 May 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166454; cv=none; b=qKG/VVySNisH8D19b5+xLxMSKEOcoUHS8IBxUR1O3MsaHyXMQ/DO4vysNzfnWOzKwQ03wF2fjgJCBTEAPK9BoAZwiorYic6mxaTJj65uYU9Jenk5H9WHUDefj8QOLKgLFklOr0ZXMfv7Qpe9HbJHe+m2vJRgGXjCAK8Bk/NH5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166454; c=relaxed/simple;
	bh=urGOUdc300vFQCsbB/6SAMCUJIQfOPUkv5UkGgygMYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVHDNCKGL9PlbRiTPoX6OvZSYpqyHRADe+mp99E6/nktnhfQKUqeW9XwoqHxSr7P/orrR28dBk0X2ayKeqLLvf7h83Nu5YFgS+PesY2sBem4y52w3NF0hHWZ1vcZlO+bBU5+pgf3dIJ5If+I47e6TOxfNfaam9P65EeWePHGbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CqBJr5bt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yqj/OSOe; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6A5111380FD1;
	Wed,  8 May 2024 07:07:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 08 May 2024 07:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715166452;
	 x=1715252852; bh=oOES+7d96Ln9+kYMYVV5bxS6uek4cldZUnA+nP+0Tu0=; b=
	CqBJr5btfsoKDjK4fvbKYKfFJuYof/MhyIlA01f0e7Imh97xqu/OJP7HRiLUaFIY
	rwKhBU6p6LmzMYxb6O2+aHd6yEToHDy+mQQrUKP8o8SuvLmWGe+HmfeWF8mJehGE
	YC2L7NzGrl8L4ZvVFnkSFArrUEPJIoAn3DTOptXID2/wW3wM2FVvUFLiRBgHSLJt
	vtFlJQCEgRE0K3IRVHy+lNf74wViNAoCi5gJraZHv8RVfF7DFJXGaFCgRxgePtwT
	+brf5QEpY8bqq/0Advm9EKsPjF9r7n4dmVItglc4s5oOpcA/YjJdSmgzOcninPcE
	bdNVCuwJolBqZYQE8JjYiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715166452; x=
	1715252852; bh=oOES+7d96Ln9+kYMYVV5bxS6uek4cldZUnA+nP+0Tu0=; b=Y
	qj/OSOey3GfcVE/chbZFTNWVyaMisMlJoIa+8NUlp6D+AqGCONrbbF5h1QBEz61l
	A7cJXD3G7ywU0K0Wb/L3N3h9zDmaLiIYLfgKsNAf00bMVo+1yeZfA9BSEqZF+N0v
	qgoqWjL9JY+tAvVkWGH++3zD7EAqnsFhaItzXuuNjNWFlYvQYPuCfu/uw6LwrOdQ
	Dhs2rCuXFDo8IwQp9/O3a9Fi27BABHVB4B5hKNcfI6UYeDxTmgvc2DtGSHiuRWmp
	xctIP5UTluPHgm4az7kJVjsyZY3BWXqCtWXu3QZG1NEEWpxzunwd3fVcdLRR7Wez
	+rx7El3lMlutlYzntY/kw==
X-ME-Sender: <xms:81w7Zol1F6pavAQ3AMGQSsLX193J9JDk8N8kxlQf6bfD1XCZFgPWIA>
    <xme:81w7Zn092O-qqYQPYiyTtfkiOrv1D0rRXpqNYuYwNiycBtvoyX0EiifMLhZhUpnWU
    -FmTlGxdVSWEj8shHc>
X-ME-Received: <xmr:81w7ZmrU7HLBuIslYcRc6eyJn7PD8wvLoV9ZHaXO7qEawD7pgf6AC1qZsw9oj28rFg5Qshz0xRtnc4vdVIKwU7KOdApV8Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:81w7ZkkZSbgONk4ES1JQIkZ8QM_bmvi_LTnGmZzM1bmVOOJFz9YM1Q>
    <xmx:81w7Zm0eZ_2bURimizNobvgSUPYUYpZgj0mqAyrlM3PHgEJnrDCSIQ>
    <xmx:81w7Zrt-oJ2WgqGO3ryWDSisUeyHGjDW6tspW7k9-uZpKiK5aVcDqQ>
    <xmx:81w7ZiWJM8AJyz6CayT_RHtd58d2Fe0FPXH39q2NifxheEXyo7GZEw>
    <xmx:9Fw7ZnKrgT_ekiUxntjj0OAD-1yQSgAkb1strJ6KsNYW1jemxcVhrXWU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 07:07:31 -0400 (EDT)
Date: Wed, 8 May 2024 13:07:29 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240508110729.GD1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <b51b7b2d-c6d0-49ef-8b84-b9ed8368c797@lunn.ch>
 <20240507215017.GA1385281@ragnatech.se>
 <2cd13d49-6b9f-4ce8-ba4e-ca02b4568842@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cd13d49-6b9f-4ce8-ba4e-ca02b4568842@lunn.ch>

On 2024-05-08 02:35:27 +0200, Andrew Lunn wrote:
> > > This looks wrong. You should be applying delays for rgmii-id and
> > > rgmii-rxid. Plain rgmii means no delays are required, because the
> > > board has extra long clock lines. Same for TX delays, only for
> > > rgmii-tx or rgmii-id.
> > 
> > This confuses me a bit, from the bindings in ethernet-controller.yaml I 
> > get this the other way around,
> > 
> >       # RX and TX delays are added by the MAC when required
> >       - rgmii
> > 
> >       # RGMII with internal RX and TX delays provided by the PHY,
> >       # the MAC should not add the RX or TX delays in this case
> >       - rgmii-id
> > 
> >       # RGMII with internal RX delay provided by the PHY, the MAC
> >       # should not add an RX delay in this case
> >       - rgmii-rxid
> > 
> >       # RGMII with internal TX delay provided by the PHY, the MAC
> >       # should not add an TX delay in this case
> >       - rgmii-txid
> > 
> > The way I understand it is that if if the phy-mode is 'rgmii' the MAC 
> > shall apply delays if requested and only if the phy-mode is 'rgmii-id' 
> > shall the MAC completely ignore the delays and let the PHY handle it.
> 
> It is confusing, and made worse by you doing different to normal and
> implementing it in the MAC, not the PHY.
> 
> 1% of boards use extra long clock lines, so don't need additional
> delays. They use 'rgmii'. There is at least one board i know of which
> has one extra long clock line, and one normal length clock line. That
> board uses 'rgmii-txid', or 'rgmii-rxid', i don't remember which. The
> other 98% of boards should be using 'rgmii-id', indicating something
> needs to insert delays.  Of those 98%, the vast majority pass phy-mode
> straight to the PHY, and the PHY added delays in both the Rx and Tx
> clock. If the MAC decides to add the delays, and it is 'rgmii-id', it
> should enable delays for both clock lines, and pass 'rgmii' to the
> PHY. In the unlikely event somebody builds one of those 2% boards
> using the MAC, you need to enable just Rx delays, or just Tx delays,
> or maybe no delay at all, because of extra long clock lines. But you
> should still be passing 'rgmii' to the PHY.

Thanks for your patience and this explanation, I understand now.

> 
> > Just so I understand correctly, if the phy-mode is A I should pass B to 
> > of_phy_connect() if I apply the delays in the MAC.
> > 
> > A               B
> > rgmii           rgmii-id
> > rgmii-id        rgmii
> > rgmii-rxid      rgmii-txid
> > rgmii-txid      rgmii-rxid
> 
> Nope. Since the MAC is doing the delay, you always pass rgmii to the
> PHY. A determines what, if any, delays the MAC adds.
> 
>      Andrew

-- 
Kind Regards,
Niklas Söderlund

