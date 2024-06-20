Return-Path: <linux-renesas-soc+bounces-6543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0C910336
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 13:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06AB51C2134A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01751AC223;
	Thu, 20 Jun 2024 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JcTQt3w8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vF9srjJz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C531ABCCD;
	Thu, 20 Jun 2024 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883655; cv=none; b=EfqFfsNXjkqHIZXDtWDZz+DazvXX/ByORJmEDbVwFjzh7ZV/rbSZOn8GfDQa/H6gMoT8e4gFYFzuF1Hj03InisMzsmfrbjcQnQVX+FGm202+Lis2K4PiqTViFW3S43CQaHNPhYWPqzOGFs603TA8CfpKzTZZbJBTl7flg7mIK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883655; c=relaxed/simple;
	bh=cvDxmEsT5DyhER+UVtWN/Kddm7YxPKM8mIhwB0t/wts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iw0V1STzzBVWEHtKc9vdmRATraPcd/X+WRdbR9ijwTV0Et27pWk3NPLv8pKJ93rylOEVESbzb3iW9XHllSkKn2Po6DWoUhS2IwLqk3A15Wit/YfJv9KLWYxRqDI0yKfi677QBKjQ7IOWsQ6QHd3aEmRBICe9wU5s9dX+U2kb8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JcTQt3w8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vF9srjJz; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 46703114028C;
	Thu, 20 Jun 2024 07:40:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 20 Jun 2024 07:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718883651;
	 x=1718970051; bh=6fIMTijZmKCpRqKVDei0jStiIOFAPerqHPKb/Xq90Yo=; b=
	JcTQt3w8UpWfWJxOrkH9DOfkrOXaWO0UDG8Zg5qGyY78uXXVlpM69lWTXPdd8lOY
	PHDUgY9JvtNx1b4AlIeH34QAvcmeWrcq2Bcws5vc1dJQr95Gz6WzgUovdWwyvStX
	8xZHhzSreHdyuRM9wt8PfDoeOap67uCDtYAewJeXS9ZYEXpjo6n3rCWyOMmQzhE8
	ULYForFUVPBb3XHmRmZ9JbPD7NtuM6EiEcFX1RQoQx3jHS7ZpKfC1Pu0hjL3deN+
	hAPf9w+C4idMhflqVIqLo8/mP9VqO2ODYDHi56FjFazRsMxXpviKSoUo4BW/C8tS
	j53C4LtXzmHDZR98Fhaa8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883651; x=
	1718970051; bh=6fIMTijZmKCpRqKVDei0jStiIOFAPerqHPKb/Xq90Yo=; b=v
	F9srjJzbpLmE1qNUkf1EaQ8zQgHboMDi+3lCvKDKrjJfZODW1FFsMU79dnratgYU
	hu87a68R04YEsC1hpEWErr5cBv+NROdelpG+4NBsGOSxq0o5gaefXTic3It+ATGG
	yBHorw3xpHUUcSIJUoBnivQC8NpekmCNkSzTtkHez3kUdPxo0n0Mu4j/xX+baQak
	fS2npTc6sPDh4DXEVAKIXzS4Z77uTvst+FFubz0Y0+Zxa46WuuL7hVMqHFfOWzhC
	Nwo1EQPbb8uWxU8yTuviS7PBJ2pgQrfSQiyx9ZEaY9BG7r/dFqA3CgSvkzD5Zg8L
	G8UlB6lhaPY4ROVNikIAQ==
X-ME-Sender: <xms:QhV0Zvlv1Q6eRUgcG7pzZZ5cl1ZS1iKLnCvDJs2dqxpEJfBHY2vc0w>
    <xme:QhV0Zi1__ILhemEhlEeristK4OMIaqOUfFUaX5o3pfT7PIo6RTx7AZ0PQ5FW0DBvJ
    7GAq8I9XTxRqmb6T3Y>
X-ME-Received: <xmr:QhV0ZlrsoNqABNijijknr4Zz4QVzoTABXwzegGSnbLrHMH5TH4J74iZCxH1ASvvQpqSExLD6koOZKuQaVo50iOeb-OdDI4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:QhV0ZnnquN7ZwPnD6cM043JiBHCLdzy34tC3s_XhYxb0gXzxSpjf_A>
    <xmx:QhV0Zt1PNEn9VZa8lRvtYzYrROKgsg1uQDXOoPC2k7lyQGwc4FjAXQ>
    <xmx:QhV0ZmsrqfFJmY5Npuexp6piJAqy8qDzRo4aNPb0Oie_3dcGHTsNQw>
    <xmx:QhV0ZhUwSyXVlCusEBU0vet4iE6nwhW8gIVLq_v8PL3faJffAV-OpQ>
    <xmx:QxV0Znybsbqh4xTZimQkg5IGUY8CqUGO4AUrBBKOI-GmzY0mRel8JT_i>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:40:50 -0400 (EDT)
Date: Thu, 20 Jun 2024 13:40:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v9] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240620114046.GV382677@ragnatech.se>
References: <20240618090824.553018-1-niklas.soderlund+renesas@ragnatech.se>
 <20240618115716.GA1186487@maili.marvell.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618115716.GA1186487@maili.marvell.com>

Hi Ratheesh,

Thanks for your feedback.

On 2024-06-18 17:27:16 +0530, Ratheesh Kannoth wrote:
> On 2024-06-18 at 14:38:24, Niklas Söderlund (niklas.soderlund+renesas@ragnatech.se) wrote:
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
> > ---
> > +static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
> > +{
> > +	struct rtsn_private *priv = netdev_priv(ndev);
> > +	struct rtsn_ext_desc *desc;
> > +	struct sk_buff *skb;
> > +	int free_num = 0;
> > +	int entry, size;
> > +
> > +	for (; priv->cur_tx - priv->dirty_tx > 0; priv->dirty_tx++) {
> > +		entry = priv->dirty_tx % priv->num_tx_ring;
> > +		desc = &priv->tx_ring[entry];
> > +		if (free_txed_only && (desc->die_dt & DT_MASK) != DT_FEMPTY)
> > +			break;
> > +
> > +		dma_rmb();
> > +		size = le16_to_cpu(desc->info_ds) & TX_DS;
> > +		skb = priv->tx_skb[entry];
> > +		if (skb) {
> > +			if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
> > +				struct skb_shared_hwtstamps shhwtstamps;
> > +				struct timespec64 ts;
> > +
> > +				rtsn_get_timestamp(priv, &ts);
> > +				memset(&shhwtstamps, 0, sizeof(shhwtstamps));
> > +				shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
> > +				skb_tstamp_tx(skb, &shhwtstamps);
> > +			}
> > +			dma_unmap_single(ndev->dev.parent,
> > +					 le32_to_cpu(desc->dptr),
> > +					 size, DMA_TO_DEVICE);
> > +			dev_kfree_skb_any(priv->tx_skb[entry]);
> > +			free_num++;
> > +		}
> > +		desc->die_dt = DT_EEMPTY;
> > +		priv->stats.tx_packets++;
> if (!skb) case also, incrementing the tx_packets. Is this correct ?

It could be moved inside the skb check, but it will have no real effect 
as the for loop is broken on the first descriptor that is not empty. But 
seems like a v10 will be needed anyhow I will move it.

-- 
Kind Regards,
Niklas Söderlund

