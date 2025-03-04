Return-Path: <linux-renesas-soc+bounces-13948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC69FA4D9AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455603A9B91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 10:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B041FDA6D;
	Tue,  4 Mar 2025 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Nmoz8sAJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3EF1EFF9F;
	Tue,  4 Mar 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741082459; cv=none; b=dTM1O83rE3i3rI3u6hHYSV1myIdEj7GrZusGunf2SMAuJGCTWH0Yw8s0KM/nmyWYNjOr+JOI7+GxI4COupTQfvpfMqyoi+MvH6y80qHiApt29iFGUjpcUGlds/8kTN+zLhNYzgx7ZGBe7maZs7Kpq2ZWVPY4crkHO0Oor5aP71Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741082459; c=relaxed/simple;
	bh=Vgqe3zLO+Pp2/f9cP/ojjsyBApW+0sTc+qloiAFX9BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8g5U92Gk5kM50abjvGUBCedN+I41TRB/7Ef8DbsUhKMZ1JF5zPzpm2l0E33cLc64VqaL01rnOJ07ciXIhqgANWw0LirLQCTLri+ieQY2X+nI/2vj9QS40vGqZkmqzfY1aAAC4BDIO1YDysP5bJtrxllznx5viSlzvMmgLiNdHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Nmoz8sAJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qvlkut7rQLG9lL2VWbf+Ug+yb0MwlQH5yDChM2yjI98=; b=Nmoz8sAJIsWHRVnrQ4LIPHNGk4
	L5paCqjU5GKfRzB4XM+bd/RANemYeM5zvxHcXtv7ysLlkKvg3UpWV4sgdU3QxoozDtMlUViwrIRGV
	/tX/XxkMAd+mYtkXSEaFA8awJ6n++PzyATfL1V9mZJxJiECxIoFde9fueU86b9OLCdhedKXLJC4fc
	iBhS4UqDj/dp5e3GGrKr+DXzL437iJC4Gf0lCjmPj0sulvFaw/YTIH03BUKqQy+mkBQ4QgP4TTVy1
	u0KALHVg7kmmTuvqBZGb/gkSTmre+FAgoXNeSBdTJvQI/1H/WUV6BU+pTlXUlV9MO87CdIC83UR/d
	MLUPjzQw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50332)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tpP4m-0002Nz-1b;
	Tue, 04 Mar 2025 10:00:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tpP4f-0004hB-2T;
	Tue, 04 Mar 2025 10:00:29 +0000
Date: Tue, 4 Mar 2025 10:00:29 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8bPPaT4Vsob4FHH@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
 <TY3PR01MB113468803E298C5FA6FB6712886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB113468803E298C5FA6FB6712886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Mar 04, 2025 at 06:58:44AM +0000, Biju Das wrote:
