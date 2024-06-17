Return-Path: <linux-renesas-soc+bounces-6372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDA90B7C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 19:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E457C1F24B3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 17:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6685E16DC07;
	Mon, 17 Jun 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pF+dQpe4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bfvFXSsA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFFB16D4E1;
	Mon, 17 Jun 2024 17:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644851; cv=none; b=ACjY/lANhq5KR+Kyg6VfwquewTlp4LPcXh+jvh/EH3px0XjrZ8XBgyfoqzILMfV/umEfK6ezhPSAvE0VG3FIyvtMq2sP1ZsSxuCNkBxM+AXc7a/sVxbsqNRlGnOaWnHyDqBHjf7L+bG9Qe19Ub2jzXhDx7DFwpMXO077MYdPw8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644851; c=relaxed/simple;
	bh=+5/FUHkbw3NH+kQzndB/Y0YlhYz2S/Z2mC1HKOOwKcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UU0pPI+vvmj/ISaGyOaqdN4YmBRAUE7L5RVXueqAFW96VnkF2ztTn5gJ2GDmO3By9E7y3DWniwJ9P2xaD+tT1ffQzoku5rJ2Z0SdzB7obdvHIW+cB/gVfOCNWSgalNCe4sVzNvrgef2zo06Zy+Y5/wyPzNNU2H/LYKeN/RXNldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pF+dQpe4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bfvFXSsA; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id CF5C6180012E;
	Mon, 17 Jun 2024 13:20:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 17 Jun 2024 13:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718644845;
	 x=1718731245; bh=l1CctP9H/9iN5K+wiFA+tdgZqWgJKcdpigi7qJiuTpc=; b=
	pF+dQpe42Wf2I7wDHVBhgINh8wdhQxniO7/8tKSgnxGP9Pt1dFzulbJGZw/6cTRN
	KUc7w7QwaImnLqcTr4679Au9xKclnqaLfEvxl6MEw4mwMcUtk7YNG12y5c19jZUP
	h1ndurrzSJsYQPQ0mb+HXMEQPjnmujPhP3eHPxSJ+38YzPqww9RKsWOgaQfbiGIo
	FHYYDbEghxcxROAqLFVJigQl+N6dqpJ7vqt3Q94hB5IFJO/Hw+oXqG1+DehstkpA
	GPWmVJD2fiXVv3VvQ9iNHs+ZnqUuc7BqkHQ9JONfrRd61USVczbkM1lq2ctF1QBy
	1Lt+aHPtCrfpFffQG2vQZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718644845; x=
	1718731245; bh=l1CctP9H/9iN5K+wiFA+tdgZqWgJKcdpigi7qJiuTpc=; b=b
	fvFXSsA6UUcagW9hXCpFIUgDIjyj1vi1TBOJ09bLgVUtByCRX1oEiTAdgn4ay0km
	TJNlbi+57T3oMOHV4KKdJImKDyNyLUll26Q4Y/T3odPOjQE3OeS2Ifj1pDpjx/8a
	PMvTL0FZW9N+e78NXSG0308jrYcglC6DSMyhNVHzzHyd2FQlZ5w/hajpTInbJ7XH
	XsgyR/aI98T9Ky2o+rGWdfsN2m4uDtbPz13BlhHys3PttTRWYMsQibGgC/gFBU3a
	oHSKEwQVlt3rA8JXoLyhXN+LwX2QkJ7hKLRwEIge3wqueJo/b5qhSV3tXVehwX8G
	AJ+9HhkHH6zBcjMWIEPUg==
X-ME-Sender: <xms:bHBwZu3tS_rZi70gNbt8j5QIp4wTPmb2aqq1FbifbrJJ3zOnxgq5Mg>
    <xme:bHBwZhFYie5L0P1YwyW2oavULVrtA0j3qJZxjwUPyi-VVJ6K11WSGD2trvz_JSuYs
    nSQUiDNuvQWrDsEZOM>
