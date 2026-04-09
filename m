Return-Path: <linux-renesas-soc+bounces-31082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECADGN+N12mtPggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:30:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291E3C9ACA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2462130098A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBAF35B14B;
	Thu,  9 Apr 2026 11:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0jWD8M8t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941514884C;
	Thu,  9 Apr 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734237; cv=none; b=ILDaqREeiPM7uRlsqiZUxZHBzNtwq3M32lWZ6d2u3YGhrWz1PzW15nc36nNwtMBtU/+JGSeXdC/qiuu5ngdfvoHNkoYI/K+nXpbS7wMhfOXMMguEMhMaNagtpd1/1G5NvjgGQEV3cPgOLrnHjwAK6GeEfHW1loc1yWa/+MVZeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734237; c=relaxed/simple;
	bh=vhuisLaRfw6ZFKxyr2Y0SD7Tahg+UGmd5J6cWEsmiDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1i9TfdmKhTTgjLR1kqipX7ICOum3GsMDWzectBlvgSuZQGQDfN+KoHdyQZuz02x+QlTmCAs0X9JbkmTUCVr0xkm52g5202i6uLe935qfigMuIz9YesdEich7Qb+HFNC75Jr9k4lZjXTjI92sxdspIs8pC5t6F5jB0VJyDE0f8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0jWD8M8t; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MMqFkU5//Urq/UeDEnZBPBKa4A17+wq2oYSTTa9aaIg=; b=0jWD8M8trqDXX0zRrSxRSWg4su
	pqRMH7Vuv48GG9CnyVgyJGAXMOYC34pFlI1Td06DqzU5AHEGyGtdgLWLeZr78TFq1njjO+jbNflFZ
	w1+hZ0BK33fcHdVjPefOxtmB2a4Ch4ciHLiwbYvColz6Ho0Lwr09XuToPQTTxHYvZxsvkwE7QVqmH
	nFx83g81qnO4oPvNsV2LSdN+Y3dl3e0NL2xCaw8c5B2EgNxOM9n/FRffANIWB++iEDKdl9iMNiIJq
	zU7VdSfNLd7kKMw+z8T5GFCx6vTOVWpwAQwry/E2xtD5t0yPXqI0mXMYPuUuEMnzNvLrt758VEprq
	vuGcjLFw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46956)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAnab-000000003TB-19Qg;
	Thu, 09 Apr 2026 12:30:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAnaY-000000004Lx-2fSx;
	Thu, 09 Apr 2026 12:30:22 +0100
Date: Thu, 9 Apr 2026 12:30:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Message-ID: <adeNzh3eu9PSdEas@shell.armlinux.org.uk>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
 <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31082-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.871];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 0291E3C9ACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:19:43AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 09 April 2026 12:05
> > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
> > 
> > On Thu, Apr 09, 2026 at 10:52:35AM +0000, Biju Das wrote:
> > > Hi Russell King,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Russell King <linux@armlinux.org.uk>
> > > > Sent: 09 April 2026 11:30
> > > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > > ksz9131_resume()
> > > >
> > > > phy_init_hw() will also call drv->config_intr(), so that doesn't need to be done either.
> > > >
> > > > It will also call drv->config_init(), which will call kszphy_config_reset().
> > > >
> > > > So most of kszphy_resume() becomes unnecessary. I think the only
> > > > thing that remains would be the call to kszphy_enable_clk() - and is it fine to call that after
> > phy_init_hw() ?
> > >
> > > It just needs kszphy_enable_clk() and phydev->drv->config_intr() to
> > > enable PHY interrupts for suspend-to-RAM to work on RZ/G3E SMARC EVK.
> > 
> > I think you mean WoL rather than suspend-to-RAM, although I don't see anything in micrel.c that hints
> > that WoL is supported, so please explain why and how the PHY interrupt impacts suspend-to-RAM.
> 
> This is not WoL. During Suspend-to-RAM, the DDR goes into retention mode while
> the CPU, SoC, and PHY power is cut off.
> 
> During resume, TF-A detects WARM_RESET, brings DDR out of retention, and jumps to
> the PSCI resume path.
> 
> > 
> > Note that a particular interrupt should not wake the system unless
> > enable_irq_wake() has been called for that specific interrupt.
> 
> If PHY interrupts are not configured during resume, no link interrupt is received and the message:
> "renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx"
> is not seen, as shown in [1].

... and why does that happen? Is it because the PHY has lost its
interrupt configuration and that needs to be reprogrammed?

If you don't disable the PHY interrupt in the suspend path, then
will the call to drv->config_intr() via phy_init_hw() before
phy_resume() be sufficient?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

