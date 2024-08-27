Return-Path: <linux-renesas-soc+bounces-8352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C419607D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78DB41C221B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 10:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C05919E7DC;
	Tue, 27 Aug 2024 10:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF419753F;
	Tue, 27 Aug 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724755847; cv=none; b=Ug8X6OjR1Jr5wFTJiuoP9gokeN9XPYYWLyQtCIH25LTsegWAhlnzug7HOT9a8p6COQ6TY3EjKo9nYcXYW5cocQXQrilXvdpHMgfdO/hpgX3lL6OywtYPYD7mja1GyUZU/F0IAmT6r9n5hfEnfBXhB7doytJccKx55GfPc93X2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724755847; c=relaxed/simple;
	bh=5cLis9W4yVmYQtrLvICZwQnyHLKxBRZGZVGrAbusI1g=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUfc1LOafMIBEBjUUBQPnyAgGgZrgqjiV4O3nKXbQLpKMV4tK8/X9Wjwgep4mWU0UX1Rh9+I/0b4b3CVEjIoJQs0AWOlXu0QqwIuIt8jVqocYNQ0F7Fe8niu6S3wOP7Lc1muGGlybbzbIFoGmxd2DEApSWBrtxEp0+e1AqwNEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPPp5lG1z6K98Q;
	Tue, 27 Aug 2024 18:47:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 05E8F140447;
	Tue, 27 Aug 2024 18:50:42 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:50:41 +0100
Date: Tue, 27 Aug 2024 11:50:40 +0100
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
Subject: Re: [net-next v3 4/9] net: mdio: hisi-femac: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827115040.000017b0@Huawei.com>
In-Reply-To: <20240827095712.2672820-5-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-5-frank.li@vivo.com>
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

On Tue, 27 Aug 2024 03:57:07 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Mixing an matching devm and otherwise can lead to subtle bugs
and generally makes the code harder to review

I'd also use devm_mdiobus_alloc_size() and devm_mdiobus_register()
and drop the remove() callback entirely.

I would not take this patch on its own as it causes a reordering
of cleanup we probably don't want.

As a general rule, single action devm cleanup series (so only using
one new type) fall into this trap. Much better to look at all the
improvements in each driver that are enabled by new infrastructure
rather than doing a single type change series like this one.

Thanks,

Jonathan


> ---
>  drivers/net/mdio/mdio-hisi-femac.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-hisi-femac.c b/drivers/net/mdio/mdio-hisi-femac.c
> index 6703f626ee83..f6fcb9e11624 100644
> --- a/drivers/net/mdio/mdio-hisi-femac.c
> +++ b/drivers/net/mdio/mdio-hisi-femac.c
> @@ -21,7 +21,6 @@
>  #define BIT_WR_DATA_OFFSET	16
>  
>  struct hisi_femac_mdio_data {
> -	struct clk *clk;
>  	void __iomem *membase;
>  };
>  
> @@ -74,6 +73,7 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct mii_bus *bus;
>  	struct hisi_femac_mdio_data *data;
> +	struct clk *clk;
>  	int ret;
>  
>  	bus = mdiobus_alloc_size(sizeof(*data));
> @@ -93,26 +93,20 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  		goto err_out_free_mdiobus;
>  	}
>  
> -	data->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(data->clk)) {
> -		ret = PTR_ERR(data->clk);
> +	clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>  		goto err_out_free_mdiobus;
>  	}
>  
> -	ret = clk_prepare_enable(data->clk);
> -	if (ret)
> -		goto err_out_free_mdiobus;
> -
>  	ret = of_mdiobus_register(bus, np);
>  	if (ret)
> -		goto err_out_disable_clk;
> +		goto err_out_free_mdiobus;
>  
>  	platform_set_drvdata(pdev, bus);
>  
>  	return 0;
>  
> -err_out_disable_clk:
> -	clk_disable_unprepare(data->clk);
>  err_out_free_mdiobus:
>  	mdiobus_free(bus);
>  	return ret;
> @@ -121,10 +115,8 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
>  static void hisi_femac_mdio_remove(struct platform_device *pdev)
>  {
>  	struct mii_bus *bus = platform_get_drvdata(pdev);
> -	struct hisi_femac_mdio_data *data = bus->priv;
>  
>  	mdiobus_unregister(bus);
> -	clk_disable_unprepare(data->clk);
>  	mdiobus_free(bus);
>  }
>  


