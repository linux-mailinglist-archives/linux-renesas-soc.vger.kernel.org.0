Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D67311C4B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Feb 2021 09:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhBFIxX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Feb 2021 03:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhBFIxT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Feb 2021 03:53:19 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841E5C06174A
        for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Feb 2021 00:52:39 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p21so13939206lfu.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 06 Feb 2021 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0cnSyR4XNAUGhazxKzpV0CfcJNheP6eqg1CN6Tljdvg=;
        b=s2Yb/dy2Kis0zI+JHW3HSSJ63lqSQzEvZ2muMkug0mGc+JB76FnnCYSLEEhLL2UJzy
         wDgEnU4kn9UpK56uDF5P4iuqy7qiQA0jtjdmo34IYzfiPrd8ESTtYaaHz/YKieafoDZa
         ak9HpnL09YpXF1PnbPgy/UVxjyFzqDjPWPyKVpXBTF3EpvEpQn/+lnrkWwHIrVA6QNoN
         jidZvMJ96ppecrdNMHpvAL54HNB64BMZnnSECIZjegW3AILx7egbV/3OfGaAU5JVZSU+
         cEqv56viv17Ru52udijuh+QhYTUYl9M9FfD2ZaFRkL+rxDiCfbqaZAER4jFyMaHQWZ36
         QDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0cnSyR4XNAUGhazxKzpV0CfcJNheP6eqg1CN6Tljdvg=;
        b=hHtkbctJLAmdZ5rOqO3zvRjrKBJqBPeZzhbuYERf7QLbsdqAxR2AJfKGRxTcm/yjyF
         ffkibZYBd/Ytmj3b3KHAaM+5eCage9fxwGFa6+UHfrNMVp0qMkvtCn5LGtVEjcP7uX6c
         Xt5w5DFBFvLnSbapm0T/aVPwSUboj3I8e6J7yNOfX1vFwGdSn/+zkQopqvH3L+sN/8Z5
         8Z3N1LbWPSNzUtVFc6LX5LjZn0SZoTA/8xJkEFGuGbO/ASEhQ0CJmetv7jdz8wdCIrzE
         YKVOXU293mUZGOjX5gPpss1Ik0kWUHeMAGLG53rnyV9hnLi3HNmJDbOBWIzWCrF5XRTA
         I3UA==
X-Gm-Message-State: AOAM531SDJma4ve0szGTweWXNach+a5q/1SWHGKAhvknlkIlePVIGFKr
        c4Xr3pRdOUaODd81Okmy2zZvdA==
X-Google-Smtp-Source: ABdhPJwLx9Z/0PrBxToqY86vnI+YTktNutrQG5nZ0iMT6fGqtGbNdwdzcJZp0/kSalsO0DATuhMqBw==
X-Received: by 2002:a19:791c:: with SMTP id u28mr5052510lfc.168.1612601558105;
        Sat, 06 Feb 2021 00:52:38 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id o27sm1257400lfb.126.2021.02.06.00.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 00:52:37 -0800 (PST)
Date:   Sat, 6 Feb 2021 09:52:36 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Remove unneeded platform
 includes
Message-ID: <YB5Y1FTjzfDdWr5m@oden.dyn.berto.se>
References: <20210205132113.1920047-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210205132113.1920047-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-02-05 14:21:13 +0100, Geert Uytterhoeven wrote:
> As of commit b587288001f05c0e ("ARM: shmobile: R-Mobile: Remove legacy
> PM Domain code"), the R-Mobile System Controller driver no longer
> handles the adding of platform devices to PM Domains, but delegates that
> to the PM Domain core code.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.13.
> 
>  drivers/soc/renesas/rmobile-sysc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
> index 9046b8c933cbe031..bf64d052f9245db5 100644
> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -14,8 +14,6 @@
>  #include <linux/delay.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_platform.h>
> -#include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_clock.h>
>  #include <linux/pm_domain.h>
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
