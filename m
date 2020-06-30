Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E32A20FC5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 21:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgF3TAG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 15:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgF3TAG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 15:00:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10B3C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 12:00:05 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n23so23897769ljh.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8AkG+ozoxKky42qVOcqYFaJyVLeAXk8Kq6YDSBbE30k=;
        b=CiSrZvcEEueCUwVkwH2cN85Fmgac2GyHYyd0vApfOoaO1mIWx19lLR1VPhzpfZDsyi
         JqeCQlyYTP4IMELpngByqW7jdgYXecM4vzN7jeegOrljou84dZhdzY0gwG/YPvBjiQnR
         U9l5uaxiDWtMtpWs1YJLHxH14VO6DihvuRI0P7hbe7inZw6bqkpaIuBSRHjDdL9sqfN+
         BA2TXwzF/LiNweZTmxHiqPtPXGBRWfFUz202ng4+/vh+wnGbeXe28GINQibsi0gZqIL4
         iZWia+nQ+GjwN/ymFbQITJqee6K3suR6pXhoMdQ9XgOtpPIFIzwRgSoSbiSRd/WTOaB0
         pULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8AkG+ozoxKky42qVOcqYFaJyVLeAXk8Kq6YDSBbE30k=;
        b=dbFM9sXVEQ9ZSi2WEA/Nf4MlzFpy3MXh2UrJBTYMtZgGgn3UhyqZREzgTd+d3HgOwo
         3oV/YPsMWDofqqgNgQwyMoy4jXmqFcpvPAE5G62Qne24hschtLSB54jwmPPJoOqxdj95
         3GIABwG+4LLyeuxio5/JUOu/P28zc4Fiw+ahcRFWSZM+SI4Kxwrno7uxb2IfDYgSGeQr
         XvpoqLwsk6cpTX/VWkCRBv5q0N3nH930kbQ32mYzw+kBhrZ9u+IwROTH2MGR+WcUOXw0
         hYt66tMEiQOWjZoh9wIMGvH1oqKT1lgi6r3KgCE+v+rTVD80gHimHsohfv8p1xuXGuUK
         k3fA==
X-Gm-Message-State: AOAM531nJAJbPO3mV54bP1wwx8t87uywRJitohCk5xXHbzGfrAe1++OC
        TrL3yhzhLzxtfOP5O7P8oTCpKg==
X-Google-Smtp-Source: ABdhPJycYs1FeTE0dGaO0FGSr/8UOOSTNotK13+UnbUcOf0moCWdLSHZW0BPeOxy4ea5g20kQots5Q==
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr1687565lja.331.1593543604285;
        Tue, 30 Jun 2020 12:00:04 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y24sm991922ljy.91.2020.06.30.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 12:00:03 -0700 (PDT)
Date:   Tue, 30 Jun 2020 21:00:03 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable additional support for
 Renesas platforms
Message-ID: <20200630190003.GB2259976@oden.dyn.berto.se>
References: <20200630171237.11077-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200630171237.11077-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert.

Thanks for your work.

On 2020-06-30 19:12:37 +0200, Geert Uytterhoeven wrote:
> Increase build and test coverage by enabling support for more hardware
> present on Renesas SoCs and boards:
>   - Dialog DA9063 PMIC "ONKEY", as used on the Stout and Silk boards,
>   - Renesas RZ/A watchdog timer, as used on RZ/A1H and RZ/A2M boards,
>   - Renesas RZ/A1H Capture Engine Unit, as used on the GR-Peach
>     audiocamera shield expansion board,
>   - Analog Devices ADV7612 HDMI receiver (incl. CEC), as used on the
>     Koelsch and Lager boards,

Nice.

>   - Renesas RZ/A1H Realtime Clock, as used on the Genmai and RSK+RZA1
>     boards.
> 
> All of the above are modular (CEC support is an optional feature of the
> modular ADV7604 driver).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.9.
> 
>  arch/arm/configs/multi_v7_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 95543914d3c7f01c..f6dbbdc4be9c66ff 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -314,6 +314,7 @@ CONFIG_INPUT_MAX77693_HAPTIC=m
>  CONFIG_INPUT_MAX8997_HAPTIC=m
>  CONFIG_INPUT_CPCAP_PWRBUTTON=m
>  CONFIG_INPUT_AXP20X_PEK=m
> +CONFIG_INPUT_DA9063_ONKEY=m
>  CONFIG_INPUT_ADXL34X=m
>  CONFIG_INPUT_STPMIC1_ONKEY=y
>  CONFIG_SERIO_AMBAKMI=y
> @@ -520,6 +521,7 @@ CONFIG_TEGRA_WATCHDOG=m
>  CONFIG_MESON_WATCHDOG=y
>  CONFIG_DIGICOLOR_WATCHDOG=y
>  CONFIG_RENESAS_WDT=m
> +CONFIG_RENESAS_RZAWDT=m
>  CONFIG_STPMIC1_WATCHDOG=y
>  CONFIG_BCM47XX_WDT=y
>  CONFIG_BCM2835_WDT=y
> @@ -618,6 +620,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
>  CONFIG_VIDEO_MMP_CAMERA=m
>  CONFIG_VIDEO_ASPEED=m
>  CONFIG_VIDEO_STM32_DCMI=m
> +CONFIG_VIDEO_RENESAS_CEU=m
>  CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS=m
>  CONFIG_VIDEO_S5P_FIMC=m
>  CONFIG_VIDEO_S5P_MIPI_CSIS=m
> @@ -640,6 +643,8 @@ CONFIG_VIDEO_VIVID=m
>  CONFIG_CEC_PLATFORM_DRIVERS=y
>  CONFIG_CEC_SAMSUNG_S5P=m
>  CONFIG_VIDEO_ADV7180=m
> +CONFIG_VIDEO_ADV7604=m
> +CONFIG_VIDEO_ADV7604_CEC=y
>  CONFIG_VIDEO_ML86V7667=m
>  CONFIG_IMX_IPUV3_CORE=m
>  CONFIG_DRM=y
> @@ -901,6 +906,7 @@ CONFIG_RTC_DRV_EFI=m
>  CONFIG_RTC_DRV_DIGICOLOR=m
>  CONFIG_RTC_DRV_S3C=m
>  CONFIG_RTC_DRV_SA1100=m
> +CONFIG_RTC_DRV_SH=m
>  CONFIG_RTC_DRV_PL031=y
>  CONFIG_RTC_DRV_AT91RM9200=m
>  CONFIG_RTC_DRV_AT91SAM9=m
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
