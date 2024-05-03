Return-Path: <linux-renesas-soc+bounces-5090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9C8BAC03
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 14:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F9F2817A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 12:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DD7152507;
	Fri,  3 May 2024 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZtirVIsK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DDD14F9F9;
	Fri,  3 May 2024 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737609; cv=none; b=CwhgXhHskuCO+uIhonAw6yURQrcuuqHsZzRneW5xnHaral3JOQ9fgXT5N8G1DkqAuyBfw1q40m5KgHJSAO2DKdljZemQynLOu6kQYRDWmL+SM4Eaj/UxZ7UxySlDGURCKmuIc8jffTGjsJ5OtCdbqT2KHWlequjCaX/kLdDAElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737609; c=relaxed/simple;
	bh=7LmhktS6u3Iwhbb36bRy5n7kXHjFejvVHfTey4yNvns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFey786s7+NvuzpE6c70hWR4fDzWgXSdDvlsvjCw7gwTRMKOyh10mnbkfzEmO1Ic93EIzI58kqpHEc79a4hyAEALC4kc/FjpIETAGq5tmwfKPWxWVVIKb/ikyuwOwPdPyhn8M8bolVyM4zWuX0bVKvJuBTmdA6iin7ZUoxPzz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZtirVIsK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3NPrbtUhHTLw5GFQKfpOgz03Eo6EbkYCxwv51hwLt40=; b=ZtirVIsK183q63ycUbDU4dcB6M
	DAFbTBclzS+1SxL5+FQ15AI+s1jb/xR18iTpnFP+XMI3OP5N5dAaAxVHejQWISyRZBc1DiRoFqxM+
	fFAtOCMqM5Z3iDbboV/ea1CHbXzGbEzGKAToqddIBaBnktEweBB3GVlKSrDWgMcTLQHk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s2rZw-00EZL8-Qp; Fri, 03 May 2024 13:59:52 +0200
Date: Fri, 3 May 2024 13:59:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503102006.GI3927860@ragnatech.se>

> > > +static int rtsn_mii_register(struct rtsn_private *priv)
> > > +{
> > > +	struct platform_device *pdev = priv->pdev;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *mdio_node;
> > > +	struct mii_bus *mii;
> > > +	int ret;
> > > +
> > > +	mii = mdiobus_alloc();
> > > +	if (!mii)
> > > +		return -ENOMEM;
> > > +
> > > +	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> > > +	if (!mdio_node) {
> > > +		ret = -ENODEV;
> > > +		goto out_free_bus;
> > > +	};
> > > +
> > > +	mii->name = "rtsn_mii";
> > > +	sprintf(mii->id, "%s-%x", pdev->name, pdev->id);
> > > +	mii->priv = priv;
> > > +	mii->read = rtsn_mii_read;
> > > +	mii->write = rtsn_mii_write;
> > > +	mii->read_c45 = rtsn_mii_read_c45;
> > > +	mii->write_c45 = rtsn_mii_write_c45;
> > 
> > Just leave these two empty, and the core will do C45 over C22 for you.
> 
> Does this not require the bus to be created/allocated with an 
> implementation that support this, for example mdio_i2c_alloc() or 
> alloc_mdio_bitbang()?  This bus is allocated with mdiobus_alloc() which 
> do not implement this. Removing the C45 functions here result in 
> __mdiobus_c45_read() returning -EOPNOTSUPP as bus->read_c45 is not set.

phy_read_mmd():
  __phy_read_mmd():
      mmd_phy_read():

So is is_c45 is true?

I would expect it to be false, so that it then uses

	mmd_phy_indirect(bus, phy_addr, devad, regnum);
	/* Write the data into MMD's selected register */
	return __mdiobus_write(bus, phy_addr, MII_MMD_DATA, val);

which is C45 over C22.

If is_c45 is true, what is setting it true?

      Andrew