X-ME-Received: <xmr:bHBwZm4dptohXF7QMqETjGgY8LFV23YEEcV85kINhGeT2mMmWyC3FxqcehH1JZHT-qykuzJRbjBb3o7yFpVfTl1PzzRvadk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:bHBwZv3HdiGb3Eozz_uWQCPw7aU3itoXFq44Ji6mCj6mSyYBxGnb8Q>
    <xmx:bHBwZhE5wPbdSM2QUwMZ1naFKUsOM4wWeGK94TrguAUpJS8plusfWQ>
    <xmx:bHBwZo8usJ05qvs6wpZ1Gykbl16Y4vvVilQAmpPyXnjSZGqcz1JzIQ>
    <xmx:bHBwZmneSc5VlDk3iRYnp2yDgu5fCjFrEBr_g4mW4_IVxLuCJHG0Rw>
    <xmx:bXBwZgDicQgg1FDAm3iwcF9a5Eb0kqSDuJMXG9phLBim8lkMTTOVchbN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 13:20:44 -0400 (EDT)
Date: Mon, 17 Jun 2024 19:20:41 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v8] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240617172041.GN382677@ragnatech.se>
References: <20240613104119.2820792-1-niklas.soderlund+renesas@ragnatech.se>
 <306484c7-4a8c-45ba-b0c6-74514a522f05@bp.renesas.com>
 <20240613124921.GG382677@ragnatech.se>
 <adbe998e-d410-4797-b8a7-24d45ca7a1bc@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adbe998e-d410-4797-b8a7-24d45ca7a1bc@bp.renesas.com>

Hi Paul,

On 2024-06-17 14:41:52 +0100, Paul Barker wrote:
<snip>
> >>> +	entry = priv->cur_tx % priv->num_tx_ring;
> >>> +	priv->tx_skb[entry] = skb;
> >>> +	desc = &priv->tx_ring[entry];
> >>> +	desc->dptr = cpu_to_le32(dma_addr);
> >>> +	desc->info_ds = cpu_to_le16(skb->len);
> >>
> >> Should we check against the maximum TX frame size supported by the
> >> hardware here?
> >>
> >> Whatever we do here, we should also do in the ravb driver as that makes
> >> a similar cpu_to_le16() call to fill the DS field with no check that the
> >> HW actually supports transmitting a frame of the given size.
> > 
> > Compared to RAVB the RTSN driver do not support splitting a packet over 
> > multiple descriptors, so the max frame size adhering to the MTU will 
> > always fit using a single descriptor.
> > 
> 
> My concern here is with pathological or malicious packets.

A malicious Tx packet due to local VLAN setup? There must be easier ways 
to crash a machine if you got the permissions to configure interface 
VLAN settings :-) But I agree the user shall be protected from
misconfiguration.

> For example,
> you can use stacked VLANS (QinQ, QinQinQ, etc) to expand the size of the
> TX frame for a given MTU since the bytes used by the extra VLAN tags are
> not counted as payload bytes.

This is interesting, I only played with single and double tagging never 
QinQinQ.. . For some reason I assumed that after double tagging space 
where going to be consumed from the payload. But indeed setting up 4 
levels of VLAN tags shows the payload can be force to stay the same and 
the skb->len do indeed grow.

  $ ip link add link end0 name end0.2 type vlan id 2
  $ ifconfig end0.2 10.0.2.10 netmask 255.255.255.0 up
  $ ip link add link end0.2 name end0.3 type vlan id 3
  $ ifconfig end0.3 10.0.3.10 netmask 255.255.255.0 up
  $ ip link add link end0.3 name end0.4 type vlan id 4
  $ ifconfig end0.4 10.0.4.10 netmask 255.255.255.0 up
  $ ip link add link end0.4 name end0.5 type vlan id 5
  $ ifconfig end0.5 10.0.5.10 netmask 255.255.255.0 up
  $ ping -s 1500 10.0.5.1  # Give an skb->len of 1530
  $ ping -s 1500 10.0.4.1  # Give an skb->len of 1526
  $ ping -s 1500 10.0.3.1  # Give an skb->len of 1522
  $ ping -s 1500 10.0.2.1  # Give an skb->len of 1518
  $ ping -s 1500 10.0.1.1  # Give an skb->len of 1514 (no tags)

The above was produced using RAVB and not RTSN and similar VLANS on a 
2nd device was setup to allow for ICMP traffic and replies.

> 
> At least with the RZ/G2L family, no verification has been performed on
> sending packets larger than 1526 bytes to my knowledge. Even using only
> one TX descriptor, I was able to completely lock up the GbEth IP by
> pushing a 2kB frame into the TX queue. So I do think it is worth adding
> some checks here.

I will add a check for this to RTSN.

-- 
Kind Regards,
Niklas Söderlund

