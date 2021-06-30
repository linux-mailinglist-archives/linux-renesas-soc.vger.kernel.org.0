Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33F13B8A26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 23:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhF3VpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 17:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhF3VpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 17:45:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EBEC061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jun 2021 14:42:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n14so7797330lfu.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jun 2021 14:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xtt33shXupG/IbC3afPmaamQZ/r2p5e1xGWNBbCJIVY=;
        b=H3N3MP6h678rBeWiNjKi2hUHDkY+KBRrlM6xclBPG0RJeXEHC1pwFS4ffzXcmKSO4S
         vwiLUaqAaxSOdGl16rKATSzQs7i79YrqV390tV3h72TTGw/hEfiBm41P5Rx9kuDkuiGX
         ZzQSIMNuMUE330QY1ssP1r1OvZG49m8qoZCOg19s7RjcHilgZ92rUdLSlWmrT/USv6+r
         62UUkhtIlpQOp09eur1DLpbPe3+M4aRS7KZl9BnSSd7QBc/mBHMtUyEbS0mtg9WAOsFh
         LIHxPeDOPhMv8/CtBEE8y6XPrSTT/8cMK7XqcKuoXV1ME/Di9uciWf8Zm3IKNjSVBo5g
         Oxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xtt33shXupG/IbC3afPmaamQZ/r2p5e1xGWNBbCJIVY=;
        b=Ew774mj/LBdSPKaN4Csrk5Kmef2Yj0equP8H8EdDIqG3b54bnYRpU2wKjhQVHwu7IK
         6peM5ABCOAn7Zxq7/WKWtj4VYU91ya4mie6n8z3jGu9aZjkqi4ZYfO/9yj3xX+aHuvEU
         P7KZE9ybDnbNIThJ1kYTP2nL4p7Z4x5uyT6r6J//Lom/iXAl6RghAQ8I69Cg1E5PsqKQ
         CtRKu9JkhaUI2+iQYtcbVdCyM94jqfDXD7rtNU1q4LB4FjhILZZntnB/X45GjlrUuGLI
         4/4+PqogC4rJyXNH1OwQ3FFKW30fT8XuzlKMn9iTYhjpjAG+bQj8KjvEdInRjm3oAtLW
         y55A==
X-Gm-Message-State: AOAM533nLuvJPs+eG3NOjKXd9wy+ZXMK8MzAl9/4eRd8Bpr5ndeHese5
        8cfQfKz1YDIeCSmTI1Qn5VdS+11opI60tjc8
X-Google-Smtp-Source: ABdhPJyoX61PIsxcFzJliuJHvJuevMVy6JL6+5TWwUiOlJRRUvgudiIY0o4mKYBNEw6YG9TrEo18xA==
X-Received: by 2002:a19:e012:: with SMTP id x18mr5262061lfg.394.1625089370409;
        Wed, 30 Jun 2021 14:42:50 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id i10sm2026006lfv.135.2021.06.30.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 14:42:49 -0700 (PDT)
Date:   Wed, 30 Jun 2021 23:42:48 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: rcar: Avoid changing PUDn when
 disabling bias
Message-ID: <YNzlWOw5rWhxkG0Z@oden.dyn.berto.se>
References: <cover.1625064076.git.geert+renesas@glider.be>
 <071ec644de2555da593a4531ef5d3e4d79cf997d.1625064076.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <071ec644de2555da593a4531ef5d3e4d79cf997d.1625064076.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-06-30 16:50:42 +0200, Geert Uytterhoeven wrote:
> When disabling pin bias, there is no need to touch the LSI pin
> pull-up/down control register (PUDn), which selects between pull-up and
> pull-down.  Just disabling the pull-up/down function through the LSI pin
> pull-enable register (PUENn) us sufficient.

s/us/is/

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - New.
> ---
>  drivers/pinctrl/renesas/pinctrl.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
> index bb488af298623407..85cb78cfcfa6c37d 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -898,17 +898,17 @@ void rcar_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  
>  	if (reg->puen) {
>  		enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
> -		if (bias != PIN_CONFIG_BIAS_DISABLE)
> +		if (bias != PIN_CONFIG_BIAS_DISABLE) {
>  			enable |= BIT(bit);
>  
> -		if (reg->pud) {
> -			updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> -			if (bias == PIN_CONFIG_BIAS_PULL_UP)
> -				updown |= BIT(bit);
> +			if (reg->pud) {
> +				updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> +				if (bias == PIN_CONFIG_BIAS_PULL_UP)
> +					updown |= BIT(bit);
>  
> -			sh_pfc_write(pfc, reg->pud, updown);
> +				sh_pfc_write(pfc, reg->pud, updown);
> +			}
>  		}
> -
>  		sh_pfc_write(pfc, reg->puen, enable);
>  	} else {
>  		enable = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas S�derlund
