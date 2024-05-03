Return-Path: <linux-renesas-soc+bounces-5093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CE8BADBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 15:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62E9EB21C55
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 13:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70E6153595;
	Fri,  3 May 2024 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XUkQ3Eav";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jm9+a6vg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308C21A06;
	Fri,  3 May 2024 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743041; cv=none; b=j0kVtKwlM2HYdZwi8aKlSVIYzutegj77rXDx9BEJ/UJQrwnvrfuB6Ju/4xCrgTQ+oXlVTiTaSPFrxv6ij3KSWR2C65yNb7ARu9rEtKE0GfynMIzDqPkb5Q0zshj5jcbQfWIPdG8qBxp2t8AEGoq/QGyeDrp+EFApg2RQX2X0uO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743041; c=relaxed/simple;
	bh=zYZbsAa76DzmNq8WEpFR/M115VkQeAxyEUX+NKKxrEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfz6n3EFO2j2Ah0op/4D065b25qzYESQ6NOJZibgNOpVc4+q8kWh9tzFDApbS0/OZrWsiIOIbz2Z7O1MIITipfkr+o30Z1GuazH01J79Fd1h67LRbzmu/RGu9fv3Yu6HqyiuGiDJg40c4wwbx7zqx+Y/M8OyL0OxEoBm/ijeHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XUkQ3Eav; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jm9+a6vg; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id CE39718000CC;
	Fri,  3 May 2024 09:30:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 03 May 2024 09:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1714743036;
	 x=1714829436; bh=EaVFqzyd7MVWJTEQ74mcz1MI/VnyOBo/ZpEb54/E6aE=; b=
	XUkQ3Eavh/1Nk9Befre+oDU/boKxTt1mR0yyuxe12ORCmyJ+c36GiKAIYdDrHk+Y
	MOVXbCI+r07usi/zF9xbxNwI9+3E4J7YEr+Z4Pzd8TeQFnemcxZgGHlkueqXPrqK
	/LeiQo7PqNDlU6jo8ZvsT22wui/qgVrQzGwSazadupnwgk8ihiOCvCliaCouYc6r
	BnBpJ2EFgaVSoLZvbtd/vul8bNcC5gIy9nx5cdxSy9cPwP8PTOOIL+nmo8+dJt3h
	S8PUBJXVVrw6AKvJO58KYsENHXejr5pjF4TOmcLWGAEG3F2ZnBG2MVd1I104ryur
	6nw4bV6awDcj5tLGfkwryw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714743036; x=
	1714829436; bh=EaVFqzyd7MVWJTEQ74mcz1MI/VnyOBo/ZpEb54/E6aE=; b=j
	m9+a6vgnQzVxkj1k5/N5k9KUPFdecEnM7a0olkSKDH4SjlL3RvbEmtXmXO4sZWwH
	wjdHo7HWZiOpMMv2538zM5IIQyDXT1TN2SqDbDyeOUIO3rG1bqtIA4rHh7CZ7J6d
	02s6KcI/xu1pZYtIesmYHc2sUoGN/IoIIV80WJwyUhMIaEN3pTTqQJ1qBudhI68/
	Z22rCcW4bN8GK1qsyfU41bCep/XbNmG1Yy5Y0f1WFErBOGfADfkYD+EHJ0IdkiRQ
	j+tFbbaBzi/dPH8AAXvAGXY/EMeFZi7CBzSrNz7GGTyxMF8FQSlTqh6RMN6jVgwo
	27gF8TLTVjn4MycmnDwTw==
X-ME-Sender: <xms:--Y0Zsuyb6_oRZheCt_0flVmbgvyzCTg3ISAr0h5rClOn0JOd0eErg>
    <xme:--Y0ZpeeSzIlQUuaC106H0IJV3iR79oWUNcFfHQbQo9mWQYClh3EHGP3Eex25a2Fz
    4H4A4eaSXPwJlFk230>
