Return-Path: <linux-renesas-soc+bounces-31143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPuGJGsP2Wl+lggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:55:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59F3D8D66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FE0B3006990
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 14:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655B53D7D99;
	Fri, 10 Apr 2026 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="JDI66gYZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A79308F23;
	Fri, 10 Apr 2026 14:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832934; cv=none; b=pTUtVvvWOI+VuBqGMFU60OdBlEl0cNZqI+OkYLT5gnAm/nRMiP9ZLfbVLdP01g6cdJZyMCR/K0ietUILOpBe/688uvjD7vjIu18/bpGoGLaSDUVLoNUAlZTP/nuhtU6fO+HfcQ4l+IqHqUFuIDwVsj8vqfhCztZjbvre7eK4bN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832934; c=relaxed/simple;
	bh=Ct77eSN/pyODbp+xdAgW04GL04De/iIrMh2Iofulfok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbFsyUMPEtpHz3u4jwuGzN3zrOaWdLV/uTRhBRDsKivbiNCcPBgk2RxWjMtzSnfCKHkNG2r1B7il7NrfBsVYRlf9Jd5mYA3E3s+8dFN6f2pEFWyATmix0AkRhJUpsMP2N6JyVvC0xTY8RWYeUlIulvPfAyAd8dmIVUvEWk+N1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=JDI66gYZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uun455N00wPFIjb8RzsNjnhEL6zH/6y6n8q6AGsp+LY=; b=JDI66gYZXf0F3a+qoet7uxXt8l
	q+eP9+Da3fG+b/yT8UH2bnUlzknamGKshyAbAva7c0TCu4L9DAdeeuKMVnK0dsgrSYMk5EOTORtpA
	Zd6piTWTIK5z3aviNWM7aKUmc20qCFnPyJ0+2ZfSbFiy6fpg+0oTancKxZj8zgwrQeBLuD+KrGDpo
	w0grAAC85wFx2ld32koPEEmow07Qw8XEOlRngRBzBW5OrbfY0Hm8xan+lyUMZKJObhy/Y4Y6qrTBZ
	I1SzEqQRGgg9Lg0DGCswaV0kwKVArXhnfwJCGJ01Z9gA+KmvRX2gVtSKpYaHxOgDzJlBqiNRN/4vf
	m/n4LHdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43448)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBDGY-0000000055n-0ZAx;
	Fri, 10 Apr 2026 15:55:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBDGW-000000005hj-2YvG;
	Fri, 10 Apr 2026 15:55:24 +0100
Date: Fri, 10 Apr 2026 15:55:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju <biju.das.au@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Message-ID: <adkPXI9pz1RCYpJ8@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31143-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.590];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,renesas.com:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 5D59F3D8D66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 03:51:18PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 10, 2026 at 03:29:01PM +0100, Biju wrote:
> > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > 
> > When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped, so
> > phy_init_hw(), which performs soft_reset and config_init, is not called
> > during resume.
> > 
> > This is inconsistent with the non-mac_managed_pm path, where
> > mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on every
> > resume.
> > 
> > To align both paths, add a phy_init_hw() call at the top of
> > __phy_resume(), before invoking the driver's resume callback. This
> > guarantees the PHY undergoes soft reset and re-initialization regardless
> > of whether PM is managed by the MAC or the MDIO bus.
> > 
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/net/phy/phy_device.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> > index 0edff47478c2..8255f4208d66 100644
> > --- a/drivers/net/phy/phy_device.c
> > +++ b/drivers/net/phy/phy_device.c
> > @@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
> >  	if (!phydrv || !phydrv->resume)
> >  		return 0;
> >  
> > +	ret = phy_init_hw(phydev);
> > +	if (ret)
> > +		return ret;
> 
> Do we want to do this even when phydrv->resume is NULL?

I should've also added (sorry, busy packing) - with it always being
called even when phydrv->resume is NULL, it means that the call sites
to phy_resume() in phylib which are preceeded by a call to
phy_init_hw() should have that call removed, otherwise we're going to
be calling phy_init_hw() twice.

As the patch currently stands, that's the case when phydrv->resume
is populated, and I think we should avoid that.

> Apart from that, looks fine to me - it seems some paths call
> phy_init_hw() can be called with or without phydev->lock held, and
> this one will call it with the lock held which seems to be okay.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

