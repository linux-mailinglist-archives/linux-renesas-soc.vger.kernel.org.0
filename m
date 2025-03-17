Return-Path: <linux-renesas-soc+bounces-14442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A62A638E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 01:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707D5188F0D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 00:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA2318E20;
	Mon, 17 Mar 2025 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AK9D9tp8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1lD7VqXU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC344A24;
	Mon, 17 Mar 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171576; cv=none; b=BcZeeBW4VJ0a25YlXm7jHXC1iyh2PMwt6Fa4QtdsyiEYVnzB+OVS62Qw5cgyFPsDs0tlLkyVxupiM3jQImJVJ60CQYvv+azJYfp5jsKdaTQ+F63dnEnVtEnsvnq2qLN33A9IuSsSxHPVWvXmsDJ6psR70uI3vW0/jaXWt2WjGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171576; c=relaxed/simple;
	bh=/W4Wz6ME2K4VsL8zRFuSGpPMmCwWteI6GuXA7Y/uCOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg+TTGX57moW3z1QaQMbhTRRDjV9ZbD8I+xg9NeGyK+VtzT8t1iVIiZRn0CnoGLJHmYb2uhD68kAjeNDBAHvoKkUlnel4bpEpt6sR7XSLKlf6Mp2kf/IO3vTneAZavImUkymP8tpFPPQgCzlcAklRAwgRqYckvWugcCsDf/30iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AK9D9tp8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1lD7VqXU; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id AE59B1140107;
	Sun, 16 Mar 2025 20:32:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 16 Mar 2025 20:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742171571;
	 x=1742257971; bh=07p0UDgAn3E7oFZv4ALaR17UkiP650akBExGxnt1O4w=; b=
	AK9D9tp8TwJYw1XxrZuzVdqr5QlaXPeh8lcubOlYfCtl8IL0yOJSblQJ2aaUY+jf
	yx4fmdq3v4v1M5BcsBWDjhrFGYG765/ZDb2SIjcddnW4apWbgR+WgGu1bbB4tFfK
	BJutSZs2ShS/+nlvNPjTxqcGJvremMkWm8bQQ08SPBoqRmd4htP4P1v7EiuA3mUa
	QMdtyaEDhM3nrGIa0wY6wXN2pUBi9SBe9ZpKCnJ8Zx/AybBRa2JfnYxELv4jwi/m
	+FOrzWZ4JIohPqLiseBjnRa6d9paYutQIBk08McFHC5lWDpghLobmJWg/YQ7bfDS
	DCzxxd/ROsLaWWqqPeyLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742171571; x=
	1742257971; bh=07p0UDgAn3E7oFZv4ALaR17UkiP650akBExGxnt1O4w=; b=1
	lD7VqXUHso5Q61BnM+YDjy0zLKdo9Xq0zJxVZaiK+pKv2gZ8JPBwNaJeGUk+1pw/
	phWUmcjMsG9Ghj56TWjDuU4w/Hqyd4gHfzw0lb3kCSnvXWHE9tbjDuy6a+84v2pX
	5D+t9gm9osbRxCShowRXucJaNNapBb2/HPhrhCSmGFeHzBllaeXiiB9yjvhkosQy
	jNZef4Xy58KgXhemgrdRYKKDsuDPTrkULaDG256qcOgnXlYzm4J0cBRR45oKT8Cc
	xsARU1tpX16id78KrOlMv7eZnb2yv8iQQDKfcO5W45mAUu95D1fQ6nMtKRhfnVMK
	QU2cwIc4YlPq4D3GofdrA==
X-ME-Sender: <xms:sm3XZ9csPsPMn5_0n2_A809GovEFc1vMn49Ef9D2lUQDbeNs3gGzOw>
    <xme:sm3XZ7Nd7A3XtBrS4yBeiqYS9NmNiaEBEOh3SSpPwt1Aj5i5NB1pJ1s7HjUQAHfHC
    Kla3oMyXN-f1mgzRyc>
