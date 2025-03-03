Return-Path: <linux-renesas-soc+bounces-13895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EBA4BE47
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 847FE1887625
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0F01F30DE;
	Mon,  3 Mar 2025 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jlXphypx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E01F17E5;
	Mon,  3 Mar 2025 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000766; cv=none; b=RGWwP3Ij0rioSuylauBfWLN5R7bc03bHOHrHRYeF1NP2kF+gxDv+INEGmIAiCR3rGEfG8JEcQShA65oCXDPEyUoyBawkVcA/4nQaedJXMTOhXfjyHjqdNIKuxXO8K9ADbPE5gRhzvSNQp3fHE0CBkm02MmuhKxPLVZVvKHfzse4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000766; c=relaxed/simple;
	bh=wY1JDGsr4w7EVb29Z+PN4ZWHoWt/+wmUL/8nCGk4qnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YI8wGG4oyTJyhQS4mnmU2/Dlcdle5q+tKZdAfpZmTeSzBDPzmvJCIl0sCp1Zk12Rp8wg4UCdlafIMN9TJDU/1SpFTkeW6s9NKbCVmbUjwpamISMdEBhciED6C4Wq4w9fBLKJ9KEq9YUZpHBMfyMNUhSQV7fy1RFjvzNNzm5TBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jlXphypx; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pNmUy0/SbO1mJMTByohCme5W5UOaVrI5mCX9RycYTCY=; b=jlXphypx+tFIa7QN6nmZyOHchy
	mAL4FzNXqAx7NBd4kdGVHZF7nbcDi/32cz13sz0Fj9y1/1JM/3A/Y76+s7kFKn3mGfijIUupTU74Q
	7zeNEGxo0ivgglhHYr/u2LibpbTUcHkmikL6bkI8o7tdVXrpmDkjuz1Lax0XLLmeKI/E9XRS1ZUdj
	/Ci1QrCRh5Qp2rL6TItEj0fLU0FtSgMv/HXPfEGd4/bdsg2+c0e9GA24LNjWfF4v0YxAyyfBNvjOM
	Dht70pkuWXppULK3LhsHptnbWfEkJtUnlAkcrbjK9tZ0DEhiNEovwD25XXFPRxUWevS3WVcgAbYUN
	EEBdOUqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38926)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tp3pC-0000Ky-2H;
	Mon, 03 Mar 2025 11:19:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tp3p7-0003kl-2o;
	Mon, 03 Mar 2025 11:19:01 +0000
