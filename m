Return-Path: <linux-renesas-soc+bounces-5225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC4B8BFB8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 13:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5ED1C20DA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 11:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3782981751;
	Wed,  8 May 2024 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kVlP7MGl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VY7+Kihv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC181752;
	Wed,  8 May 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715166196; cv=none; b=fde2Kyba4TUqcm1Kw/fCfV+6T4OckfD+YjReE8Q1MDzma35ctGEuZuB8h5IKTq2+USenFYOXyXuAvCwnoGpX9Qv3MizQz44R6IIwqYafYnhJbFVvFsKPc0x0TIjoFAAdRLMuE/0SQLEHR1KvKTgFwLIqAqxObo57czQF7Sq8o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715166196; c=relaxed/simple;
	bh=idAYd0p7V7CI8zrpQBScXfvNecJtwsRXz1w5LR2UUZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6kf4s4Tyywsi4mZZPc8CxFGOsZWlMj034SuHom+RmpuBh6gpFo4vUUjgkXWrzCTqFqEBSM1D60EGXredXkkbzPRcBaRk4Dtr8m0YEma6s5WP42d+wAzriDdwzAH+lMGuAcPJ7TyoRXbhrlPCr8GYXCNJ99MylfjOXQT8l3iLFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kVlP7MGl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VY7+Kihv; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A198A114025A;
	Wed,  8 May 2024 07:03:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 08 May 2024 07:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715166192;
	 x=1715252592; bh=4PFoxPqK373lYc5LVI5dFtMK6L5SWkrtpaRDSfzc0Yw=; b=
	kVlP7MGlZ+3RRztqPBlleODxE67g0LLoRzgoUtzkwrtrzHMX9yxCT/7HsbynPA0v
	c6Sdf9iqTsS7EHU6gGns8XjKxsiBcHdGHaISVS5CNzbrLkBd79Td+g65fKbCP6q0
	NqyBosrUi/3BdXcQQuGQttLdfH7nJLxLe/8gTyxBDPvADSMLdii2p3//rYS2LqK+
	Msch1sJjt7GzypwL4Gp8QieUqPwC2h3Nl5Umj0SWXUiXe7ToHD4M9grEb6V0syZO
	pj2j0SY9GjOpdQUdah/IImc7/WXqQ/MpLdJoPX905sN78vc3wSFcq8JhP0hUcGuC
	oIzcqq0vGZFrKhnHrE7FEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715166192; x=
	1715252592; bh=4PFoxPqK373lYc5LVI5dFtMK6L5SWkrtpaRDSfzc0Yw=; b=V
	Y7+KihvnjtTyELme4mSpvgreEqvUNIn+eUzL49uralcxpHx+NjNh0T4KAWxCCpbg
	NZtM8mfPI429EcvkC6sHtVixnk37TG/APxLwgueoAtH+nXpxrWJdgamrrsMuAH2y
	QBLHpSr2xsdju/nmhu0m8YkGsb4f0LoYDDlZDP3n4lHVRpQoCAIY6EHIPLB70bwN
	CSJwzQezeqQ7j4SHwAdpqS3HhDCiBeBtRXDfvd4VKwW/NLMJ0O7/mYZAtwCE5A2j
	fKhGGiYoDJYLVvgguqofZLnG5jDJNByDxujtEzK/nUrsMkJ9LhLuvwo+IjDCsdR7
	/feKRjykFWh3bXVcJ81eQ==
X-ME-Sender: <xms:8Fs7ZjEvMSU35zCjQhXxUGQlkmkHNjA4xJHi82ZOJu1kE862tioM8Q>
    <xme:8Fs7ZgU6eU2ISGN1e1FQKKpbcJ-CSSJs-c2jbIZAInjAmhfLStvmThPWv14Dozour
    xVpf_-eLACygvzkJz0>
X-ME-Received: <xmr:8Fs7ZlKKurAj621S5VfhJEj5Rs4W4vHU_N9QDOEjVZ8fjL23F8t5ZmMpmYQN2y6Y_CSyNmcGWZTt7hvLNz4IMyYP7uEwfdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:8Fs7ZhH9LbwAFLoPIurxYePuFQPhbJGwU6GMCj_fqz9ng5UGR-5Z6Q>
    <xmx:8Fs7ZpXK4bZHJeoxLvoqmZ4dElrAHIlBuWaWa5Fadn_HXwQyyW636w>
    <xmx:8Fs7ZsO7ZzKsnPuQNt2pvJz1--AgOM9Kxq7ItM1M3I7ogIIK3OA30g>
    <xmx:8Fs7Zo21PU1GurGZKRJJUkxnJm-K0hOTBQEQj1PhCvkm4ME4_nHwww>
    <xmx:8Fs7ZlqrSPm-pzqmZRODblt5y66-uy01S76iTzLo3Za4y3OWHE5AJl5c>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 07:03:11 -0400 (EDT)
Date: Wed, 8 May 2024 13:03:10 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240508110310.GC1385281@ragnatech.se>
References: <20240507201839.1763338-1-niklas.soderlund+renesas@ragnatech.se>
 <25f23887-061f-4ce6-a424-e5bf269cf8b5@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25f23887-061f-4ce6-a424-e5bf269cf8b5@lunn.ch>

On 2024-05-08 02:52:18 +0200, Andrew Lunn wrote:
> > +static int rtsn_probe(struct platform_device *pdev)
> > +{
> > +	struct rtsn_private *priv;
> > +	struct net_device *ndev;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	ndev = alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAINS,
> 
> ...
> 
> > +	ether_setup(ndev);
> 
> struct net_device *alloc_etherdev_mqs(int sizeof_priv, unsigned int txqs,
> 				      unsigned int rxqs)
> {
> 	return alloc_netdev_mqs(sizeof_priv, "eth%d", NET_NAME_ENUM,
> 				ether_setup, txqs, rxqs);
> }
> 
> Notice the ether_setup here? I think you end up calling it twice.

Indeed, I completely missed that. Thanks for pointing it out, will fix 
for next version.

> 
>        Andrew

-- 
Kind Regards,
Niklas Söderlund

