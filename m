Return-Path: <linux-renesas-soc+bounces-8977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3097B2A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 18:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EECD02862C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEB2185941;
	Tue, 17 Sep 2024 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="j3rggOBm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57849142621;
	Tue, 17 Sep 2024 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726589438; cv=none; b=VRH0dA/+9OaNj46/1cPpVXyMUngATn/gNLnddJ9Jjv1WHCWpABpiPPUnfrS9KTte1kFrSYWnq29Xz+GuH5URNluJpRLGMs/JQ679YexBFu/FQqYIm/LxFRH5VWO8hjVFXuTvIPzghnfH/Xdc6WWAxTuLA9G+c1MrNtY6uQrXsx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726589438; c=relaxed/simple;
	bh=ZDmo0+T1bXvG/blZ6IAC87t006UqSstW5d+MXp4X1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw6B++3c9+9r6XX3DBJZjTO0Nul3jzyeNjvb8evrtNicL6J0F2SmLduG7ktUI1dNQQrEa5GhXeXkBQG1SQrtaLG3/+LbB3ct0SfwIlCSxI6v+da2GGauy+VYBB+aEC3B9FrM38+/NY2rElEk08NS5JhnSurAlb8Wq60WxK5VUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=j3rggOBm; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c26lBn6pUaz2NthNDDdAGNn1PHwZrOoIZP0kg2YBzU8=; b=j3rggOBmZj4voxIF3xhcHhtWSo
	7ChmXLGLCi9bxrlKChgr1OQ7/TNv094A6rmcYJ+XdeenuNGQin/ZzViIuoHoB1Eain8/qF/9j3TDN
	b8WGEPLpl9Z579/34uZmO8Zx6lXqzjfEpSZW8l5USMenSX734I+pcJC9goMKs6I5VPelaiTHcrOXe
	YmGK5ORUKUYIlUQNRz2spm/1YT46OT/Z+LbrevaTZdQy9KIBY1ogqrdEvgjWtgTF5bTOW0/6Dt3mh
	gK6B2RVHipcW62/0UCPj/O9KUpcomawwqPhqrXBjG5ereeGyQPHfC1rx1+befLNs70RAiyMBHW2Ti
	XYm+eP7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40424)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sqamZ-00075m-30;
	Tue, 17 Sep 2024 17:10:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sqamW-00087P-2Q;
	Tue, 17 Sep 2024 17:10:24 +0100
Date: Tue, 17 Sep 2024 17:10:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 2/2] net: phy: Fallback to C22 access if needed in
 phy_mii_ioctl()
Message-ID: <Zump8Hmlxt3uqVFE@shell.armlinux.org.uk>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
 <20240906093955.3083245-3-niklas.soderlund+renesas@ragnatech.se>
 <365313cb-c767-414a-8b4b-97882854e9b6@lunn.ch>
 <20240906213608.GY3708622@fsdn.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906213608.GY3708622@fsdn.se>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Sep 06, 2024 at 11:36:08PM +0200, Niklas Söderlund wrote:
> On 2024-09-06 23:04:50 +0200, Andrew Lunn wrote:
> > On Fri, Sep 06, 2024 at 11:39:55AM +0200, Niklas Söderlund wrote:
> > > If a C45 only PHY is attached to a driver that only knows how to talk
> > > C22 phylib will fallback and use indirect access. This frees the driver
> > > from having to implement this themself.
> > > 
> > > The IOCTL implementation for SIOCGMIIREG and SIOCSMIIREG do not use
> > > these convenience functions and instead fail if a C45 PHY is used
> > > together with a driver that only knows how to speak C22.
> > > 
> > > Fix this by using the two convince functions that knows when to fallback
> > > to indirect access to read/write to the MDIO bus when needed.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/net/phy/phy.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> > > index 4f3e742907cb..89f52bb123aa 100644
> > > --- a/drivers/net/phy/phy.c
> > > +++ b/drivers/net/phy/phy.c
> > > @@ -342,9 +342,12 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
> > >  		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
> > >  			prtad = mdio_phy_id_prtad(mii_data->phy_id);
> > >  			devad = mdio_phy_id_devad(mii_data->phy_id);
> > > -			ret = mdiobus_c45_read(phydev->mdio.bus, prtad, devad,
> > > -					       mii_data->reg_num);
> > >  
> > > +			mutex_lock(&phydev->mdio.bus->mdio_lock);
> > > +			ret = mmd_phy_read(phydev->mdio.bus, prtad,
> > > +					   phydev->is_c45, devad,
> > 
> > Using phydev->is_c45 is probably wrong.
> > 
> > mii_data->phy_id is the device on the bus you want to access. It does
> > not need to be the same device as the MAC is using. Just because the
> > device the MAC is using is a c45 device does not mean the device you
> > are trying to access is.
> 
> I think phydev->is_c45. The outer if clause is checking if the PHY I 
> want to talk to is C45, or not. The phydev->is_c45 just express if the 
> MAC can talk C45, or if it only supports C22. This is the variable 
> mmd_phy_read() uses to determine if it shall fallback to indirect C45.

Nevertheless, this is wrong for two reasons:

1) the MII access API is a raw bus access debugging API, so its up to
userspace to do the necessary accesses. Yes, it's racy... it isn't
supposed to be used for production purposes.

2) the MII access API gives access to any MDIO device on the bus that
the _associated_ PHY is attached to. This includes non-PHY devices.
Just because the PHY that is attached to the netdev *might* support
C45-over-C22 (not every PHY does), this is unique to PHYs and is not
true of every MDIO device. So "upgrading" a C45 access to a
C45-over-C22 could end up corrupting other devices on the bus.

So, I'm afraid that I disagree with your change.

> I agree it's not the best. But is it not better to have the IOCTLs 
> working as they already exists, rather then have it function depending 
> on the combination of if the MAC and PHY both speak C22 or C45?

If the bus supports C22, and userspace asks for a C22 transaction, a
C22 transaction will happen on the bus.

If the bus supports C45, and userspace asks for a C45 transaction, a
C45 transaction will happen on the bus.

Otherwise, an error is returned.

Just because PHYs have this special C45-over-C22 thing, does not mean
that the low level debugging API should use C45-over-C22 for C45
transactions when the bus does not support C45.

I re-iterate, the MII bus access ioctls provide access to any device
on the the bus not specifically the PHY that you have attached to
the netdev. Using the properties of the attached PHY is meaningless
here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

