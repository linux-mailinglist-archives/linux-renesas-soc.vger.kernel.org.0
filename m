Return-Path: <linux-renesas-soc+bounces-8836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC796FD77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 23:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06CE41C22059
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 21:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17137158D92;
	Fri,  6 Sep 2024 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NFfYokej";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ohp21qt3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7114883B;
	Fri,  6 Sep 2024 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658577; cv=none; b=ZpbrYiyXOQxm/Nu/ry0+eAyu2gd6JjF8g5NuvlLcBqkFKpsyIthIdhmWN3zfNlhEBaQOrJ0YbjPPPiT7K3aXj3B9aNQq3eJXQjkH6I3bvUreYO6b0oMzgiwf//gR1j68mv2py+1KQh/e3rMowSIwDxcgUZdwRnnF6gKLEkam0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658577; c=relaxed/simple;
	bh=coh1l02wB8A2oS3RIEqFs/MA6myPimjBonHjMWN185c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gm8HM2EeP917RWSVHX0YrI8eh4NwdUVo3oxsuIhuL15s5YAH9HZ6fP1Dg/x54vtk/gAGSxzD/UffIfwGE92f29Z3NPsfWGJNqmZgtqKoicT4nm3zq3i5xMNEfhrejCPoObfRN/MChjRxIOZisTj0l2vGWn8GgeLuMeDABjx+lto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NFfYokej; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ohp21qt3; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 00FA813801C9;
	Fri,  6 Sep 2024 17:36:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 06 Sep 2024 17:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725658571;
	 x=1725744971; bh=zcYnvB12Jf+yfxv4/iy0u+1MiO51ILepklHPBuACiLQ=; b=
	NFfYokejacDsFPNajkqG0TNSf+Fbq1+STsNqxwQpHTF8YRowEMoWGcRCOR4S5kbH
	WMRhloB4alz+qmUz/S6U8SqfWSi6dwADJzeHLDByfxGrwNcVA8ZB5rZdXXYd4QJV
	i8OMbXGgMXgLkt4Sinhc77Pr8ds+qV5T2YdBMNvZ+tov1f0d0JO2w1P0PqS1R+bu
	bzYc5sWKbyIFbICgbJiy/nf2cqaJ24Xx4Pfy3jtnKG72SdOEqVyuwvCNB7pElS7q
	EnUxPuOKYfKH2V1wGrcEaU5sqFE2ffoQ4WBa4NdfImP59dGIarXm2rq0FoKYz0zZ
	LVu3330YODU890HilfKSxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725658571; x=
	1725744971; bh=zcYnvB12Jf+yfxv4/iy0u+1MiO51ILepklHPBuACiLQ=; b=O
	hp21qt3/Cgm1vZxL1p4tDtgq9GLwAKAwQlUbnZZ3mfTp7zLVDu2U28icA5fvmlhY
	B++4NZavU8DWBuQ2dbekA1S3C34EZZYL0rb9buGxHvbukVD40Z4bPWFRYe0Yd0uj
	vd9kSaMrkcBGEZbvKKnDls64NNc57q+wh7IFRwpsj3JDgoyn1HYQNdKN9iY3PSok
	bfHjz+H7IxhKlNOVbL5KT1vpd+YmyTx7zytk4qwUJxb5OVLUp/YTMgSvpdoO90Gr
	ddsNSj0qxiM6wKKv09RV5rI7CkxpGbZMrxljRSdy18O5N7KYQ2jVQj45Y94/EDFv
	cKcAz1uSevJzikMlvCqWA==
X-ME-Sender: <xms:y3XbZvxjgd7m8YhdElKgwb-zupHQaulhRk972ju04gvHk6u963Iwow>
    <xme:y3XbZnQWMvlsNtjmqJfYPPZJJKdHMosGScaD4Ou0NLEsyVUj0FFRdjh5yOHRbA4pE
    eFhdDg73RqVs-9rJLE>
