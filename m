Return-Path: <linux-renesas-soc+bounces-8357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7EE96082E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816A31F2362C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAD319E81F;
	Tue, 27 Aug 2024 11:10:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7B19DF97;
	Tue, 27 Aug 2024 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724757000; cv=none; b=rNxEVtx9V5HA7o15U6PF8cuaScuTyglvjDihNRozqRhG+jW7XKcFOtreH5V6cEAJo6xolem5j079oWF6+6r7ZFB8fIMOjJXGCi57W1QO/4dRnw7mcSYv5bEd1FBoIs7N9UMvwHvTEUGSNNalGv6OW4O5WfBHvDB8dblvCXbboXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724757000; c=relaxed/simple;
	bh=QUGFg+hX30w2ZitBCIxluhdOSeIhPO5mtPVhzqXr46k=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzZZXXeStRLKfhkFa4BRFCDFG88z0a4QYPdOHHstp7+sigghnJi+fHcnM07kZZPe/GFjM8feFGZ8sFB8m46+YosbmBvE3St3zyzmrQckKWTh5OKwm+brdAT8OuOvDXy0V4zDr5vc0h5tdcY947Am91AFUxB+PokYKNrNHj0KnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPq92dSwz6J76Z;
	Tue, 27 Aug 2024 19:05:57 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 519DE1400D4;
	Tue, 27 Aug 2024 19:09:55 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 12:09:54 +0100
Date: Tue, 27 Aug 2024 12:09:53 +0100
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
	<maxime.chevallier@bootlin.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
Subject: Re: [net-next v3 8/9] net: mvpp2: Convert to devm_clk_get_enabled()
 and devm_clk_get_optional_enabled()
Message-ID: <20240827120953.00005450@Huawei.com>
In-Reply-To: <20240827095712.2672820-9-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-9-frank.li@vivo.com>
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

On Tue, 27 Aug 2024 03:57:11 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>

>  
> @@ -7745,12 +7710,6 @@ static void mvpp2_remove(struct platform_device *pdev)
>  
>  	if (!dev_of_node(&pdev->dev))
>  		return;

Given this makes no difference any more, drop the above dev_of_node() check.

> -
> -	clk_disable_unprepare(priv->axi_clk);
> -	clk_disable_unprepare(priv->mg_core_clk);
> -	clk_disable_unprepare(priv->mg_clk);
> -	clk_disable_unprepare(priv->pp_clk);
> -	clk_disable_unprepare(priv->gop_clk);
>  }
>  
>  static const struct of_device_id mvpp2_match[] = {


