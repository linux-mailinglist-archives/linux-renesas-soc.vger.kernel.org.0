Return-Path: <linux-renesas-soc+bounces-14044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB21A53F2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 01:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CC0C1703D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 00:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9975517BBF;
	Thu,  6 Mar 2025 00:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hzj+OhjT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F933DB;
	Thu,  6 Mar 2025 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221130; cv=none; b=cEPfMFZcE1UO5+vRQ8OEP/rn6nXRe/W6zPcJ2SwN+g+L860Ugorlzt1oH0oFwLGrNiXtJ4yNPalUZZt5zUaNgs03/+Lh75yXi9CZoEM+Tc/6vraD7VevNlrdIycL3nvoh86QhcfXr4LcjP7PzxZqrBYKONi+Va9aRabt8IBVUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221130; c=relaxed/simple;
	bh=YSgf5CDzA0ss+PwLHPtQej1mUa4XBDf4Gq7G9tQDejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AH3Ghvk44paEucq0lavDRMga0CkeK1wrVsdIYWtYuxTxVXFfUQreUe2lF0rQ260oZZT2wuQJ8By7OSWolEzd2UFhWaHOPEeJyaDkQZ7Jhe2Iv5I6CY89g34/zb2HzzCV+LI5eGnqhpFaOVMnQD16H2TA6JrfQt0/AKCVzoGojxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hzj+OhjT; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kUbOWVUUO3yOlnIfglKELSgnsKJiWXMSUdsbxd9R494=; b=hzj+OhjTv/kE2HesnAtGrZbxbc
	C3DkNnsKLEf+ER8erB/OWR/2Pl+FITCYEUCZBhUiqo5WHCgP1+qPYrkBXlJx6okmYbnBLTi4LU3/q
	4H2wcVpwk5OLZMldr7NGxReptG3u/d6Tr0FrqeYLmBQ+7QajxDKLh1U18pbleTn2F+Rg32jJWjlU7
	ZBvnzTwdDfLxEfGisjzc8c2zqNN92W+YlFUqmvPtugMarW6MkQEZcfxuAD2MEGSNKUuD3Ri7NznhD
	hUq5DUzfutJUZxtX/8QNdQgSQdDkZICP3VH5cSBdJvcZ0J5BjtdgoTg8eX5ayZIU29tHnOgTuMysg
	rMmZWgqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tpz9R-000595-0h;
	Thu, 06 Mar 2025 00:31:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tpz9L-0006Ez-2j;
	Thu, 06 Mar 2025 00:31:43 +0000
Date: Thu, 6 Mar 2025 00:31:43 +0000
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
Message-ID: <Z8js74ASE_b-y9sR@shell.armlinux.org.uk>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
 <CA+V-a8vCqxCaB_UEf-Ysg3biu5VoQ2_0OxWnN97Mdee9Op3YDA@mail.gmail.com>
 <Z8XZh9nvX3yrE6wB@shell.armlinux.org.uk>
 <CA+V-a8teuTznxBE2_LqqQcqRgQu1saAMuOUST8jFLFFTALqUMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8teuTznxBE2_LqqQcqRgQu1saAMuOUST8jFLFFTALqUMw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Mar 05, 2025 at 09:26:43PM +0000, Lad, Prabhakar wrote:
> I did investigate on these lines:
> 
> 1] With my current patch series I have the below in remove callback
> 
> +static void renesas_gbeth_remove(struct platform_device *pdev)
> +{
> +       struct renesas_gbeth *gbeth = get_stmmac_bsp_priv(&pdev->dev);
> +
> +       stmmac_dvr_remove(&pdev->dev);
> +
> +       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
> +}
> 
> After dumping the CLK registers I found out that the Rx and Rx-180 CLK
> never got turned OFF after unbind.

I think that's where further investigation needs to happen. This
suggests there's more enables than disables for these clocks, but
there's nothing that I can see in your submitted driver that would
account for that behaviour.

