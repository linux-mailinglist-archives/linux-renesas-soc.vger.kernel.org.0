Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA1D1F5549
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 15:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgFJNAa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 09:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729163AbgFJNA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 09:00:29 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6F9C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 06:00:28 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 9so2339609ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2020 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PNyrBZppNk3Cjv2T06G1zQBWJHpOfeyJqDojTtGkqc0=;
        b=Qbll/Bjm7pPCbjqueebN+hgqtenuC0SeH2KoV1L2PcrPvu1yr0DVTGD35LdOIPOFGb
         rIUL5CIDe3nVW7glCNLBRARyF2Hd/kOd6yH9rVut2I1yxnc5fIE4tKF1eML+3wiJYmzW
         k47efqsigrCnZmaJOG1bj5Y+Z9GxJLHG+7y0dfoelNMlFa7Kmia9UsST1NVNP3XIh7fW
         k1tZ1o1Gytst8WLFzGcavIjhKjKIx/zZeNFNXovrOfbLgHNNsrp6SRkyvdvBzKsj8Imh
         v/dQO/fuSL5us9jXZoS4Ps56ircqY/aQM+akRQnc/WHRxe1jBYlFsWzNF/NGn1O71Pb/
         rj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PNyrBZppNk3Cjv2T06G1zQBWJHpOfeyJqDojTtGkqc0=;
        b=YisGmnN1sc7JMmPJwh/w1XiDnK30Y0U9E3o3BaVGvnJS4gWIoUnDmqYe/UrPwG0k6d
         QO03fmlaaKEY05l8L76kv4l+Cx6XzNEQCcG6rWZnWWe61y70U/HWCMTMj2iZvMlpExXT
         v0wbgMj4oMcwcF3vZxdNL7YaGAHZJMou2vPX80DcmbguRNM0rKA14L0t7mCaLh0CILTu
         5qAFoql8RoA8kh0WX+J0+RK1edg4F6KLPQor5t3YqfnLhUd9cj8kMTTbeZpnlqUp78Ik
         n4wEVpWAazoMOmUYcU4YmUdun4XDa+y1WO5ZKsOOPhiEO03rRRLnoNaut8vH9J5gjUPa
         dd1w==
X-Gm-Message-State: AOAM5333o2YG8qTK/ilyfk+BPGO8Xl8EjBv6fAvEzH1UFki5SNxoLOek
        UQlGBEjdF8b6FaJ7YhPaD+F0SA==
X-Google-Smtp-Source: ABdhPJyz49dL94Sea0DJLV1WyFieZrGEQPrJqr/qrzgylWAQVW3IiN5+3jH4CECthyOGqzH2YpP66g==
X-Received: by 2002:a2e:8554:: with SMTP id u20mr1734783ljj.188.1591794026560;
        Wed, 10 Jun 2020 06:00:26 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id h15sm1001700ljk.24.2020.06.10.06.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 06:00:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 15:00:24 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] media: rcar-vin: Invalidate pipeline if
 conversion is not possible on input formats
Message-ID: <20200610130024.GA184623@oden.dyn.berto.se>
References: <1590581810-19317-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590581810-19317-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1590581810-19317-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-05-27 13:16:48 +0100, Lad Prabhakar wrote:
> Up until now the VIN was capable to convert any of its supported input mbus
> formats to any of it's supported output pixel formats. With the addition of
> RAW formats this is no longer true.
> 
> This patch invalidates the pipeline by adding a check if given vin input
> format can be converted to supported output pixel format.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  6 +++++-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 11 ++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 1a30cd036371..2b26204910fd 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1110,11 +1110,15 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
> -		vin->mbus_code = fmt.format.code;
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
> +			return -EPIPE;
>  		break;
>  	default:
>  		return -EPIPE;
>  	}
> +	vin->mbus_code = fmt.format.code;
>  
>  	switch (fmt.format.field) {
>  	case V4L2_FIELD_TOP:
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f421e2584875..d3b6a992b4a2 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -350,9 +350,9 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  	 * all of the related pixel formats. If mbus_code is not set enumerate
>  	 * all possible pixelformats.
>  	 *
> -	 * TODO: Once raw capture formats are added to the driver this needs
> -	 * to be extended so raw media bus codes only result in raw pixel
> -	 * formats.
> +	 * TODO: Once raw MEDIA_BUS_FMT_SRGGB12_1X12 format is added to the
> +	 * driver this needs to be extended so raw media bus code only result in
> +	 * raw pixel format.
>  	 */
>  	switch (f->mbus_code) {
>  	case 0:
> @@ -362,6 +362,11 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
>  	case MEDIA_BUS_FMT_UYVY10_2X10:
>  	case MEDIA_BUS_FMT_RGB888_1X24:
>  		break;
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		if (f->index)
> +			return -EINVAL;
> +		f->pixelformat = V4L2_PIX_FMT_SRGGB8;
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