X-ME-Received: <xmr:sm3XZ2gPN9zRpTb_MAWcDumcD4r2P7Gg-pcNwiMW-iXgW_MhLgRkk1RWYY4m-P-iY7La4UHppWJRoW2Cl00sb-13M37_wJ-n9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehjeejkeefhfehheetheeludegtdeggeeiueeigeeivedtkefgtedutd
    elheeftdenucffohhmrghinheprhgvphhorhhtvggurdgtrghtnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguihhmrgdrfhgvughrrghuse
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghp
    thhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinh
    hugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghv
    vghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgr
    sggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sm3XZ29rDOQy1I5AHBwfYF3fkqg1_F4WBiiJugQ5gAZaMynbKV0nQw>
    <xmx:sm3XZ5s8Z8oNOZ44q2VTt_5L2djK795koLxv-pkJIjxA6F47mi1vXw>
    <xmx:sm3XZ1GsMrij69k5p9FnyziOYN0g29vQtIb07n5DydR9jpSZrUZyOA>
    <xmx:sm3XZwO2rX9-K_MKQuCvJ_R_GdEC2aOJZmfuv6kuVTHmydI3dQkt9g>
    <xmx:s23XZ6krUlnVhKmr21cunKgnymY4un-BtI2Gy958KsVxIGONT4Mvze0t>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Mar 2025 20:32:50 -0400 (EDT)
Date: Mon, 17 Mar 2025 01:32:49 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
Message-ID: <20250317003249.GB660648@ragnatech.se>
References: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
 <20250316152324.GA12356@debian>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316152324.GA12356@debian>

Hi Dimitri,

On 2025-03-16 16:23:24 +0100, Dimitri Fedrau wrote:
> Hi Niklas,
> 
> Am Sun, Mar 16, 2025 at 12:20:33PM +0100 schrieb Niklas Söderlund:
> > The temperature sensor enabled for mv88q222x devices also functions for
> > mv88q211x based devices. Unify the two devices probe functions to enable
> > the sensors for all devices supported by this driver.
> > 
> > The same oddity as for mv88q222x devices exists, the PHY must be up for
> > a correct temperature reading to be reported.
> > 
> >     # cat /sys/class/hwmon/hwmon9/temp1_input
> >     -75000
> > 
> >     # ifconfig end5 up
> > 
> >     # cat /sys/class/hwmon/hwmon9/temp1_input
> >     59000
> > 
> > Worth noting is that while the temperature register offsets and layout
> > are the same between mv88q211x and mv88q222x devices their names in the
> > datasheets are different. This change keeps the mv88q222x names for the
> > mv88q211x support.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/net/phy/marvell-88q2xxx.c | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
> > index 15c0f8adc2f5..cdd40b613ce8 100644
> > --- a/drivers/net/phy/marvell-88q2xxx.c
> > +++ b/drivers/net/phy/marvell-88q2xxx.c
> > @@ -834,6 +834,7 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
> >  static int mv88q2xxx_probe(struct phy_device *phydev)
> >  {
> >  	struct mv88q2xxx_priv *priv;
> > +	int ret;
> >  
> >  	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> > @@ -841,17 +842,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
> >  
> >  	phydev->priv = priv;
> >  
> > -	return 0;
> > -}
> > -
> > -static int mv88q222x_probe(struct phy_device *phydev)
> > -{
> > -	int ret;
> > -
> > -	ret = mv88q2xxx_probe(phydev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	ret = mv88q2xxx_leds_probe(phydev);
> >  	if (ret)
> >  		return ret;
> > @@ -1124,7 +1114,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
> >  		.phy_id_mask		= MARVELL_PHY_ID_MASK,
> >  		.name			= "mv88q2220",
> >  		.flags			= PHY_POLL_CABLE_TEST,
> > -		.probe			= mv88q222x_probe,
> > +		.probe			= mv88q2xxx_probe,
> >  		.get_features		= mv88q2xxx_get_features,
> >  		.config_aneg		= mv88q2xxx_config_aneg,
> >  		.aneg_done		= genphy_c45_aneg_done,
> > -- 
> > 2.48.1
> > 
> 
> thanks for your patch. Looks good to me.
> Did you have the chance to test the LED support as well ? I'm asking
> because mv88q2xxx_leds_probe gets called in mv88q2xxx_probe. LED
> handling should be equal for all 88Q2XXX devices, adding the support
> should be easy. Anyway:

The board I have to test on is remote, so I have no way to inspect the 
LED. I did check the datasheet and schematics, and as you say it looks 
the same for both devices.

> 
> Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>
> 
> Best regards,
> Dimitri Fedrau

-- 
Kind Regards,
Niklas Söderlund

