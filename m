Return-Path: <linux-renesas-soc+bounces-3451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9D87043F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 15:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E8DAB21948
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 14:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AB841775;
	Mon,  4 Mar 2024 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vO+Obnrv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C31DFF9;
	Mon,  4 Mar 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562873; cv=none; b=baGPw+YXu/97Vo+w9Ck0dFSX6LzGIb/g08sedyLJVmttUQwUnM+teAm6SRNi3ZmjWNHYmo5I0THsNwWOTY0bklhMYNAnlesxbo3aru0R91W4MDYcNGFgsIdGj8dhRLz9kizwAlpaPbuKnGEsJhlnZbneWkLLbCq1m1/fC7I0K0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562873; c=relaxed/simple;
	bh=hqGocPNYk7ePwgiK0aqytOz04FOFDbOm1tSF6U7TiuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqE+v2s6CPW79xv3jGSMnrsJR4c/at1A9JrLU/8TGY5FWngbg5qW8sheRL9Ju0Y2DS9ZT4xliuK7P0okurBIGpeiOWNGORGlAHqPF0pWqosc3hR42RZBnazQ8AE7ckMXqNONqsJAlaG8hNjSPrIZhAkcDPh9fAg1zqOrFVYT75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vO+Obnrv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fYuXqjHSU4wWS8NC0tCBb8q7KcSGmYLkLI7d+Z6Xpls=; b=vO+Obnrv9UbTf4BIiOBNluFHwQ
	HzZDmnwV5Jx68lAk5kYKNUCXw6TrVub00LpaLuymAkqt1ybxMzAFRQVDJuEoG6DuhrANwE1rgMSM+
	6AnSNenf09xQKxhLAuUCxspi+SKwV7TRkOOi+i7hGJVs8RSHezOnrMuiUgx60pqZ4RsCE+WIwi2lt
	V8LuTQ3OGjkGMGua22xKF41j/ZGSUe82HW49qiqBLFeaB/pCBbk4bzsS7AN+EYMvUq1omTCJKvwbg
	niZOSzqqb73MjebA/FHeEE49+w/9RrOnVJRm1zfapQJkQ2WFvGseben159NC47a6J031Ovzy0D+6W
	82S/Gk8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rh9OX-0005mA-0e;
	Mon, 04 Mar 2024 14:34:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rh9OU-0004Yu-TA; Mon, 04 Mar 2024 14:34:18 +0000
Date: Mon, 4 Mar 2024 14:34:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH net-next v5 5/7] net: stmmac: Signal to PHY/PCS drivers
 to keep RX clock on
Message-ID: <ZeXb6p/RpJj1HRgn@shell.armlinux.org.uk>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Mar 01, 2024 at 04:35:02PM +0100, Romain Gantois wrote:
> There is a reocurring issue with stmmac controllers where the MAC fails to
> initialize its hardware if an RX clock signal isn't provided on the MAC/PHY
> link.
> 
> This causes issues when PHY or PCS devices either go into suspend while
> cutting the RX clock or do not bring the clock signal up early enough for
> the MAC to initialize successfully.
> 
> Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
> drivers know to keep the RX clock up at all times.
> 
> Reported-by: Clark Wang <xiaoning.wang@nxp.com>
> Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
> Reported-by: Clément Léger <clement.leger@bootlin.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
> Suggested-by: Russell King <linux@armlinux.org.uk>

This should be:
Co-developed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 79844dbe4258..2290f4808d7e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1218,6 +1218,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	priv->phylink_config.type = PHYLINK_NETDEV;
>  	priv->phylink_config.mac_managed_pm = true;
>  
> +	/* Stmmac always requires an RX clock for hardware initialization */
> +	priv->phylink_config.mac_requires_rxc = true;
> +
>  	mdio_bus_data = priv->plat->mdio_bus_data;
>  	if (mdio_bus_data)
>  		priv->phylink_config.ovr_an_inband =
> @@ -3408,6 +3411,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  	u32 chan;
>  	int ret;
>  
> +	/* Make sure RX clock is enabled */
> +	if (priv->hw->phylink_pcs)
> +		phylink_pcs_pre_init(priv->phylink, priv->hw->phylink_pcs);
> +
>  	/* DMA initialization and SW reset */
>  	ret = stmmac_init_dma_engine(priv);
>  	if (ret < 0) {
> 
> -- 
> 2.43.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

