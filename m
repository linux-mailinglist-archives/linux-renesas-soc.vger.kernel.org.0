Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7356F2E71B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 23:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE2VKJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 17:10:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37694 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfE2VKJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 17:10:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so3254296lfh.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2019 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Mu5MGiwViAE+xq3hYJVecKhrhSmdgp+dy0KSK59tJJQ=;
        b=q7RBmWipjWlju0c41VvigqOXIk1DHR+H76XwOrJtqCU1G+2CXeXcUuG3K44zkwDp+2
         9LzH/KNMAYFMDhlBOwDGclMMxcSD7ElKD6PKZ4GoU4LF1uuXxuro7d5mFJi8jWcW/eZP
         UnG4YFQJhGvLfF/CX4aL1/G9bIhMHL152eqyHiYUnRhAHKHO18OwU9Vrokd42Unt0UtR
         LXR5ls+D2SdbpSSLA3wP4dwEXPeHujWC0q8qtoTijto1v/a2iLViNmUi0YGXvOc++HFc
         u9IyM/GyDngsdEB+UUcuNSv8l7KPgk6QtkkfapeRBvwxv9J7xnwsLbqRzr5Luq883BcB
         e2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Mu5MGiwViAE+xq3hYJVecKhrhSmdgp+dy0KSK59tJJQ=;
        b=rE4KnL8MuRSMhfyBHMg6fjUlbG4/6XGv1KUAp1Yf/XnEouag04asDZ70v0CDK1lR+d
         ymzAp/79/+jI6gO0uGNLiajcz5W2rmqEf5282hWizsqVtd43AegpCSGsHG3QoQaqPXo+
         VaPgyQAWpKpE2CignZ+kUHeRHfE2ObJ2SaMU9d2Q9mTNTlYbv6wJmyUdKsiFvIju6sYo
         DIhbzZma8KE3bgSMQumdOVePVyqTDLAhfI0HQYO5g5cP/dy6ukhRpMy+Y2ZZ6KZ98kHF
         rTLBweDypM9OvfH5tIYsRIP4mqeXkLoC4nhN7PC5CpswKBF+It7H7H+Znd6ryd/MMSmj
         LA5g==
X-Gm-Message-State: APjAAAUGMqFbVMtM9Q2o0fwgzg7vQbVJjshvtX1GgC+mX4uicmhpNE/4
        Y0L8O43IAUUtQU0Ovv9N/ugjrg==
X-Google-Smtp-Source: APXvYqwzIF80yYZ/jteMvGKNCS+XyzpSGUWpSJfGRPE95IKFnWMZOJ2nNtFQbjiCMq5QxWGOxhABdw==
X-Received: by 2002:ac2:43b7:: with SMTP id t23mr27804lfl.110.1559164207194;
        Wed, 29 May 2019 14:10:07 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id g22sm83602lje.43.2019.05.29.14.10.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 14:10:06 -0700 (PDT)
Date:   Wed, 29 May 2019 23:10:05 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529211005.GO1651@bigcity.dyn.berto.se>
References: <20190527123420.7057-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527123420.7057-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-05-27 14:34:20 +0200, Geert Uytterhoeven wrote:
> pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> memory.  Hence there is no need to print error messages on failure, as
> the memory allocation core already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.3.
> 
>  drivers/clk/renesas/renesas-cpg-mssr.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index d1054204f3a75022..082d0bf12ea7f219 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -509,16 +509,12 @@ int cpg_mssr_attach_dev(struct generic_pm_domain *unused, struct device *dev)
>  		return PTR_ERR(clk);
>  
>  	error = pm_clk_create(dev);
> -	if (error) {
> -		dev_err(dev, "pm_clk_create failed %d\n", error);
> +	if (error)
>  		goto fail_put;
> -	}
>  
>  	error = pm_clk_add_clk(dev, clk);
> -	if (error) {
> -		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
> +	if (error)
>  		goto fail_destroy;
> -	}
>  
>  	return 0;
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
