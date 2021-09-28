Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A7741A404
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 02:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238248AbhI1AFj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 20:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbhI1AFj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 20:05:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208D5C061740
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Sep 2021 17:04:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so84959074lfu.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Sep 2021 17:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9bL4iRqqm89pRQSEPivN/gaNctu5ZJkCkeOF8HtDooE=;
        b=BWGbHDT8WDVjiSuAKlE1lEDV/8IaADOQhOuH9iOm3Fb5MPNa9fL6CHku/manoKLIJU
         rraEp263CPdPlBzWb8rh9TpXI2OBj/+NTKT87H0QnEWiUcb7zuxJJpKVx1YzbnmyWjFA
         Eqvg7Rd/ylGsa1bXpXdVAIfNt4TbkmKiG3Ld0g4UL0ZbHJHw7B7sOO44BlDnIhAawH84
         8gWgDFT69Twb+xZClYc0LXHOaazrkaq1MVot4wq9JcNWI/M7UkoeGILUYNhdQLL0/MVl
         her38/c5QTcUMXh5jepwpqSZiZvHbb8HUQrup8BuOY81QataUC1Kb0+C3RdIwR92GW2d
         sy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9bL4iRqqm89pRQSEPivN/gaNctu5ZJkCkeOF8HtDooE=;
        b=e3YIfoWqtk4Avi4XYcDOcctoWO3wibMyU5xvpev5mfHpmiNAdTuAuK766r4bPJCO1J
         LU88sOm+j0grstIgMNoaKEPcCmFKol2JZRaAfk4jDdXZiiXHTfs6OmtUCgTuU45JLie9
         EzgNEiAT6byd+SM0zvBDtmL146zOl17AMRznJL8eDSXy90bEr7QJHOha8dzEEzIf5Ppi
         733HcAwRHydO7VRQyBL1EcQhmUeKb07tm8UyvOMNKSZWJyq8kJGMjjdTMgRExLtLLZt5
         76VNYDVqXMpg1ySdYjpkOlYAI268INk9Tvq1WTIemO+2fA4+0buWKC/g38Ax0D3zN49s
         TKAg==
X-Gm-Message-State: AOAM533WbOkxWqF+Em2asD4H65Yv3REqsfR+C6z0c5QFU2YWevGmFxfd
        4lFk/wdjCOVE86674tw/W8MXYg==
X-Google-Smtp-Source: ABdhPJx1XQfmZA36FtlL4UskEKqlHfdZJLZFI4pV/dsoUKSvihRwWpAfv39/56vOGjFCEbfkEIk5xg==
X-Received: by 2002:a05:6512:3191:: with SMTP id i17mr2482707lfe.381.1632787438343;
        Mon, 27 Sep 2021 17:03:58 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id b22sm1741542lfv.286.2021.09.27.17.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 17:03:57 -0700 (PDT)
Date:   Tue, 28 Sep 2021 02:03:56 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2] media: rcar-vin: add G/S_PARM ioctls
Message-ID: <YVJb7MUGQUoQ5oI8@oden.dyn.berto.se>
References: <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
 <20210924135138.29950-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924135138.29950-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Nikita and Vladimir,

Thanks for your work.

On 2021-09-24 16:51:38 +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> This adds g/s_parm ioctls for parallel interface.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes from v1:
> - use &vin->vdev to access vin's struct video_device
> 
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index bdeff51bf768..a5bfa76fdac6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -527,6 +527,24 @@ static int rvin_s_selection(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int rvin_g_parm(struct file *file, void *priv,
> +		       struct v4l2_streamparm *parm)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	struct v4l2_subdev *sd = vin_to_source(vin);
> +
> +	return v4l2_g_parm_cap(&vin->vdev, sd, parm);
> +}
> +
> +static int rvin_s_parm(struct file *file, void *priv,
> +		       struct v4l2_streamparm *parm)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	struct v4l2_subdev *sd = vin_to_source(vin);
> +
> +	return v4l2_s_parm_cap(&vin->vdev, sd, parm);
> +}
> +
>  static int rvin_g_pixelaspect(struct file *file, void *priv,
>  			      int type, struct v4l2_fract *f)
>  {
> @@ -743,6 +761,9 @@ static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
>  	.vidioc_g_selection		= rvin_g_selection,
>  	.vidioc_s_selection		= rvin_s_selection,
>  
> +	.vidioc_g_parm			= rvin_g_parm,
> +	.vidioc_s_parm			= rvin_s_parm,
> +
>  	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
>  
>  	.vidioc_enum_input		= rvin_enum_input,
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
