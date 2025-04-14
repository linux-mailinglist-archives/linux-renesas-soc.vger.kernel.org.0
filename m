Return-Path: <linux-renesas-soc+bounces-15941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B05A88928
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16F2E7A1FE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25DE288C88;
	Mon, 14 Apr 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OjIeHuD9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FD27FD79;
	Mon, 14 Apr 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649890; cv=none; b=uGDAWxwauVbPtDWFHAInPEI+EoKhn2dDhKxuizI/ZhB0xaXsQGHN6mgxjifOvpgKUrxFTskDSzio1w2FyLT7ysfIQ92lQbWO6wRgocd4J1HS0JpXW4QV3SCJbEEBwnFhxMoNJLO4gLgnTHyJTc0eDl6slmFybLC+it20KXTq8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649890; c=relaxed/simple;
	bh=4hYhsz4kTt2pLX6PzDOVl8NRG0L8du4Knh7lEqCz75w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAhVTFmQDk/QXG58AUaLiFRCo7nijxJ0FcW78FVROaIotEEsQDomOe4f7jyxG1EKf7WIquBgxl1Ju1N42DEi4h3CZa2YO5mpjVN+zYgVff1ZuuS+HzvnQLHOcp7V8dfjmld/l9uQiPdXxxX9+Bb/UAaTjCVyd9lYb4sytGz0+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OjIeHuD9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yZVRVFitHVYKh8lUFpDXz29jMQ4TVL55S2+Fg6L3zdM=; b=OjIeHuD93l2eyXtskX24h8WOtk
	L0lAdRcCp2gO9pW7MVq+3mm1HqBIp0Qpome2851bjAZ/uO0U4rITvM2C13uYfxaq5jcMJlLhx46gb
	CFyTcWeFOjvOWJuTu23KNEiGhH/TJiPjV2yV9bOq86Zto0+sQ5ACQ3wFcc0BXltuA+S6veUoXhKOZ
	9givV4yMZuESfUKFgiHLB6mudZhFAdWPUxka2yklXXBHXCWKHWA1An3lhBuu1ogx0NNNbjgn0d+se
	KNKSCbD+JBnwkWd7Lfk9p/Qv8HiRzUoOjhd8wKNXJCvd/DVerSJ2YlJT6Lz/j4YmfUNVhRMBuisF8
	wlBiGAnw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35404)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u4N83-0006rx-0D;
	Mon, 14 Apr 2025 17:57:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u4N7w-0007v6-0o;
	Mon, 14 Apr 2025 17:57:44 +0100
Date: Mon, 14 Apr 2025 17:57:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Message-ID: <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> +	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(gbeth->rstc))
> +		return PTR_ERR(gbeth->rstc);
> +
> +	gbeth->dev = dev;
> +	gbeth->regs = stmmac_res.addr;
> +	gbeth->plat_dat = plat_dat;
> +	plat_dat->bsp_priv = gbeth;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->clks_config = renesas_gbeth_clks_config;
> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> +			   STMMAC_FLAG_SPH_DISABLE;
> +
> +	err = renesas_gbeth_clks_config(gbeth, true);
> +	if (err)
> +		return err;
> +
> +	err = stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> +	if (err)
> +		renesas_gbeth_clks_config(gbeth, false);
> +
> +	return err;
> +}
> +
> +static void renesas_gbeth_remove(struct platform_device *pdev)
> +{
> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), false);
> +}

Would calling renesas_gbeth_clks_config() in the suspend/resume paths
cause problems?

If not, please consider using plat_dat->init() and plat_dat->exit()
to control these clocks, and then use devm_stmmac_pltfr_probe()
which will call the ->init and ->exit functions around the probe
as necessary and at removal time (and you won't need the remove
method.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

