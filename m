Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61AE5547C78
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jun 2022 23:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbiFLVck (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 Jun 2022 17:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbiFLVcj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Jun 2022 17:32:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB26645A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jun 2022 14:32:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p18so6157446lfr.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jun 2022 14:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/ujlSvZDm+T5STICymqMakNld8PPtAbjGJ2W5jeIug0=;
        b=kbmgGItjAlp3SzVQibq2g9TOmk2uX8rX0aE7LWdFf4pD5x4U1+EMfJVtjHtBCOFlWV
         bF+WPyXewi5XxTk7PfGq+N4OXjG8a7BRIHKb4MQj777VSy5cGKUE0bnNl/Ry4cgA/vkF
         Ui77ap/QIVXkni0Wr71bpIIrKY7GBWOq2WemuooTPjfarMpuWg9OBB5olsp2ucYIco9M
         HRKj/H5IHhOsJLPnvjAn0zsIFskrMjBqgb9/lLNSOxonRhF2dr+u4HJSfiqeEkwN8biT
         rA4nOZGQW7OgXeWEM25lF+9Tb1BTrIf+26NJ3TE2neyWhGdbDaqDF3yau+C6KVly6ZFK
         KSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/ujlSvZDm+T5STICymqMakNld8PPtAbjGJ2W5jeIug0=;
        b=X9Jqz75HpgLA2S1+U+jTp+0+fCja4GzUKsQFE9sqEADu5lLcTZeFDrUrHZJ6n/6o0a
         Cl4GozEvwF4pEb41EMbhjC8YK9ouPuDp9IEXJ74LpyEB6qLmf2EfsBWWheGK7uLJp57r
         hfB5VMcaWy4Du+I9bdoAyn7zsXE5LTUYy2htfd9JwzSBqn8BbkYyTtBhllhPXdv6BctJ
         8pwf/GRa2RWh/S2B5VgQAJzmkufOwe4pBt0YBN8nFTWuSmRNS1WhlQxtP8f0T7FkhD53
         N2LQlRSebqqMIYgsCzKBCDfkgoLfHsLdBxuZIzxJd0lvmig0CXPBlkSGBoYaw8SkQuin
         Pemg==
X-Gm-Message-State: AOAM533AF5ZaAGCRnIsTb1mBU6UOSXgUxhRIow/sMpKRuvF89/p+oqEq
        MmoFLGzgFwOvbS8DmNOHRee725jbf1sDyOsk
X-Google-Smtp-Source: ABdhPJw+E3i56vZWjOBGQ5brc5qFF0emikuDDV6rztL+Lu2qm6Za6v07zWTKVcC1NiVWqwnIca9/VA==
X-Received: by 2002:a05:6512:131f:b0:47d:b9cd:1d1d with SMTP id x31-20020a056512131f00b0047db9cd1d1dmr6967123lfu.82.1655069553735;
        Sun, 12 Jun 2022 14:32:33 -0700 (PDT)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id q28-20020ac2515c000000b00478df9f4d64sm729545lfd.227.2022.06.12.14.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 14:32:33 -0700 (PDT)
Date:   Sun, 12 Jun 2022 23:32:32 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] thermal: rcar_gen3_thermal: improve logging during
 probe
Message-ID: <YqZbcBmURzq/WRDP@oden.dyn.berto.se>
References: <20220610200500.6727-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610200500.6727-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2022-06-10 22:04:59 +0200, Wolfram Sang wrote:
> When setting up a new board, a plain "Can't register thermal zone"
> didn't help me much because the thermal zones in DT were all fine. I
> just had a sensor entry too much in the parent TSC node. Reword the
> failure/success messages to contain the sensor number to make it easier
> to understand which sensor is affected. Example output now:
> 
> rcar_gen3_thermal e6198000.thermal: Sensor 0: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 1: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 2: Loaded 1 trip points
> rcar_gen3_thermal e6198000.thermal: Sensor 3: Can't register thermal zone
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Change since v2:
> 
> * don't add plural-'s' at runtime to allow for a greppable string
>   (Thanks, Niklas!)
> 
>  drivers/thermal/rcar_gen3_thermal.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index ccdf8a24ddc7..cda7c52f2319 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -511,7 +511,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
>  							    &rcar_gen3_tz_of_ops);
>  		if (IS_ERR(zone)) {
> -			dev_err(dev, "Can't register thermal zone\n");
> +			dev_err(dev, "Sensor %u: Can't register thermal zone\n", i);
>  			ret = PTR_ERR(zone);
>  			goto error_unregister;
>  		}
> @@ -533,7 +533,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
>  		if (ret < 0)
>  			goto error_unregister;
>  
> -		dev_info(dev, "TSC%u: Loaded %d trip points\n", i, ret);
> +		dev_info(dev, "Sensor %u: Loaded %d trip points\n", i, ret);
>  	}
>  
>  	if (!priv->num_tscs) {
> -- 
> 2.35.1
> 

-- 
Kind Regards,
Niklas S�derlund
