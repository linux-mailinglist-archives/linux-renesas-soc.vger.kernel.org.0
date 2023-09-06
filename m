Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF9C67936ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Sep 2023 10:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234826AbjIFIMW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Sep 2023 04:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbjIFIMV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2023 04:12:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E976CFF
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Sep 2023 01:12:10 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c1c66876aso494078766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2023 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1693987928; x=1694592728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cshhEYUx1tzYq99eDAAtRSGn4JmQSooH5rXwh+sxOqk=;
        b=qZpS4SfbS10sDPqkBPLorNir9Uw+Dux42g71LH35HygpqnWB/ywlhowgfzVCsLqh2f
         T1aS5OlPH/a27JKFJFirrQmbac4bjGANjVsEQnoZQQ0akLDVlcp69jQ1juYD6lkFQ/+R
         HPOKUvQaeRQGvV8zP0svc/fB6N7rerlCh8PfyO1GkfSwAHLgthiabc0vdzFnxKThasAK
         LW4bxJbaD8rtDvuqPaY2ag7GvLH/+RjKXeyUcpswTr9Fg2LQScBT6xzeFEWMFb1c/ZIA
         cS9UaX3Uyg8YpXxy0cqSedyKlTBjGmGSZ41xo4k3Aky2YE6QquCaGmccAZSAowDaLwqm
         jNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987928; x=1694592728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cshhEYUx1tzYq99eDAAtRSGn4JmQSooH5rXwh+sxOqk=;
        b=U7TxuhT5XoJcgvasWzJwNhg6/g7JgMerJzzw45r2G36uJmQ/ij7XOypiHcZ7bzgu1h
         vKRVxg0zYPzsSm2us+lu/Opin6kLlFMxdfFbyaV90UWg9VX2PZYXc2oggqOplJMXN0ZE
         Cx5SnCfAza5PxMW9KVcFp5EfLudwgESknwOZkntUMKXugBqJTX4t1uWnb8ZUCX5OQy2U
         YvmB3OQYUncQYbvbNOfmRPJePxxialVGq8pfK9vMxrCdAneeFL9TqcNbkm09XdHRJNvz
         NXfJV7Cpv78bBy78do5dh+CFxU1kW2lajAOaXFEY1Hv7PED5gkNrItk8lU4H6v0bMkRG
         OEiw==
X-Gm-Message-State: AOJu0Yz3BDf/PfILjsyCTGuIMgqSFPUwPQ2Q3TfdTM7dN3Ed1bd4han2
        TjRnt8lUkwZefkq6QVcFQM3/1vWVOTWvPMuDoIcnow==
X-Google-Smtp-Source: AGHT+IGffSfZndMkcS6em++cOsuyJolnPR/6PQrft/9B88g3p6g1HJbe58u8REqsYPDLEX9J/MA7PQ==
X-Received: by 2002:a17:906:538a:b0:9a5:c919:55ca with SMTP id g10-20020a170906538a00b009a5c91955camr1831371ejo.65.1693987928235;
        Wed, 06 Sep 2023 01:12:08 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id um16-20020a170906cf9000b00992d70f8078sm8645060ejb.106.2023.09.06.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:12:07 -0700 (PDT)
Message-ID: <71ed3e90-2c94-2692-7b13-9788acfb9af6@tuxon.dev>
Date:   Wed, 6 Sep 2023 11:12:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] pinctrl: renesas: pinctrl-rzg2l: Add validation of GPIO
 pin in rzg2l_gpio_request()
Content-Language: en-US
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230905125603.74528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230905125603.74528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Prabhakar,

On 9/5/23 15:56, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Validate the GPIO pin request in rzg2l_gpio_request() callback using
> rzg2l_validate_gpio_pin() function. This stops any accidental usage
> of GPIO pins which are not supported by the SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 37cdfe4b04f9..4ad08a4b786a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -795,12 +795,18 @@ static const struct pinconf_ops rzg2l_pinctrl_confops = {
>  static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> +	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[offset];
> +	u64 *pin_data = pin->drv_data;

Maybe move this down a bit to keep the reverse christmas tree order that
the driver is using as pattern.

Other than this:
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

>  	u32 port = RZG2L_PIN_ID_TO_PORT(offset);
>  	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
>  	unsigned long flags;
>  	u8 reg8;
>  	int ret;
>  
> +	ret = rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit);
> +	if (ret)
> +		return ret;
> +
>  	ret = pinctrl_gpio_request(chip->base + offset);
>  	if (ret)
>  		return ret;
