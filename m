Return-Path: <linux-renesas-soc+bounces-8358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCF960839
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3581C227E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52C819EEAF;
	Tue, 27 Aug 2024 11:11:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F273158D9C;
	Tue, 27 Aug 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757113; cv=none; b=MsjJha6pNQMjLEbDIn/XGMGfmku8A26s28OEg/yPnBzjm9/31joBWBjqe9/nlPr90BVK2F7eGf8inGGVU+8V2n63lCc+B3qAAcb0efBDydteHsfPQwOLP8Nwo9j3Yf6ramzjI0NN9YQicaiCEu/S65o+ZL3zv2itr67FZiSHQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757113; c=relaxed/simple;
	bh=k99TBizg+HcIIP8jC7HI5f4C2NjlxLfor1s8Vd6V8LQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFbXaNuMl/o6P/Dd4tkVriOlfKWTlJKIzsyUNHmyQRChPEcrBAW9EI/nZQUG6psa0R4tgKqPkdQe/ACxjedeBGFTkk5rtiveS+6RaUPg+ctmfInJih44iht2YesKV/l0JLxGxFwqosODEbvNeE28olG4tB5kHRY+ykc7vkcDHnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPt96lPLz6K9X1;
	Tue, 27 Aug 2024 19:08:33 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 355301400D4;
	Tue, 27 Aug 2024 19:11:49 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 12:11:48 +0100
Date: Tue, 27 Aug 2024 12:11:47 +0100
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
Subject: Re: [net-next v3 9/9] net: marvell: pxa168_eth: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827121147.00006444@Huawei.com>
In-Reply-To: <20240827095712.2672820-10-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-10-frank.li@vivo.com>
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

On Tue, 27 Aug 2024 03:57:12 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
Ordering in here is already 'interesting' but I'd still look
at more devm_ calls for the mdio and netdev parts.

> ---
>  drivers/net/ethernet/marvell/pxa168_eth.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
> index 1a59c952aa01..bad91cc705e8 100644
> --- a/drivers/net/ethernet/marvell/pxa168_eth.c
> +++ b/drivers/net/ethernet/marvell/pxa168_eth.c
> @@ -237,8 +237,6 @@ struct pxa168_eth_private {
>  	struct timer_list timeout;
>  	struct mii_bus *smi_bus;
>  
> -	/* clock */
> -	struct clk *clk;
>  	struct pxa168_eth_platform_data *pd;
>  	/*
>  	 * Ethernet controller base address.
> @@ -1394,23 +1392,19 @@ static int pxa168_eth_probe(struct platform_device *pdev)
>  
>  	printk(KERN_NOTICE "PXA168 10/100 Ethernet Driver\n");
>  
> -	clk = devm_clk_get(&pdev->dev, NULL);
> +	clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "Fast Ethernet failed to get clock\n");
> -		return -ENODEV;
> +		return PTR_ERR(clk);
>  	}
> -	clk_prepare_enable(clk);
>  
>  	dev = alloc_etherdev(sizeof(struct pxa168_eth_private));
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto err_clk;
> -	}
> +	if (!dev)
> +		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, dev);
>  	pep = netdev_priv(dev);
>  	pep->dev = dev;
> -	pep->clk = clk;
>  
>  	pep->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(pep->base)) {
> @@ -1523,8 +1517,6 @@ static int pxa168_eth_probe(struct platform_device *pdev)
>  	mdiobus_free(pep->smi_bus);
>  err_netdev:
>  	free_netdev(dev);
> -err_clk:
> -	clk_disable_unprepare(clk);
>  	return err;
>  }
>  
> @@ -1542,7 +1534,6 @@ static void pxa168_eth_remove(struct platform_device *pdev)
>  	if (dev->phydev)
>  		phy_disconnect(dev->phydev);
>  
> -	clk_disable_unprepare(pep->clk);
>  	mdiobus_unregister(pep->smi_bus);
>  	mdiobus_free(pep->smi_bus);
>  	unregister_netdev(dev);


