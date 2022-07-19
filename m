Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C14D57A12F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 16:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbiGSOU0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 10:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237731AbiGSOTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 10:19:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C752DC1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:00:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id z23so27350237eju.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=KRbPahA4lFzwgk1dPu0dYjc5HI3Y+D0dxd62DcPU4ogSQZ64caMPwZVzbpx73J5Kc1
         eaEMkOYtMeTIYH6d3tYbTI31Zpk6YPeEHme+XqB6TB9vweuaBCzadZE54jjqEcIAS/Jf
         pzYTNENzXg+3E79ccZwG+0AO9oqg2VDxVgFkHvRNiXy7aIvjIH3seHu/ncpcbTZ7PS82
         gV4Uc4P8NeQN5INx5ZzZSJl5OpV/PcFLmN2hPWUojY2geEaue3bSrIyK7NibMwK9pdcK
         O1jLIZnNHFsb8ssyIcISmoy2tFgywNjOo7bd37jOZ8uS76xPibNCxglV/JSG62NQzbUF
         B9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=vJg1PhMANXae6Ddp9kZ6DpzTiWDq/0j+WMlLISUM+K9yNM5drpa/BROnHpN6Zi0fm1
         f50qB1IrN86QdprozkM0+JsPsHDi6E7cgYQ3TF5LIRsTvh0+o+4wWAhBov1SC7cJDQLo
         Axn8+YNzYche159JyaHOkG4m46DJftQ45Dls29woBDSuDeicRBpcHTkNR35sGjnY9D75
         shQwCwszTNGdD4TX53mVC1X++ZG1hFAN54ksye3RGHVFCcfpoHZTaMiNmdl5dNKTwZHM
         WgR36QEdiVSLk2aRu5pOUbBHkSZBZhygzYXyM+gyG+7VDO/ZNRB9F8DhgjaipmvYKUgT
         K41Q==
X-Gm-Message-State: AJIora/dVQmLmLEJ/qrMrRqZgLjJ2BTkoMLEph+4s5702FH01ie5fObb
        294POdyzRAmZ42r5JESv3bfzBSJQrIU/xpiuXoxxTA==
X-Google-Smtp-Source: AGRyM1tWkD5ndkU51YMn3Zy/3SBBUnKXW/elXPy0MwiGbgYk7yLn606w46OmkL1nPHs9nxQiSkrrhnOhpxFcOHfz/3U=
X-Received: by 2002:a17:907:d92:b0:72e:e94d:b675 with SMTP id
 go18-20020a1709070d9200b0072ee94db675mr21493011ejc.742.1658239204549; Tue, 19
 Jul 2022 07:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-6-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-6-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 14:59:48 +0100
Message-ID: <CAPY8ntAALp=vtofLjKjEjH89k_fGtLWv9b4L=7fmFZr9+Dd6jg@mail.gmail.com>
Subject: Re: [PATCH v1 05/12] drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
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
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
>
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index ab0bce4a988c..b6e5c285c8ea 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -8,6 +8,7 @@
>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
>         }
>  }
>
> -static bool sii8620_mode_fixup(struct drm_bridge *bridge,
> -                              const struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static int sii8620_atomic_check(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *bridge_state,
> +                               struct drm_crtc_state *crtc_state,
> +                               struct drm_connector_state *conn_state)
>  {
>         struct sii8620 *ctx = bridge_to_sii8620(bridge);
>
>         mutex_lock(&ctx->lock);
>
> -       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
> +       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);
>
>         mutex_unlock(&ctx->lock);
>
> -       return true;
> +       return 0;
>  }
>
>  static const struct drm_bridge_funcs sii8620_bridge_funcs = {
>         .attach = sii8620_attach,
>         .detach = sii8620_detach,
> -       .mode_fixup = sii8620_mode_fixup,
> +       .atomic_check = sii8620_atomic_check,
>         .mode_valid = sii8620_mode_valid,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int sii8620_probe(struct i2c_client *client,
> --
> 2.34.1
>
