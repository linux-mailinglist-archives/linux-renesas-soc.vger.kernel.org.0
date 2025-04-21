Return-Path: <linux-renesas-soc+bounces-16208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10764A956E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 21:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9D2F7A749D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 19:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F81EF382;
	Mon, 21 Apr 2025 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="JKafrj3O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D214EC46;
	Mon, 21 Apr 2025 19:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265133; cv=none; b=bcIW2SpLEWRBHphJIdi5vBHFPfqcOz3Twkp27IW01CmX0PhWLL3nGnke8dqcHXCLKUQVI7Pscp1yzqedg/i0FpglBnNvA27SOyh7Tkxnk07KI9XU+lvYDQ/vJxuKrQQJZaeqARxCmgoHkM9GuC2TJgIFPWX09c74SMnsWbeHgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265133; c=relaxed/simple;
	bh=u6safFetNv4QEP0r9Iz/YmPmNAmPjrfsQtubWT4us/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODBvd+IFbjMoK94e/BwryM5HOaY2SOKISZtyMUM9Y+moOaBHDhvgK8DBONcWVU3qxQvcaTcUuRuBfUqNUcNwCnGMmU4Afexo5JrbiMBb+NdTnMvvIXn8DDhktJzrs6kjoLnwN5V4MLqcqh7G55mGCk9mjOk037/nT2z+7i2TyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=JKafrj3O; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CoIXiOR5N4qvjIOVDMGoDjq4P3o+Q3XWknsTh3hugIQ=; b=JKafrj3OLsnuxsHw+VFNxH82yA
	TM2jheskPpBoFDY5/xp844xNRSPBxUT1UGoyCTP5TwbV50UiGTJoK6lWRZrqdjNdoqXDGgITcN5gz
	vevJR9DnBmIsQrgPVjts1CpRpFMUhXxVZckI8feZJxMwsbYilm0Ksuqec755JzCtDTN6asu9iFr2Q
	PdBYFesIWfaFrffZQqHMsx0HpE3KWeG17VDrJf0RgoktrUf9s+UbZbKo1llLg6z7M12lX+ePK85mi
	s4UG2UfzOixSH0XOn4K0rRPUZHUXVrlngVhCvsSzLcxzoCNYk0WdDmw5QponUsuyMPUM7lUqY0n8O
	quYz+Yug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55886)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u6xBH-0003Je-1s;
	Mon, 21 Apr 2025 20:51:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u6xBC-0006js-0V;
	Mon, 21 Apr 2025 20:51:46 +0100
Date: Mon, 21 Apr 2025 20:51:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <aAah0ofEozVUZAOa@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aAaVrVFql3vSktrT@shell.armlinux.org.uk>
 <TY3PR01MB113461CDEA58CB260ADB9FB9286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346DD3E3AEB0CCEAB57AE9C86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346DD3E3AEB0CCEAB57AE9C86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 21, 2025 at 07:23:52PM +0000, Biju Das wrote:
> Hi Russell,
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: 21 April 2025 20:06
> > Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> > 
> > Hi Russell,
> > 
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: 21 April 2025 20:00
> > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > > for Renesas GBETH
> > >
> > > On Mon, Apr 21, 2025 at 01:45:50PM +0000, Biju Das wrote:
> > > > Hi All,
> > > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.
> > >
> > > Which "mainline" are you using?
> > >
> > > Reading your emails, I suspect v6.14 rather than something post-dating
> > > v6.15-rc1, since your latest email suggests that the PHY driver's
> > > ->resume method is not being called early in stmmac's resume. However,
> > > commits 367f1854d442 and ef43e5132895 made this happen, which were
> > > merged during the merge window, and are thus in v6.15-rc1.
> > 
> > I am using Linux version 6.15.0-rc2-next-20250417 + renesas_defconfig with CONFIG_PROVE_LOCKING
> > enabled.
> 
> For me, it looks like issue related to timing, see[1] for details
> 
> [1] https://lore.kernel.org/all/TY3PR01MB1134690619EC6CADD07CD2DE186B82@TY3PR01MB11346.jpnprd01.prod.outlook.com/
> 
> Please let me know, if you have any patch that I can try out to fix the random timing issue.

That's the email that provoked me to reply this evening (I wouldn't have
because I'm still on vacation.)

So, this is how things are supposed to be working:
- stmmac_phy_setup() sets phylink_config.mac_managed_pm and
  phylink_config.mac_requires_rxc to be true. The former disables phylib
  based power management.

- You've hooked in stmmac_pltfr_pm_ops.
- On resume, this will call stmmac_pltfr_resume().
- stmmac_pltfr_resume() will call your ->init function followed by
  stmmac_resume().
- stmmac_resume() will call phylink_prepare_resume().
- phylink_prepare_resume() will call phy_resume() to resume the PHY
  if pl->config->mac_requires_rxc && phydev && phydev->suspended is
  true. The first and second will be true. The third... depends.

For phydev->suspended to be true, phy_suspend() needs to have been
called. Neither mdio_bus_phy_suspend() nor mdio_bus_phy_resume()
should be having any effect as phydev->mac_managed_pm should be
set (as a result of phylink_config.mac_managed_pm having been set.)

phy_suspend() also gets called from phy_detach() and
_phy_state_machine_post_work() when the work is PHY_STATE_WORK_SUSPEND.
This happens when we halt the PHY, which will happen if phy_stop() is
called.

phylink_suspend() will do this only when WoL is not active - calling
it when WoL is active will prevent WoL from working as the PHY needs
to stay awake to (1) detect WoL packets if it is programmed to do
so, or (2) pass packets to the MAC in the case where the MAC is doing
WoL.

So, phy_resume() should be getting called for the !WoL case, which will
result in the PHY driver's ->resume method being called - in your case
kszphy_resume().

This will occur synchronously, and after gbeth's ->init function has
been called, and as its all in the same thread of execution, it should
be 100% reliable.

For the WoL case, we assume that the PHY retains its settings since it
needs to remain powered up, and because it hasn't been suspended or
shutdown, it should be retaining all settings when the system wakes up.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

