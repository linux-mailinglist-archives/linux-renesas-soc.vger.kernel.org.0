Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DD525D132
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 08:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgIDGVx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 02:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgIDGVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 02:21:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E00C061245
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2020 23:21:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so6574142ljo.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2020 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CYxJW0pF1s7HMB5ayGaO6wQ5F8XNxtCQnzPUxbzOs7o=;
        b=dqGZcytE4tSAACRbfMYlx5MEJZ0VMf/o6rVBFR+iGIuhR9fVjhMBCNG6MbfyKqAW19
         EVu8tyJSYjmKzpJQEdykpq300FjJke1WMHfrljHUsswJiYxFpMq3elGpr+j8ELluuEIy
         8WAVR/gpPWQ2H99u6R+VubSQ6w4KfcPqIS+EZbY6m3CKjgBRclU4U2wx5teNklQJJe0a
         PGj0oXc5QgwCCVoUHTCMHXsVJFWu4qnDcoZBQkcfQHQkcdkK3lJ9j8oU5Eo8I1+pR0Xl
         2bbj1etsUF20nPY+zgvCMJvf4sFbSokNq59b2gsew7RP3ZchMeEQvHPr3M5TByb6415U
         0uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CYxJW0pF1s7HMB5ayGaO6wQ5F8XNxtCQnzPUxbzOs7o=;
        b=WC0bNqecQvm8ZwXp8NH7vHDQCS0YaKirDs+Z8tHtSe9dyrv+u/3AqR/IMSYSVCKMMc
         remiDtiL7KF+ZbNmW0FGi0+O9X6jSu2e/IjkDa6fGMYlYDEjzFa1NTT+6NhOYBPv8H2e
         d7rsNOFqUCQbcgWfGnmw8vuq8xny5L9kx57or3pBx33wPxF9UKoi311QZeJl1z0fkWnn
         8QgSZr/xP4WUHcTCqM3ZsPJeA/Dx+g8GRQ0Rz7TDpnQVoZF9+2VjSsSeuT0mfMT+b20G
         CIr5LJ0lSk9OTpoCG/wmR8y49WKC7OKTxjpExn4RsDLZ9KnU22A2dg+R9ipLqnvW2mUb
         D1nw==
X-Gm-Message-State: AOAM531UwnD8FcSwmghRx+y8L1zGSgfWvpr75uMoIURRRbOxqKLiFSxj
        C/G74BeVzzyKWoyS03f8fWrlW+DBVMPF6Q==
X-Google-Smtp-Source: ABdhPJx46NQTga8EfudNzzsfS5KRYyflh7DXL9qXZUsGJZUFW1v9dluV9C7NWsEuGBXSjlwlG6Zwag==
X-Received: by 2002:a2e:98cf:: with SMTP id s15mr3308391ljj.446.1599200508584;
        Thu, 03 Sep 2020 23:21:48 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j12sm1099242lfj.5.2020.09.03.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 23:21:47 -0700 (PDT)
Date:   Fri, 4 Sep 2020 08:21:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: in slave mode, clear NACK earlier
Message-ID: <20200904062147.GG1498632@oden.dyn.berto.se>
References: <20200817121930.4474-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200817121930.4474-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-08-17 14:19:30 +0200, Wolfram Sang wrote:
> Currently, a NACK in slave mode is set/cleared when SCL is held low by
> the IP core right before the bit is about to be pushed out. This is too
> late for clearing and then a NACK from the previous byte is still used
> for the current one. Now, let's clear the NACK right after we detected
> the STOP condition following the NACK.
> 
> Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 284dc3edb9a1..0f73f0681a6e 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -594,6 +594,7 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
>  	/* master sent stop */
>  	if (ssr_filtered & SSR) {
>  		i2c_slave_event(priv->slave, I2C_SLAVE_STOP, &value);
> +		rcar_i2c_write(priv, ICSCR, SIE | SDBS); /* clear our NACK */
>  		rcar_i2c_write(priv, ICSIER, SAR);
>  		rcar_i2c_write(priv, ICSSR, ~SSR & 0xff);
>  	}
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
