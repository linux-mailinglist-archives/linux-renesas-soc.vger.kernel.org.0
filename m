Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C0857A15A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 16:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237732AbiGSOZf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 10:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbiGSOZV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 10:25:21 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5EF69F05
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:09:56 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id z23so27408892eju.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
        b=dF2CF31GTyulq3yHsXUA1vHe2kfxBlnZD2GJKEsvd21wdJODJxisNWK5q2qqnE8jRu
         dVdbJZgJTdqzovcJwW3t3CbaOdfS7JC++7wFa1cueWGgZqoHtEShGi3yiRc+wcJrYe4R
         1LFTz0mj3OE37GgsKHiR2JRreETgNkWJL5b224HFw8FerDiKE6dZ30/Pr4BcZoTpNWO6
         LjMlrr9ctQA+eOUZrwmG9DpU0IgSFYaJsGs4ivXnZeU0dsPshkBt2jV5QpyyshaVtwXy
         CjnkN3P/7C7EvzeYPIrklHPAh3suJ7JUpSe25X3FMsfE1SytE7IEz7Itd2ae7s+4mmvN
         HKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
        b=BNpXN03YjdWC16rar5y8RUmbnf4MRjbWKzd3ziU7paI28dFoyxfBz+w48kMNEdoYEO
         RRWwjjss0fofnGniIetwE03ffzezYO6cZcZsplhlwIdBPxBolxyfT8ivHraOE7+lOHQ1
         K+nH6WqWvUHXw2nigkgpe2HCQqIXtu+N6K8MTEYb75RreR6yIbzP4ESUOohd2sR4XpH5
         +7Jg4NV6gejhiNjOgHT4k8YHcFm4RjKCEFjVtWivqtzvjMT5O61IPwOgiEBEiyOeY1oC
         Ht2knY9a2bZhBnS8w/72JtGT/rxSwb1BIhBWhFPz5pQTUG4dLL5B2sR3i+RW7P3YyBXT
         1h6g==
X-Gm-Message-State: AJIora9NP6nBNOsNUAWRE8IXA/COSRLG7mUP4WOxSwmiWj7sLs3REnqo
        Hsgvy7l2IfWurTG5KoVfD6ZCv7/ZI6tTIPKx1c8KoA==
X-Google-Smtp-Source: AGRyM1vIvrL+ynTCXW9jozSCwBKEDF7zOHgYSDXBTQzuGSuKy/E6HIdmsx6PziOBLoPRrbpWd3BC/TOOutSHeTbYer0=
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id
 js2-20020a17090797c200b0072b9ec49a60mr29861218ejc.154.1658239795128; Tue, 19
 Jul 2022 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 15:09:38 +0100
Message-ID: <CAPY8ntBVhdixytMMMxAZcnCYf=zCB14RGucgD+hsTrD5RFP_fw@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
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

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> The implementation of drm_bridge_funcs.mode_fixup is optional
> so there is no need to provide an empty implementation.
> Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
> deprecated drm_bridge_funcs.mode_fixup() operation.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index a63b76055f81..7321aa1ee6f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>         return 0;
>  }
>
> -static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                      const struct drm_display_mode *mode,
> -                                      struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>                                            struct drm_bridge_state *old_bridge_state)
>  {
> @@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .attach = mtk_hdmi_bridge_attach,
> -       .mode_fixup = mtk_hdmi_bridge_mode_fixup,
>         .atomic_disable = mtk_hdmi_bridge_atomic_disable,
>         .atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>         .mode_set = mtk_hdmi_bridge_mode_set,
> --
> 2.34.1
>
