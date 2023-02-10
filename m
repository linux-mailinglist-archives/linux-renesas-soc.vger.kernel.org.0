Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7676929D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 23:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbjBJWHs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 17:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBJWHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 17:07:47 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CF863591
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 14:07:45 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ml19so19485056ejb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 14:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z34212KwTv7op+ncoBtpwntDPA4mpV2PjB7V2LFUeU4=;
        b=M1lVuk2yKTgGoRNYLDshHEmjmbWYZJNs8N3Z8qyO1seBMx8pknIZrcmtKTvU2s7Hyj
         lQ2YoPddvTVka41UehSnZcLAX1nDFOaI9ozDAaugk3oZZW/78ybbi9+a3yWc9NfQBP5J
         QB91ndWztdQqsEsZ/cbrVvkNuAjCcdPUyVMmNjbMkF0B4A7XTEtnwEwZCePCATRE6k17
         J49eoJ5S1L8AyDKVFQmUZ5LF+32JcgSsd/DB8xqV7KJ31Kpm7zf0OQTTLusqgU/7Xh7b
         szt1iyEf27H6VaSrCbt28fdi22OhxvYd+eEseXNWKcXokxWrrnzwU2nk5yLkn3e1ZRRW
         A4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z34212KwTv7op+ncoBtpwntDPA4mpV2PjB7V2LFUeU4=;
        b=EqFWsAo3+d7rOskr+0pkU9tJdzGlLPPFINS5ShoKa8oGiI2C7miwVum9xkbPWXtaH5
         7cYmPmyWFAPkMje8XUPmwJkRHal+MbHiM1ItBiDH/viAFbgupbmz4QbN+4Lg6HCVcPEG
         d/h3rfGj0dvHulVdUCfwNwUA4ZH4rIwxg/qAbNSzyxqUrd46k96e3JGeSXXTQlX3Vq74
         AEN0Cr0duI98qjWbK9kVOgVc21/09WilDqifK/ZChMtXmvYRwZmG/q7k1VnyF9NOtueT
         YDLJrAYMcIip+KWMzAOtHVNUqBhdKW2TLcCYNiN1h1eCQ47cdDlqkYFJyHmKfCyGnx9k
         bLgw==
X-Gm-Message-State: AO0yUKVAJuRoketDuHJcAErENLiVBSWi/O7GmDO08tA9bmdz9/IfxZMk
        lT1tjwkUHsLjQyqCTinKsQQZTZsbSeO0UIdg
X-Google-Smtp-Source: AK7set+VO04SImzGLTn3NjavsSgac549dkQ3V3lhSpOOYqb7fwC16PHEGnMIk0ds6QYZxIRs36FXSw==
X-Received: by 2002:a17:907:2d94:b0:8aa:6edf:2a9 with SMTP id gt20-20020a1709072d9400b008aa6edf02a9mr17478401ejc.69.1676066864467;
        Fri, 10 Feb 2023 14:07:44 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id kl12-20020a170907994c00b00880d9530761sm2931240ejc.209.2023.02.10.14.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:07:43 -0800 (PST)
Date:   Fri, 10 Feb 2023 23:07:43 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: draak: Add overlay for HDMI
 input
Message-ID: <Y+bAL06bDx83PHv2@oden.dyn.berto.se>
References: <20230210211551.18106-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210211551.18106-1-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2023-02-10 23:15:51 +0200, Laurent Pinchart wrote:
> The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> both connected to the same VIN input. DIP switches are used to select
> one of the two devices, with the CVBS decoder being the default. Add an
> overlay that selects the HDMI decoder.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> 
> Niklas, would this be an acceptable way to handle the DIP switches on
> the Draak board ?

I think this is a perfect way to handle DIP switch settings. I have a 
similar patch for Eagle I wish to upstream one of these days.

For this patch, however correct it is, I have a comment. As part of the 
ongoing rebasing of BSP patches I'm preparing to submit a patch which 
makes the HDMI the default input for Draak. The BSP team have requested 
this as they wish to align all Gen3 boards to have HDMI as the default 
input.

Hence, this patch is awesome, but should be reversed to overlay RCA 
entablement :-)

> 
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../boot/dts/renesas/draak-hdmi-input.dtso    | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 0699b51c1247..de4170af611e 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -88,4 +88,5 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
>  
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
> +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-hdmi-input.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> new file mode 100644
> index 000000000000..e0d671f0cab3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-hdmi-input.dtso
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023 Ideas on Board Oy
> + *
> + * Device tree overlay for the Draak board, to enable HDMI input. This requires
> + * setting DIP switches SW49, SW50, SW51 and SW52 to ON, and SW53 and SW54 to
> + * OFF.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&adv7612_out {
> +	remote-endpoint = <&vin4_in>;
> +};
> +
> +&i2c0 {
> +	composite-in@20 {
> +		ports {
> +			port@3 {
> +				/delete-node/ endpoint;
> +			};
> +		};
> +	};
> +};
> +
> +&vin4_in {
> +	remote-endpoint = <&adv7612_out>;
> +};
> +
> +&vin4_pins_cvbs {
> +	groups = "vin4_data24", "vin4_sync", "vin4_clk";
> +};
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund
