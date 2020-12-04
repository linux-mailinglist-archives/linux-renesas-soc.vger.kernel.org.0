Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC462CF5F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 22:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgLDVFO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 16:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgLDVFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 16:05:14 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A76BC061A51
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Dec 2020 13:04:33 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id r24so9528286lfm.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Dec 2020 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EG188Z7LOYTwSIr/8rPYLAXDKPrRs9ipgT0A8y3Xk6A=;
        b=epSvJZsolxipasQZDqHYINTMkz1GrdqVD+a8Bf+orlLbzV42nCUeQcgvPlTUKE3N/j
         dNZ9yzQ1QUeac+8L24L2j20TebCjSCOWSb4eiUUyKu2fPbCxHv1Uwr5G68s2CjY19Wh2
         gnViPUoTI5WDa0ZW9CBk4bM/SN5uU3Yhh1DldTIxYFe7NNAUL/4/FvHKRefE8Vm2Sz38
         Ed+haYVyrLoGr3KdUuaDL/96cws+TBZ85e76guMasDzc2+uS/HvlLgIGrSyqm0lepHaH
         L93jRpSr59sAIWtM1xF/S7YdSIY1evP7+q9HgQkW5E7LPxUZp3SIlIz4AZ1HNLIE6yYP
         246Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EG188Z7LOYTwSIr/8rPYLAXDKPrRs9ipgT0A8y3Xk6A=;
        b=mt0HPyaTdqn/pwD4dkkBkda521E1wMo3BKjQs0TTGn5hIEv609Ww3H87n1b0Gy9wb3
         F8ku3ELgLTiDOEel2uKf55OTkA/rcp9N6wkXM5rjcFZNzikZmSX/ZXMf2i2b52yBBz8g
         6Cz3GvYVL1tDAuXMoyb+z+xg9c2Ag0doDJCi85v613+1SOo4Q5ndDNvUYzotBEKY8jsk
         v51qA32ikpecNmAJIk4IGzmEYvITnZQDJ7pAR/kvU9RtBW+20euh3KRy0N0VWqXGOOjQ
         Mu/ri6XOaeCFOWfjw0nfQhc62Lz8oHzuBnfO3F5EI82gDaBbE+pYoG7TLAnnuZKKSHw8
         YoMg==
X-Gm-Message-State: AOAM530S8Wk6Jh9VjRR0mmXUGubM7owUNAtvu7EHaQtLc7OEL+mWrhCR
        jI2eoqe5kVP/JyBJ4etiCbUVxQ==
X-Google-Smtp-Source: ABdhPJybtasCzWy856l/7IrLqSJl/CHroYjPgnhkNovhcyVAvsXbVS+Y3f9i5LlvqUYEMuGyNrrOOA==
X-Received: by 2002:ac2:4c21:: with SMTP id u1mr3832158lfq.269.1607115871763;
        Fri, 04 Dec 2020 13:04:31 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u21sm2095811ljk.62.2020.12.04.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 13:04:30 -0800 (PST)
Date:   Fri, 4 Dec 2020 22:04:29 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: rcar-vin: fix return, use ret instead of
 zero
Message-ID: <20201204210429.GB2018713@oden.dyn.berto.se>
References: <20201204173833.1146570-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201204173833.1146570-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Colin,

Thanks for catching this!

On 2020-12-04 17:38:33 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the return error code is in ret is being assigned but not
> used. It and should be returned by the return statement and currently
> just 0 is being returned. Fix this.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: b9ad52aafe38 ("media: rcar-vin: Rework parallel firmware parsing")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 98bff765b02e..e48d666f2c63 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -654,7 +654,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  out:
>  	fwnode_handle_put(fwnode);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rvin_parallel_init(struct rvin_dev *vin)
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
