Return-Path: <linux-renesas-soc+bounces-5089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CA8BAAAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 12:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45B4F1C223DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3079C14F114;
	Fri,  3 May 2024 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GCcI+tQP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f89CV4dE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27314F9FE;
	Fri,  3 May 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714731614; cv=none; b=lwQC8knn56te3QBH4j4/Qoiise4WtS3Cb04GFOny4JjF3sHlVp+xKtWXQKxE7uKphNIsVECnkHjfM4PZ44irFIzfOq3K3UqE8EjH5GAl4HDGbFdLouusOOnJbT12xxmYEedvfTBZuxo/8hkmdTtaIIxDjKxZ10h2VXJdN81qIXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714731614; c=relaxed/simple;
	bh=DICoQVnYmPgorHVxrVIP1LQv23ML1uRoPplIE/qzPAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtEEo0cFV4rt0OCFKOG2x2nc7uK20JRZGs7At7exSb4H7YKHNCJ7Niuu7EIOFGv8XTUSgJRgw57UAujoFLYR7PhO+X4J3+IjfOB8vHfY73RwH7o+9xgiJXG/gKiIvTy6r+prry2LqtzGtXqZzCHqKHYs6CamZnAlUy/Hy0/K1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GCcI+tQP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f89CV4dE; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id E45DC13803C1;
	Fri,  3 May 2024 06:20:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 03 May 2024 06:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714731609;
	 x=1714818009; bh=DPfInlo/XvXy4NjkU3rFcKyvCmG30F7qzTeSUQQsAcE=; b=
	GCcI+tQPWXhW6DJ4M7RO9QT0jxM+zoJQAMUfMXsn6RRkVXqAtCZui/QJPvXoc86k
	XjI8jKqzHd/+AKOsUMpSJpbOfB54KyKiH85k3qj+Dk2HTpSfWHnF+llF1HiysQJ1
	Y0SHlON5hQb+Jeyai9ZouRLN9F3eA+gKk7Y3FXOoeTFmz3Ryna4v08Dlgbj0Z3E8
	7WI69eq+UZJ+PmhwZn+f5X9Xcl1KMGo+yrH/PBnQoP2qCKx6pQr/9ZZaFJ7ckYpy
	e1KSPfxpWeb9AcBLMulIkGJzqkJXbz0krvkjRCeg0YYuf3kPY+PDydNHdOFy7Vee
	HvSAIVm8aQIh2BhYSBSCAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714731609; x=
	1714818009; bh=DPfInlo/XvXy4NjkU3rFcKyvCmG30F7qzTeSUQQsAcE=; b=f
	89CV4dEOxGeRFPWMJInejm6bZnrKi7MJuc/vOQw1nl31CESo3u0V65xiPwINUU78
	Z+pNwZZsRv7hYLOs+hxF6FlOVSdLMED2sd4oEvUUggO/Ar/CEiUKhGR8T91z/w7d
	kkF9ecD74zBE1C0XjVmRzvd0+Ac3aYTWHB90YgYAK2kBukJjqKCXOTRiximUR1Uh
	uRgXTOsh1mXBv4VI3hlYRXeKiv7FLhjSuHAJG0TnyYuOWh+qfMp43TVHJi8hbdD5
	sjVRz9XQo/b0znoFWjGiLViKyvaKaD6NwpeUn4gtaWLR3jY0t6HzGVmAj6vrih9A
	Wqw9hBMOAFP7A76ryHQRA==
X-ME-Sender: <xms:Wbo0ZmSsDDC6ua-o4JsvEJK_mLA8oMFq_osl2ZMYDrX0VSgnMAUl5g>
    <xme:Wbo0ZrxabcTwhE3EqRnAal_aS4qk7fahjkeUhX9Wk909FmgvV-VN9gmuY3JNPQdlP
    cFKKuvuXfWX5zKIitc>
X-ME-Received: <xmr:Wbo0Zj3ixIYpwI_RnCEZd96Re3EeUOujEkMP2v4liaBcOzX6WD7syAij_JKnc9NmJknobm2GS8xk83CqYuOJSXAeIWX1TtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Wbo0ZiCONgBhTwjOUAKQorWPShvku_S0j7FUVFCSLQMapxvPbluTqQ>
    <xmx:Wbo0ZvgHrxzaa5GdCdG0Ss7Hk3LCPwE-e1lXL1UMzr1v996ap6cVOw>
    <xmx:Wbo0ZurQNWF9mlGKwxiLyamxJdE8i1VIKB2eBXJRYQIP_DbqY0344A>
    <xmx:Wbo0ZijB8bPA60GNV7oMMluF9wq2n6XTAh3D--oJZrn5WtmBr1woDg>
    <xmx:Wbo0ZgXUFF1TvEsA5vBzkH6CfSFp0O50ihEDK2xG4dRY9LUGjnqX-5_V>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 May 2024 06:20:08 -0400 (EDT)
Date: Fri, 3 May 2024 12:20:06 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240503102006.GI3927860@ragnatech.se>
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

Thanks for your review.

On 2024-04-16 00:55:12 +0200, Andrew Lunn wrote:

<snip>

> > +static int rtsn_mii_access_indirect(struct mii_bus *bus, bool read, 
> > int phyad,
> > +				    int devnum, int regnum, u16 data)
> > +{
> > +	int ret;
> > +
> > +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL, devnum);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_DATA, regnum);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL,
> > +			      devnum | MII_MMD_CTRL_NOINCR);
> 
> This looks to be C45 over C22. phylib core knows how to do this, since
> it should be the same for all PHYs which implement C45 over C22. So
> there is no need for you to implement it again.
> 
> > +static int rtsn_mii_register(struct rtsn_private *priv)
> > +{
> > +	struct platform_device *pdev = priv->pdev;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *mdio_node;
> > +	struct mii_bus *mii;
> > +	int ret;
> > +
> > +	mii = mdiobus_alloc();
> > +	if (!mii)
> > +		return -ENOMEM;
> > +
> > +	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> > +	if (!mdio_node) {
> > +		ret = -ENODEV;
> > +		goto out_free_bus;
> > +	};
> > +
> > +	mii->name = "rtsn_mii";
> > +	sprintf(mii->id, "%s-%x", pdev->name, pdev->id);
> > +	mii->priv = priv;
> > +	mii->read = rtsn_mii_read;
> > +	mii->write = rtsn_mii_write;
> > +	mii->read_c45 = rtsn_mii_read_c45;
> > +	mii->write_c45 = rtsn_mii_write_c45;
> 
> Just leave these two empty, and the core will do C45 over C22 for you.

Does this not require the bus to be created/allocated with an 
implementation that support this, for example mdio_i2c_alloc() or 
alloc_mdio_bitbang()?  This bus is allocated with mdiobus_alloc() which 
do not implement this. Removing the C45 functions here result in 
__mdiobus_c45_read() returning -EOPNOTSUPP as bus->read_c45 is not set.

The allocator in question here could possibly be alloc_mdio_bitbang(), 
but I see no easy way for me to implement the mdiobb_ops struct. Is 
there a different bus implementation I should use that is able to talk 
C45 over C22 ?

-- 
Kind Regards,
Niklas Söderlund

