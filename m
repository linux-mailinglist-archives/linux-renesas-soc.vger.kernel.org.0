Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD8D1F4A52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 02:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFJANu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 20:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgFJANu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 20:13:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA71C05BD1E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2020 17:13:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so268542ljn.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2020 17:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NDHwwickqvbmvykQpJak9D2P5R1Ys3pXUiBHiVbFMfA=;
        b=fM0bMWL+CQYZE0k6LEyPa79lNM9BpdipRe02eaGZ6Kr0iz+WaWknV/SDHGAw/9/oW0
         C/5vWMkkXoajRKb/MukRUfjQyjwDTcqaG+5UnxXHmdPyvioIBUgLGMydtGPIyyAVAK3q
         VSvByYfEZ8W1qAVb50q+EjlksVFgnLksA9hzp3Odr5g04Pcfi2Tmyhi1jGRZHYiKI6Pe
         EUqf00mM92DxEv9noOPXTEgYlsGUFEz28Llerc6QvOegkVcyN0FymdvdwS6jVFsLz1BV
         LRjzEVEgXSZ1eff34oCW6pH/mdrFeQnnhMjf0cllXIwHyxZVtQ1df5oGAqAfrodT+Lk+
         vGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NDHwwickqvbmvykQpJak9D2P5R1Ys3pXUiBHiVbFMfA=;
        b=QpWJ0vXgg9ddN2Cq1vAWlgv6AWSKI5CF2uw4bJ9B7x9E7GueHilx9kHEJHZnxixKO3
         v8eXA03sDk4ljSQiAA8Cs7pTM54eyQ7UJpSYi1mTBOZ6wruvN1JzZ3rBFcpM60j0NTI8
         ZYB01jaJH9XTFPCkDotGyjs3ECpS9P3doXygsYaT0dDdzYBBY1S+PbXDkm8FaG4F5gco
         SxK7c6lFDy4tYAxcjG/KCLDWQ32V38kBx5Rj2NjW1BhNOPbOE6+pwbwvpAuOV2ORE1QL
         JI9UBkJ+9i9qZLzwezaqWoKHui5OK6TCdpKOZS3DgxBwU2f/TzQQBi9blnpm23oPuCv5
         lojA==
X-Gm-Message-State: AOAM531Ax+qabH9EQ/mNEBcOqz8H4E11RSEqXbVHxZZbbvJlpspG8o7n
        TecbzssPQE8YiVg4+V5IpgHfLQ==
X-Google-Smtp-Source: ABdhPJx2VPY8fQQyyApbOzr9fZqAxSQX1Lw8acKgMop5p6fXZr8+vG5DvCNYGqvwFwKvjxttaNuLNg==
X-Received: by 2002:a05:651c:54e:: with SMTP id q14mr316129ljp.279.1591748027767;
        Tue, 09 Jun 2020 17:13:47 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id f3sm2702412ljc.8.2020.06.09.17.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 17:13:47 -0700 (PDT)
Date:   Wed, 10 Jun 2020 02:13:45 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     rui.zhang@intel.com, daniel.lezcano@linaro.org,
        amit.kucheria@verdurent.com, van.do.xw@renesas.com,
        dien.pham.ry@renesas.com, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3_thermal: Fix undefined temperature
 if negative
Message-ID: <20200610001345.GB394579@oden.dyn.berto.se>
References: <1591703110-14869-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1591703110-14869-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san and Pham-san,

Thanks for your work.

On 2020-06-09 20:45:10 +0900, Yoshihiro Shimoda wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
> 
> As description for DIV_ROUND_CLOSEST in file include/linux/kernel.h.
>   "Result is undefined for negative divisors if the dividend variable
>    type is unsigned and for negative dividends if the divisor variable
>    type is unsigned."
> 
> In current code, the FIXPT_DIV uses DIV_ROUND_CLOSEST but has not
> checked sign of divisor before using. It makes undefined temperature
> value in case the value is negative.
> 
> This patch fixes to satisfy DIV_ROUND_CLOSEST description
> and fix bug too. Note that the name "reg" is not good because it should
> be the same type as rcar_gen3_thermal_read(). So, rename it with "ctemp".
> 
> Signed-off-by: Van Do <van.do.xw@renesas.com>
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> [shimoda: minor fixes, add Fixes tag]
> Fixes: 564e73d283af ("thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Changes from v1:
>  - Use int instead of long.
>  - Rename "reg" with "ctemp".
>  https://patchwork.kernel.org/patch/11593051/
> 
>  drivers/thermal/rcar_gen3_thermal.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 58fe7c1..49ea330 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -167,16 +167,16 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>  {
>  	struct rcar_gen3_thermal_tsc *tsc = devdata;
>  	int mcelsius, val;
> -	u32 reg;
> +	int ctemp;
>  
>  	/* Read register and convert to mili Celsius */
> -	reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
> +	ctemp = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
>  
> -	if (reg <= thcode[tsc->id][1])
> -		val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1,
> +	if (ctemp <= thcode[tsc->id][1])
> +		val = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b1,
>  				tsc->coef.a1);
>  	else
> -		val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b2,
> +		val = FIXPT_DIV(FIXPT_INT(ctemp) - tsc->coef.b2,
>  				tsc->coef.a2);
>  	mcelsius = FIXPT_TO_MCELSIUS(val);
>  
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