X-ME-Received: <xmr:--Y0ZnyIQneqy460-jVQ5wMb29D9wD4kKWzPkMSLKKKl--poqbHcQ6SUTnWR6GyHZwwXughCXb5umYqFzuSuVdu_jPUWC7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvtddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:--Y0ZvPwJi3KYPGGV3Uj193P28iBwwTt2r7ftncdR76pqeR3A22sEA>
    <xmx:--Y0Zs-tVkw3KIZOY-RLbFsXo8dNf_3FpMTUIOU3MU4nGCPF-Oi_MA>
    <xmx:--Y0ZnWXyp5YUHu6kG7Ijb1YVBhqpp5bolBrcDIGHUOl_9b1kZzgpw>
    <xmx:--Y0ZlcszyiyOdidR9ZVIYCwYnQ4H-4K_k8Q8VHPwzbwXS3LAhEpVQ>
    <xmx:_OY0ZgSI1FwjvEbSpr458dheP7mV8ls9mQfXVBBN0-9oMDMc19JRKu8u>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 May 2024 09:30:35 -0400 (EDT)
Date: Fri, 3 May 2024 15:30:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240503133033.GJ3927860@ragnatech.se>
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
 <5fd25c58-b421-4ec0-8b4f-24f86f054a44@lunn.ch>
 <20240503102006.GI3927860@ragnatech.se>
 <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3ce12b0-fb5d-49d7-a529-9ea7392b80ca@lunn.ch>

On 2024-05-03 13:59:52 +0200, Andrew Lunn wrote:
> > > > +static int rtsn_mii_register(struct rtsn_private *priv)
> > > > +{
> > > > +	struct platform_device *pdev = priv->pdev;
> > > > +	struct device *dev = &pdev->dev;
> > > > +	struct device_node *mdio_node;
> > > > +	struct mii_bus *mii;
> > > > +	int ret;
> > > > +
> > > > +	mii = mdiobus_alloc();
> > > > +	if (!mii)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
> > > > +	if (!mdio_node) {
> > > > +		ret = -ENODEV;
> > > > +		goto out_free_bus;
> > > > +	};
> > > > +
> > > > +	mii->name = "rtsn_mii";
> > > > +	sprintf(mii->id, "%s-%x", pdev->name, pdev->id);
> > > > +	mii->priv = priv;
> > > > +	mii->read = rtsn_mii_read;
> > > > +	mii->write = rtsn_mii_write;
> > > > +	mii->read_c45 = rtsn_mii_read_c45;
> > > > +	mii->write_c45 = rtsn_mii_write_c45;
> > > 
> > > Just leave these two empty, and the core will do C45 over C22 for you.
> > 
> > Does this not require the bus to be created/allocated with an 
> > implementation that support this, for example mdio_i2c_alloc() or 
> > alloc_mdio_bitbang()?  This bus is allocated with mdiobus_alloc() which 
> > do not implement this. Removing the C45 functions here result in 
> > __mdiobus_c45_read() returning -EOPNOTSUPP as bus->read_c45 is not set.
> 
> phy_read_mmd():
>   __phy_read_mmd():
>       mmd_phy_read():
> 
> So is is_c45 is true?

Not sure, I never get that far. The function __mdiobus_c45_read() is 
called directly from of_mdiobus_register() call-chain.

The call chain is:

  rtsn_open()
    of_mdiobus_register() <- This fails and RTSN can't talk to the PHY
      __of_mdiobus_register()
        __of_mdiobus_parse_phys()
          of_mdiobus_register_phy()
            fwnode_mdiobus_register_phy() <- See [1]
              get_phy_device()
                get_phy_c45_ids()
                  mdiobus_c45_read()
                    __mdiobus_c45_read() <- Returns -EOPNOTSUPP [2]

1. Here is_c45 is set as it checks the compatible value is checked.

     is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");

2. The struct mii_bus have no read_c45() callback and returns  
   -EOPNOTSUPP.

> 
> I would expect it to be false, so that it then uses
> 
> 	mmd_phy_indirect(bus, phy_addr, devad, regnum);
> 	/* Write the data into MMD's selected register */
> 	return __mdiobus_write(bus, phy_addr, MII_MMD_DATA, val);

Cool, I was not aware of that code-path I was only looking at the above 
when trying to remove the implementation in RTSN driver.

> 
> which is C45 over C22.
> 
> If is_c45 is true, what is setting it true?
> 
>       Andrew

-- 
Kind Regards,
Niklas Söderlund

