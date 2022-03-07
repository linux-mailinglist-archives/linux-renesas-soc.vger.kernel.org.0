Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A582E4D0BFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 00:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242197AbiCGXXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 18:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243654AbiCGXXN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 18:23:13 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DE349F0D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 15:22:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a8so35347070ejc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NtQPHi8MlejTb0WOYkUro+FgYs2jI22g5jze1Xz11Wc=;
        b=EDn3vpkM0MQwAwbvMPZgM+4OdqB7ZpPc9q1RFkFJr/ikmYNZUKI3PXVdTz9AODjcx4
         gzVtjQYGQmSseMru8nUKU6chiUchOkZOxR6fIMRcX9zdvOO2cZ9rD/Zmp3udjJpBSOCG
         uBO3oq/4FaIzk8ef+UNffI1feZv+ynCiuTZc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtQPHi8MlejTb0WOYkUro+FgYs2jI22g5jze1Xz11Wc=;
        b=26/UmOjuHOPubpIjzYm3rBD1nvVHuyXgUGIMTWQGuBBsuYlMK60mRhIN5gBqMQ4yOl
         VuAMIlAda672Xo9ghKWcdTDRraQKcrrI891kaMfBPdYBXTysOTMJO0YlxX1daJdimBQj
         dK4aLPDch4cEQI70MfKJFRHIzmT/XAeCqLrTsAa4n3pbZlL4Rv7zdkZkSox57clMKjb/
         gRAPhz2xeouOHx4OLtv/Glg5cI/McN4exu1OFYe9POTBgDTSecszkFs3cHFaa6V7fIbw
         jpM7Fcnz7sAsZ8ibNbDY4J7YGQrDe4AEUe39uWLGWr2fQD2Wq/yfZDAssZfenoRRcb9K
         piLQ==
X-Gm-Message-State: AOAM532rsjKZWuvYi/BNsc+COA4BpO6v39Mng6NAa7amXA86T+4rCKfP
        DprNq4yMdKm0Hf4e0h7q6B4Tdfz9DGxX/2CU
X-Google-Smtp-Source: ABdhPJzFeaG8RIW63FDEnGvfJVZkl+P8JHkFw6NRVX+BU5w2co7VAT/7lx0M6/6TXvi8sehNyRVVJw==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id y2-20020a17090668c200b006b49f26c099mr11014140ejr.41.1646695334904;
        Mon, 07 Mar 2022 15:22:14 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b006da745f7233sm5158121ejx.5.2022.03.07.15.22.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 15:22:13 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id r65so10154257wma.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:22:13 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr1048093wmh.73.1646695332499; Mon, 07 Mar
 2022 15:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Mar 2022 15:22:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
Message-ID: <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is detected as a DisplayPort
> connector, and disable eDP features in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reworked to set bridge type based on the next bridge/connector.
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> --
> Changes since v1/RFC:
>  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
>    devm_drm_of_get_bridge"
>  - eDP/DP mode determined from the next bridge connector type.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 29f5f7123ed9..461f963faa0b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -60,6 +60,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)
>  #define  VSTREAM_ENABLE                                BIT(3)
>  #define  LN_POLRS_OFFSET                       4
>  #define  LN_POLRS_MASK                         0xf0
> @@ -91,6 +92,8 @@
>  #define SN_DATARATE_CONFIG_REG                 0x94
>  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
>  #define  DP_DATARATE(x)                                ((x) << 5)
> +#define SN_TRAINING_SETTING_REG                        0x95
> +#define  SCRAMBLE_DISABLE                      BIT(4)
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> @@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
>                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
>
> +       /* For DisplayPort, use the standard DP scrambler seed. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> +                                  ASSR_CONTROL, 0);

I thought it was agreed that this hunk wasn't doing anything and
should be removed? I did some research previously [1] and the manual
said that this bit is "read only" unless "TEST2" is pulled high. In
the previous discussion Laurent said that it wasn't. I also pointed
out that this conflicts with the bit of code in ti_sn_bridge_enable()
which tells the sink to enable the alternate scrambler.


>         /* enable DP PLL */
>         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
>
> @@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>                 goto exit;
>         }
>
> +       /* For DisplayPort, disable scrambling mode. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);

In my previous review I asked for some comments to include the "why"
we disabling scrambling mode for DP. Can you please add that?

I also presume that for DP it's probably a good idea to avoid the code
in ti_sn_bridge_enable() that tells the sink to use the alternate
scrambler.


[1] https://lore.kernel.org/r/CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com

-Doug
