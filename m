Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64E73777F03
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Aug 2023 19:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjHJRVI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Aug 2023 13:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235056AbjHJRVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 13:21:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2209F2703;
        Thu, 10 Aug 2023 10:21:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso163461666b.1;
        Thu, 10 Aug 2023 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691688065; x=1692292865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPpvD6qW4n16vdLm9Vdg6zTK955nBVTdrCALfctuHdA=;
        b=cC9SPyXkSSMncOGiP0Thd1nq9K8gtYATnYCrMCydXvRPxw8cX7ck4Xwa0R163tU7bd
         KpSbjGlL3nRkgq016zuFJgdYfMMMqSJhscz7IZ/omLc657ILRicwFKXJkwPHbLG+YgP2
         AMpYuocO3UjG9xRRHL4O4i6JFYfc8G3qB2MAvhD6KS0f1aCbmBcNZmqy0l3qpK8Meudc
         UPMFcIcEhg6BfV0i5iRTx/v+F6JvbPsoGwRAWACVDWXERMkdU86pVMUKY1Y4+2HbMWyK
         J9KVTuLwzYHaGj1vhTZ246FWGbu0J/a09h/heS9o+/adhnk8jLqwkLQ29ca/uuZSDRm1
         lObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691688065; x=1692292865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPpvD6qW4n16vdLm9Vdg6zTK955nBVTdrCALfctuHdA=;
        b=gK7DdTbUQuEwJKgTipN1mOx7hcFzR9dCYggJtyb8CbknBY+oTRcUKIoJ3W8svNJPub
         /nncgz+i8mo335Tsjy4lCUK0p6+EZL2gfb09bGf37n3NC6Uvdwfenbfvb4d9gsuIQVLu
         tfg0U2ABydZoq9I67uMfFWgSa81zgARTik9hqfK1C1YSQ3paP33ZssOjUZp9Xb0WslJ8
         TtEmnzdH7zNDxNXVkPs75SQm58NFEI2U7mRXvp14M5auT/o5MVW9btVB5aUCBJEKVj+d
         5XV1d3eaOGtrBdEJYigBSi/cbbr123+NizYLcngqwoSirNiulIUx2z9TPCCVBcuJLu4Y
         MLcg==
X-Gm-Message-State: AOJu0Yzh2OQt9o9ojyPEumhOfGQCI/7zu6I4iKMfFKDHrBpiz0tEvQyi
        G7bXIaZX5IrLnTYzcguYzaE=
X-Google-Smtp-Source: AGHT+IE0SUqkw48K8TqOL9MAt7h/uYaeOIjIKwR9IMG/JTN7W13g8t2HpLuz+rR4+8p1AWqWCmSUtg==
X-Received: by 2002:a17:906:2255:b0:99b:ed44:1a79 with SMTP id 21-20020a170906225500b0099bed441a79mr2954773ejr.3.1691688065337;
        Thu, 10 Aug 2023 10:21:05 -0700 (PDT)
Received: from skbuf ([188.27.184.201])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906640200b0099d0c0bb92bsm1192753ejm.80.2023.08.10.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 10:21:05 -0700 (PDT)
Date:   Thu, 10 Aug 2023 20:21:02 +0300
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Xiang Yang <xiangyang@huaweicloud.com>
Cc:     clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        xiangyang3@huawei.com,
        Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH net v2] net: pcs: Add missing put_device call in
 miic_create
Message-ID: <20230810172102.dlpr43xk5scs3j6p@skbuf>
References: <20230810140639.2129454-1-xiangyang@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810140639.2129454-1-xiangyang@huaweicloud.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 10, 2023 at 10:06:39PM +0800, Xiang Yang wrote:
> From: Xiang Yang <xiangyang3@huawei.com>
> 
> The reference of pdev->dev is taken by of_find_device_by_node, so
> it should be released when not need anymore.
> 
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  drivers/net/pcs/pcs-rzn1-miic.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
> index e5d642c67a2c..97139c07130f 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -314,15 +314,21 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
>  
>  	pdev = of_find_device_by_node(pcs_np);
>  	of_node_put(pcs_np);
> -	if (!pdev || !platform_get_drvdata(pdev))
> +	if (!pdev || !platform_get_drvdata(pdev)) {
> +		if (pdev)
> +			put_device(&pdev->dev);
>  		return ERR_PTR(-EPROBE_DEFER);
> +	}
>  
>  	miic_port = kzalloc(sizeof(*miic_port), GFP_KERNEL);
> -	if (!miic_port)
> +	if (!miic_port) {
> +		put_device(&pdev->dev);
>  		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	miic = platform_get_drvdata(pdev);
>  	device_link_add(dev, miic->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> +	put_device(&pdev->dev);
>  
>  	miic_port->miic = miic;
>  	miic_port->port = port - 1;
> -- 
> 2.34.1
> 
> 
