Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10F0443119
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 16:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbhKBPCn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 11:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234447AbhKBPCh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 11:02:37 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2BDC061203
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 08:00:02 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id k24so15996941ljg.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Nov 2021 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GL9y3QxOGALzOsukPP8rl92QF0DvSrOPcH1BSiTiCGM=;
        b=jovuFuSlZoKnJzt4a74kci9wdiYWHBk+RIjP8RjPFQR0rNyrT8DVBk7wfk0DGYc/zA
         VliTRYHtqbFFBEsCffeM1ZACt75I3o4ERsLTb/UlyJBZ7i20exAQiWEuWabeNVhzka6+
         BRVevyZhoUmkW7wxbrLLrOoUNxTmih7sEUj1+88WW+0BNbxMItZkIgBjxItBoUJaeTU9
         SS/CueEMxO3NrnLwxzaeIg2lCNSP1+w5J3G5HN+ClcZ7+ACBu4YNB0xSfad8LKIZANvs
         RIa69Rgy02ocdoVXSMP9Q+3I+vAf4HTGhZlavUrfPl5liBmOETpwoHwJt3vXEa7YEdMQ
         8lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GL9y3QxOGALzOsukPP8rl92QF0DvSrOPcH1BSiTiCGM=;
        b=DTkxhSzVAKWcnZIDdYahrMYjRHMUvJ6DndxXSjb11KgJXjcIqFYWR9IV80Q2hNAy45
         F/Qxmg8jWPJvGgAq9ZTavX9d+xiOeExG6DMC4lWEvnBxNN9vKMuho9zv4JewxyJBCxr/
         jk6FlCjNAUN3YrRMCQ8F60XyQlXbwCq61qvm3X/hYmNGzOQAvJwW5rG7uqDaQHcWk03u
         sP7Rw47+IrtjCpWKm1dO3cNHD9tlScWj26eA8vqSjtNdaymjxQ9mDRxgXdRS4CC1iBOU
         CVd73nGd6DuYEHzOnh4gsghD7yHJAOxCuxjnEPEPLlni8ei3HSGrqmuzxCzvHkeqx368
         ExXQ==
X-Gm-Message-State: AOAM531pnYyEegMwOlIY5uvPDvb+FoI0BQFObtb9hc3DOvAuuXU4zwnR
        xgDrK3A18n0gFIs4WeyhLqsfHCuM0Y1CjQ==
X-Google-Smtp-Source: ABdhPJx6r9H0NVbaSmeaYLRybp1iZt9Sv0vlRdUQDWAsowPW2u4/JtWPLS7fuflBJ4xp6jR/ASSFwQ==
X-Received: by 2002:a2e:9b11:: with SMTP id u17mr24312455lji.237.1635865200410;
        Tue, 02 Nov 2021 08:00:00 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id q17sm377420lfr.246.2021.11.02.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 08:00:00 -0700 (PDT)
Date:   Tue, 2 Nov 2021 15:59:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: max9286: Depend on VIDEO_V4L2
Message-ID: <YYFSb/rkrgbwUR3U@oden.dyn.berto.se>
References: <20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thanks for your work.

On 2021-11-02 11:02:43 +0000, Kieran Bingham wrote:
> The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
> While this dependency has likely always been met by configurations
> including it, the device does use V4L2 core, and should depend upon it.
> 
> Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> failures when compile testing.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
> v2:
>  - Split VIDEO_V4L2 to it's own line
> 
> A bit of an RFC almost, as I haven't seen any failure on this, however
> this does stand out as different to other drivers, and the recent
> "max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
> drivers could find themselves being compile tested in a manner which
> would other wise break.
> 
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index d6a5d4ca439a..e9cfedf561d3 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -469,6 +469,7 @@ config VIDEO_VPX3220
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
>  	depends on I2C && I2C_MUX
> +	depends on VIDEO_V4L2
>  	depends on OF_GPIO
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
