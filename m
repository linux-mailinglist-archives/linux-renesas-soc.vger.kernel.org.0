Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19114C142F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Feb 2022 14:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240920AbiBWNaV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Feb 2022 08:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240914AbiBWNaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 08:30:20 -0500
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E4DAB462
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 05:29:53 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id 60so1433024uae.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 05:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4g4LymjyvwNVX8e21gXsjD7FfTulhB9WIqrmStB+xZs=;
        b=KjFK7XxIejAJ8cJ1RpB2cN0nUipOSX4Y5vxI3bbh1M4F86JWsVzVF5J6/xz1S5ZDCA
         YuG2eaXJmSrF7vbyK72U9lyAUC4REjbXz34NIiG/UQwNGUtpibBnk9KGkBZFKi+2kHXL
         x5ANTsA0agFfcf8TtBzCQR0SDlSg+c/B/RLZH59FwspA0+CTTQbQFeh66n1GfMd7X7kY
         xazS3O8yAApqFMS2SuZP/IjqScJ9baB84sFMipoyJyrLo2o1IF84ozIblU9jRiv5c35V
         TtHMLBik8TEl+Cxg0hC5fNnfLlGOo9bcMOfRXNpvqgeeit1XsTvsR/X/nmHKiRESVXYL
         xUNQ==
X-Gm-Message-State: AOAM531DdHGnf2oiDiWqiresV5TPkNk2gFen3JimzEOs2bPl57yRbSie
        +mtjPzGj84TZhUMkVsXnCxhinyAQH/ADUw==
X-Google-Smtp-Source: ABdhPJzE+puRJKY0tmK5VLkPLa5Sx5KsonIPXytAs2WwuLSdOqav49t0YimvKmjxtxA61Qq0XEXd5g==
X-Received: by 2002:a9f:3721:0:b0:33c:8830:dcf5 with SMTP id z30-20020a9f3721000000b0033c8830dcf5mr12221061uad.99.1645622992317;
        Wed, 23 Feb 2022 05:29:52 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id n77sm9956110vkn.29.2022.02.23.05.29.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 05:29:52 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id l10so12243002vki.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Feb 2022 05:29:51 -0800 (PST)
X-Received: by 2002:a1f:6087:0:b0:328:e94a:54b3 with SMTP id
 u129-20020a1f6087000000b00328e94a54b3mr12379645vkb.20.1645622991806; Wed, 23
 Feb 2022 05:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20220218150558.1748594-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220218150558.1748594-1-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Feb 2022 14:29:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCA47CU=oxRBDjpx1zf5HBxRNt-fk6+dOz1XGq9cYk0A@mail.gmail.com>
Message-ID: <CAMuHMdVCA47CU=oxRBDjpx1zf5HBxRNt-fk6+dOz1XGq9cYk0A@mail.gmail.com>
Subject: Re: [PATCH] [LOCAL] arm64: renesas: defconfig: Add DRM_TI_SN65DSI86
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Feb 18, 2022 at 4:06 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Add the TI SN65DSI86 to the renesas defconfig to support the V3U
> platform which uses it.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -256,6 +256,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
>  CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
>  CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
>  CONFIG_DRM_DW_HDMI_CEC=y
> +CONFIG_DRM_TI_SN65DSI86=y

This should be moved up, cfr. "make savedefconfig"?

>  CONFIG_FB=y
>  CONFIG_FB_MODE_HELPERS=y
>  CONFIG_BACKLIGHT_CLASS_DEVICE=y

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch, with the added
line moved to its final resting place.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
