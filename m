Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6C3774309
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Aug 2023 19:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbjHHRzs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Aug 2023 13:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbjHHRz3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:55:29 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAB2298A5;
        Tue,  8 Aug 2023 09:25:01 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-317dcdae365so2649274f8f.1;
        Tue, 08 Aug 2023 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691511888; x=1692116688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rf4XxCrYgVizAAavMc52IH6DpERxZE+o/Obkfya7pmE=;
        b=Pj0d9Z0qmLaM5eWmZ2ec3quM/MMR2tzZCYuYbb+aYNfLDKVoAjwUc7ygizqpmmRsdb
         M9BXED4yoOnxfVx+9Loq74+KWMDvdlGHBPCGQpbCwPHARiC3ShgjdIHxYvpZ014a/gjy
         VZLdFpvaiCNeaQCcLA3NHgP2fTvRJquwhyZBlGMCiDcPT6jfJtwIC766yLwpLfir+U6P
         wBxcypOPR8OFOXxoZWQloLSdvhYmH9rtZzzpXnIE9laBEZKsqB4ClNO2L3ctrasXOQsn
         6b2gUqzuuxu6IwJolRT3tVTzUhmviVs8hYUJQVh/vETDnPsAeqqhi8P5OhzAcID5mqZo
         33mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511888; x=1692116688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf4XxCrYgVizAAavMc52IH6DpERxZE+o/Obkfya7pmE=;
        b=XNmkmCoAZpb1sJ0zDGW4olotuDBt6XotPcNfRJ8wpg6wPSy5fdocLLEH+zpJeL4Dhe
         2Ggt7f8fDMn+r2zpXxJrfsx/Up85q+ZlUBMpQMZFxRohCgbeQ8M7HE12Dk/LEmY7I54I
         BeB6i+a1i8mmlGrh28vtr9uNsnmPmxryx53+NABjvtJS5TGAGV2R/f6hDlTcmZ+DCADc
         dQCpbacujhkwZxvRIAhZp9dwwwD0RvbQgeDCCfbkImtkwRdEeUtsSC+vJAkJzh1VoB2J
         tycAh2cNxr0dsMU2qiNq9nAVKaaTqen/iVs4bYuz7/miYKFKDNZExZXJzQWtepYZLx/L
         E8Sw==
X-Gm-Message-State: AOJu0YwEAE9nbqdzLrteeSXBYUX1y/km5QOeqjeYhie1HUUS1emngGJ+
        fBdidAbBuPnfuSwok9qkVI6WJ8Qg3aLiRGZm
X-Google-Smtp-Source: AGHT+IGl4IwprpVRhUbr2saNT8Z/71UnR6qHH7OBP3LIPnm13VJYE8SNOagzmc/jO6UfMutTNg6ycQ==
X-Received: by 2002:a50:fb8a:0:b0:523:4933:b024 with SMTP id e10-20020a50fb8a000000b005234933b024mr862866edq.14.1691491999646;
        Tue, 08 Aug 2023 03:53:19 -0700 (PDT)
Received: from skbuf ([188.27.184.201])
        by smtp.gmail.com with ESMTPSA id lf13-20020a170906ae4d00b0099cc402d3ddsm4114291ejb.202.2023.08.08.03.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 03:53:19 -0700 (PDT)
Date:   Tue, 8 Aug 2023 13:53:17 +0300
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Xiang Yang <xiangyang@huaweicloud.com>
Cc:     clement.leger@bootlin.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, f.fainelli@gmail.com,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        xiangyang3@huawei.com
Subject: Re: [PATCH -next] net: pcs: Add missing put_device call in
 miic_create
Message-ID: <20230808105317.66o2gv66q2q3ulhl@skbuf>
References: <20230807134714.2048214-1-xiangyang@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807134714.2048214-1-xiangyang@huaweicloud.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 07, 2023 at 01:47:14PM +0000, Xiang Yang wrote:
> From: Xiang Yang <xiangyang3@huawei.com>
> 
> The reference of pdev->dev is taken by of_find_device_by_node, so
> it should be released when error out.
> 
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
> ---

Ok, but if of_find_device_by_node() requires a subsequent call to
put_device(), then doesn't this mean that in the non-error case, the
pdev refcount remains elevated, and will thus never be freed?

I would expect another put_device(&pdev->dev) after the device_link_add(),
which itself takes another set of references on the supplier and
consumer devs, which are sufficient for this driver's runtime operation.

Also, "if (!pdev)" and "if (!platform_get_drvdata(pdev)" here need
different treatment. One needs to call put_device(&pdev->dev) and the
other one doesn't.

	pdev = of_find_device_by_node(pcs_np);
	of_node_put(pcs_np);
	if (!pdev || !platform_get_drvdata(pdev))
		return ERR_PTR(-EPROBE_DEFER);

pw-bot: cr

>  drivers/net/pcs/pcs-rzn1-miic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
> index e5d642c67a2c..d097f123635a 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -318,8 +318,10 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
>  		return ERR_PTR(-EPROBE_DEFER);
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
> -- 
> 2.34.1
> 
