Return-Path: <linux-renesas-soc+bounces-13885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC1A4BB7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 10:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02CA03B2BBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 09:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FE21F1517;
	Mon,  3 Mar 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="uRvNzI5k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188E51F12F6;
	Mon,  3 Mar 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995924; cv=none; b=lNgLuh/W2/gZ9SYfijBVkzdFReGes2LByVTlxkUlbewst44N0AEuc1VSXv6s/9CAYosJnNLQA2V3ZfB2vUb2kf9v9QHvZxuKEp5bQITcSs/sOw3pY3ACm6p7jChyfBOgeUvuQRHwP3MiktARssPiMZjNBrOBOUfF4Rf3CVu3kYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995924; c=relaxed/simple;
	bh=EVHnAT0Fj8UFfX1d1iKKikIPT6mE89O8IutiZ9wghW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUj/vg5+uC8w2Fn91lWY8nAANi9s5/p0vA6BasrRJYTVJh9cNJjpK4o3Q/uVUf+BS2SCJGk5I76o9mw8U3gNYILim2LVc4p/+zn5e5cxXfzs8orCTgVhwsiC7Wt0GTsPqNDwHB4FRXyb7TXrRr+6cq8Xz5e0WU9za6jyqXX54RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=uRvNzI5k; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vocGWq00dHieN/+oIHdRzKoBXygqv9MdZeGwUkedRe8=; b=uRvNzI5kU7RbApRJOXrYX2IOFF
	5QfX0iCOo6Ens2pw8lKCUfsT18QpgBG3nwlYDqFwdxXv4hqE6jaEXDZG8HfvQxOXLEKsquGbP8NEE
	OIB2Cgx3P68QPb8V73KpPrf2dsXurdE2IL/EIDuGzeBZzGWdJByIMa8+g5Z1cODYI5TUBw6hFZwC9
	kaFBMnRyIrk7CkD+V6IwFdYPWRnpx28jtnOWXM9WYHhf2hIdfBc026F7qrR1feEzQMfL/s8S5mK3A
	ZE5FrGOXdfv3BtB/Gj/8r7ls4V7bUSbI6eF1hOoelJKXwUS6BNNypgWBR1M5J9GGGgJrsCG6TPlBJ
	a/95o4Pg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45396)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tp2Z4-00008X-2c;
	Mon, 03 Mar 2025 09:58:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tp2Yy-0003hC-1p;
	Mon, 03 Mar 2025 09:58:16 +0000
Date: Mon, 3 Mar 2025 09:58:16 +0000
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
Message-ID: <Z8V9OC_1llF3leZd@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <CA+V-a8un7Oy9NtfDUfs0DSwRVAFn52-vWj1Os=u_1dqijJhbMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8un7Oy9NtfDUfs0DSwRVAFn52-vWj1Os=u_1dqijJhbMw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 03, 2025 at 09:41:13AM +0000, Lad, Prabhakar wrote:
> Hi Russell,
> 
> On Sun, Mar 2, 2025 at 9:20 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Russell,
> >
> > On Sun, Mar 2, 2025 at 7:33 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Sun, Mar 02, 2025 at 06:18:08PM +0000, Prabhakar wrote:
> > > > +     gbeth->dev = dev;
> > > > +     gbeth->regs = stmmac_res.addr;
> > > > +     plat_dat->bsp_priv = gbeth;
> > > > +     plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> > >
> > > Thanks for using that!
> > >
> > Yep, it shortens the glue driver further.
> >
> > > > +     plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > > +                        STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |
> > >
> > > I would like to know what value tx_clk_stop is in
> > > stmmac_mac_enable_tx_lpi() for your setup. Ideally, stmmac should
> > > use the capability report from the PHY to decide whether the
> > > transmit clock can be gated, but sadly we haven't had any support
> > > in phylib/phylink for that until recently, and I haven't modified
> > > stmmac to allow use of that. However, it would be good to gain
> > > knowledge in this area.
> > >
> > tx_clk_stop =1,
> >
> > root@rzv2h-evk-alpha:~# ifconfig eth0 up
> > [  587.830436] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-0
> > [  587.838636] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-1
> > [  587.846792] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-2
> > [  587.854734] renesas-gbeth 15c30000.ethernet eth0: Register
> > MEM_TYPE_PAGE_POOL RxQ-3
> > [  587.926860] renesas-gbeth 15c30000.ethernet eth0: PHY [stmmac-0:00]
> > driver [Microchip KSZ9131 Gigabit PHY] (irq=POLL)
> > [  587.949380] dwmac4: Master AXI performs fixed burst length
> > [  587.954910] renesas-gbeth 15c30000.ethernet eth0: No Safety
> > Features support found
> > [  587.962556] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008
> > Advanced Timestamp supported
> > [  587.971420] renesas-gbeth 15c30000.ethernet eth0: registered PTP clock
> > [  587.978004] renesas-gbeth 15c30000.ethernet eth0: configuring for
> > phy/rgmii-id link mode
> > root@rzv2h-evk-alpha:~# [  591.070448] renesas-gbeth 15c30000.ethernet
> > eth0: tx_clk_stop=1
> > [  591.076590] renesas-gbeth 15c30000.ethernet eth0: Link is Up -
> > 1Gbps/Full - flow control rx/tx
> >
> > With the below diff:
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index aec230353ac4..68f1954e6eea 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1100,6 +1100,7 @@ static int stmmac_mac_enable_tx_lpi(struct
> > phylink_config *config, u32 timer,
> >         struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> >         int ret;
> >
> > +       netdev_err(priv->dev, "tx_clk_stop=%d\n", tx_clk_stop);
> >         priv->tx_lpi_timer = timer;
> >         priv->eee_active = true;
> >
> > > > +                        STMMAC_FLAG_RX_CLK_RUNS_IN_LPI |
> > >
> I got some feedback from the HW team, based on the feedback this flag
> depends on the PHY device. I wonder if we should create a DT property
> for this. Please share your thoughts.

Not sure exactly which flag you're referring to, because you first
quote the code that you added to dump the _transmit_ clock stop,
and then you named the _receive_ clock flag.

I assume you're referring to STMMAC_FLAG_EN_TX_LPI_CLOCKGATING, which
is currently used by the driver because it didn't know any better to
check the capabilities of the PHY - and phylib didn't expose an
interface to do that.

tx_clk_stop is basically the flag from the PHY indicating whether the
MAC may be permitted to stop its transmit clock. Unfortunately, we
can't just switch over to using that in stmmac because of it's dumb
history as that may cause regressions. As we haven't used this flag
from the PHY before, we have no idea whether it's reliable or not,
and if it isn't reliable, then using it will cause regressions.

I think that the way forward would be to introduce yet another flag
(maybe STMMAC_FLAG_LPI_TX_CLK_PHY_CAP) and:

	if (priv->plat->flags & STMMAC_FLAG_LPI_TX_CLK_PHY_CAP)
		priv->tx_lpi_clk_stop = tx_clk_stop;
	else
		priv->tx_lpi_clk_stop = priv->plat->flags &
					STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;

and then where STMMAC_FLAG_EN_TX_LPI_CLOCKGATING is checked, that
becomes:

	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
				  priv->tx_lpi_clk_stop,
				  priv->tx_lpi_timer);

It's rather annoying to have to include a flag to say "use the 802.3
standard behaviour" but given that we want to avoid regressions I don't
see any other choice. It would've been nice to have had the driver
using the PHY capability, but that horse has already bolted. We can now
only try to encourage platform glue authors to try setting
STMMAC_FLAG_LPI_TX_CLK_PHY_CAP with the above in place.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

