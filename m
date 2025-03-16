Return-Path: <linux-renesas-soc+bounces-14437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1042A63588
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 13:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB420188F8EE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8D019B3EC;
	Sun, 16 Mar 2025 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qGHtt+PH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZzU9rmBn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CACA1A00ED;
	Sun, 16 Mar 2025 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742126547; cv=none; b=idK4+ELHKBVGN0eastm9wTx+ox4QiST+pO2lIb7n6/JoNwGY532+0cyB8Iq+9ClYJiq9sHJXznQfV9SFIFv0O6d8BX4RG4LjghhyV7orQKsMQIOsK7uoR5ZAsRotAff7/r6/fzm/aqaSL6vJAGvRT0hCf/WzyjKs0DoyaSmb1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742126547; c=relaxed/simple;
	bh=lSXp+O9DVaXUTCGjNyXSEofZO98+fskYq0zZTyMYzGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLD90NgxtmBQne71vpq0LRC4imCsWWWrAMvG3uPh2goO+qlM0E/2h38OHbFPYS9GYARVe7hNdh117+96zb/DZ18o/x66iBVsx37xRGm5uq56uiwFzXpSNaq99uP4GNQGhdFbx74Ke+AY4BMPX4X/EpjyIJE8TGDTziWJnIc9JiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qGHtt+PH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZzU9rmBn; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3D75A138112B;
	Sun, 16 Mar 2025 08:02:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 16 Mar 2025 08:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742126544;
	 x=1742212944; bh=Py4sMxnIyeWWbqRr6YZjl8z5nwTB7JAUCvTD2qb//d0=; b=
	qGHtt+PHUDWvsbY59dLVIPQPKno8D1xW3KFbVRgndVqPqBkZICmEbYO5oUGeO6sV
	F2JIgd4U1Os4l+LS0zjmY3frCWe2886IZWBSlFzHonX9UQ8K2O02dLa+8gsmurUs
	BR+xO2JgUYmXSGG8Jbs8EF898U4TIk4WnlVZ6dwDV8HzO1CT8N/iaP3KeU0Qf/QE
	RIZKMMYtVETBpJmHou80jbEGcUO4zY+abAUN+UTcowAeqVcz28nW3jydyIR3raTr
	iLRsvNxHogm7LUOcheHfEFTcqV0nt3o021t0xOcZNi0upc77aLqXOnwBgMFWQY8D
	emGqqksfl5P8BmHh073fcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742126544; x=
	1742212944; bh=Py4sMxnIyeWWbqRr6YZjl8z5nwTB7JAUCvTD2qb//d0=; b=Z
	zU9rmBn1ezC8wBQLldXHYdeYbAhIXtQ4IyjbyVq2wlcmReM1ESsnVimG/S3lzVW1
	uHdHhhJTv8zeY/YxM2Xjn19Us5YjGP5Aka5Ct+N2uYpsxtIZ4fn/RcSd/G+wvJOE
	i0HcDkRTWIU3V/e4gcwhPlsHLOPGbkULBe+QQAE63mRx4xf2j5HxfTUfxekQA7Cs
	YdkiTSNVVV1oDOqjryvpsWw6U1tL+irk8SY4oGlpbxJlfmecFkDVngRUuLqdexqM
	UJlWdOn9lZqDX+Uj2S2p3KXm5zj2s02JhoiVgPNEIi0d9uvoMOBHen1Mkw9az5od
	0uCVmz35u8FD5qB8JKkmA==
X-ME-Sender: <xms:z73WZ-r3ftiIvhYzT0RV3d5cUUhaRGu1ZBdoGEheaRglvbyI7fL4_Q>
    <xme:z73WZ8rmeQC52hj64X3UIbRTv51_0NnVxSaKIRaklmZCyhZaOYvZa1l0GTMEI0iyG
    kG4qNR9RBc5l546toI>
X-ME-Received: <xmr:z73WZzMY2Z4Ccvqo1Xqd6xzp0uffBe9pONTWpdWhBkGihv3puQar39BNW-slJRWavfqO976oBImOY6WmSPq29rVUgAg4GB5f2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeiheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeffkefgudekgefhhfejtedviedtgeetieekffeiudfhgeevteejvedtff
    dvkefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunh
    guodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrg
    hilhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthho
    pehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughimhgrrdhfvggu
    rhgruhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:z73WZ96LFHxe3JYdqEHZA-bxwCu6_woCnUn4ahJU5QANCKkMUKZYhA>
    <xmx:z73WZ97FVPsGWY2JyCgu1zOr9Xz9_BIWgMM-ZJhFzDdDa3lftLPgSQ>
    <xmx:z73WZ9hPbJoZhAWFDl1QQVbuMuHnbXZsK2Vd0fXUQ5IVgf6Cjto9RA>
    <xmx:z73WZ36gl21O1rvczOmnFvacHVkIHLUZ75DpcdEKpscN_8pRHJfLcA>
    <xmx:0L3WZ6yLEPPJTKyQ3t6yOqjkyUZ--mVeAA3jb3cCaE-j9o-LoZU6O_nN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Mar 2025 08:02:23 -0400 (EDT)
Date: Sun, 16 Mar 2025 13:02:14 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Enable temperature sensor
 for mv88q211x
Message-ID: <20250316120214.GA360499@ragnatech.se>
References: <20250316112033.1097152-1-niklas.soderlund+renesas@ragnatech.se>
 <c17d4b58-9efd-4c09-8e20-e4f9e2e10100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c17d4b58-9efd-4c09-8e20-e4f9e2e10100@gmail.com>

Hi Heiner,

Thanks for your feedback.

On 2025-03-16 12:47:55 +0100, Heiner Kallweit wrote:
> On 16.03.2025 12:20, Niklas Söderlund wrote:
> > The temperature sensor enabled for mv88q222x devices also functions for
> > mv88q211x based devices. Unify the two devices probe functions to enable
> > the sensors for all devices supported by this driver.
> > 
> > The same oddity as for mv88q222x devices exists, the PHY must be up for
> > a correct temperature reading to be reported.
> > 
> In this case, wouldn't it make sense to extend mv88q2xxx_hwmon_is_visible()
> and hide the temp_input attribute if PHY is down? 
> Whatever down here means in detail: Link down? In power-down mode?

These are good suggestions, this issue is being worked on [1]. I just 
wanted to highlight that this entablement behaves the same as the 
current models that support the temperature sensor and log how this was 
tested on mv88q211x.

1.  https://lore.kernel.org/all/20250220-marvell-88q2xxx-hwmon-enable-at-probe-v2-0-78b2838a62da@gmail.com/

> 
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
> 

-- 
Kind Regards,
Niklas Söderlund

