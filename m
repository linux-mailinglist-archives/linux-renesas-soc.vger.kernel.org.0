Return-Path: <linux-renesas-soc+bounces-14173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC0A58274
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 09:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E2616A969
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0A419CD01;
	Sun,  9 Mar 2025 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hPsLJARs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4A11917ED;
	Sun,  9 Mar 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510265; cv=none; b=oYDRd29gM4eGbApqo7KSmVwl6z2voDIjVEIx7PZGUIw/J5QMrVkTOQFctMU5ib80RG5cagqXlgZy0itwO9DM13zliMwrzFCd+b0G4KpwHfiJQu+n2an3mzi704CGzjVBJNi+Or11lx4cTYe4yHwtTbq9L2T/7cVyTfiTPbcVJos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510265; c=relaxed/simple;
	bh=5jECTUiw9haCgXbEVQtiLiq0L4+XTURHsaG7ZIr/8KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMTEvARjpIOx5E599WZbfYxGf5ZcqvJ/xQ8/nZdEFsGAhSXcmeE9ukAuWdW67ti4xH2I9DUWDVOTsursqHu9zWuwu+EvK6ig+9pCiQHO3uaPwK69GmvJEc9JQGFSx9O4InRJ0yODaAmxEBxdHG6WEdaeTwBFKzIMC/iJjHG9Iy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=hPsLJARs; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aqRgtvOvtDN3KSFPVIG9hG6fYTTX8Eg1w+wLpj29zgk=; b=hPsLJARs3EKAyDhDslxETQiu0l
	XSEmcc26ugqnFvHWolkj8IdE3cvotzUBziKngYWlhLEpfYPj9TM/1owsi20dgqGxqMbDg6gbGauQW
	EIMyhhWyjaIcdm+g//NiJE5prMoOHlvtZ6k0c5vjZgV+s+OykMzWRNbI8Q5vGIBxpfuYDVS4/xSWq
	a0kvrYdbZ12gu6/4MSshaR1uL+dYrxrfFcIr4+Teek+JKu/IU76EAxX4d/wkTEq4XziRb3Ba0ynOm
	mX0BfmYa1qGAcgo32hKTZ0KOdt4WUzP2qcAaHxX0zENcLpCa9AcKngUCwsq90B4kw9nLoF0pdSFhS
	uQ29ZYzA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51030)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trCMm-00014z-17;
	Sun, 09 Mar 2025 08:50:36 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trCMe-0001KD-1v;
	Sun, 09 Mar 2025 08:50:28 +0000
Date: Sun, 9 Mar 2025 08:50:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
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
Message-ID: <Z81WVNGlvRNW5JFk@shell.armlinux.org.uk>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308200921.1089980-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sat, Mar 08, 2025 at 08:09:21PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped __initconst for renesas_gbeth_clks array
> - Added clks_config callback
> - Dropped STMMAC_FLAG_RX_CLK_RUNS_IN_LPI flag as this needs
>   investigation.

I thought you had got to the bottom of this, and it was a bug in your
clock driver?

> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------

Thanks for the diagram.

> +struct renesas_gbeth {
> +	struct device *dev;
> +	void __iomem *regs;
> +	unsigned int num_clks;
> +	struct clk *clk_tx_i;
> +	struct clk_bulk_data *clks;
> +	struct reset_control *rstc;
> +};

If you stored a pointer to struct plat_stmmacenet_data, then you
wouldn't need num_clks, clk_tx_i or clks. If you look at
dwmac-dwc-qos-eth.c, I recently added a helper (dwc_eth_find_clk())
which could be made generic.

You can then include the clk_tx_i clock in the bulk clock, and
use the helper to set plat_dat->clk_tx_i.

> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLOCKGATING |

Didn't I send you a patch that provides
STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP so we can move towards the PHY
saying whether it permits the TX clock to be disabled?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

