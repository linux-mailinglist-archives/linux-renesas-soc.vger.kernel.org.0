Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5484A5072B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 18:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354463AbiDSQNT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 12:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354456AbiDSQNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 12:13:19 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3353D3152C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:10:36 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u5-20020a17090a6a8500b001d0b95031ebso2336064pjj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2zUDBVZeufodaZBNXLQJpGoBp+9yrpMkHJh0fQiqf0=;
        b=J+4gxcqoPhHaR+hm2f5I3WcEL8MofsAJ/pbl3RrfAaP7mLrBTP+JmjS4/QwVj3DY9S
         bHEclbIp2kARdIePLa0wyZ7DYtaOG0UBbQVSk1GGbWC7TmlGV7WYw3a2o9Hd3mYp2xgB
         /OHIXsW+qA2OhuvkS31eGQlZkAzUCXSVAXY/dXsM5kPbH0pCRE224YxhZWRMOSIpAGfC
         LB3FRhHrcgP6sRHgoICbrDCA2eJ4QUSNgt44nOgZSZrK7fkU2UYeOC0NEnMJBjxKu0By
         /lglHKovo6lSP09RkiPDmhkw+wg5V9gFIUedey4AtVnuhPNKdNN39Qu5k2+JlYysNcdx
         fbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2zUDBVZeufodaZBNXLQJpGoBp+9yrpMkHJh0fQiqf0=;
        b=IwxhtSzvm5hHczXTYOijrq3qmv8tm/s6N0AWprlIS/5DW2rcJwiOSYyoF2DA13t/C1
         KgQksrNZ+B2hJwnR2qsOqUouz31fy5kVTi3QBTAoo484Y/l8CaKjZA1nOxvgTcBTwQdq
         9+rJTJSEBnFkK1SrBzgD17qAracSZxIGMzdSLKlXlTFL5VGMmI66cinw+SxqZ04fn+XL
         9MWkQB0kd6zjpPUurmatVp/0pbKMGI6n2d8xI23ylVtOpF3lnnqzuGqPzXtQLKxwJTyA
         arObZA10meaSIB2APQ+gyRmwyKnprZEWDhSysobVvnYabF9y94oqbt3M/XQDVLiqRbBu
         +9qA==
X-Gm-Message-State: AOAM531djQVJROH6DpGWcSRkK430C8+/Ur1G5d4xXTzsTMF4alyYiwFP
        LAA/rCNduq1KlpMsp3/od1+8Td11NEwvv1kDTQbcCQ==
X-Google-Smtp-Source: ABdhPJxfhzMAM4PyybWFTYly1A2JBF1qg31SECQqXlnwLv87FBwbiKELjuIBwecIgyRvQhlreJfhF0QoBprPDxdXub0=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr6983945pjb.232.1650384635662; Tue, 19
 Apr 2022 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 19 Apr 2022 18:10:24 +0200
Message-ID: <CAG3jFytYo66aTJXk-6C7uaUSOJk=JkYYv997gg+64Mm9uZP3ZA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on
 HPD interrupt
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 Apr 2022 at 16:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Connector detection using poll method won't work in case of bridge
> attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
> the code defaults to HPD.
>
> Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
> it will fall back to polling, if HPD is not available.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 668dcefbae17..b3f10c54e064 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>                 goto err_unregister_cec;
>
>         adv7511->bridge.funcs = &adv7511_bridge_funcs;
> -       adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> -                           | DRM_BRIDGE_OP_HPD;
> +       adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +       if (adv7511->i2c_main->irq)
> +               adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
>         adv7511->bridge.of_node = dev->of_node;
>         adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next
