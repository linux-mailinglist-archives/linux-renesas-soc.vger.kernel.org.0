Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE536299D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 14:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbiKONQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 08:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiKONQc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 08:16:32 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A8628E36
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:16:30 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s8so7211094lfc.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl1BV7fBxn6Va3uDyQcOPanm5XadBqhJHUBBX9Sb6bI=;
        b=M+nPLf+nbaNgQJZE3GZoHbIVDgFHNZyWDibcs3t07MLtUGfM+jXjJ4HMxEXGmruaKO
         2rMbiJQKIt7T5dUt2xI7GQIs4T6EFphstUZVsobgWUz2wybUBqkKo7BhEiE8k0VGYmP9
         F92t0Z8Up2MvN5Lx6F4B4tZ3/H/qeK11Khpe5vrxAFRc2z+jjVmdB/f0snl28Phd5G3Z
         VhU2P0WgWkgC5B+NIS2hkr5ga7bb0r1QfvFF9P8c7bWl1W+KitlJNJSELPEElQtzJUHj
         5VIPwVqpArabsYNNFerQQ62tF72X3gcMAVY68mmBQjvkbIyJ0LCzOioZk0BrnsaHOlcJ
         rtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vl1BV7fBxn6Va3uDyQcOPanm5XadBqhJHUBBX9Sb6bI=;
        b=QpOkM2wLFus20913y4ubQ/BcPgqmdOMIq/LPtyiLIcyrjrOzKYC9Fb/ujyFaSnjIKY
         EQlGy9RFJZDclr0THd/BYZumTg4iSE730gh0grY2IMk6EqPlLtgqZhf01SckGZ22zH+5
         bszMnJrtsZZHnpVvqDwbS8WDkAW9qv0qqYgvzpPYbL9OZ2aVqPreWEmgHTTjH1APF2Et
         sFhb0Als+BbaXuW80WXwR5SxiFevXqEvzp1rLNilqTo6d4nNry4DxnJlLoKLFwfxfjVb
         pSR8xvj/si5oVZIYickFrfBI1VJ0+dK6GbJSGpMDtZnPmscTyQ14vxGyPJJwxanZkiOV
         84Rw==
X-Gm-Message-State: ANoB5pkJlc4bZFUqaZVn7MP+2+A1oOhs+Qs73/WqOq4mkTE775aEUdiB
        ZC6Wc/XoZO+/yYa9skj67L2VFg==
X-Google-Smtp-Source: AA0mqf4khaa5y9EhlBl8gS9PmoJr4OoakMGwbZAbkLgVi7zDvGOcJrtmg5qiaP7TkzP5lsOga3hyuw==
X-Received: by 2002:a05:6512:128e:b0:4b3:ccea:9b2e with SMTP id u14-20020a056512128e00b004b3ccea9b2emr6383119lfs.379.1668518188894;
        Tue, 15 Nov 2022 05:16:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi20-20020a05651c231400b0026dcf0cbb97sm2507562ljb.137.2022.11.15.05.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:16:28 -0800 (PST)
Message-ID: <51d42fc2-0492-9077-302d-5c3be4b45cd1@linaro.org>
Date:   Tue, 15 Nov 2022 14:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/7] ARM: dts: r9a06g032: Add the USBF controller node
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
 <20221114111513.1436165-7-herve.codina@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114111513.1436165-7-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/11/2022 12:15, Herve Codina wrote:
> Add the USBF controller available in the r9a06g032 SoC.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 563024c9a4ae..a4bb069457a3 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -117,6 +117,18 @@ dmamux: dma-router@a0 {
>  			};
>  		};
>  
> +		udc: usb@4001e000 {
> +			compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
> +			reg = <0x4001e000 0x2000>;
> +			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sysctrl R9A06G032_HCLK_USBF>,
> +				 <&sysctrl R9A06G032_HCLK_USBPM>;
> +			clock-names = "hclkf", "hclkpm";
> +			power-domains = <&sysctrl>;
> +			status = "disabled";

If you provided all resources (clocks, power domains etc), why disabling it?

Best regards,
Krzysztof

