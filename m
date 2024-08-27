Return-Path: <linux-renesas-soc+bounces-8355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B542D960803
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CEEE283757
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 10:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53D219E83C;
	Tue, 27 Aug 2024 10:57:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2CF19E7FF;
	Tue, 27 Aug 2024 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724756257; cv=none; b=I2Vz7E+mkBQ2nMEuAkX5oxaiTFZ4Nf/unHfmNRymOnFUc+OtW8ZsEP+mMjXuSZc8SO6fAAzmw/PhDuBqsqWo+vPKZIfh93IukGdy+w4DNIEixuvC9L7mare66RsX6VqcDUeKdXuNmFYagV6rFFOHg/CbnneaT6PB1QYSRXDckdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724756257; c=relaxed/simple;
	bh=CeKAJbVu1lrX4Inx0HaxDPih7bt9gT3sC6XDxRYXs0A=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKmPaEpERHPryBfw0Vx/Tc9wxRv1E0i0R6l4+U1yYH9q465odRyNubELcwS8cqr8Fnawjrb1hvgl8c9KJ3QXUKwMlKRrFmk7qjCf4xlV2ma9tGntR/JKHPEbWTSfWoic0XC99daFPVb0Nu4y8IIVDGBxZlKLAwaV92EvtdWSs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPXv0Ypyz6J6rX;
	Tue, 27 Aug 2024 18:53:35 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 05273140B39;
	Tue, 27 Aug 2024 18:57:33 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:57:32 +0100
Date: Tue, 27 Aug 2024 11:57:31 +0100
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
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [net-next v3 6/9] net: ethernet: broadcom: bcm63xx_enet:
 Convert to devm_clk_get_enabled()
Message-ID: <20240827115731.00007469@Huawei.com>
In-Reply-To: <20240827095712.2672820-7-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-7-frank.li@vivo.com>
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

On Tue, 27 Aug 2024 03:57:09 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
Another one where this is mixing devm and not which makes care
hard to review and may introduce subtle bugs.

Use devm_alloc_etherdev() and devm_register_netdev()
and take all the cleanup handling managed.

Much simpler to review that way.

J
> ---
> v3:
> -Reduce the number of clk variables
> 
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c | 47 ++++++--------------
>  drivers/net/ethernet/broadcom/bcm63xx_enet.h |  6 ---
>  2 files changed, 13 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index 3c0e3b9828be..dcc741837d50 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	struct bcm63xx_enet_platform_data *pd;
>  	int irq, irq_rx, irq_tx;
>  	struct mii_bus *bus;
> +	struct clk *clk;
>  	int i, ret;
>  
>  	if (!bcm_enet_shared_base[0])
> @@ -1752,14 +1753,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	priv->irq_rx = irq_rx;
>  	priv->irq_tx = irq_tx;
>  
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
> -	if (IS_ERR(priv->mac_clk)) {
> -		ret = PTR_ERR(priv->mac_clk);
> +	clk = devm_clk_get_enabled(&pdev->dev, "enet");
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>  		goto out;
>  	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>  
>  	/* initialize default and fetch platform data */
>  	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
> @@ -1789,15 +1787,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  
>  	if (priv->has_phy && !priv->use_external_mii) {
>  		/* using internal PHY, enable clock */
> -		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
> -		if (IS_ERR(priv->phy_clk)) {
> -			ret = PTR_ERR(priv->phy_clk);
> -			priv->phy_clk = NULL;
> -			goto out_disable_clk_mac;
> +		clk = devm_clk_get_enabled(&pdev->dev, "ephy");
> +		if (IS_ERR(clk)) {
> +			ret = PTR_ERR(clk);
> +			goto out;
>  		}
> -		ret = clk_prepare_enable(priv->phy_clk);
> -		if (ret)
> -			goto out_disable_clk_mac;
>  	}
>  
>  	/* do minimal hardware init to be able to probe mii bus */
> @@ -1889,10 +1883,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  out_uninit_hw:
>  	/* turn off mdc clock */
>  	enet_writel(priv, 0, ENET_MIISC_REG);
> -	clk_disable_unprepare(priv->phy_clk);
>  
> -out_disable_clk_mac:
> -	clk_disable_unprepare(priv->mac_clk);
>  out:
>  	free_netdev(dev);
>  	return ret;
> @@ -1927,10 +1918,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
>  				       bcm_enet_mdio_write_mii);
>  	}
>  
> -	/* disable hw block clocks */
> -	clk_disable_unprepare(priv->phy_clk);
> -	clk_disable_unprepare(priv->mac_clk);
> -
>  	free_netdev(dev);
>  }
>  
> @@ -2648,6 +2635,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  	struct bcm63xx_enetsw_platform_data *pd;
>  	struct resource *res_mem;
>  	int ret, irq_rx, irq_tx;
> +	struct clk *mac_clk;
>  
>  	if (!bcm_enet_shared_base[0])
>  		return -EPROBE_DEFER;
> @@ -2694,14 +2682,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> -	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
> -	if (IS_ERR(priv->mac_clk)) {
> -		ret = PTR_ERR(priv->mac_clk);
> +	mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
> +	if (IS_ERR(mac_clk)) {
> +		ret = PTR_ERR(mac_clk);
>  		goto out;
>  	}
> -	ret = clk_prepare_enable(priv->mac_clk);
> -	if (ret)
> -		goto out;
>  
>  	priv->rx_chan = 0;
>  	priv->tx_chan = 1;
> @@ -2720,7 +2705,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  
>  	ret = register_netdev(dev);
>  	if (ret)
> -		goto out_disable_clk;
> +		goto out;
>  
>  	netif_carrier_off(dev);
>  	platform_set_drvdata(pdev, dev);
> @@ -2729,8 +2714,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -out_disable_clk:
> -	clk_disable_unprepare(priv->mac_clk);
>  out:
>  	free_netdev(dev);
>  	return ret;
> @@ -2740,16 +2723,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
>  /* exit func, stops hardware and unregisters netdevice */
>  static void bcm_enetsw_remove(struct platform_device *pdev)
>  {
> -	struct bcm_enet_priv *priv;
>  	struct net_device *dev;
>  
>  	/* stop netdevice */
>  	dev = platform_get_drvdata(pdev);
> -	priv = netdev_priv(dev);
>  	unregister_netdev(dev);
>  
> -	clk_disable_unprepare(priv->mac_clk);
> -
>  	free_netdev(dev);
>  }
>  
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> index 78f1830fb3cb..e98838b8b92f 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
> @@ -316,12 +316,6 @@ struct bcm_enet_priv {
>  	/* lock mib update between userspace request and workqueue */
>  	struct mutex mib_update_lock;
>  
> -	/* mac clock */
> -	struct clk *mac_clk;
> -
> -	/* phy clock if internal phy is used */
> -	struct clk *phy_clk;
> -
>  	/* network device reference */
>  	struct net_device *net_dev;
>  


