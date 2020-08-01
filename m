Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A55235156
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Aug 2020 11:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgHAJFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Aug 2020 05:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgHAJFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Aug 2020 05:05:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E820BC061756
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2020 02:04:59 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x9so34800342ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2020 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ysGkfROsxh9fScF28a6Ab2vg7iqMPSIMDcq/54hw/Bs=;
        b=NLvj3hoTucDf6+zODHoC036A5mqQFsEMXF7b9PN5sgndABfVg1Ow7CM9z9Ig0i/iAv
         QjBs2ZE6feVJKQ1a+tEYAAXBL9kHxq1JWH4c6J4i3aGKMkU5naF/d8S9QRR9Spg25wtN
         3KAlWP+ovjBMIMbRoEmAcCTTOelojk7X9esECTxq3bgiiEEurWT+vGuVs8BV3q3JBywM
         wKbj+AjK4Ccn16LdqzXunJEsuGsVVQkxEHVUcPT6KA4ybrobiKAo263uG3OhHY0z/uHV
         IvgAjzu8Uh0jKNNRJkMrNbJJrixlcMX9Cxbl9QT+B14Ky0lyXl1YvFdmHX7LHVxlZVUY
         aatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ysGkfROsxh9fScF28a6Ab2vg7iqMPSIMDcq/54hw/Bs=;
        b=cnKoQ9jNrmdJ0gz0hALQ9hPsATBhFl+DvHaNsdbh4jpCroLZmaDSzkldXrwC99IzRX
         Vmf7x6NenPeyXRiH+ayscMxObDdnPb+lw4+qvu96eV8Ume+BseyCMPcqlvpk8vzxqGsB
         7w7ToxeZ+zfslBWLIxzBnQfQ8cLIVBn8hrT+n+h/bPeb9gssnwuHtS5l7IHt5KQGaNyn
         9qaVcJGqeQZgXpvhTojktSiNF9bTbVuNRO+Pjtpl5bnIm/xBshBn2/xo+Ro39zHQ9cKh
         S5v3N5LnAtyoOQHT83tb07+4FTrHBeUZ0HzwJnhRpQyCD3T04+eKglcr0c1NLxIqV4yd
         51IA==
X-Gm-Message-State: AOAM532LOuSzWIeCpp10F7EDRR6nBSvOLnYw6Nos7uVGy1TfEFqTV8Ka
        ++pajC+L4Otah8G+U4GPusbnOw==
X-Google-Smtp-Source: ABdhPJy3b6mLEDRdxzHctsXC+DubwBmRjCbyeloTjS4iFDZlA4tJZMThjxXAl1XSuFAX1eIzRN7tDg==
X-Received: by 2002:a2e:160d:: with SMTP id w13mr3732137ljd.470.1596272698238;
        Sat, 01 Aug 2020 02:04:58 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r19sm2556901lfi.58.2020.08.01.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 02:04:57 -0700 (PDT)
Date:   Sat, 1 Aug 2020 11:04:56 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200801090456.GB1379367@oden.dyn.berto.se>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> The crop and compose settings for VIN in non mc mode werent updated
> in s_fmt call this resulted in captured images being clipped.
> 
> With the below sequence on the third capture where size is set to
> 640x480 resulted in clipped image of size 320x240.
> 
> high(640x480) -> low (320x240) -> high (640x480)
> 
> This patch makes sure the VIN crop and compose settings are updated.

This is clearly an inconsistency in the VIN driver that should be fixed.  
But I think the none-mc mode implements the correct behavior. That is 
that S_FMT should not modify the crop/compose rectangles other then make 
sure they don't go out of bounds. This is an area we tried to clarify in 
the past but I'm still not sure what the correct answer to.

> 
> Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f421e25..a9b13d9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  	fmt_rect.width = vin->format.width;
>  	fmt_rect.height = vin->format.height;
>  
> +	vin->crop.top = 0;
> +	vin->crop.left = 0;
> +	vin->crop.width = vin->format.width;
> +	vin->crop.height = vin->format.height;
> +	vin->compose = vin->crop;
> +
>  	v4l2_rect_map_inside(&vin->crop, &src_rect);
>  	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
>  	vin->src_rect = src_rect;
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
