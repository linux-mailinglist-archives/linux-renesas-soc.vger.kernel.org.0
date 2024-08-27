Return-Path: <linux-renesas-soc+bounces-8353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177D9607EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B201C228D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 10:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D33919E7FF;
	Tue, 27 Aug 2024 10:53:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0C4C634;
	Tue, 27 Aug 2024 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724756035; cv=none; b=EAjTBX55aua3iU5bdz94Wl6a0JiH8v/tn6vd6F5Zbnns46+5F+89N4RqOl7cFnyfpSeNHTBInLP9lizcXZysqAj0jvctjWEy4c3zkHAxxa/sT3rTev5Qj63o0YHpWKoSzmTmgL/xdR6pW3Uqrq0J1CmygaOnSsa4dIEdhN1GEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724756035; c=relaxed/simple;
	bh=s8W6qCwP1dfOxsBwXIaTpsIJ8nG5fLwW/vsZ9t46X/c=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dpK+H/Gh16YwNPK6yDSw+BMWCxatPYy9qpV4u0th/uBnPXTB6CmHpYcQ3SJj/MC41pP6jvI2zRHCDFXNy3cmlWG08gPG9/tEuXVeexZU5UxFMfh8WT4fV0pmSEQtdZjTl+3S/pCA+cuzsTEKskiWYh7QyzP+X3JB01wAYK79nNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPSd1cR5z6J7LP;
	Tue, 27 Aug 2024 18:49:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 265CA140A71;
	Tue, 27 Aug 2024 18:53:51 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:53:50 +0100
Date: Tue, 27 Aug 2024 11:53:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
CC: <clement.leger@bootlin.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <ulli.kroll@googlemail.com>,
	<linus.walleij@linaro.org>, <marcin.s.wojtas@gmail.com>,
	<linux@armlinux.org.uk>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <hkallweit1@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <jacob.e.keller@intel.com>,
	<justinstitt@google.com>, <sd@queasysnail.net>, <horms@kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 3/9] net: ethernet: cortina: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827115349.00002f77@Huawei.com>
In-Reply-To: <20240827095712.2672820-4-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-4-frank.li@vivo.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 27 Aug 2024 03:57:06 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't like the mixing of devm and non devm here.
Maybe better to use a devm_add_action_or_reset()
for geth_cleanup_freeq() as well.


> ---
> v3:
> -move the local clock variables, keep lines longest to shortest
> 
>  drivers/net/ethernet/cortina/gemini.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 73e1c71c5092..5c86987c6fdf 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -109,7 +109,6 @@ struct gemini_ethernet_port {
>  	struct device *dev;
>  	void __iomem *dma_base;
>  	void __iomem *gmac_base;
> -	struct clk *pclk;
>  	struct reset_control *reset;
>  	int irq;
>  	__le32 mac_addr[3];
> @@ -2326,7 +2325,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
>  		phy_disconnect(port->netdev->phydev);
>  		unregister_netdev(port->netdev);
>  	}
> -	clk_disable_unprepare(port->pclk);
>  	geth_cleanup_freeq(port->geth);
>  }
>  
> @@ -2401,6 +2399,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	struct gemini_ethernet *geth;
>  	struct net_device *netdev;
>  	struct device *parent;
> +	struct clk *pclk;
>  	u8 mac[ETH_ALEN];
>  	unsigned int id;
>  	int irq;
> @@ -2453,14 +2452,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	port->irq = irq;
>  
>  	/* Clock the port */
> -	port->pclk = devm_clk_get(dev, "PCLK");
> -	if (IS_ERR(port->pclk)) {
> +	pclk = devm_clk_get_enabled(dev, "PCLK");
> +	if (IS_ERR(pclk)) {
>  		dev_err(dev, "no PCLK\n");
> -		return PTR_ERR(port->pclk);
> +		return PTR_ERR(pclk);
>  	}
> -	ret = clk_prepare_enable(port->pclk);
> -	if (ret)
> -		return ret;
>  
>  	/* Maybe there is a nice ethernet address we should use */
>  	gemini_port_save_mac_addr(port);
> @@ -2469,8 +2465,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	port->reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(port->reset)) {
>  		dev_err(dev, "no reset\n");
> -		ret = PTR_ERR(port->reset);
> -		goto unprepare;
> +		return PTR_ERR(port->reset);
>  	}
>  	reset_control_reset(port->reset);
>  	usleep_range(100, 500);
> @@ -2532,24 +2527,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  					port_names[port->id],
>  					port);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	ret = gmac_setup_phy(netdev);
>  	if (ret) {
>  		netdev_err(netdev,
>  			   "PHY init failed\n");
> -		goto unprepare;
> +		return ret;
>  	}
>  
>  	ret = register_netdev(netdev);
>  	if (ret)
> -		goto unprepare;
> +		return ret;
>  
>  	return 0;
> -
> -unprepare:
> -	clk_disable_unprepare(port->pclk);
> -	return ret;
>  }
>  
>  static void gemini_ethernet_port_remove(struct platform_device *pdev)


