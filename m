Return-Path: <linux-renesas-soc+bounces-6544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97348910365
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 13:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 221591F22CC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B741ABCC7;
	Thu, 20 Jun 2024 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="K4oGDxLY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z9JhBjnJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AA157E84;
	Thu, 20 Jun 2024 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884257; cv=none; b=WDZdquSb26gMUq1NaT4hPQ9NGKkDIZ+qnMiXs1fN/cWSd6Uw0U6hbP8+phH+KIqXlyhcYltnKBr1lUTDHzxJKqR+uJ7z5HxqUChy5e+8s3MXfYfuyMk9zOVaYur+HlHr1hTOAvajG/AjrLk6kOyVI/mJfscSivEEp7pdun2T8u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884257; c=relaxed/simple;
	bh=/aujwsIT99J+ciFrdR+Pv/+CPVjQgso5mU5xijGBmE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLDLRclSYtbkSTQ4oHKgqjdF4qpKqVsgQfxW3LOt+l3p7nagygpppbUFb0HPk+cioJ/Bg3dqzzAM4epRdiI+iVh4fobyFmLhZvVjiPZdnho/pNIVvW/f9LCHdlTqkyqmH4DhZtybz+jSzUuMvD90H2WjUKBakk7A3zYIP9EPM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=K4oGDxLY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z9JhBjnJ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 457B71380513;
	Thu, 20 Jun 2024 07:50:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 20 Jun 2024 07:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718884254;
	 x=1718970654; bh=cRq3pf/PZ++6p/1NRu1uzCniQUAbi6xOVY8m+ue7eUE=; b=
	K4oGDxLY93VPnn9rOtYTFCz/5o9JB3+T7FL1mzI2AtU9VTITCz0dFs/Y4T/Ijl1h
	Hqmr99xMyLkDKKZeVZBiW2ipszPRMGJ4Lo4f9E+5reWD/NiSYYdqBodrIZ3p+LLO
	aHte7albwjDb4B7OjJcMZR2/zU0RDl94tlUsVzYZIi5NehEb1xlC5/6OCQYhnphe
	x/KZWa/aPDrWtYwy7dvjRL0z+PDepuUUkzpl4xx/TAYlVBLOLIBqtjNP38rGVSus
	J9NUAelH4juG7zQyfGl5J7qZAcE5pSqf2CU9M5OMeJrPzkGbUKvgAQsw+tNzP0xZ
	2M3GiwNevyWET7CDASssqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718884254; x=
	1718970654; bh=cRq3pf/PZ++6p/1NRu1uzCniQUAbi6xOVY8m+ue7eUE=; b=Z
	9JhBjnJK6oQvHhzIzOzQXeFP2Qr9UoXyo9Zzy1AYpZ6xhUHXe+NPuQcgEM3cohF0
	E+l+1zIJIvYqw2nNPvERDeRI4FFnpObx2nc0kXKlMP3G/nSE1DS8KD0bWJRYHfT3
	NSpUPypRlrv2sw1U7bJfCY/2ee7R3g7kQ+fAY2gxIAyB7UAMN2LfOhJkkg8PCaT4
	PhnBSIH37cxP6ifKkC5/IkaH2kUEgtJ8ausS+9BqsRfeIhJPIop74kFEKtg0EyTF
	H5vuISj99Nz5+nle6owd3gMXhZ+q+wuGPaOJS7Eg7Y8PVg1/Af8ep1qjgd9HWb6o
	0vw8RRpe+0wriavtAs8Cg==
X-ME-Sender: <xms:nRd0Zu62EBcL2_awFwGzBNsN22sZyUmh30zaY4fTgDE4sX3kVJzqPA>
    <xme:nRd0Zn7T1SWT8VN8pnKKWX_KnHOhwV-lRp9cHTX3qD0fkWX5ajGPmaoHePbWdBgK3
    c7tzwns2hpzPoRC2Lk>
X-ME-Received: <xmr:nRd0ZteYlms2WU7kfSaFewXhJm0klKGMCK043wFifdCYi6sI3do3MnHjK-nQEYVDHuDPaBnnnzQ1VQ1XmJRZKxh2vWRALKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:nRd0ZrKph7kR5noDZMtfI4_0xzq2wYvmOF7QRQFfOkwHX0u-dtlBmw>
    <xmx:nRd0ZiLxlOnD3BfeDc1NLS55xLMIhw0ouD5-m6OPledEOFYAJhkHJg>
    <xmx:nRd0ZszTTY2WKJEBUJm7wnplVOYzuhw6QaXBv3EZIehPPevO45SjHA>
    <xmx:nRd0ZmIHGrEMHIe0fveP587scbLEASF0LMcvKE9k4xaD-Y0IV96EtA>
    <xmx:nhd0Zh9liZctpRNKg7DMd9dNcUE2M_r7ta8l1rHSyWDSMvOHElhwMukH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:50:53 -0400 (EDT)
