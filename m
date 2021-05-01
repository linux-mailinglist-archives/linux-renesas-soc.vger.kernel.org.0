Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D6B370637
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 May 2021 09:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhEAHcg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 May 2021 03:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhEAHcg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 May 2021 03:32:36 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830A8C06138B
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 May 2021 00:31:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id n138so544053lfa.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 May 2021 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SjghcktCn/v0mSKiq7YSh9knZWHQrVAkLN5cOTCeyMQ=;
        b=IeT+vFa5Km/I9Dm+uKwwYeuk6Gu1u7/UFjSjue6I0M5reMA++scWX79UU7vKJMIB7J
         Y1wN2LZy+kHnPmN1oYN6qLE3YXneT4dybBh8y2W2VR/cf4Jnj5Kp9ZkCQdrp6I5A4DOw
         wTe9v9Dq+kiLUyZu0TNt7WnbRiG2fafVnmv/S6p5xcrnMa68TuSsqO4LMOKp1aWrwdpk
         7Z3E1oZySdZbh+/0md411n2Tl7eMfaEoDeAbAXI2IAvRLvhC+Q73bxMDqiVaBqX6y/Ox
         E88+wt1T5WAsE0lDaC0LSsfXWAFjlhYDmoZJuHvOH7i6F+XSFrNYL1YowpEOwZZThp6y
         fMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SjghcktCn/v0mSKiq7YSh9knZWHQrVAkLN5cOTCeyMQ=;
        b=iuoy8Q1YfS7d+MCYR95Op2xj/YjykbDknVh08CG238yAPb5vURj4txy/DBqaOv5S6m
         h7aFVJF3OOu7+qYTQTd6NPMCt49nEmtNbQRzXBVe2CSmV7hVO2R5pqyJ//2JxFc+OlrY
         G0jMvHo645n/vbq40PHooU0ZtB3e9Mu+I6SjThAlt/Gyi/3VqplHkCWZQSMwAiBWQlmp
         T0cG+FdK3KmiLjRbPA14O79A0BqfYLfzJShxLtX+7xaGfpd4lL7DvVNgAswt2D7HLp6m
         d8ClQx8bJNhQqFu1iLGfkkjfoSS7QyX7fktVkQTI4OtWQik3ze+1FpAAam9Ba7HrD01J
         ya8A==
X-Gm-Message-State: AOAM53208G+0b+FSHXd1MsDRTcDIXZRuXqXqKCnadIEzHrR1WhamPxnN
        oMeLbpRy434nPOnknVj5k4ZGpGF4BGcssg==
X-Google-Smtp-Source: ABdhPJyspwuzvGFXq7HvoRGXd0zvm2vdQZPjeF47OZ9RA1oXUMJMf3aPNaUWykhMoIwk0FOOu+qq6Q==
X-Received: by 2002:a19:f01a:: with SMTP id p26mr6132908lfc.139.1619854303667;
        Sat, 01 May 2021 00:31:43 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id c4sm474145ljd.115.2021.05.01.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:31:43 -0700 (PDT)
Date:   Sat, 1 May 2021 09:31:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 03/12] pinctrl: renesas: r8a77990: Drop bogus PUEN_
 prefixes in comments
Message-ID: <YI0D3kQds0B5VxuU@oden.dyn.berto.se>
References: <cover.1619785375.git.geert+renesas@glider.be>
 <9ea85ae8973f6d9b3d10f02f0d9b4ab6a086ec63.1619785375.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ea85ae8973f6d9b3d10f02f0d9b4ab6a086ec63.1619785375.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 14:31:02 +0200, Geert Uytterhoeven wrote:
> The "PUEN_" prefixes are part of the bit names of the PUEN registers,
> while the comments should refer to the actual pin names.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pinctrl/renesas/pfc-r8a77990.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pfc-r8a77990.c b/drivers/pinctrl/renesas/pfc-r8a77990.c
> index eeebbab4dd811f9c..f44c7da3ec167de7 100644
> --- a/drivers/pinctrl/renesas/pfc-r8a77990.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a77990.c
> @@ -5197,8 +5197,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
>  		[27] = RCAR_GP_PIN(1,  0),	/* A0 */
>  		[28] = SH_PFC_PIN_NONE,
>  		[29] = SH_PFC_PIN_NONE,
> -		[30] = RCAR_GP_PIN(2, 25),	/* PUEN_EX_WAIT0 */
> -		[31] = RCAR_GP_PIN(2, 24),	/* PUEN_RD/WR# */
> +		[30] = RCAR_GP_PIN(2, 25),	/* EX_WAIT0 */
> +		[31] = RCAR_GP_PIN(2, 24),	/* RD/WR# */
>  	} },
>  	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
>  		 [0] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
> @@ -5333,8 +5333,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
>  		[27] = SH_PFC_PIN_NONE,
>  		[28] = SH_PFC_PIN_NONE,
>  		[29] = SH_PFC_PIN_NONE,
> -		[30] = RCAR_GP_PIN(6,  9),	/* PUEN_USB30_OVC */
> -		[31] = RCAR_GP_PIN(6, 17),	/* PUEN_USB30_PWEN */
> +		[30] = RCAR_GP_PIN(6,  9),	/* USB30_OVC */
> +		[31] = RCAR_GP_PIN(6, 17),	/* USB30_PWEN */
>  	} },
>  	{ /* sentinel */ },
>  };
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
