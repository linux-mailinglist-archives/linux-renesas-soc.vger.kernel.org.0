Return-Path: <linux-renesas-soc+bounces-16198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740DA9536C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 17:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F273A3AD9F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 15:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84571C6FF9;
	Mon, 21 Apr 2025 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qHCaqiwu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6522905;
	Mon, 21 Apr 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248317; cv=none; b=Kve/Q+38N579PCKo4odrxuxfTJ+41sE/Q73LztfgDCU7Ah8vNNoLeWYyWWpSPcLi4Pzv7CbIhnmvqGOFY9J8v01qVugDqg+Vq2wz38tSR6T9iW8Je2InbdwKJz2g9lerLK4q7YMPQJLac10w2aNJkS6UvBjA9RmNd69hlJ/SKp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248317; c=relaxed/simple;
	bh=EHa/T6ez41b7oXSy+VilbiKuFoqWi+nKvsd0pJrHXaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlXi8sPEuG0c1mS+hSTgb0WafyrpX7KXvSU0gzGINJut1SQAZpjn2xOu/DXNxh5vGTUezWtGsaN+bQfRGW6tdHPN3qERxlCoAd+3fX+xCztBOhkm7sclIMxRW4qp0yrlVU5ECQmLis0JMjIiiE4v1SuEv0OH/SMbwHJz5dka7Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qHCaqiwu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Jt6Utj2gPnUwIkyT9SlweszWJ+twHHILTLiotcUmrKM=; b=qHCaqiwuxSKszljmJWaE601OSF
	YcOiLderKUsaC/XvaDrl21q7KCeSeexFrd0XJHP50GNrUZnL3VFH5WP47EhlISWxHK5OShI+41Gi6
	xBhFwLfVeGe0ZbQkjp2E45upG1z/sinn3vcJmgISRApho8l1bwPCK88tw5AkoSKu9vGs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u6so1-00A6Bo-Ac; Mon, 21 Apr 2025 17:11:33 +0200
Date: Mon, 21 Apr 2025 17:11:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Message-ID: <c27a2359-ee55-4d20-907d-314eee30ed4f@lunn.ch>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Mon, Apr 21, 2025 at 02:22:01PM +0000, Biju Das wrote:
> Hi Andrew,
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 21 April 2025 15:02
> > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> > 
> > > > On the RZ/G3E, the upstream support for testing S2R is not yet in a
> > > > usable state. So for now, I'll switch to using init/exit callbacks and drop the PM callback.
> > >
> > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize the PHY.
> > > I have done below changes on top of [1] to make STR working.
> > 
> > Can you explain why you need to reinitialise the PHY? The MAC driver should not need to do this, so
> > something is wrong somewhere. If we understand the 'Why?' we can probably tell you a better way to do
> > this.
> 
> Without this change bind/unbind works. But for the STR case, without reinitializing the PHY, even though
> the IP link is UP, I am not able to talk the NFS server or ping the host properly.
> 
> I checked clock/reset before and after reset everything set as expected.
> 
> Only change during STR is, on wakeup we need to restore direction (MII/RGMII) of IO block 
> for ET0/1_TXC_TXCLK (IO attribute) in the pin control driver. After that looks like PHY init
> is required to talk to server. 

When talking about suspend/resume, is this with or without WoL?

If WoL is enabled for the PHY, the PHY is left running while the
system is suspended, and so all its clocks and reset lines also need
to be left enabled etc. On resume, there should not be any need to
touch the PHY.

If WoL is not enabled in the PHY, it should get powered off. On
resume, phylib should be reinitializing the PHY.

Which of these two cases need the reinitialisation?

The reasons i can think of for the PHY needing a reinitialization are:

1) It lost power when it did not expect to loose power
2) Got reset when it did not expect to be reset
3) Clock not ticking when it should of been ticking.

So you cannot just check clock/reset before and after, you need to
look at the order of events. The loss of power, or a reset after
phylib resumed the PHY would not be good. Similarly, if the needed
clocks are not ticking while phylib resumes it would also not be good.

I would also suggest you check the datasheet for the PHY, and does it
document anything about the clock input TXC_TXCLK is connected to?
Does it need to be ticking while configuring the PHY? Any action which
needs to be taken after this starts ticking? Is the pinctrl resume
being called before the PHY resume?

	Andrew

