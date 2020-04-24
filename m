Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4261B76EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2020 15:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgDXN0X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Apr 2020 09:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgDXN0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Apr 2020 09:26:22 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F708C09B046
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2020 06:26:22 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j14so7672059lfg.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2020 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nTW1Q1Dpbwy0yIzSEYe1O+e2suF3BS8yUOviCeo6/YE=;
        b=ESC+EaeyNfc9OzeMFPKQ5n4B49vrknA+qwHQ2nqvGnKrwtN90+XxDwOgT5lhOa62h1
         rEWnFlimKYd91z+bQDbtQTz39i0TDFn8WozBNX+NMKQzNdf3NS7o8053HGE+smOD9TPG
         Qu1YAaJZfHEM1igGw6uJVLDvmkxdjcbpqerDHjww9GZfRDZOC3THyB6TrMiyE8IP1sAc
         SAEIC7dWVN4uykRvxXU3j1+hJg33bs/P6d3s+DurmDZkGIQ6wfaJvm0SFFHUOCaoEYF1
         mYOxsMRSswWcbcm+zDh4fJq/dTF+kRm9iE0632GvRbidVN6SI6KvXPM0YxjMOj+aUscp
         2gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nTW1Q1Dpbwy0yIzSEYe1O+e2suF3BS8yUOviCeo6/YE=;
        b=EG27rqop/TYyfECoy8uOMvCs0itsypBZu0MjN1laUPYv7etV6VyFdBoplmSdt3OGJc
         qDMMgiT09gJ4pklT/XQQ2XmiSydaYCwUefIrUDcrh1C14v9hhNtv1Qj39jSw/OPbQAK2
         TVP7z54HPyqBCgXjlSsbOk76jyQjvSjcD0Rsk4Uwk+HKJC/Vqww2sgDQcn3Dijar9j5R
         8IQBFMIDBnu61iE13mHLd9g3lr4zzMnqwUtZYZ+yoCN7n8mk90IDy5DP8j2rsUmf8kMH
         ZbfX/sbS419aZbTHwS+8sHrcFRDFEOqwx62nb7r8VtVP+hvjFjqD6Babrdju7AlDb06e
         2H1w==
X-Gm-Message-State: AGi0PubarUPhSyXydVbCYT85ehk2mwqnXEO5JrschzScwcBNGyC7Qpzu
        sDLj8AzQQ5NEpOa8AW/bbEb/PRCn92s=
X-Google-Smtp-Source: APiQypK1vpqz+JpmsccYKH5/Fe1jfA+lt+ETmJzITMZAoLi8YwYmfvHAhvXvevIDUPxXZk6RqHoPSA==
X-Received: by 2002:ac2:5f92:: with SMTP id r18mr6511115lfe.154.1587734780983;
        Fri, 24 Apr 2020 06:26:20 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a28sm4396895lfr.4.2020.04.24.06.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:26:20 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:26:19 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH] media: rcar-csi2: Fix comment of VCDT/VCDT2 register
Message-ID: <20200424132619.GA4040416@oden.dyn.berto.se>
References: <20200424103945.2836-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200424103945.2836-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram and Matsuoka-san,

Thanks for your patch.

On 2020-04-24 12:39:45 +0200, Wolfram Sang wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to latest H/W manual v1.50, the description of channel
> number in the VCDT/VCDT2 register is decremented by one.
> Therefore, this patch fixes it about comment.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index faa9fb23a2e9..151e6a90c5fb 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -52,8 +52,8 @@ struct rcar_csi2;
>  
>  /*
>   * Channel Data Type Select
> - * VCDT[0-15]:  Channel 1 VCDT[16-31]:  Channel 2
> - * VCDT2[0-15]: Channel 3 VCDT2[16-31]: Channel 4
> + * VCDT[0-15]:  Channel 0 VCDT[16-31]:  Channel 1
> + * VCDT2[0-15]: Channel 2 VCDT2[16-31]: Channel 3
>   */
>  #define VCDT_REG			0x10
>  #define VCDT2_REG			0x14
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