Date: Thu, 20 Jun 2024 13:50:51 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240620115051.GW382677@ragnatech.se>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <716088809af5c646b3f1342656dbb08969becaaa.camel@redhat.com>

Hello Paolo,

Thanks for your feedback.

On 2024-06-20 13:13:21 +0200, Paolo Abeni wrote:
> On Tue, 2024-06-18 at 11:08 +0200, Niklas Söderlund wrote:
> > Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> > V4H. The Ethernet End-station can connect to an Ethernet network using a
> > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> > Depending on the connected PHY.
> > 
> > The driver supports Rx checksum and offload and hardware timestamps.
> > 
> > While full power management and suspend/resume is not yet supported the
> > driver enables runtime PM in order to enable the module clock. While
> > explicit clock management using clk_enable() would suffice for the
> > supported SoC, the module could be reused on SoCs where the module is
> > part of a power domain.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> I'm sorry for giving such fundamental feedback this late, but I think
> this should be split in series to simplify the review process.
> 
> You could e.g. introduce the defines and probe in patch 1, the rx path
> in patch 2, and the tx path in patch 3.

I have been given the opposite advice in the past, to add a basic driver 
in one single commit. All be it this was in other subsystems. This 
already have been thru a lot of review, do you feel strongly about this 
or can I note it down for how netdev prefers work do be done in future?

> 
> > +static int rtsn_rx(struct net_device *ndev, int budget)
> > +{
> > +	struct rtsn_private *priv = netdev_priv(ndev);
> > +	unsigned int ndescriptors;
> > +	unsigned int rx_packets;
> > +	unsigned int i;
> > +	bool get_ts;
> > +
> > +	get_ts = priv->ptp_priv->tstamp_rx_ctrl &
> > +		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> > +
> > +	ndescriptors = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
> > +	rx_packets = 0;
> > +	for (i = 0; i < ndescriptors; i++) {
> > +		const unsigned int entry = priv->cur_rx % priv->num_rx_ring;
> > +		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
> > +		struct sk_buff *skb;
> > +		dma_addr_t dma_addr;
> > +		u16 pkt_len;
> > +
> > +		/* Stop processing descriptors if budget is consumed. */
> > +		if (rx_packets >= budget)
> > +			break;
> > +
> > +		/* Stop processing descriptors on first empty. */
> > +		if ((desc->die_dt & DT_MASK) == DT_FEMPTY)
> > +			break;
> > +
> > +		dma_rmb();
> > +		pkt_len = le16_to_cpu(desc->info_ds) & RX_DS;
> > +
> > +		skb = priv->rx_skb[entry];
> > +		priv->rx_skb[entry] = NULL;
> > +		dma_addr = le32_to_cpu(desc->dptr);
> > +		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
> > +				 DMA_FROM_DEVICE);
> > +
> > +		/* Get timestamp if enabled. */
> > +		if (get_ts) {
> > +			struct skb_shared_hwtstamps *shhwtstamps;
> > +			struct timespec64 ts;
> > +
> > +			shhwtstamps = skb_hwtstamps(skb);
> > +			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> > +
> > +			ts.tv_sec = (u64)le32_to_cpu(desc->ts_sec);
> > +			ts.tv_nsec = le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
> > +
> > +			shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
> > +		}
> > +
> > +		skb_put(skb, pkt_len);
> > +		skb->protocol = eth_type_trans(skb, ndev);
> > +		netif_receive_skb(skb);
> 
> Since the driver uses napi this should be napi_gro_receive().

Thanks, will fix.

> 
> > +
> > +		/* Update statistics. */
> > +		priv->stats.rx_packets++;
> > +		priv->stats.rx_bytes += pkt_len;
> > +
> > +		/* Update counters. */
> > +		priv->cur_rx++;
> > +		rx_packets++;
> > +	}
> > +
> > +	/* Refill the RX ring buffers */
> > +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> > +		const unsigned int entry = priv->dirty_rx % priv->num_rx_ring;
> > +		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
> > +		struct sk_buff *skb;
> > +		dma_addr_t dma_addr;
> > +
> > +		desc->info_ds = cpu_to_le16(PKT_BUF_SZ);
> > +
> > +		if (!priv->rx_skb[entry]) {
> > +			skb = napi_alloc_skb(&priv->napi,
> > +					     PKT_BUF_SZ + RTSN_ALIGN - 1);
> 
> skb allocation is preferred at receive time, so that the sk_buff itself
> is hot in the cache. Adapting to such style would likely require a
> larger refactor, so feel free to avoid it.

This is good feedback. There are advanced features in TSN that I would 
like to work on in the future. One of them is to improve the Rx path to 
support split descriptors allowing for larger MTU. That too would 
require invasive changes in this code. I will make a note of it and try 
to do both.

-- 
Kind Regards,
Niklas Söderlund

