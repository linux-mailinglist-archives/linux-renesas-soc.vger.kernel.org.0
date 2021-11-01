Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D811441F2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Nov 2021 18:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhKAR0B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Nov 2021 13:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhKAR0A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 13:26:00 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C878BC061764
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Nov 2021 10:23:25 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 205so30489058ljf.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Nov 2021 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bHJGGoP8mbvB3GrqfwRxkOoAovBhFANkss5LYhzvbNU=;
        b=HCZhDZ+9LwITp+X9HDb0c4VjoZzv83IMCJf0v+FaYCoSwnM9jAhJf/FIg56dWX7zkH
         25dl/A7oX7HgZ8NyU7OaAXoboRDb4CqoCZaLMLZ3bRQzSl40/owsntlrLuryhhpAv5fI
         ZX+xTtuhRITvmtYxqE4MzRXqWgwpUeobm0XiLZswGsnbeSCV6KWAYY0ewuK6mGd275R5
         c7CX1zqZHBlAunl4+O10ZK9a9H1EmqJ8SdwckKKhkEpoqVroFdOnn+aoCnUT5Gcuo9n2
         29zsbCSuX3Yjhz9E3YXO8NS/aA0KPdl6TREyRy3VHB7POpnvOqWXf5Eok17wNpqAsjRX
         WElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bHJGGoP8mbvB3GrqfwRxkOoAovBhFANkss5LYhzvbNU=;
        b=DW9Jqy/oyyG0gvJXU71fAUEyxltqF1kIK/v6iltGLF7H/6h+yOI3zdx7er8Mbbf+4t
         xMTJ+O3VWVYHZDpogupfo7KO97qsC0JhZCsWcQtyRdpJDdALNu09/dO38HJYAZx3UK1o
         G+dSehO2NMdetJpj2LgVVSylb8NqNp3jEjsmAauitp9HdQ1WZCYMN8J/atTKZKsnI5FF
         BpjMAuo/mzQVBzB0TadTxB0cHd8MOQQbiQ8/y9/me8RL8olh5/iReuWwBzpdIFA52fIe
         DPK0cCK271VD1Y4/Dy01aTIgOA6pV3YV5LJ5EQeu5aVxFAI8NPAhowglEl8FG2UO4Wp1
         lQIg==
X-Gm-Message-State: AOAM533jOe0YGxc10GrmdINpMpoYUhJXQbolvZGnpgDGCCPpvyXS9XXW
        DRIwBTam72KUF4vD5aUK6ncP9P1IFIHMIg==
X-Google-Smtp-Source: ABdhPJzI/+RVzLRf4MABHR3BiMDUcfqCQI98RWah9FQPG62BOpzl1F0pefrKqvLV+IxuD4yySZ6oeQ==
X-Received: by 2002:a2e:9a88:: with SMTP id p8mr33374863lji.505.1635787403846;
        Mon, 01 Nov 2021 10:23:23 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id r3sm1226366ljc.20.2021.11.01.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:23:23 -0700 (PDT)
Date:   Mon, 1 Nov 2021 18:23:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Depend on VIDEO_V4L2
Message-ID: <YYAiihIejUuF+uu0@oden.dyn.berto.se>
References: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thanks for your work.

On 2021-11-01 17:19:49 +0000, Kieran Bingham wrote:
> The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
> While this dependency has likely always been met by configurations
> including it, the device does use V4L2 core, and should depend upon it.
> 
> Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> failures when compile testing.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> A bit of an RFC almost, as I haven't seen any failure on this, however
> this does stand out as different to other drivers, and the recent
> "max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
> drivers could find themselves being compile tested in a manner which
> would other wise break.
> ---
>  drivers/media/i2c/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index d6a5d4ca439a..9eac5e96c6aa 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -468,7 +468,7 @@ config VIDEO_VPX3220
>  
>  config VIDEO_MAX9286
>  	tristate "Maxim MAX9286 GMSL deserializer support"
> -	depends on I2C && I2C_MUX
> +	depends on VIDEO_V4L2 && I2C && I2C_MUX

I think the new 'depends on' shall be on a separate line. Reading this 
is confusing as now the V4L2 is mixed with I2C while GPIO is still on a 
separate line.

>  	depends on OF_GPIO
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