> 2] I replaced the remove callback with below ie first turn OFF
> Tx-180/Rx/Rx-180 clocks
> 
> +static void renesas_gbeth_remove(struct platform_device *pdev)
> +{
> +       struct renesas_gbeth *gbeth = get_stmmac_bsp_priv(&pdev->dev);
> +
> +       clk_bulk_disable_unprepare(gbeth->num_clks, gbeth->clks);
> +
> +      stmmac_dvr_remove(&pdev->dev);
> +}
> 
> After dumping the CLK registers I confirmed all the clocks were OFF
> (CSR/PCLK/Tx/Tx-180/Rx/Rx-180) after unbind operation. Now when I do a
> bind operation Rx clock fails to enable, which is probably because the
> PHY is not providing any clock.

However, disabling clocks _before_ unregistering the net device is a
bad thing to do! The netdev could still be in use.

You can add:

	if (ndev->phydev)
		phy_eee_rx_clock_stop(ndev->phydev, false);

just before unregister_netdev() in stmmac_dvr_remove() only as a way
to test out that idea.

Do the clock registers you refer to only update when the relevant
clocks are actually running?

> > However, PHYs that have negotiated EEE are permitted to stop their
> > receive clock, which can be enabled by an appropriate control bit.
> > phy_eee_rx_clock_stop() manipulates that bit. stmmac has in most
> > cases permitted the PHY to stop its receive clock.
> >
> You mean phy_eee_rx_clock_stop() is the one which tells the PHY to
> disable the Rx clocks? Actually I tried the below hunk with this as
> well the Rx clock fails to be turned ON after unbind/bind operation.

phy_eee_rx_clock_stop() doesn't turn the clock on/off per-se, it
controls the bit which gives the PHY permission to disable the clock
when the media is in EEE low-power mode. Note that 802.3 does not
give a default setting for this bit, so:

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 0ba434104f5b..e16f4a6f5715 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1756,6 +1756,7 @@ EXPORT_SYMBOL_GPL(phy_eee_tx_clock_stop_capable);
>   */
>  int phy_eee_rx_clock_stop(struct phy_device *phydev, bool clk_stop_enable)
>  {
> +       return 0;
>         int ret;
> 
>         /* Configure the PHY to stop receiving xMII

May not be wise, and if you want to ensure that the PHY does not stop
the clock, then forcing clk_stop_enable to zero would be better.

> > NVidia have been a recent victim of this - it is desirable to allow
> > receive clock stop, but there hasn't been the APIs in the kernel
> > to allow MAC drivers to re-enable the clock when they need it.
> >
> > Up until now, I had thought this was just a suspend/resume issue
> > (which is NVidia's reported case). Your testing suggests that it is
> > more widespread than that.
> >
> > While I've been waiting to hear from you, I've prepared some patches
> > that change the solution that I proposed for NVidia (currently on top
> > of that patch set).
>
> I tried your latest patches [0], this didnt resolve the issue.

I assume without the modification to phy_eee_rx_clock_stop() above -
thanks. If so, then your issue is not EEE related.

> [0] https://lore.kernel.org/all/Z8bbnSG67rqTj0pH@shell.armlinux.org.uk/

Wasn't quite the latest, but still had the same build bug (thanks for
reporting, now fixed.) Latest is equivalent so no need to re-test.

> > However, before I proceed with them, I need you to get to the bottom
> > of why:
> >
> > # ip li set dev $if down
> > # ip li set dev $if up
> >
> > doesn't trigger it, but removing and re-inserting the module does.
> >
> Doing the above does not turn OFF/ON all the clocks. Looking at the
> dump from the CLK driver on my platform only stmmaceth and pclk are
> the clocks which get toggled and rest remain ON. Note Im not sure if
> the PHY is disabling the Rx clocks when I run ip li set dev $if down I
> cannot scope that pin on the board.
> 
> Please let me know if you have any pointers for me to look further
> into this issue.

Given the behaviour that you're reporting from your clock layer, I'm
wondering if the problem is actually there... it seems weird that clocks
aren't being turned off and on when they should.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

