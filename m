Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE483FE23E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Sep 2021 20:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345015AbhIASQ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 14:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344701AbhIASQ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 14:16:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E929CC061764
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Sep 2021 11:15:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id j12so514533ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Sep 2021 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4k3zWyUEL5AN2tG7xoJkJdor5LE2O/9hbbNwLvToM/k=;
        b=SXSuA4Z2KSJWgSEDMpoOIQVvONtLLv+2kaWAupmQbPqxaVcxRZEQ69Hr4G2Q1cEaIy
         A+c+aPK3Sllcep7lmnXU9b0Sy62KlFnOK6JJsC/OPOx4RHQMOTNvCoC2fAmeA81EmcPX
         frinTWwu6w2eXHJ0oCsaqsvWEVObcAxSnNQSCdFCe53OGfWpSyN6uuZuQ3U6WW08ZIYF
         CpK714alSJ+deTXBdUQI0ZdmNE0P60+dk+FMG+Vy5snH3tQ00hGD7s1iEx+9QGWUAKxN
         y9j6IrqC7zcil5EBf5hFw8Jj3zBxPMMWWyycr1l/j6SGe6BJiDraAOhpDYb9oKVd8M2A
         4nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4k3zWyUEL5AN2tG7xoJkJdor5LE2O/9hbbNwLvToM/k=;
        b=HQUvCI/VZaHwZCuzEjy9up4r8eEcxxI2cxxtquuRvjnYopCyhDzXxC+wYnwFvdcc2f
         Dp/BCr+unZhQBnGpdW1WQUK6NhXSb9Eb6iLdann2SSwpwMmk8mzJHmCO8ISnrUK+JhJa
         QU1lZWB+SCjpN6oivaiUI11atx08dFajHkDHEVDtcvwSq1o+W/vf/xrt+MQPMeiVXlX0
         wUFcLW5VbiOXaJPCJ9N43tM9HE8h8KuaXl9rTlDiaujN4lA2IsZUAHbM2mrJOcXxOkHr
         Wun3/1HvyaTFi4HpI7hAfHl0Iz38hbX3uglr8gaygpTNiPGsTYeYpt3kRCj5zj8W+M5C
         b2fg==
X-Gm-Message-State: AOAM530QBPn6e91+ot/s4RZPbwKtJuZTD47yS2B0H2sHc1g2b9Hmy5a0
        yWHdhuCut3kiQyqt7WDtnFA/QA==
X-Google-Smtp-Source: ABdhPJxmg44jwR9K8A2Q0l7UYT3Cqb5yecouenQ+7/QsbzoyfARFCYohz/9j8covPbprCfASfeKthQ==
X-Received: by 2002:a2e:910f:: with SMTP id m15mr778961ljg.275.1630520158257;
        Wed, 01 Sep 2021 11:15:58 -0700 (PDT)
Received: from localhost ([185.224.57.161])
        by smtp.gmail.com with ESMTPSA id h13sm22492lfv.62.2021.09.01.11.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 11:15:57 -0700 (PDT)
Date:   Wed, 1 Sep 2021 20:15:55 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <YS/DW7GbhVjV9//8@wyvern>
References: <20210901055510.7279-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210901055510.7279-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Cai,

Thanks for your work.

On 2021-09-01 13:55:09 +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 711b52ba42b5..a4952711b7b1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1238,11 +1238,9 @@ static const struct media_entity_operations rcar_csi2_entity_ops = {
>  static int rcsi2_probe_resources(struct rcar_csi2 *priv,
>  				 struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	int irq, ret;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