X-ME-Received: <xmr:y3XbZpUf0FxSKYgHtif5A_KZndfOJvvcMn4-ni-GlVFcSO-0thxaGeNMEiLkukL8YVJH4_LOUWR0dcsobeq-Au3cbmsb7Ssy5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeivdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeine
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhl
    rghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgu
    rhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilh
    drtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvug
    humhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpth
    htohephihoshhhihhhihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhm
    pdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:y3XbZpi8PBkVF8-3FUtMv-KKOpqT8tfk8bc-gFth3b95F2QOBYUHWA>
    <xmx:y3XbZhChsDjSY7q_aQHkuxgU1F-ykizpN2Gccd14Ol1fwATTLt4ccw>
    <xmx:y3XbZiKQj68MBFFUClqs5HgoNDHqRQcpxgAAXE7ui42rGMwDaMNQjw>
    <xmx:y3XbZgB8lIkAWkl_mD8XF0tBkqiqocaBl56QSpiLY8NxaYtC5WdfyA>
    <xmx:y3XbZl6XwVE7-gx7EvXx55aBXRD8C3WatmfZbsaEiuyqpnV_raIVenXA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 17:36:10 -0400 (EDT)
Date: Fri, 6 Sep 2024 23:36:08 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/2] net: phy: Fallback to C22 access if needed in
 phy_mii_ioctl()
Message-ID: <20240906213608.GY3708622@fsdn.se>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906093955.3083245-3-niklas.soderlund+renesas@ragnatech.se>
 <365313cb-c767-414a-8b4b-97882854e9b6@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <365313cb-c767-414a-8b4b-97882854e9b6@lunn.ch>

On 2024-09-06 23:04:50 +0200, Andrew Lunn wrote:
> On Fri, Sep 06, 2024 at 11:39:55AM +0200, Niklas Söderlund wrote:
> > If a C45 only PHY is attached to a driver that only knows how to talk
> > C22 phylib will fallback and use indirect access. This frees the driver
> > from having to implement this themself.
> > 
> > The IOCTL implementation for SIOCGMIIREG and SIOCSMIIREG do not use
> > these convenience functions and instead fail if a C45 PHY is used
> > together with a driver that only knows how to speak C22.
> > 
> > Fix this by using the two convince functions that knows when to fallback
> > to indirect access to read/write to the MDIO bus when needed.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/net/phy/phy.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> > index 4f3e742907cb..89f52bb123aa 100644
> > --- a/drivers/net/phy/phy.c
> > +++ b/drivers/net/phy/phy.c
> > @@ -342,9 +342,12 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
> >  		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
> >  			prtad = mdio_phy_id_prtad(mii_data->phy_id);
> >  			devad = mdio_phy_id_devad(mii_data->phy_id);
> > -			ret = mdiobus_c45_read(phydev->mdio.bus, prtad, devad,
> > -					       mii_data->reg_num);
> >  
> > +			mutex_lock(&phydev->mdio.bus->mdio_lock);
> > +			ret = mmd_phy_read(phydev->mdio.bus, prtad,
> > +					   phydev->is_c45, devad,
> 
> Using phydev->is_c45 is probably wrong.
> 
> mii_data->phy_id is the device on the bus you want to access. It does
> not need to be the same device as the MAC is using. Just because the
> device the MAC is using is a c45 device does not mean the device you
> are trying to access is.

I think phydev->is_c45. The outer if clause is checking if the PHY I 
want to talk to is C45, or not. The phydev->is_c45 just express if the 
MAC can talk C45, or if it only supports C22. This is the variable 
mmd_phy_read() uses to determine if it shall fallback to indirect C45.

> 
> Maybe i gave you some bad advice. Sorry.
> 
> This API is reasonably well known to be a foot gun. You should only be
> using it for debug, and actually using it, even only to read
> registers, can mess up a PHY/phylib.
> 
> The API gives you the ability to perform a C22 bus transaction, or a
> C45 bus transaction on any arbitrary device. That is all you need for
> debug, you can do C45 over C22 in user space. Yes, there are race
> conditions, but this API already has race conditions, which is part of
> why it is a foot gun.

I agree it's not the best. But is it not better to have the IOCTLs 
working as they already exists, rather then have it function depending 
on the combination of if the MAC and PHY both speak C22 or C45?

-- 
Kind Regards,
Niklas Söderlund

