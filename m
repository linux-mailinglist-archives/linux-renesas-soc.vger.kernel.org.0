Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCEE7A599F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Sep 2023 07:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbjISF5C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 01:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjISF5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 01:57:01 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C285102
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 22:56:55 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so4161378a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695103014; x=1695707814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5zhHi7QmMom+9ftqoYhZzINI56OUYiaj8dVmVyf2c=;
        b=N2MGvZ0wlVDqdq5fPZ6gLJkG00j9sXn/as5TWvshpL6aderBsyKiC6rwRTdUd1KDaP
         Ouf45GULPBdRL/0s/oiHB3trwIdFtgEx36cDAg0FQ+P6aq9/BYn1JjksQixwpaRz3dnZ
         ReOhRaf8BnjTdfU7jUUiFeH457pdJoEiGTJUw7KJW0z7rYJozUwZlCUy6GPP3Xizo/tn
         uU0pANmHM2oGCybjo9z7aH87yZ5qtjiQ4eJpgI5yyvwaqrJdSTcPST6iJt+gOOH/Wr0V
         FsnKW3CW1M01Hs4h3zShxrG6OXgbkr3MoMnPDEotg9ZY18LPmlIp0JWx0YTwLOkwaRVF
         KCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695103014; x=1695707814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ik5zhHi7QmMom+9ftqoYhZzINI56OUYiaj8dVmVyf2c=;
        b=lmBNUJWAKUe0TsZR189QuQ2qsbZSbU2mrz1tOUaXajFMf0c1aB2ZtcZBijOt7NaWLa
         eUvy1aQ0sZupVOpVkQUIEOP6EDWNvIC8sNbHPqJDl1yz6f+ZoJedhrQr4pu9Kx6cugWK
         YwPhHNowsxVGq5Zb2Z7eDAjfXyr31Qp2YpqbG0ItSEOMxm3E+NW7TZQOjzlqQjjw80hq
         GmV7LfbB80VNUMAA9GpXCw3OZO/qoJzcShe+08sW18DSYmUIWUdJY3ZL5WRSja4Drjsh
         OqcJx3qbL3EF/uVAIlhdDQxjXHD6Gq5gBEckkWlwOJ8UrbYh72CGheo1/jfhpmkty+3V
         xjZQ==
X-Gm-Message-State: AOJu0Ywm3J0o8M1F3vuapWBS/+l3cDLkYHJ5s5NYoSpBC9y8tsoYAkq/
        UOl5NdckGi5yog3C67HISuUyt/h0eGbD5FgrPfg=
X-Google-Smtp-Source: AGHT+IFZG5ig/cSKp48vqlvY+2xW5jMFFee+MK6jA6s6Lje2FTrArxaTNIIo5d+8wpQGKqHBVqSVAg==
X-Received: by 2002:a17:906:112:b0:9a9:f042:deb9 with SMTP id 18-20020a170906011200b009a9f042deb9mr2711982eje.19.1695103013717;
        Mon, 18 Sep 2023 22:56:53 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id gv23-20020a170906f11700b0098ec690e6d7sm7317180ejb.73.2023.09.18.22.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 22:56:53 -0700 (PDT)
Message-ID: <d86de952-39ec-adc8-7687-1f7ed3e6047c@tuxon.dev>
Date:   Tue, 19 Sep 2023 08:56:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] irqchip: renesas-rzg2l: Fix logic to clear TINT
 interrupt source
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.au@gmail.com>, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20230918122411.237635-1-biju.das.jz@bp.renesas.com>
 <20230918122411.237635-2-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230918122411.237635-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 18.09.2023 15:24, Biju Das wrote:
> The logic to clear the TINT interrupt source in rzg2l_irqc_irq_disable()
> is wrong as the mask is correct only for LSB on the TSSR register.
> This issue is found when testing with two TINT interrupt sources. So fix
> the logic for all TINTs by using the macro TSSEL_SHIFT() to multiply
> tssr_offset with 8.
> 
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
> index 4bbfa2b0a4df..2cee5477be6b 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -118,7 +118,7 @@ static void rzg2l_irqc_irq_disable(struct irq_data *d)
>  
>  		raw_spin_lock(&priv->lock);
>  		reg = readl_relaxed(priv->base + TSSR(tssr_index));
> -		reg &= ~(TSSEL_MASK << tssr_offset);
> +		reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
>  		writel_relaxed(reg, priv->base + TSSR(tssr_index));
>  		raw_spin_unlock(&priv->lock);
>  	}
