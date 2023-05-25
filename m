Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 402AC7107B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 10:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240235AbjEYIhr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 04:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240063AbjEYIho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:37:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DBDE71
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:37:10 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so1754138f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685003787; x=1687595787;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n3dgMxXDod8W5xFRkfrc3GHYIe7IJtWHOb1qHkVrSyw=;
        b=rAJr00uhitvg08RQiF4/r2qsuN54ed2qIy+jhMamu7WC+7DYjaVW38dSSK1ISlVYuv
         6A/z3EOKu/EPeDsga1H+cbaD08hWHaMazOLKcPDRmpRLY0IaVV+qAT2UjceMthQJ8huZ
         aaPBjtPUkpL6vAmnm2CICrShG7kQRnwmzn4zJvRgzlWPsMMA/KXre+5BSSCagb4f7m3z
         P9wvqV3my11UDuiug3DQg+sxf9PNuirNezxB4co6FLAgAsPpeZqcA/Bv/iHQdB7/40bu
         9kz9SoUv/oRNLmJvuuwV/BWANlSSV35QI/rlc1A/y6fIU3ILm0sNkvBivC26ukuQvqdh
         oPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003787; x=1687595787;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3dgMxXDod8W5xFRkfrc3GHYIe7IJtWHOb1qHkVrSyw=;
        b=R0pBO/GAUM+DMsuEOiYTt2wqjcq8l4bd0XzEPkg7BRV0Nl7qVDqGKeGxN1bK6roUeK
         V327seFwmNSxxMDH/tnTcxMt87G9NzTbBm/vOhS2kGfg6iZR7ScY0u2KDuHAY6IKNZOB
         bT+C34Y5gnzAgzoqf9kifgRXhg/9/3iBnFMTqtgiwytBDVZXqg5t90yOIA8hQgrVLauh
         gJJ9iAW/R7WbRIKXhbLi8ch+A5OqhcUOdFhQFn3zcUh36x/RDJxPVtHjo0hcdnwExY26
         CfdijYOLBjIBwQU5AfQtjlvzZnTfmJfbpRhSSceAw7yTCvcxN5loSx1ENZDO/sEZXprj
         ErkA==
X-Gm-Message-State: AC+VfDzLavWTjSPrreDqe/BsCGSmtruFSQgsm+Vzl/wEdv+FAGvWVmpj
        gc0ItpY6LSHONNVqwnm83F5H4w==
X-Google-Smtp-Source: ACHHUZ5nkq7EAYlDZowugr1Hfy9OT67waP2J4z6G+ddNE5NGUnlczveGmFzKp2JfbMx57X46VnG+Cw==
X-Received: by 2002:a5d:4b03:0:b0:30a:8c0b:3209 with SMTP id v3-20020a5d4b03000000b0030a8c0b3209mr1682351wrq.9.1685003787201;
        Thu, 25 May 2023 01:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6? ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b003f6038faa19sm4812494wmj.19.2023.05.25.01.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 01:36:26 -0700 (PDT)
Message-ID: <5c5910e0-8a55-416f-e1fe-2a1b223558f5@linaro.org>
Date:   Thu, 25 May 2023 10:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1684931026.git.geert+renesas@glider.be>
 <244d9471e0ed248ff2dea8ded3a5384a1c51904b.1684931026.git.geert+renesas@glider.be>
Organization: Linaro Developer Services
In-Reply-To: <244d9471e0ed248ff2dea8ded3a5384a1c51904b.1684931026.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/05/2023 14:32, Geert Uytterhoeven wrote:
> Add support for the Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD panel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 33 ++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5778824dffd47a31..467117c0b2c9d463 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -778,6 +778,36 @@ static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
>   	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
>   };
>   
> +static const struct display_timing ampire_am_800480l1tmqw_t00h_timing = {
> +	.pixelclock = { 29930000, 33260000, 36590000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 1, 40, 168 },
> +	.hback_porch = { 88, 88, 88 },
> +	.hsync_len = { 1, 128, 128 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 1, 35, 37 },
> +	.vback_porch = { 8, 8, 8 },
> +	.vsync_len = { 1, 2, 2 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc ampire_am_800480l1tmqw_t00h = {
> +	.timings = &ampire_am_800480l1tmqw_t00h_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 111,
> +		.height = 67,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct panel_desc ampire_am800480r3tmqwa1h = {
>   	.modes = &ampire_am800480r3tmqwa1h_mode,
>   	.num_modes = 1,
> @@ -3993,6 +4023,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "ampire,am-480272h3tmqw-t01h",
>   		.data = &ampire_am_480272h3tmqw_t01h,
> +	}, {
> +		.compatible = "ampire,am-800480l1tmqw-t00h",
> +		.data = &ampire_am_800480l1tmqw_t00h,
>   	}, {
>   		.compatible = "ampire,am800480r3tmqwa1h",
>   		.data = &ampire_am800480r3tmqwa1h,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