Date: Mon, 3 Mar 2025 11:19:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Message-ID: <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 02, 2025 at 10:02:15PM +0000, Lad, Prabhakar wrote:
> Hi Russell,
> 
> On Sun, Mar 2, 2025 at 9:44 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Sun, Mar 02, 2025 at 09:20:49PM +0000, Lad, Prabhakar wrote:
> > > Hi Russell,
> > > > What is the reason for setting this flag? If it's because of suspend/
> > > > resume failures, does my "net: stmmac: fix resume failures due to
> > > > RX clock" series solve this for you without requiring this flag?
> > > >
> > > Ive set this flag based on the configuration supported by this IP.
> > > Unfortunately the platform which I am working on doesn't support s2r
> > > yet so I cannot test suspend/resume path yet. But I do see an issue
> > > when I unload and load just the glue module the DMA reset fails.
> >
> > Thanks for that feedback - that's a scenario I hadn't considered.
> >
> > I was trying to avoid having to disable LPI RX clock-stop on suspend by
> > ensuring that it was enabled at resume time. I think that's valid, but
> > you've brought up another similar scenario:
> >
> > - device is brought up, configures RX clock stop
> > - links with media, negotiates EEE
> > - driver is unloaded, link doesn't go down, but due to no traffic goes
> >   into idle, so RX clock is stopped
> > - driver reloaded, RX clock still stopped, reset fails
> >
> > I would like to solve that so we can get the power savings from
> > stopping the clock, but still have reset work when necessary.
> >
> I would be happy to test the patches ;)
> 
> > I'm guessing that the "DMA reset fails" refers to this path:
> >
> > stmmac_open() -> __stmmac_open() -> stmmac_hw_setup() ->
> > stmmac_init_dma_engine() -> stmmac_reset() ?
> >
> Yes.
> 
> > In other words, when the device is being brought back up
> > adminsitratively?
> >
> > What happens if you (replace $if):
> >
> > # ip li set dev $if down
> > # ip li set dev $if up
> >
> > Does that also fail without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI set?
> >
> Logs without STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> --------------------------------------------------------------
> root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> [   33.606549] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> [   37.356992] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> [   43.974803] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-0
> [   43.983189] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-1
> [   43.991155] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-2
> [   43.999128] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-3
> [   44.072079] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> [   44.094605] dwmac4: Master AXI performs fixed burst length
> [   44.100138] renesas-gbeth 15c40000.ethernet eth1: No Safety
> Features support found
> [   44.107748] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> Advanced Timestamp supported
> [   44.116725] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
> [   44.123352] renesas-gbeth 15c40000.ethernet eth1: configuring for
> phy/rgmii-id link mode
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# ip li set dev eth1[   47.207761] renesas-gbeth
> 15c40000.ethernet eth1: Link is Up - 1Gbps/Full - flow control off
> ^C
> root@rzv2h-evk-alpha:~# ^C
> root@rzv2h-evk-alpha:~# ip li set dev eth0 up
> [   55.636722] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-0
> [   55.645139] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-1
> [   55.653111] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-2
> [   55.661073] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-3
> [   55.732087] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> [   55.754612] dwmac4: Master AXI performs fixed burst length
> [   55.760143] renesas-gbeth 15c30000.ethernet eth0: No Safety
> Features support found
> [   55.767740] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> Advanced Timestamp supported
> [   55.776705] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
> [   55.783333] renesas-gbeth 15c30000.ethernet eth0: configuring for
> phy/rgmii-id link mode
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# [   58.855844] renesas-gbeth 15c30000.ethernet
> eth0: tx_clk_stop=1
> [   58.861989] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> 1Gbps/Full - flow control rx/tx
> 
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~#
> 
> Logs with STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag set:
> --------------------------------------------------------------
> root@rzv2h-evk-alpha:~# ip li set dev eth1 down
> [   30.053790] renesas-gbeth 15c40000.ethernet eth1: Link is Down
> root@rzv2h-evk-alpha:~# ip li set dev eth0 down
> [   35.366935] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> root@rzv2h-evk-alpha:~# ip li set dev eth1 up
> [   40.448563] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-0
> [   40.456725] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-1
> [   40.464893] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-2
> [   40.472840] renesas-gbeth 15c40000.ethernet eth1: Register
> MEM_TYPE_PAGE_POOL RxQ-3
> [   40.543895] renesas-gbeth 15c40000.ethernet eth1: PHY [stmmac-1:00]
> driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> [   40.566419] dwmac4: Master AXI performs fixed burst length
> [   40.571949] renesas-gbeth 15c40000.ethernet eth1: No Safety
> Features support found
> [   40.579550] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008
> Advanced Timestamp supported
> [   40.588505] renesas-gbeth 15c40000.ethernet eth1: registered PTP clock
> [   40.595135] renesas-gbeth 15c40000.ethernet eth1: configuring for
> phy/rgmii-id link mode
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# [   43.687551] renesas-gbeth 15c40000.ethernet
> eth1: Link is Up - 1Gbps/Full - flow control off
> 
> root@rzv2h-evk-alpha:~# ip li set dev eth0 up
> [   49.644479] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-0
> [   49.652719] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-1
> [   49.660681] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-2
> [   49.669059] renesas-gbeth 15c30000.ethernet eth0: Register
> MEM_TYPE_PAGE_POOL RxQ-3
> [   49.740011] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> [   49.762518] dwmac4: Master AXI performs fixed burst length
> [   49.768057] renesas-gbeth 15c30000.ethernet eth0: No Safety
> Features support found
> [   49.775655] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> Advanced Timestamp supported
> [   49.784609] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
> [   49.791236] renesas-gbeth 15c30000.ethernet eth0: configuring for
> phy/rgmii-id link mode
> root@rzv2h-evk-alpha:~#
> root@rzv2h-evk-alpha:~# [   52.871635] renesas-gbeth 15c30000.ethernet
> eth0: tx_clk_stop=1
> [   52.877777] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> 1Gbps/Full - flow control rx/tx

I would like to get to the bottom of why this fails for module removal/
insertion, but not for admistratively down/upping the interface.

Removal of your module will unregister the netdev, and part of that
work will bring the netdev administratively down. When re-inserting
the module, that will trigger various userspace events, and it will
be userspace bringing the network interface(s) back up. This should
be no different from administratively down/upping the interface but
it seems you get different behaviour.

I'd like to understand why that is, because at the moment I'm wondering
whether my patches that address the suspend/resume need further work
before I send them - but in order to assess that, I need to work out
why your issue only seems to occur in the module removal/insertion
and not down/up as well as I'd expect.

Please could you investigate this?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

