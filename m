Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B326E1D0246
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 00:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELW0w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 May 2020 18:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727971AbgELW0w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 18:26:52 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECC3C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2020 15:26:51 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id o14so14459377ljp.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2020 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t1GCnSY4uTkAcfm2Amgz7mdBr4uRw86tBEsv4bxmQzY=;
        b=mwlbZQAfvfOzwB6ODiMJXWLYT1su4PF828fSWj2MzV2UAihilJRaooKhp4G2RSNKKL
         8U03XKz4i6TmLdGyJiwS9bV8GU1CmYvqMj7wP1lE/fxakYbdbcv5QYS4uhdm00U2jXoJ
         kDkEClnyf3wM520UyQjv/dEFBLuVwTRXkr6oaBmgLPYdryH7y2rMuVu9ABRJ2aTq7o5j
         D70OH4dM+VI6M+ovdGggtM+Z1dGHbe9lGg0NYVqzcdxkUCSr1yR4apP37J5Lg7SnB1tw
         2ptPSn5bwdHODa3LjzfS4p77gbHmSH+ReJKG7qafpjKUA6AEsskQ8am9RD6yrF9Gja2J
         0OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t1GCnSY4uTkAcfm2Amgz7mdBr4uRw86tBEsv4bxmQzY=;
        b=FKF4VCsa8Macht8F0OHhLU7wtRzI1pMDyUN0+mytzMxPya3XeDSjdXEXycOt42FbQ5
         UHszEcsyYOGoiuhKim6zRC6m+WPSvmmpcWfgFZbAhmY5IskHU7VKjAQEQQyeAmUcj64D
         EIfiVl7770wQM4PrDZxgStOwTZlT6fF/YYWDyYb9Yo0CPQmTYXmvCNSFWKcWUO490YYd
         rWl6Zi42ZvO1YzQqVWHcGrlK58QDf4RGycLxBlY4yln8QUfgO+LAa1lZKRwCP6gH7oeU
         JT3JJqNi5QNK9jCS4uewVbjjDSC2neC3lau1CHVf7GwEARwziIRVtHlDYyHT0WAxGWZw
         NdbQ==
X-Gm-Message-State: AOAM5319QADa4RxH1K7/jTQvkvmIiIZjEorcSpWufgd5O7yHEg86ruuD
        eMqEaXv6dO8ougxe9sXbSEqtOw==
X-Google-Smtp-Source: ABdhPJwEduG0cPtm1XlGc9w4iKYmhxowK3sFh1H/aNyWh4z7t2H+0oB7q+2VOgPira1wZz5X0+1tdw==
X-Received: by 2002:a2e:9cd:: with SMTP id 196mr14484595ljj.226.1589322409674;
        Tue, 12 May 2020 15:26:49 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c79sm14992881lfg.29.2020.05.12.15.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:26:48 -0700 (PDT)
Date:   Wed, 13 May 2020 00:26:48 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 1/3] media: rcar-vin: Invalidate pipeline if
 conversion is not possible on input formats
Message-ID: <20200512222648.GD2542285@oden.dyn.berto.se>
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586945948-11026-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1586945948-11026-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-04-15 11:19:06 +0100, Lad Prabhakar wrote:
> Up until now the VIN was capable to convert any of its supported input mbus
> formats to any of it's supported output pixel formats. With the addition of
> RAW formats this is no longer true.

Add blank line.

> This patch invalidates the pipeline by adding a check if given vin input
> format can be converted to supported output pixel format.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I like this patch I think there is a typo bellow and patch [1] have been 
merged in the media-tree which unfortunately addes one more thing to do 
in this patch. In rvin_enum_fmt_vid_cap() there is a TODO noted for what 
needs to be done. In imagine the fix is simple and the end result would 
look something like this.

    switch (f->mbus_code) {
    case 0:
    case MEDIA_BUS_FMT_YUYV8_1X16:
    case MEDIA_BUS_FMT_UYVY8_1X16:
    case MEDIA_BUS_FMT_UYVY8_2X8:
    case MEDIA_BUS_FMT_UYVY10_2X10:
    case MEDIA_BUS_FMT_RGB888_1X24:
        break;
    case MEDIA_BUS_FMT_SRGGB8_1X8:
        if (f->index)
            return -EINVAL;

        f->pixelformat = V4L2_PIX_FMT_SRGGB8;
        return 0;
    case default:
        return -EINVAL;
    }

1. d5f74a1eff9aef3b ("media: rcar-vin: Make use of V4L2_CAP_IO_MC")

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd036371..48bd9bfc3948 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1109,13 +1109,17 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY8_1X16:
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
> +		break;
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> -		vin->mbus_code = fmt.format.code;

This is not right is it?

Should you not add a case for MEDIA_BUS_FMT_SRGGB8_1X8 instead of taking 
over MEDIA_BUS_FMT_RGB888_1X24?

> +		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
> +			return -EPIPE;
>  		break;
>  	default:
>  		return -EPIPE;
>  	}
>  
> +	vin->mbus_code = fmt.format.code;
> +
>  	switch (fmt.format.field) {
>  	case V4L2_FIELD_TOP:
>  	case V4L2_FIELD_BOTTOM:
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
