Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF2157A16D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 16:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbiGSO0l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 10:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbiGSO0T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 10:26:19 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358CA77A5F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:11:52 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id m13so9596252edc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=PpOMFXjn4g8lzVw5rHY4cup+bAESdluj4/3YOF7f+Nf6pVaKQIAOCl03o9pc+ycEg8
         JzGF5OksPZHIYo8KnyZYmZrW0WECIAz29OUSWAxfSBkt+qSOGEMeFW+lYpOJ57/DLLk7
         PYdg8BrOQbM/KkKhw1ljgw+DJ9JyqPEhrGlv2s2Xvji0jloqJWQx744c24n/HazvLKzM
         WP4RxGlwmQKNkwOHSxdqcVxD+OllnYAgIwd9FtDOhTQtG2CjkBm7BK7nWEWdcovEANB6
         3gYZHINxB0I37Oya/rNkBvm7c6jRL+syTFjrov0FBNiRiOJ7LGx5YQEWJkrCKPAmY03h
         pSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=kGRqcgSfW4frPciiQcCVHP/N6PIwq23JakYBTSn/dTIWAu97k/ELBhZznZ55dL82lC
         5gUpFyILK2gvl2oG9MGM8+CQXT0OttrkkBCUNcyKg9VRVLaweeRLaDu/OCAcNfpDs4y3
         mA6/aVnF1RTo1NAVwtvB72Iu1t2JZPt0y6W+PypdfFbTxFytiMqPU3kOVmAdMIDOcVBe
         lcpLR05Pg3fn8AtRHGUGLyu1ivy/SJxKHyIRXsnyfv/lVtbqcbEKcW4/uUTeLpibuJ1M
         fjNkeaDzRFmrz+DyX4xJzs8sV1eaT2Vi9dgEmOA5VEGnWZUrzvOszpgTaVNpE44XKJ7S
         jSyg==
X-Gm-Message-State: AJIora9QCNUCXr+RVgWtE8uHACfQie3kTPk9eWZjB2S1y175creY3WGK
        GWSd2sl5V+czIKkajCD8TI46CBdFhmoldyczwuPCgg==
X-Google-Smtp-Source: AGRyM1u8NJW8Er8LUi8nkjhRDlt2K9GTp5JSpALaf1s7vzpZ3L6Y6cv9xNTWc9xabCNHNsVc63LyB1SwXY5mz2IiJeg=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr43193671edc.86.1658239910831; Tue, 19
 Jul 2022 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-2-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-2-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 15:11:34 +0100
Message-ID: <CAPY8ntDMPG3GxP3kuTi74DXMFCAYbh7AY3ZhWSWG1MFYjBdr0A@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
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
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> The driver implements the state operations, so no other changes
> are required for the replacement.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 830aac0a2cb4..c4adbcede090 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>         clk_disable_unprepare(lvds->clocks.mod);
>  }
>
> -static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adjusted_mode)
> +static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
> +                                 struct drm_bridge_state *bridge_state,
> +                                 struct drm_crtc_state *crtc_state,
> +                                 struct drm_connector_state *conn_state)
>  {
> +       struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>         int min_freq;
>
> @@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>         min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
>         adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>
> -       return true;
> +       return 0;
>  }
>
>  static int rcar_lvds_attach(struct drm_bridge *bridge,
> @@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .atomic_enable = rcar_lvds_atomic_enable,
>         .atomic_disable = rcar_lvds_atomic_disable,
> -       .mode_fixup = rcar_lvds_mode_fixup,
> +       .atomic_check = rcar_lvds_atomic_check,
>  };
>
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> --
> 2.34.1
>
