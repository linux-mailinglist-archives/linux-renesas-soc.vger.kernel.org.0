Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE19E33ECC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Mar 2021 10:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhCQJQi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Mar 2021 05:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhCQJQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Mar 2021 05:16:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02237C06175F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:16:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t18so1892119lfl.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Mar 2021 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X4serOffhNvm2pn4rGEBM7dU/qYI9fXQKdGs5eoe7lU=;
        b=mf7AyfcV3ENPr1mcx0NH8GgJCYZvVpz17lPU6/SdqBOcNLobzyLe3gjbgg90f9ddUH
         qD2RwSLmTUG0/vByh/mcio2c9FvWrjKEsIcs6Zu/aNhiAtALx/QR+/n6BunXCbwjmdH3
         8yqEi/BHQlqrFjlEMgGGH3ehlRAIcHGkzPIyZ+MqnQDVb/odNPmEW7ksNCkx4aTzKUPn
         +rvNfMfQBDx5WmhkZJYYz2oGp0pWiDfD50qexFOzstlPG7eooMuY1NWhcqdamVA1TwZS
         Sxn0pp+38j3p2U3WJN3jwQqRphIdF5Uq3jZDzXZLjL9ID79zSNNihS8OR5E8pwJt4x7g
         4v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X4serOffhNvm2pn4rGEBM7dU/qYI9fXQKdGs5eoe7lU=;
        b=MB7okoczL1Nt2Q+uN8THQKHM9EHOdk5HzwXoL2WBF5m41kaz2YlHxa9aKBFJgGl3XE
         jiEX5HzuCedSFxBW34BukffCIaAW5Q9Vi9POk7C3NVBrWBa4AmuqIUh3/87fP1rAXhjg
         zv3VQ5H6rbbsY9ZfjDg8U0Y4pvLq8KEua6hTmluAqmEyLIhshu3MsLtrawFwk3inXASH
         +wVVFtXSGR5XXa+KfJexbKwCadu803AwNIkD26l5isQ0Fz3WlxOUXmjhno/WcLbASGPk
         2/jr4xL75hVFu3gjhDpdjzOeJbBwKU4v7vfjZLaY6zn+Si1RbXyz5hPlnUiEM6gDyQ31
         IWZA==
X-Gm-Message-State: AOAM532k/LdF5nVMSTm6RG6FvOSGwZqQCNMPqeIUgKNrsBTaiB5I7Lte
        4RqITIY3hEo5I33EHx2iifM/2Q==
X-Google-Smtp-Source: ABdhPJzC+odnmrwNz3bHVgVaM0t/WP7hYoQAR/FOphuvAwRv3huL5i9CE+q9N440mINULn1Jv+ZlVw==
X-Received: by 2002:ac2:491d:: with SMTP id n29mr1873655lfi.541.1615972575571;
        Wed, 17 Mar 2021 02:16:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c4sm110385ljf.101.2021.03.17.02.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 02:16:15 -0700 (PDT)
Date:   Wed, 17 Mar 2021 10:16:14 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Enable support for r8a77961
Message-ID: <YFHI3szl9yu3yU6Q@oden.dyn.berto.se>
References: <20210312130543.1744180-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312130543.1744180-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On 2021-03-12 14:05:43 +0100, Niklas Söderlund wrote:
> Enable support for M3-W+ (r8a77961).
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I have off-band received a tag for this patch,

Tested-by: LUU HOAI <hoai.luu.ub@renesas.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index cb3025992817d625..33957cc9118ca79e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -1362,6 +1362,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a7796",
>  		.data = &rcar_info_r8a7796,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a77961",
> +		.data = &rcar_info_r8a7796,
> +	},
>  	{
>  		.compatible = "renesas,vin-r8a77965",
>  		.data = &rcar_info_r8a77965,
> -- 
> 2.30.1
> 

-- 
Regards,
Niklas Söderlund
