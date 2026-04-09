Return-Path: <linux-renesas-soc+bounces-31085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAjDIpuc12kUQQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:33:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D60CC3CA76D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291553013A56
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 12:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B313C73FB;
	Thu,  9 Apr 2026 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="S+n9szJK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2B3ACF06;
	Thu,  9 Apr 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738003; cv=none; b=X5CdWHTlyhUkwXhyznoa1V3zPR+H6TIh5mmX/VUlDpFxRAg3fQeY+BROwAVN0F0HdPCbebXd5yg572tHlYz3C707jh0JW89p2bk7Qmvm4E7W2oWep5+m4xqat5CQASgYmMKAUrPbr35BbwlB5MqEUeTysoFbrj1We16qPP2bUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738003; c=relaxed/simple;
	bh=9ULeZsc911lAicPCY2PEP6kcKP9KRPwzdO4WQWiq+Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAPEkmrMlhaqd4T6VtDWa5z5ptpd5vkoiREFovNUFb19F5NeIUViCwhtJLTTAvPNMhhIu6oURwV3nQQv4fZNLmwfP9VyFcOOhpDkknqJgrTnz+/NK91iUyXEzUSMc67ptEcLaXkpcPAW73vH/E5lgAjIbmY6pwInk/Su1dbmCXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=S+n9szJK; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5Bn+DnYoJa0XZ6Z2wLQFNpb2np6oh+svzQhD1S33LBM=; b=S+n9szJKZiHHwnccs7UxdiN+cq
	8WMDjwUCj0fNtSa5lqStF+MXb4JbdWMlm3hx003/gUQkNHlF/rgAj9Qn9Wtbwqg2gSr7CKCx4pzQW
	xH9Yl01CuXhlicMawyqeygks7RYV9j8ciXgIZIzLHK79Gd72TTeHyEIIgH4vXRL7xbE9uG4votQam
	17/6eC+nIommvCg26PpldJczg+9+VIj9fh095M78i9R5dlOC2iSwrLCaRDM6lL2gtsjZGkATJJKn4
	Z7awkWuJY93DjPxVRkQKWvMsTcVoJkcRXbtFlQh25PUrcjzmlkbbEmJWvHuxAAqQ7ukbdy2cbv+Vr
	3vlYTACA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35246)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAoZN-000000003YO-02rg;
	Thu, 09 Apr 2026 13:33:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAoZK-000000004OS-0PUw;
	Thu, 09 Apr 2026 13:33:10 +0100
Date: Thu, 9 Apr 2026 13:33:09 +0100
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
Message-ID: <adechY4Y6zUQkFwq@shell.armlinux.org.uk>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
 <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeNzh3eu9PSdEas@shell.armlinux.org.uk>
 <TY3PR01MB11346DC74FBC1043C9C0A27D186582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DC74FBC1043C9C0A27D186582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-31085-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.896];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: D60CC3CA76D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:58:04AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 09 April 2026 12:30
> > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
> > 
> > On Thu, Apr 09, 2026 at 11:19:43AM +0000, Biju Das wrote:
> > > Hi Russell King,
> > >
> > > > -----Original Message-----
> > > > From: Russell King <linux@armlinux.org.uk>
> > > > Sent: 09 April 2026 12:05
> > > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > > ksz9131_resume()
> > > >
> > > > On Thu, Apr 09, 2026 at 10:52:35AM +0000, Biju Das wrote:
> > > > > Hi Russell King,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Russell King <linux@armlinux.org.uk>
> > > > > > Sent: 09 April 2026 11:30
> > > > > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > > > > ksz9131_resume()
> > > > > >
> > > > > > phy_init_hw() will also call drv->config_intr(), so that doesn't need to be done either.
> > > > > >
> > > > > > It will also call drv->config_init(), which will call kszphy_config_reset().
> > > > > >
> > > > > > So most of kszphy_resume() becomes unnecessary. I think the only
> > > > > > thing that remains would be the call to kszphy_enable_clk() -
> > > > > > and is it fine to call that after
> > > > phy_init_hw() ?
> > > > >
> > > > > It just needs kszphy_enable_clk() and phydev->drv->config_intr()
> > > > > to enable PHY interrupts for suspend-to-RAM to work on RZ/G3E SMARC EVK.
> > > >
> > > > I think you mean WoL rather than suspend-to-RAM, although I don't
> > > > see anything in micrel.c that hints that WoL is supported, so please explain why and how the PHY
> > interrupt impacts suspend-to-RAM.
> > >
> > > This is not WoL. During Suspend-to-RAM, the DDR goes into retention
> > > mode while the CPU, SoC, and PHY power is cut off.
> > >
> > > During resume, TF-A detects WARM_RESET, brings DDR out of retention,
> > > and jumps to the PSCI resume path.
> > >
> > > >
> > > > Note that a particular interrupt should not wake the system unless
> > > > enable_irq_wake() has been called for that specific interrupt.
> > >
> > > If PHY interrupts are not configured during resume, no link interrupt is received and the message:
> > > "renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx"
> > > is not seen, as shown in [1].
> > 
> > ... and why does that happen? Is it because the PHY has lost its interrupt configuration and that needs
> > to be reprogrammed?
> 
> Yes, but phy_init_hw() reconfigures the PHY interrupt during resume.
> This is due to phydev->interrupts = PHY_INTERRUPT_DISABLED; in the suspend path, as you mentioned below.
> 
> > 
> > If you don't disable the PHY interrupt in the suspend path, then will the call to drv->config_intr()
> > via phy_init_hw() before
> > phy_resume() be sufficient?
> 
> Yes, I confirm that if the PHY interrupt is not disabled in the suspend path, the call to
> drv->config_intr() via phy_init_hw() before phy_resume() would be sufficient.

I think we need a simple solution for 7.0, but subject to Andrew's
agreement, I think we should consider having phy_init_hw() inside
phy_resume(), and a series of cleanup patches that result from that
change, including getting rid of unnecessary code in micrel.c for
the next kernel cycle. As I say, subject to Andrew's agreement, please
can you look into this. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

