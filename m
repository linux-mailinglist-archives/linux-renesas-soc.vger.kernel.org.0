Return-Path: <linux-renesas-soc+bounces-31165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LSiKV6N2WnSqggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 01:53:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6E3DD92E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 01:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC1CC303FAAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 23:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259A138A29A;
	Fri, 10 Apr 2026 23:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="yjgG1Uno"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59534363C64;
	Fri, 10 Apr 2026 23:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865097; cv=none; b=tH56hTZsSpzKo6HOi/GTMLMRwRn0qqzpVdawnSTZsdfqzrT1V0U/TluvZ9ndnP25diGpXYAYAXK/EVpBIqffvO5+Sal8PzBZk5+coQmiCh8prfShfEv9Z/7aEJITZwZLj/DSx3/7zxBpBJnoGjtehnqvvm+uL8C204/C2Jav1mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865097; c=relaxed/simple;
	bh=H3h9oM/pAyNUP0Xl/szWiImDBrJ3w6FUxgxJnZ+zunw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dec/JJXSN14rZFbS/DAaMWCmdUVDxIzCxvLYcAL/krhmCd7wIB/2EEaaRe7Rxd8q47WqhxdywMH0sNjdErLJ/4P/N5r7KDM8y0wzYtBmeGgJY2r8tmuz/G7ZCC06jmoZE2HJO4qLFL5285fvdaKc4hTvWabRKs85XM8KCq02pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=yjgG1Uno; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wJcLJpXPBwDXxBKnu3Ua3ryD7pYNhV+iw16fIM/TE/I=; b=yjgG1UnoMImRSW3dsvMVSHKAY8
	/2g83xkMj9zdxauPdBF4XZqk6mLGl657x2vD0O/nFAIWLF500snT/ZftsQ3psEOKunzMHeeaHAeoO
	QrS8hDRGt0nAPHZe6r2PW34mJ0WuxbsO7lYvGJFpB04kIGZuw26vU3mhoqQbZngNFIByJdJlN76+H
	5rSl6jD0nw5JSBN4cXCPLxkmYe4BdTJlYA1DKdDLrZb6c/vJn26vJDPRN/Iq80/pvnioPZuY/Fj5y
	Jhy3bIYpchw6GFfYpP5OHbSRccYspH291BptftKE1W9m0l/UF96XI9nz2U2jkJxlUO2c+uaM3MltO
	Fz0E78XA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56170)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBLdI-000000005UU-3PWl;
	Sat, 11 Apr 2026 00:51:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBLdH-0000000065H-22vA;
	Sat, 11 Apr 2026 00:51:27 +0100
Date: Sat, 11 Apr 2026 00:51:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Message-ID: <admM_1bf6frKfLJ9@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <adkPXI9pz1RCYpJ8@shell.armlinux.org.uk>
 <TY3PR01MB113466D8DD83EC0B48D8262CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113466D8DD83EC0B48D8262CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-31165-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,armlinux.org.uk:url,renesas.com:email]
X-Rspamd-Queue-Id: C5F6E3DD92E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:27:02PM +0000, Biju Das wrote:
> Hi Russell King/ Andrew,
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 10 April 2026 15:55
> > Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
> > 
> > On Fri, Apr 10, 2026 at 03:51:18PM +0100, Russell King (Oracle) wrote:
> > > On Fri, Apr 10, 2026 at 03:29:01PM +0100, Biju wrote:
> > > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > >
> > > > When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped,
> > > > so phy_init_hw(), which performs soft_reset and config_init, is not
> > > > called during resume.
> > > >
> > > > This is inconsistent with the non-mac_managed_pm path, where
> > > > mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on
> > > > every resume.
> > > >
> > > > To align both paths, add a phy_init_hw() call at the top of
> > > > __phy_resume(), before invoking the driver's resume callback. This
> > > > guarantees the PHY undergoes soft reset and re-initialization
> > > > regardless of whether PM is managed by the MAC or the MDIO bus.
> > > >
> > > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  drivers/net/phy/phy_device.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/net/phy/phy_device.c
> > > > b/drivers/net/phy/phy_device.c index 0edff47478c2..8255f4208d66
> > > > 100644
> > > > --- a/drivers/net/phy/phy_device.c
> > > > +++ b/drivers/net/phy/phy_device.c
> > > > @@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
> > > >  	if (!phydrv || !phydrv->resume)
> > > >  		return 0;
> > > >
> > > > +	ret = phy_init_hw(phydev);
> > > > +	if (ret)
> > > > +		return ret;
> > >
> > > Do we want to do this even when phydrv->resume is NULL?
> > 
> > I should've also added (sorry, busy packing) - with it always being called even when phydrv->resume is
> > NULL, it means that the call sites to phy_resume() in phylib which are preceeded by a call to
> > phy_init_hw() should have that call removed, otherwise we're going to be calling phy_init_hw() twice.
> > 
> > As the patch currently stands, that's the case when phydrv->resume is populated, and I think we should
> > avoid that.
> > 
> > > Apart from that, looks fine to me - it seems some paths call
> > > phy_init_hw() can be called with or without phydev->lock held, and
> > > this one will call it with the lock held which seems to be okay.
> 
> 
> The new patch will be like this, after moving phy_init_hw() without
> phydev->lock held. Please let me know are you ok with this?
> 
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 0edff47478c2..4a2b19d39373 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -396,10 +396,6 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
>  	WARN_ON(phydev->state != PHY_HALTED && phydev->state != PHY_READY &&
>  		phydev->state != PHY_UP);
>  
> -	ret = phy_init_hw(phydev);
> -	if (ret < 0)
> -		return ret;
> -
>  	ret = phy_resume(phydev);
>  	if (ret < 0)
>  		return ret;
> @@ -1857,16 +1853,14 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
>  	if (dev)
>  		netif_carrier_off(phydev->attached_dev);
>  
> -	/* Do initial configuration here, now that
> +	/* Do initial configuration inside phy_init_hw(), now that
>  	 * we have certain key parameters
>  	 * (dev_flags and interface)
>  	 */
> -	err = phy_init_hw(phydev);
> +	err = phy_resume(phydev);
>  	if (err)
>  		goto error;
>  
> -	phy_resume(phydev);
> -
>  	/**
>  	 * If the external phy used by current mac interface is managed by
>  	 * another mac interface, so we should create a device link between
> @@ -2020,6 +2014,10 @@ int phy_resume(struct phy_device *phydev)
>  {
>  	int ret;
>  
> +	ret = phy_init_hw(phydev);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(&phydev->lock);
>  	ret = __phy_resume(phydev);
>  	mutex_unlock(&phydev->lock);

Looks good to me. Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

