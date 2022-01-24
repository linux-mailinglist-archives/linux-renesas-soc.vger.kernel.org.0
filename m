Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF32497B14
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242445AbiAXJKy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 04:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbiAXJKx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 04:10:53 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C758C06173B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 01:10:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id me13so19545030ejb.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 01:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Rn9oWg7QZJtqL+/oipKctmGG9u6phd/vYxDS5+XP7mE=;
        b=wMtimSiwRoP4NmyeTG+2Yxl9GkqWpodlTF34lziSMz9aIu0QeP5ryUw6bV+jL0ynOz
         IzVmFq5MtAkYnrO8PecCkpTOn165o8eiWePkxnPKbb3IMNqKb44o7iF1uOmN4fnNSnK4
         nhYvYM3Lcblj2xZNrzAv+WKjU64cjyYEIFPZdqXpTde/jTPyAP3Jq04abW1KZ/o5dwwy
         b6SunQpIZD5xfmKCmhBj8rOyLbzl0Jb80/3cO/Uo9JSvKKpI3cy9JelA4g5Kyzvh581a
         EFYZpUvt2RLQgIU1/ImRipJLQfZOStd4fajWfEKlyQrYxLxKeOcr6gfWAItkEIL7o+He
         J+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Rn9oWg7QZJtqL+/oipKctmGG9u6phd/vYxDS5+XP7mE=;
        b=uN6AUj2eGUu90buzwN1UEChGzjUkLdiV9pMeiYaqQdVf3I/6HmL/P4sdgHFpiRLL9+
         T2X+Rjk054gNBeSTXfg1Rn46gr5LqquPL78Ev+l951MAta0GHzqzdGBFghSPIXkpOItw
         bPikACYRpB11z/iXUna5hlzCDiOSlZe0wNDj4xXd0IjG32NFovUnISFHq9+n9wdgUwqJ
         Ckho4UKONDcpQ/KeHKK6PhkwJbqjJu9764As3DcY3bWR80nTBbVg9o9WBmJnwahXEoNn
         vKrdw2yeSD+QrcpCEVTVbTCJ+m3s35AZEP8ejvHvZDAz0/nhdyTT6jdf1I/BquOPI0kF
         7EVA==
X-Gm-Message-State: AOAM531GLjPxTOea9YA5R/8RqBXRZyrETX1ePJYP7kdi7Lqe1p8nd/l5
        sek/m0boKCteb+wGM3Xqko3j83VTlNSAzQ==
X-Google-Smtp-Source: ABdhPJxfnbBxqSS5eVglnXcYZuB0xAys0gPDmiHP5RertB8Q+i/BxgU1zUPjJAtqjwgiIB0LvUo5HQ==
X-Received: by 2002:a2e:3008:: with SMTP id w8mr2879290ljw.308.1643015441577;
        Mon, 24 Jan 2022 01:10:41 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id j2sm490058lfe.223.2022.01.24.01.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 01:10:41 -0800 (PST)
Date:   Mon, 24 Jan 2022 10:10:40 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 4/6] media: rcar-csi2: Use mipi-csi2.h
Message-ID: <Ye5tECB371BINonm@oden.dyn.berto.se>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220123160857.24161-5-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2022-01-23 18:08:55 +0200, Laurent Pinchart wrote:
> Replace the hardcoded MIPI CSI-2 data types with macros from
> mipi-csi2.h.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 57 +++++++++++++++++----
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 8c939cb3073d..93df9a5e3d80 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -17,6 +17,7 @@
>  #include <linux/reset.h>
>  #include <linux/sys_soc.h>
>  
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -412,17 +413,51 @@ struct rcar_csi2_format {
>  };
>  
>  static const struct rcar_csi2_format rcar_csi2_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .bpp = 24 },
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
> -	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
> -	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
> -	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
> -	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .bpp = 10 },
> -	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8,     .datatype = 0x2a, .bpp = 8 },
> -	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8,     .datatype = 0x2a, .bpp = 8 },
> -	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8,     .datatype = 0x2a, .bpp = 8 },
> -	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
> -	{ .code = MEDIA_BUS_FMT_Y8_1X8,		.datatype = 0x2a, .bpp = 8 },
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.datatype = MIPI_CSI2_DT_RGB888,
> +		.bpp = 24,
> +	}, {
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.bpp = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV10_2X10,
> +		.datatype = MIPI_CSI2_DT_YUV422_8B,
> +		.bpp = 20,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y10_1X10,
> +		.datatype = MIPI_CSI2_DT_RAW10,
> +		.bpp = 10,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 8,
> +	}, {
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
> +		.datatype = MIPI_CSI2_DT_RAW8,
> +		.bpp = 8,
> +	},
>  };
>  
>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas S�derlund
