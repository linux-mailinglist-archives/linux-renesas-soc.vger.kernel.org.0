Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8C4416FA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 11:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245381AbhIXJzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 05:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245359AbhIXJzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 05:55:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4ECC061757
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 02:54:19 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y28so37765446lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 02:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wcxpbY+epMaoT0lwiHeUpX8tLc7nUpHe7LhF3U6sUnU=;
        b=I/Cd4NSdwJtmjhA8DEbeaz0quiEmF4Cjd9gKskAR/UcjQAah159V9NnEiIM7JS+VbE
         CLNsyCEsMoKRy30Zu8+ew7L73lUrGN+NDHkpv5yizE86uGsIPFvIY7C2s/eOAAfD+9cZ
         75otQf3GjxFVBB1lXIsMIwzW6pyt/hL3eiWsBLnUSvfU5P72K60TpvZORdkx/ogkpKo/
         FFi4oaOr3PNw7jMrXZDyypAaFplKI7f1GjmAqWP3SxvC8lURLTbNVG0IlelaVw4RW+IL
         cnlR68nvcfPUvN9l1asq26zICbUnGe71a8PFXRI2w/psk/VCIKlxtnk0bgWf9XX/ieN5
         Esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wcxpbY+epMaoT0lwiHeUpX8tLc7nUpHe7LhF3U6sUnU=;
        b=LyOp7GYlLZ1ohP4/71hJtkiejeRmU9NzDueBtN3DALYk/oT6eTbwvcEsi1o8zfozBa
         dNNn/DRtNQP2eOWWXqNcii4MczBjWJWqQXjqHE2BBcPiGaSEuka5tZOnqw4EY7HV9m4x
         Gip+K3adlz8iKSsidhLtJ6f6lN+JR57z+7ZvXXBltSwEusATaDQ2efJ+B1v6ZCLsJ87h
         CqGJaHJZbrMCuXQ0s/lmxPoJye6ARU0EPRcV+Tb2zWV51lx8DcAprL342idObu6jrj37
         Wapg+H5Re3VksCcXDVeSxGSFdYLb5BwgTp5apVHo2p1dNZeoQvlL2jKZrKk8U4XZAI08
         8U5w==
X-Gm-Message-State: AOAM530/lUSG/DcuH8AdiZxugI7TbVRjIhfGqcnTGGzvIQNHpMfvc6H8
        noUBuLjHh1dt0jdnkdBMFsqqfA==
X-Google-Smtp-Source: ABdhPJyJlNxVycHvyLvUe2rVi3VFfOPgeBJexve8zpPNl82obU8S49/FJDSfT8b75rb0i6pkXYKmrQ==
X-Received: by 2002:a05:6512:33c2:: with SMTP id d2mr8410461lfg.18.1632477257760;
        Fri, 24 Sep 2021 02:54:17 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id r12sm871285ljp.15.2021.09.24.02.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 02:54:17 -0700 (PDT)
Date:   Fri, 24 Sep 2021 11:54:16 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] media: rcar-vin: add G/S_PARM ioctls
Message-ID: <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
References: <20210924084115.2340-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924084115.2340-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Nikita and Vladimir,

Thanks for your patch.

On 2021-09-24 11:41:15 +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> This adds g/s_parm ioctls for parallel interface.

I would like to ask your use-case for this. I'm trying to make up the 
courage to move Gen2 inline with Gen3, that is move Gen2 to use the 
media graph interface to allow it more complex use-cases, including 
controlling parameters on the subdevice level.

So I'm curious if this solve a particular problem for you or if it's 
done "just" for completeness. If it solves a real problem then I think 
we should move a head with a v2 (with the small comment below fixed) if 
not I would like to try and reduce the non media graph usage of the API 
as much as possible.

> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index bdeff51bf768..de9f8dd55a30 100644
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
> +	return v4l2_g_parm_cap(video_devdata(file), sd, parm);

Please use &vin->vdev instead of video_devdata(file). 

> +}
> +
> +static int rvin_s_parm(struct file *file, void *priv,
> +		       struct v4l2_streamparm *parm)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	struct v4l2_subdev *sd = vin_to_source(vin);
> +
> +	return v4l2_s_parm_cap(video_devdata(file), sd, parm);

Please use &vin->vdev instead of video_devdata(file). 

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
