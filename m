Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7470EFC0C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2019 08:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfKNHbS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Nov 2019 02:31:18 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39576 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfKNHbS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Nov 2019 02:31:18 -0500
Received: by mail-lj1-f195.google.com with SMTP id p18so5510740ljc.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Nov 2019 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HDmK777Muy/RUNrWUo+/QpLFz6vy7W9CQ749DrBLJws=;
        b=P0BQZKyXxwoV2Lt1GZIignlM5iQRYq7/iHlcODI8j14SWfKEatXzGzjhYQ9SbrbXIg
         XPLmrJRPB7kb0pBC0qi7XRazE7iPYQo9qo6uFtpTTzYc2I3Xg119cSM/m8vqlIG3IEib
         EhMmwWdIHKEodc94ymwufb7CVH/y94YBINnP8KrykZ/f/XRw1WUAu6HldZJfPX0nd10M
         lRSuHAWvwVrIrb3YsCU3+FD6ScX3MhEq/OymbP8aYflggBfkTb8R5D4hMdTFVGn3tjdb
         Qgnamcjt+gSs62OLlFO0j3artU9ZI3IVcno9EusAQuH+JghYpLkFpcoUq3m8zcO1j76K
         ckRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HDmK777Muy/RUNrWUo+/QpLFz6vy7W9CQ749DrBLJws=;
        b=ofOXa2TPH6SX1AikIoGbMcO/oGExJB9PelaDU3cL1OpwNN4Pc3O8QK5agJB47ZMOCF
         YCQnJNyy1ZU6TvvnAgyS4G7N0RkFygZ5D1rG3fEmBAgxilJ0MD0JblQAgO+nf3zsJGqZ
         RUdLcRoU7c49gz+KLaHr+IozKeOe1g8EogRNUoD1Dn05ww3VxkL8S+n248ZLo6sl3U0f
         YWddB33XQKvSEGkRwgsdJgDLlKMhtIX1ubxRt0+aB+njutP5pPTojfekBLFoy/uxtNge
         woSd/IDz2Zbg51MG3lshBxEuxuU84Ee1ERixz1kxxwqFFVrZuwmOqysM98osz0b7/xHJ
         QoXg==
X-Gm-Message-State: APjAAAXx4MH4o/ziprqEQG2NFjPx5ueMMEPe3BApxE9ZNXYKhjANP5z2
        ZNOdqJp5XTGmnYuaFHPhnuZMJGO7W6Y=
X-Google-Smtp-Source: APXvYqwrYyRE8aFTbbFiwZCK/8jSeBdpVZb2X90fP2DbDFnss2O6+E2Tw9Dp+7MqISO7utRMGWJROA==
X-Received: by 2002:a2e:8518:: with SMTP id j24mr5048715lji.13.1573716676235;
        Wed, 13 Nov 2019 23:31:16 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z17sm1921882ljz.30.2019.11.13.23.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 23:31:15 -0800 (PST)
Date:   Thu, 14 Nov 2019 08:31:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: Remove superfluous call to clk_get_rate()
Message-ID: <20191114073115.GD26902@bigcity.dyn.berto.se>
References: <20191113101453.28157-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191113101453.28157-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-11-13 11:14:53 +0100, Geert Uytterhoeven wrote:
> Variable "rate" already contains the current clock rate, so use that
> rather than calling clk_get_rate() again.
> 
> Fixes: 8d0494037bb2af32 ("i2c: rcar: get clock rate only once and simplify calculation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 531c01100b560be3..879f0e61a4968a08 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -317,7 +317,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv, struct i2c_timin
>  
>  scgd_find:
>  	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
> -		scl, t->bus_freq_hz, clk_get_rate(priv->clk), round, cdf, scgd);
> +		scl, t->bus_freq_hz, rate, round, cdf, scgd);
>  
>  	/* keep icccr value */
>  	priv->icccr = scgd << cdf_width | cdf;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
