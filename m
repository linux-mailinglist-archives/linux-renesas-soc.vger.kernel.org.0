Return-Path: <linux-renesas-soc+bounces-4634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E48A6690
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 10:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63872281453
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 08:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A2B83CDE;
	Tue, 16 Apr 2024 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="G5mY67qz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PQAea+fT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5F2907;
	Tue, 16 Apr 2024 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713257889; cv=none; b=cb1pJSVMmLQo8SRmSlMoTS7MkeeO8PoOmqwQ0JbzU1u6pZSPeuHs5b+LCVlRkG/cvcWoXUJMbNkwwdXmBqPGaVHjWiicGwsSvYL2mHziCpO0n/NL/Sx4yghw95qvlvdu7eGAj0EXjq6Ba7TwDKsdZZusz9nVCMpF28ISxEILcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713257889; c=relaxed/simple;
	bh=4/1ePeI69MfhY87vj18253cEWi6mAn19+2Xq/5mfrVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQEkRFUTgaG9eNePj8Tk/Gi/2ErkaTnQtTmmG/D6ovLEzbm7J1kvQOZmz+TAKAXZdbYNvx1WlZFx+eBeQvTz3E3drrwW6FSUEuNjC/rQJ6P5dlpsArjAtv83I7ARo7MbccWfwXNXmNTwgcMewsadkH4l0F1Wc06r1zHUkYUojSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=G5mY67qz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PQAea+fT; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailflow.nyi.internal (Postfix) with ESMTP id 3D6D320030A;
	Tue, 16 Apr 2024 04:58:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 16 Apr 2024 04:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713257885;
	 x=1713261485; bh=2vpzAJq9BdhgMku9x0Zyb1TfC6+YDET8qPtrzKEqebs=; b=
	G5mY67qzN2jWP7fcyNPtkQTsK7gq2dy+HnqFzmKUouFApIcuyQbnXOoFK8hou1Ye
	slrQzXzrWhc3VpMXh+EC0cErXyBfXnZmmPqHqp8CZKYl/aGLyyp1Z+fDi5EesTnP
	rSaZ2Y/mylaOrv7bQO/YYaNcK1hulrSEx4G/1EbqB/ou3TnaGZ7T7d928yTY65lZ
	NCNIPEp1OnHMswcG6Y+jN2nAqg1eUYL75enX8jhwvdpnDnNq8U3Bu1pVrsBIfD6U
	z169vOROPcM6an69I9sWoaplPqRGcGJ/RmwUDnvf3Mgoq0WTWR9ymzKN6bDtC0JO
	YYudFTOQdl9mDqKsuUg1Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713257885; x=
	1713261485; bh=2vpzAJq9BdhgMku9x0Zyb1TfC6+YDET8qPtrzKEqebs=; b=P
	QAea+fTKL/0s4ynJlqUt95Im2AFnw1Eq26a5ScfUY3iTrFJPCSQi2gLv+SZ20Hzn
	zgHjxNqUK9tK9b7dVeI4AAirAPlJJ19c2aOKYzyWbSsXbZysp+zLfzna7f3ep6GM
	lWpIJ78MyUAfj2epMK5IFJpa2gGd6qwoeROUeUBaW7vk0AG0kBxajAhNSkhm4z9v
	xgTLieVGhJ+jWnK1WRNDQbjIhXU5CF3Lv30PS+yNwFBU7huBwh092+MdvvXHcZI8
	ESP0hYJJAnJrcBlAfOqNLYoty2g8g0/FtAcGNVIqNumiLtrDi82cru93+9etxm1l
	Vq0Flwloz+OCP7I0u8hAw==
X-ME-Sender: <xms:nD0eZlZw6lwvN1U2VchrTp7TeykmfUh6RtUGeQLOrJvRok0GUzA4WA>
    <xme:nD0eZsY0_ZvVsnh8dsGA7YcUiVaICHygRZyk6b-oR78v6K0Dq_GPSl35OSq4jPr2f
    WFZxkPgisx9OoW0BvM>
X-ME-Received: <xmr:nD0eZn-0ITqNMK4ZJz7qVfwKcZ4voLBeJvn3qzzmp25T7qBdhEaC-5RWb46H2lkKj0vRUJYrs9GJrrvmZUvqNigKh9SLFR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudek
    gefhhfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:nD0eZjpge9Sf3M8RY92iLJy4MZ_OTXEs3aUaJQMWoHJjOqEymjSmoA>
    <xmx:nD0eZgrZt47jlLiZBa_XF4Xv4r1S5z1-xpldvbT9TPc12jwlkwU_rg>
    <xmx:nD0eZpQBZTNfwEgAbWELDLFkjKs63Gp0iHJ4FnBaeLNdVewZlKP0Zg>
    <xmx:nD0eZoo1euBj95x2zzZPHFG_yGasXUSc9pQoEbwPwFJtYBUinSiltg>
    <xmx:nT0eZlD8E6CT8_AqNFgOxwZanhndxKHsff3Ki-rpfPyrKMc0zH2CuKNV>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Apr 2024 04:58:03 -0400 (EDT)
Date: Tue, 16 Apr 2024 10:58:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240416085802.GE3460978@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>

Hi Andrew,

Thanks for your thorough review, much appreciated.

I agree with all suggestions except one and will fix those for v2.

On 2024-04-16 00:55:12 +0200, Andrew Lunn wrote:

<snip>

> > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > +{
> > +	struct device_node *np = priv->ndev->dev.parent->of_node;
> > +	u32 delay;
> > +	u32 val;
> > +
> > +	val = 0;
> > +
> > +	/* Valid values are 0 and 1800, according to DT bindings */
> 
> The bindings should not matter. It is what the hardware supports. The
> bindings should match the hardware, since it is hard to modify the
> hardware to make it match the binding.

I agree the comment could be improved. It should likely point to the 
datasheet instead. See below for why.

> 
> > +	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay))
> > +		if (delay)
> > +			val |= GPOUT_RDM;
> > +
> > +	/* Valid values are 0 and 2000, according to DT bindings */
> > +	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay))
> > +		if (delay)
> > +			val |= GPOUT_TDM;
> > +
> > +	rtsn_write(priv, GPOUT, val);
> 
> So you seem to be using it as bool?

Yes.

> That is wrong. It is a number of pico seconds!

The issue is that the hardware only supports no delay or a fixed delay 
that can depend on electric properties of the board. The datasheets 
states that the typical Rx delay is 1800 ps while the typical Tx delay 
is 2000 ps. The hardware register implementation for this is a single 
bit for each delay, on or off.

To model this in the bindings after some discussions [1] the standard 
property was picked over a vendor specific bool variant of it. Here in 
the driver I tried to document that the binding will enforce the value 
to either be 0 or {1800,2000}, but that for the hardware it should be 
treated as a on/off switch.

<snip>

1. https://lore.kernel.org/linux-renesas-soc/ZVzbigCtv2q_2-Bx@oden.dyn.berto.se/

-- 
Kind Regards,
Niklas Söderlund