> Hi Russel king,
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: 03 March 2025 11:19
> > Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> > 
> > On Sun, Mar 02, 2025 at 10:02:15PM +0000, Lad, Prabhakar wrote:
> > > Hi Russell,
> > >
> > > On Sun, Mar 2, 2025 at 9:44 PM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Sun, Mar 02, 2025 at 09:20:49PM +0000, Lad, Prabhakar wrote:
> > > > > Hi Russell,
> > > > > > What is the reason for setting this flag? If it's because of
> > > > > > suspend/ resume failures, does my "net: stmmac: fix resume
> > > > > > failures due to RX clock" series solve this for you without requiring this flag?
> > > > > >
> > > > > Ive set this flag based on the configuration supported by this IP.
> > > > > Unfortunately the platform which I am working on doesn't support
> > > > > s2r yet so I cannot test suspend/resume path yet. But I do see an
> > > > > issue when I unload and load just the glue module the DMA reset fails.
> > > >
> > > > Thanks for that feedback - that's a scenario I hadn't considered.
> > > >
> > > > I was trying to avoid having to disable LPI RX clock-stop on suspend
> > > > by ensuring that it was enabled at resume time. I think that's
> > > > valid, but you've brought up another similar scenario:
> > > >
> > > > - device is brought up, configures RX clock stop
> > > > - links with media, negotiates EEE
> > > > - driver is unloaded, link doesn't go down, but due to no traffic goes
> > > >   into idle, so RX clock is stopped
> > > > - driver reloaded, RX clock still stopped, reset fails
> > > >
> > > > I would like to solve that so we can get the power savings from
> > > > stopping the clock, but still have reset work when necessary.
> > > >
> > > I would be happy to test the patches ;)
> > >
> > > > I'm guessing that the "DMA reset fails" refers to this path:
> > > >
> > > > stmmac_open() -> __stmmac_open() -> stmmac_hw_setup() ->
> > > > stmmac_init_dma_engine() -> stmmac_reset() ?
> > > >
> > > Yes.
> > >
> > > > In other words, when the device is being brought back up
> > > > adminsitratively?
> > > >
> > > > What happens if you (replace $if):
> > > >
> > > > # ip li set dev $if down
> > > > # ip li set dev $if up
> > > >
> > > > Does that also fail without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI set?
> > > >
> > > Logs without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> > > --------------------------------------------------------------
> > > root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> > > [   33.606549] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> > > [   37.356992] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> > > [   43.974803] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-0
> > > [   43.983189] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-1
> > > [   43.991155] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-2
> > > [   43.999128] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-3
> > > [   44.072079] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> > > driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> > > [   44.094605] dwmac4: Master AXI performs fixed burst length
> > > [   44.100138] renesas-gbeth 15c40000.ethernet eth1: No Safety
> > > Features support found
> > > [   44.107748] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> > > Advanced Timestamp supported
> > > [   44.116725] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
> > > [   44.123352] renesas-gbeth 15c40000.ethernet eth1: configuring for
> > > phy/rgmii-id link mode
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# ip li set dev eth1[   47.207761] renesas-gbeth
> > > 15c40000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off ^C
> > > root@rzv2h-evk-alpha:~# ^C root@rzv2h-evk-alpha:~# ip li set dev eth0
> > > up
> > > [   55.636722] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-0
> > > [   55.645139] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-1
> > > [   55.653111] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-2
> > > [   55.661073] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-3
> > > [   55.732087] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> > > driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> > > [   55.754612] dwmac4: Master AXI performs fixed burst length
> > > [   55.760143] renesas-gbeth 15c30000.ethernet eth0: No Safety
> > > Features support found
> > > [   55.767740] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> > > Advanced Timestamp supported
> > > [   55.776705] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
> > > [   55.783333] renesas-gbeth 15c30000.ethernet eth0: configuring for
> > > phy/rgmii-id link mode
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# [   58.855844] renesas-gbeth 15c30000.ethernet
> > > eth0: tx_clk_stop=1
> > > [   58.861989] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> > > 1Gbps/Full - flow control rx/tx
> > >
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~#
> > >
> > > Logs with STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> > > --------------------------------------------------------------
> > > root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> > > [   30.053790] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> > > root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> > > [   35.366935] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> > > root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> > > [   40.448563] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-0
> > > [   40.456725] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-1
> > > [   40.464893] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-2
> > > [   40.472840] renesas-gbeth 15c40000.ethernet eth1: Register
> > > MEM_TYPE_PAGE_POOL RxQ-3
> > > [   40.543895] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> > > driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> > > [   40.566419] dwmac4: Master AXI performs fixed burst length
> > > [   40.571949] renesas-gbeth 15c40000.ethernet eth1: No Safety
> > > Features support found
> > > [   40.579550] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> > > Advanced Timestamp supported
> > > [   40.588505] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
> > > [   40.595135] renesas-gbeth 15c40000.ethernet eth1: configuring for
> > > phy/rgmii-id link mode
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# [   43.687551] renesas-gbeth 15c40000.ethernet
> > > eth1: Link is Up - 1Gbps/Full - flow control off
> > >
> > > root@rzv2h-evk-alpha:~# ip li set dev eth0 up
> > > [   49.644479] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-0
> > > [   49.652719] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-1
> > > [   49.660681] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-2
> > > [   49.669059] renesas-gbeth 15c30000.ethernet eth0: Register
> > > MEM_TYPE_PAGE_POOL RxQ-3
> > > [   49.740011] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> > > driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> > > [   49.762518] dwmac4: Master AXI performs fixed burst length
> > > [   49.768057] renesas-gbeth 15c30000.ethernet eth0: No Safety
> > > Features support found
> > > [   49.775655] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> > > Advanced Timestamp supported
> > > [   49.784609] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
> > > [   49.791236] renesas-gbeth 15c30000.ethernet eth0: configuring for
> > > phy/rgmii-id link mode
> > > root@rzv2h-evk-alpha:~#
> > > root@rzv2h-evk-alpha:~# [   52.871635] renesas-gbeth 15c30000.ethernet
> > > eth0: tx_clk_stop=1
> > > [   52.877777] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> > > 1Gbps/Full - flow control rx/tx
> > 
> down/upping the interface but it seems you get different behaviour.
> > 
> > I'd like to understand why that is, because at the moment I'm wondering whether my patches that
> > address the suspend/resume need further work before I send them - but in order to assess that, I need
> > to work out why your issue only seems to occur in the module removal/insertion and not down/up as well
> > as I'd expect.
> 
> FYI, With linux next, On RZ/G3E SoC which has similar IP as RZ/V2H,i
> ethernet works during suspend entry/exit
> Even though STR is not fully functional yet.

For the failure to happen, you need to check whether EEE is being used:

# ethtool --show-eee ethX

and check whether it states that EEE is enabled and active, and Tx LPI
also shows the timer value.

You need a PHY that does stop it's receive clock when the link enters
low-power mode. PHYs are not required to have this ability implemented,
and there's no way for software to know whether it is or not.

Then, you need to be certain that your link partner does actually
support EEE and signals LPI from its side, rather than just advertising
EEE. Lastly, you need to ensure that there is no traffic over the cable
when you're resuming for the period of the reset timeout for the
failure to occur. If the link wakes up, the clock will be started and
reset will complete.

One can rule out some of the above by checking the LPI status bits,
either in the DWMAC or PHY which indicates whether transmit and/or
receive seeing LPI signalled.

If the link doesn't enter low power, then the receive clock won't be
stopped, and reset will complete. If the link wakes up during reset,
then the clock will be restarted, and reset will complete before the
timeout expires.

So, the possibility for a successful test is quite high.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

