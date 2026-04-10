Return-Path: <linux-renesas-soc+bounces-31164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFVKOi6N2WnSqggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31164-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 01:52:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6DB3DD918
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 01:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36D643013A64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 23:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CA4388E5F;
	Fri, 10 Apr 2026 23:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FV/Dzq/x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7040DFD9;
	Fri, 10 Apr 2026 23:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864968; cv=none; b=J7fSnTZLotLayDXxsvnQSGL1fxw5wXzh5CEoloZOE+kibPpPIhsyc/4teBqVjz7YI2R+Z2jOz3zKjsqN8Q7ALdPTaQwsXk+zthhoxieEiqXGznsuIWz4RJmEruCS993y185pxTk4DjVggSHPl3QC07fGX82R/Tub7KnIY1RlfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864968; c=relaxed/simple;
	bh=pLiaHzDtvRPWgWLYGJlwiFUsCCGbTtzVX9RlVtYqPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiF6f4pPFFyjknCvJZeZlvyorxHaH5S8Bp2Udc3N60uG3zXHDfV0cBJpnJytHqCK8FI+RbtwT1OcJwQ5/3MT6ijyVdNt0Pc5mFRKJD+3HJ/A7kknFdkOetUS8UJdcmerolrgxybC7AawsJ4oh5DArDipsj1X0/+osTjMqA4n9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FV/Dzq/x; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GniXfLefCt+nsXI0+DB9pBwNPJLQYdvU0xNyxBuHy7I=; b=FV/Dzq/xwRVulghjslqRmGOd8Y
	4Iw4Fd2dWsVQQyC9YtW/1GqIlJQCSKx4uIu1puR7T8UQAaqKudFNlkO2Ugtl/i7yGfV3NbvXOOOCB
	zLd65ZP2rNOsO2DuQR37TXt8qWq0BViL6U48G+fwvdFlyB44Ym5vXS7nq0DgNUyTWmdHaxF48B428
	eDBGYIXYGIqgwanhUXhvV5s0+O60cmBHSvLghNfN0My+kQ5RFfi9FQsrqY4UjwPG1r0m5IOpDgy8J
	IUMzZVEbpdSUnBDp0y6jRCVAwblmJ9GPqQLzz8ErZ2NGc6tWAdAQx8taBorxTnzp71k5GGjMqGs1v
	A4XlokPg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37062)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wBLbB-000000005UD-3ORn;
	Sat, 11 Apr 2026 00:49:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wBLb8-00000000659-3B1D;
	Sat, 11 Apr 2026 00:49:14 +0100
Date: Sat, 11 Apr 2026 00:49:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "biju.das.au" <biju.das.au@gmail.com>,
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
Message-ID: <admMethCSjOQhu8g@shell.armlinux.org.uk>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-31164-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:url,shell.armlinux.org.uk:mid,lunn.ch:email]
X-Rspamd-Queue-Id: 2C6DB3DD918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 04:41:08PM +0000, Biju Das wrote:
> Hi Andrew,
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 10 April 2026 16:15
> > Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
> > 
> > > Apart from that, looks fine to me - it seems some paths call
> > > phy_init_hw() can be called with or without phydev->lock held, and
> > > this one will call it with the lock held which seems to be okay.
> > 
> > Haven't we had deadlocks in this area before?
> > 
> > Please test with CONFIG_PROVE_LOCKING enabled.
> 
> I have n't faced any issue with micrel phy. But my collegue
> got the below issue with Microsemi phy. It doesn't finish the boot.
> 
> drivers/net/phy/mscc/mscc_main.c 

Looking at this driver, I'm wondering why it's taking phydev->lock
in vsc85xx_edge_rate_cntl_set()... phy_modify_paged() is already
a fully locked atomic operation (it takes the bus lock) and taking
phydev->lock gains nothing.

vsc85xx_mac_if_set() is a different matter, and this _should_ be
using phy_modify() to atomically change MSCC_PHY_EXT_PHY_CNTL_1.
phydev->lock doesn't guarantee that e.g. userspace won't access
the register behind this code's back.

vsc8531_pre_init_seq_set() is a repeat of vsc85xx_edge_rate_cntl_set()
except with phy_select_page()..phy_restore_page() which does the
necessary bus locking to ensure the entire sequence is done atomically.
Ditto vsc85xx_eee_init_seq_set().

So, I question whether any of the functions in this driver actually
have a valid reason to take phydev->lock - looks to me like a not
very well written driver.

In cases like this, I don't think we should make things more
difficult in the core just because we have a lockdep splat when that
can be avoided by killing off unnecessary locking.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

