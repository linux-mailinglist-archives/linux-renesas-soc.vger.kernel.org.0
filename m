Return-Path: <linux-renesas-soc+bounces-31195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOpdHBp72mnG2wgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 18:47:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C53E0E56
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 18:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43CDD301C581
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6522E2C15BB;
	Sat, 11 Apr 2026 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="PR7WAvLv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A28DF6C;
	Sat, 11 Apr 2026 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775926036; cv=none; b=KLa1N+O+DJ75NN2pDKtYRGmtzYPYk7bq3+UaDmCDgtU9LGa91QR5Pl2Z7HRXwiHmHJGGCyWpSRW7zEjEds1RfYwrl+8+EVh47QKXhT4UCNCTPb6WX2zg5pgJcjcRux1yIp9vNCeIZAbNlTd+e7qVJi9VTcd4+btuMKWAyxKMzic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775926036; c=relaxed/simple;
	bh=8cQZImQp+tuVvGHr4GmxXjui6MMfQ2dLUI/hZd9WRFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULEDL38HPr92Gyp7bC5N12lCs4R6l/bDzYg8wjuWxcOxIXhGuqEvcyrdXX1iTgG0iDFwikCzn3tDqS0+52xBNHiqn1B/JFatZA1gxXlHwGbeX7xj/5b2OhdSqniTzDI7F00oe+44jVD/Y72/JgkwXxmRWHWTxUBUJHh2HuZ8L34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=PR7WAvLv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qKF12S90jU35vPmsb+IS2nvo1a00d4ctwx48R3EXU9M=; b=PR7WAvLvGplY6r36JhuLZrC8rs
	uXxSqxok7GpsE9ws+KIcaL7+qJ1T0W7eZdI8Awr9yScdz3nn++8zd56gn2POog78UdCdbAzDZaIti
	XZNtOE2hSup3scYWBmsj0M/Z6GbSOrTYGAaVivFqwuoWa3+aOOPQMJnJ598yQ2lmkh6Mdfr5eKfsy
	SWvyOPa9AsOfY0zubhAcnA/KEYmTtEP6b2IcU1HcbRNcw5VWC6UPZaDCxs9PnsGTNplLUVCAYIDCR
	lTI9GL0s+yaW9tWWgcIv5nyEuQaJn7/+WK95P6/QSKrz7EDS0oOyj5Kot8Ce45dVB5WaBaBSFOL/I
	S1DLTCTQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60304)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBbTz-000000006JT-2VOg;
	Sat, 11 Apr 2026 17:46:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBbTv-000000006la-4688;
	Sat, 11 Apr 2026 17:46:52 +0100
Date: Sat, 11 Apr 2026 17:46:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <adp6-wElGOOijZRG@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <admMethCSjOQhu8g@shell.armlinux.org.uk>
 <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31195-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.977];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D13C53E0E56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 03:50:13PM +0200, Andrew Lunn wrote:
> > So, I question whether any of the functions in this driver actually
> > have a valid reason to take phydev->lock - looks to me like a not
> > very well written driver.
> > 
> > In cases like this, I don't think we should make things more
> > difficult in the core just because we have a lockdep splat when that
> > can be avoided by killing off unnecessary locking.
> 
> Agreed. This patchset should cleanup these locks.
> 
> We also need to look at lan937x_dsp_workaround(). I also don't see
> what that mutex lock/unlock is protecting. Accessing bank registers
> need to be protected, so doing one additional access within that
> should not need additional protection.

Looking at access_ereg(), shouldn't it be taking the MDIO bus lock
and using the __phy_* accessors anyway because it's writing various
registers which determine what is being read via the
LAN87XX_EXT_REG_RD_DATA register or the value written via the
LAN87XX_EXT_REG_WR_DATA register.

Also, as it has access_ereg_modify_changed(), that entire sequence
needs to take the MDIO bus lock to safely do the read-modify-write.

Then there's lan87xx_config_rgmii_delay() which is a large open
coded read-modify-write for the PHYACC_ATTR_BANK_MISC, LAN87XX_CTRL_1
register.

To me, this looks like a racy driver, and it also looks like it's using
the wrong lock to try and protect hardware accesses.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

