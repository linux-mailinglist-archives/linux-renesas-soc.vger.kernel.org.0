Return-Path: <linux-renesas-soc+bounces-14181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5FA58400
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 13:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3091516C4CF
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93BB1CCB21;
	Sun,  9 Mar 2025 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="oX1YZjPS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE52211C;
	Sun,  9 Mar 2025 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741522763; cv=none; b=Iq7CamF3246UcUAKvleLR6P4vpNCV1WVLjkyo7iVPhbynKsOke3GY2wPWorgotBNVal0WWWM7h2VwSFXAUrMUvNb7Vvd7VBKOd7pNZkqmdJWwuDuj39osreKO/ADGlrJTDVlaQYwtYIj9ePOcVPZIbv6/VQXZl4KOY3RUXlaknk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741522763; c=relaxed/simple;
	bh=7sRUR7aLQX7IAeaQn8fJoeQ7LQHllbHbgib8KkJCZIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKG8P1qSCCrXYkIOr/qkvbqL4M5krEa5xmbdBPujbAgak/8A4BYFN9QO7rPBUrWPYMr0wPxilS7L0c13jl9fJ21REnVUKRd0ytU+m3AxIxPMBkphmDS5BKimNi4d9bS7/IONId+s/BdFL+29FCr+y5o029sbevZh62JW+2fido4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=oX1YZjPS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OMe7X162PbDqxZBfjfEZb0yB4rbjLUrUqRTmqcMmD3s=; b=oX1YZjPSAQKU3UNOsLDu2gjBmb
	UxrHVxYi7zyyfKsU2/azO2LEFgyG2OVO5dsFHwonypD4Vp0IKKHUNj9I3q6G3Z4krTozlD5tAS01W
	V0T3EPVX6uxHShf5NQQpXYwRbvd8XBsRDQpwxZAKaFoTIudUk0IblZEW9ftEnDl+Gk+xhn0pWtA4R
	8IRWI1OJj8V29WT3PF5t+wgA/6uFjTjETvhU/JmWnIxabJRJaDTdv9yVlGedayTA717/p+sfZ55/e
	ecbvfTgy646NnQC8PAqdNhNlhEvRs/jQtyiDDKuWA0YYpwfT9pl069hoy68F0LhKu3bWmpqc3JuT/
	26k5FttQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35288)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trFcT-0001Ht-2w;
	Sun, 09 Mar 2025 12:19:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trFcN-0001Rl-1P;
	Sun, 09 Mar 2025 12:18:55 +0000
Date: Sun, 9 Mar 2025 12:18:55 +0000
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
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z82HL6NX0B1SdgPU@shell.armlinux.org.uk>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z81WVNGlvRNW5JFk@shell.armlinux.org.uk>
 <CA+V-a8stuYLJMA5UEKpyLpH1kcgEvA=b5BzUOEaCKcfNtdSSfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8stuYLJMA5UEKpyLpH1kcgEvA=b5BzUOEaCKcfNtdSSfg@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Mar 09, 2025 at 11:24:57AM +0000, Lad, Prabhakar wrote:
> Hi Russell,
> 
> Thank you for the review.
> 
> On Sun, Mar 9, 2025 at 8:50 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Sat, Mar 08, 2025 at 08:09:21PM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> > > SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v1->v2
> > > - Dropped __initconst for renesas_gbeth_clks array
> > > - Added clks_config callback
> > > - Dropped STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag as this needs
> > >   investigation.
> >
> > I thought you had got to the bottom of this, and it was a bug in your
> > clock driver?
> >
> I have added a fix in the clock driver to ignore CLK_MON bits for
> external clocks. The main reason for dropping this flag was despite
> trying the below i.e. adding phy_eee_rx_clock_stop() just before
> unregister_netdev() in stmmac_dvr_remove() still doesnt stop the Rx
> clocks.

That's not unexpected, because phy_eee_rx_clock_stop() does not control
a clock gate.

What phy_eee_rx_clock_stop() does is control the clock stop enable bit
in the PHY. Please see IEEE 802.3 section 45.2.3.1.4 and other sections
referred to from that section to gain the appropriate understanding.

The point of adding the phy_eee_rx_clock_stop() call before
stmmac_dvr_remove() was to _test_ (and *only as a test* - a point that
I did stress) to see whether preventing the PHY from stopping it's
receive clock solved the reset timeout on module reload. This test
only makes sense if STMMAC_FLAG_RX_CLK_RUNS_IN_LPI has not been set.

As I understand it, you have found the real issue why that occurs, so
it seems there is little need to continue with that test if, and only
if, everything is now working reliably when removing and re-inserting
the module.

The key point here is "reliably". The receive side of the link *could*
enter or exit LPI at *any* moment - it depends in the link partner. If
the PHY has permission to stop it's receive clock, then this might lead
to stmmac_reset() timing out because the PHY has stopped it's receive
clock _if_ the receive-side LPI persists longer than the reset timeout.

At this point, I am not certain what the current situation is. Are you
now setting STMMAC_FLAG_RX_CLK_RUNS_IN_LPI because it solves a problem?
If the answer is yes, then there is still a bug in the driver that needs
to be solved and I've presented several solutions to that.

I want to remove STMMAC_FLAG_RX_CLK_RUNS_IN_LPI from the stmmac driver
so I'm going to NACK patches that add new uses. Sorry, but we need to
solve the root problem, and stop hacking around it with flags to change
behaviours.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

