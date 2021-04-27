Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B47C36CC31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 22:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbhD0UNX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Apr 2021 16:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbhD0UNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Apr 2021 16:13:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB25C061760
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Apr 2021 13:12:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j4so56113625lfp.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Apr 2021 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SY5mTC8vXKhJGwgY8a17iTcKGGwfNUSrB5/cauq2jqY=;
        b=u6vd4Kkii6lXYSZh+HCehIixhQiYhIkSnOuFRoeujJoZ5raj/As+RHLppluq1kGmz8
         lKcm9vMQkSsjShinIYU9iPVlqifGhVtt01I6okKR3Y2sKtns/QksnL5gKKPpZpT14U+U
         8EXZ4ZLlPFMfV2REQPaJUmgwLdRNCMiv9Q9a6CCZvQlpNceVdNoevbeHi2Vpdg5k9Lks
         byH2Bb8ICj0O4/zd0BRJYQ0qS949JuH2KsPmJKSr2swGtTn7fOloaZsuB3+x+o15Xs0b
         D2PJ2a286hdYnkvVc8o/X4pYFY0thtUhrq3ov8KjIn7ntG+LKhFuKNxCrsk91d9Evt7J
         P7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SY5mTC8vXKhJGwgY8a17iTcKGGwfNUSrB5/cauq2jqY=;
        b=BB4fipjRPUCN6YVzMltHD5SHobYC/0bbQqUGIpCZCjFsECt8APTVBGmIoh6pQoRO1M
         nlkEVKnVCatwPmdS1HHGNaXTXd0I2GbFkv+L9PRbCVbix7sn2l8HJBKgGAKNz3W0MLeK
         zuqp4FWDtbEl3pR2V2n37eHuCiwS/NjnUgjQwJmAtSDKgDG4JJr9p1Kpxsta4fB/rmhy
         OzWI95ZS41sCfOA6M80rOXEfF7t19PXucBVMbiezIOFplPMOmiWwcNgKEgoQS5j5GYyQ
         iEuNlvt6FQziirWTrC3zi80QydURpVLItx/Pgbji426X1p1BpxjXkDElrSNL+qyi5uU7
         GBdw==
X-Gm-Message-State: AOAM531z0TpjXMTMJFHPiBmzCxiOVClkx0fQIn09ROt64paQA8ca1Oci
        93MicmnDLyE9zIh7ks4Jdn5T1g==
X-Google-Smtp-Source: ABdhPJxRptHCvRujl3ipBD3jYJx1B1R+o4jvk8O9es83Qg19Ucak4kadsDMxs3ViZtpF+JNi3e6MFA==
X-Received: by 2002:ac2:57c8:: with SMTP id k8mr4461677lfo.659.1619554354158;
        Tue, 27 Apr 2021 13:12:34 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id w14sm192868lfp.147.2021.04.27.13.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 13:12:31 -0700 (PDT)
Date:   Tue, 27 Apr 2021 22:12:30 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 78/79] media: rcar-vin: use pm_runtime_resume_and_get()
Message-ID: <YIhwLhJSNyKPbzu9@oden.dyn.berto.se>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mauro,

On 2021-04-27 12:27:08 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 6 ++++++
>  drivers/media/platform/rcar-vin/rcar-dma.c  | 6 ++----
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++----
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e06cd512aba2..ce8e84f9e3d9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -408,6 +408,12 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
>  
>  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
>  {
> +	/*
> +	 * The code at rcsi2_enter_standby() assumes
> +	 * inconditionally that PM runtime usage count was
> +	 * incremented. So, it shouldn't use pm_runtime_resume_and_get()
> +	 * here.
> +	 */

I think this comment is a bit much. I won't object if you really want to 
keep it but my preference would be to drop it.

>  	pm_runtime_get_sync(priv->dev);
>  	reset_control_deassert(priv->rstc);
>  }
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f30dafbdf61c..f5f722ab1d4e 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1458,11 +1458,9 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  	u32 vnmc;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(vin->dev);
> +	ret = pm_runtime_resume_and_get(vin->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	/* Make register writes take effect immediately. */
>  	vnmc = rvin_read(vin, VNMC_REG);
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 457a65bf6b66..b1e9f86caa5c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -870,11 +870,9 @@ static int rvin_open(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(vin->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(vin->dev);
> +	ret = pm_runtime_resume_and_get(vin->dev);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = mutex_lock_interruptible(&vin->lock);
>  	if (ret)
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas S�derlund
