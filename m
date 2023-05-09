Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7423B6FCE4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 21:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbjEITJ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 15:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjEITJy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 15:09:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C56340C8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 12:09:53 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f2510b2b98so2882299e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1683659392; x=1686251392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR8X1TTcgXvRjYy2pcb038nOoHAa1YKPA1Hbl8rlO8I=;
        b=utsq2Fa9ROUo1B+SWGCCBlFrad/V62TEvHg6urG8x0W8muJgmp3nPQZ3c44mMK8Q7P
         UJNsvP377ZIK9isZrzjB4ZTQUQmCbGIwZq40VB7QJD4rMfmxCmey7C4oDk54EfmlB1vB
         fU8ofJFf+16G28GGOpfbzzYcvN8rp1YHZOuyrmDcM+6/XcAq+3E5nhmo4DHrZMe0L0kS
         uRIF+XhqF5Kt9+a8iuehSkP30EjVoSRAtKWrxT62Ox1/6+j1WxIhxzrKSK+Exc0FKrV0
         VxvJShwJCYC5/iADu0FoPJo/c4nzZ2FuMaetTKYxt5fAyaU+jdhcjGJ1cN1mUSLne2WG
         eklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659392; x=1686251392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR8X1TTcgXvRjYy2pcb038nOoHAa1YKPA1Hbl8rlO8I=;
        b=GsUaYMr3XhsT2psFnyfP57O6TYMMelBJhdkpZmNAjnwGjXnr+4wGh01a4OmI6UbCeo
         BAYtZeKkUYGBcSMy80fApecORgAnF0RABHv+91y4HRUG3fRcs105H34nNByc36lh0ZzU
         Q/eygGakWR9aA2E6X6Pp6yCu0udN8F1MkIqzlkZ+DMwdebrza5x/T3IKI8aWDJI6axAJ
         hpZgzdXB+/fUuMbE4FCYyLqiplmXGVqRyLw2E9TrRkcGDHbzbqZScGg3MylXSO1s42Xs
         5biavEEg3ZI4MvyCWezlQkAN3pTGii8grjUad5j4E6thZo+GXhv+VgFuyxGwfQyeI9iF
         MucA==
X-Gm-Message-State: AC+VfDzBkcBAXMs0mf9nJyLNy+zqHw2R0bt2X1U1LZQa5sJcM6Ca2DUR
        ElUT3ZJqVN2fge+vjfEdFkOGZw==
X-Google-Smtp-Source: ACHHUZ5e9Jtlui8kfIyUL7GRbasRokDXiELgHYBCtGJBZUbi4dIULV87bomTgrzfNCKS1w+bLIWjcA==
X-Received: by 2002:ac2:4317:0:b0:4eb:c3c:fb19 with SMTP id l23-20020ac24317000000b004eb0c3cfb19mr1082000lfh.30.1683659391733;
        Tue, 09 May 2023 12:09:51 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id b16-20020ac25e90000000b004eca2b1c5b4sm443621lfq.229.2023.05.09.12.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:09:51 -0700 (PDT)
Date:   Tue, 9 May 2023 21:09:50 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-vin: Add support for R-Car V4H
Message-ID: <ZFqafhmNm4co7H-N@oden.dyn.berto.se>
References: <20230211145519.3821526-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211145519.3821526-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

A gentle ping on this patch, the binding was merged in v6.4-rc1.

On 2023-02-11 15:55:19 +0100, Niklas Söderlund wrote:
> Add support for R-Car V4H. The V4H uses the ISP Channel Selector as its
> only possible video input source. Even tho V4H is a Gen3 board the VIN
> interface is very close to the one found on the V3U, for this reason
> mark it as a Gen3 model internally.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 5e53d6b7036c..059795c889ad 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1303,6 +1303,15 @@ static const struct rvin_info rcar_info_r8a779a0 = {
>  	.max_height = 4096,
>  };
>  
> +static const struct rvin_info rcar_info_r8a779g0 = {
> +	.model = RCAR_GEN3,
> +	.use_mc = true,
> +	.use_isp = true,
> +	.nv12 = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +};
> +
>  static const struct of_device_id rvin_of_id_table[] = {
>  	{
>  		.compatible = "renesas,vin-r8a774a1",
> @@ -1368,6 +1377,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a779a0",
>  		.data = &rcar_info_r8a779a0,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a779g0",
> +		.data = &rcar_info_r8a779g0,
> +	},
>  	{ /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, rvin_of_id_table);
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund
