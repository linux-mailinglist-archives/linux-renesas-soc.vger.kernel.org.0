Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9933857A159
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 16:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238141AbiGSOZA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 10:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbiGSOYr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 10:24:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4A253D17
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:09:16 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id va17so27477655ejb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
        b=S4sSw4dPG9SoIscVCdBbw23gLQXegfD1TkIApRxUyVaz4Lk+4tqsgVjhX7TOzjd6Is
         /5DnmmmSvRPYTOQnlVzVSdPc/EEPWSixLP80fWE5TRy0sVDHHSidsaUXEDv3dmwvt19n
         wDF6u4wZBZskt7/AQ8kG+73zWr1KFlEQDV/t6r2v/SU5fpBxDgQzRwbhLqatihkNuoQ5
         TreVDvedfrbpmBjJNp8iihxBQWHqaqEFPuBJvNjcZAw/gisZ5vXx5VZESnFkLl2GOCNL
         T8QFk5vB1DXMLTK3C2tSP8Lfs+f5/nSrsh+72N8UWxmFfb4/FrAr/QrEi6e+kV9vpiB6
         mHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8sLlbZKcYVwqChBzOR8a7SbN4VOIEkVLaJpmGxf1u8=;
        b=12zRWUPE7owRhRjlV1aoB8YQnKlZNMk8by5lWC5VS3Tk9gfzxTpHc97aHTIByG2NmL
         wc3xenDMSWiztK3JaXiBQ4mKmxXQ9/zbfnJRoHMXI+mfIqGyIbrjXWfFYSpPlPcZ+fSj
         5qs4c2K2aPw20wDNSZb7MAPHy/eAXjqmiy3kclWHbBj+G3E9oZ15rRMXCd+H5XICbHRT
         8UcE26EE8QTz/IQbzb2iy4/9V7OYjSmJ+xmg1+CcmCJEPQ1wIhFCLAX0/IJnDc8wKMIh
         PTVOHFvfLWGphh6hypzZs6c/+6Aj2ygP+sWECU4u5qpagJ8XM6PpiSSh+Wh8SXzBHNZ9
         UPOg==
X-Gm-Message-State: AJIora9k+d7NVqyrOVJ8zTb4OFqogOmRCButj5hwdpnRTdtyJJ6x6Dw1
        QvvLeme0lK2d/VwvxB01jW5gXsJPK3tNk92IceXk+g==
X-Google-Smtp-Source: AGRyM1udjkXGNICxc5l46Ad38az3eGQyrcMk/c2xHDg4URlYogp6zX3h1ScYex5vj2vhyr7QFOwl7+d/nHFljbt8Hdw=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr31450934ejc.294.1658239754935; Tue, 19
 Jul 2022 07:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-8-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-8-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 15:08:58 +0100
Message-ID: <CAPY8ntCk=q1n+bCwJdv5MXbAc8PeRUUrwZ352BW_Ax6d550GKg@mail.gmail.com>
Subject: Re: [PATCH v1 07/12] drm/bridge: tc358767: Use drm_bridge_funcs.atomic_check
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Philip Chen <philipchen@chromium.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 17 Jul 2022 at 18:45, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> When atomic_check() is defined, then mode_fixup() is ignored,
> so it had no effect that drm_bridge_funcs.mode_fixup was assigned.
> Embed the original implementation in the caller and drop the function.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(There was a point when drm_bridge_chain_mode_fixup still existed, but
that's gone/going now).

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 02bd757a8987..b2ab967504af 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1496,26 +1496,18 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
>                 dev_err(tc->dev, "main link disable error: %d\n", ret);
>  }
>
> -static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adj)
> -{
> -       /* Fixup sync polarities, both hsync and vsync are active low */
> -       adj->flags = mode->flags;
> -       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> -       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> -
> -       return true;
> -}
> -
>  static int tc_common_atomic_check(struct drm_bridge *bridge,
>                                   struct drm_bridge_state *bridge_state,
>                                   struct drm_crtc_state *crtc_state,
>                                   struct drm_connector_state *conn_state,
>                                   const unsigned int max_khz)
>  {
> -       tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> -                            &crtc_state->adjusted_mode);
> +       struct drm_display_mode *adj = &crtc_state->adjusted_mode;
> +
> +       /* Fixup sync polarities, both hsync and vsync are active low */
> +       adj->flags = crtc_state->mode.flags;
> +       adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +       adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>
>         if (crtc_state->adjusted_mode.clock > max_khz)
>                 return -EINVAL;
> @@ -1783,7 +1775,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>         .atomic_check = tc_edp_atomic_check,
>         .atomic_enable = tc_edp_bridge_atomic_enable,
>         .atomic_disable = tc_edp_bridge_atomic_disable,
> -       .mode_fixup = tc_bridge_mode_fixup,
>         .detect = tc_bridge_detect,
>         .get_edid = tc_get_edid,
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> --
> 2.34.1
>
