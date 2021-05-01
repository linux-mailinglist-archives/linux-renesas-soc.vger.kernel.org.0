Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C868370621
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 May 2021 09:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEAHK7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 May 2021 03:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhEAHK7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 May 2021 03:10:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2763C06174A
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 May 2021 00:10:09 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b23so474115lfv.8
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 May 2021 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mgS/jedG9c60ewkc9VFKhKsRQTsVeF9ApdL3c2JgQbE=;
        b=x1Y/XJyK63PLlR7UCR9wcI14WPV8qBGwk0c9rKbJSWJqavxb6l+r0jMFtXY6Z92TpC
         YovGBcn6l6gZeyC/IWkDUr4YajMp4BSpUxfi9cUAdGQtEs1w0nNiB/Ihp4j20zgjouwV
         Z6TXrdNQYqT/Zv/rJLoamt3nXVY15gA8xcorSJkkScJWQ5HN9lEpGwWusT7bF0KtIpCX
         eIUEJZPJOMTZvLTv/KViyYnc1SBaguTP71C+oohllEnC1OwvhDZuVC649YPW6gkmLyvR
         VvE+Viaxcep4O/LLOTrHy/B2ehsGd4baeAJBDU3FYJwKGtb/H3S2P8DSZjKwpak+da4y
         FKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mgS/jedG9c60ewkc9VFKhKsRQTsVeF9ApdL3c2JgQbE=;
        b=pfMQTSLMRF7mZRg34U20269AL+DMU558AbcwguZfvCSULN4kGvJpQw8t5NpZ74LM6G
         RUFhKmslVwShs0Q1mY+5l/qgaK3HL4nwmSdS1+e52Fx/EPgKkgEX5bDNT/nmgwYA7SXj
         /kMJPCVkKpcfkMlLGnhtAO+OQ/yre2ESkyUe8IYAg1JBgfHtzbAgTm4hITJx9rcmChYI
         HvrplOROWlySu6LQFCRkW3NxisqoYqcLpDHmXCljnct0ako11XqoKW+4TOH/fzLZkUbt
         fERNwYHgOrmBJecSnA49PDIgHtkH6YzzbIfYxzejcdBnEQkGNWfqTdB4oMjM2n2zcTLY
         HdnA==
X-Gm-Message-State: AOAM533FO5Gfq157w9PHkBYjBBGKquwtuvBriysXwwBEChjfuacHWQtT
        gqwwIcAkX8P3pWzDeC4DOU3zyw1Ht8i2yQ==
X-Google-Smtp-Source: ABdhPJy5pMdtvkD3sEOMsH65lDHtOuPJBcP5G1anWH4n6A0oJzOpcnM400K+zoK6AvBe8N8P1XG0xQ==
X-Received: by 2002:a19:818e:: with SMTP id c136mr2464789lfd.440.1619853008198;
        Sat, 01 May 2021 00:10:08 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id d26sm279415lfa.118.2021.05.01.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:10:07 -0700 (PDT)
Date:   Sat, 1 May 2021 09:10:06 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] ARM: dts: koelsch: Rename sw2 to keyboard
Message-ID: <YIz+zsKtbfNZqmr4@oden.dyn.berto.se>
References: <cover.1619785905.git.geert+renesas@glider.be>
 <3d718cf69e21b1ceea0c29c0e841b9bdda44533d.1619785905.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d718cf69e21b1ceea0c29c0e841b9bdda44533d.1619785905.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-04-30 15:10:51 +0200, Geert Uytterhoeven wrote:
> Rename "sw2_pins" and "sw2" to "keyboard_pins" resp. "keyboard", to
> comply with generic name recommendations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  arch/arm/boot/dts/r8a7791-koelsch.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 61e881bbbf6ee5aa..2a8b6fd9095cceba 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -81,7 +81,7 @@ lbsc {
>  	keyboard {
>  		compatible = "gpio-keys";
>  
> -		pinctrl-0 = <&sw2_pins>;
> +		pinctrl-0 = <&keyboard_pins>;
>  		pinctrl-names = "default";
>  
>  		key-1 {
> @@ -622,7 +622,7 @@ sound_clk_pins: sound_clk {
>  		function = "audio_clk";
>  	};
>  
> -	sw2_pins: sw2 {
> +	keyboard_pins: keyboard {
>  		pins = "GP_5_0", "GP_5_1", "GP_5_2", "GP_5_3";
>  		bias-pull-up;
>  	};
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
