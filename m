Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E42357A19E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238487AbiGSOdb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238469AbiGSOdS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 10:33:18 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189FB1208F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:22:21 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id os14so27512670ejb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxr/Prb54/zy1kmbyYS8uuOBwL7gTKX4x+dREF3kWlc=;
        b=rfHzJilRMzE3oKpFS9bXcJBrk1KS7Ji2XBmi7NF3v4C7xkfLktLroYez3gsPMPrT9M
         Hh+Rl7s2UkaSjNDgfHRQqaczuorbv5k6B9UEU/Wh888GK78wdPAY61DmOXSIx6Ukgaa9
         r1C9QOkgF+mmqgdirIuR8rxLBbmSSkgAXUo9yXg+WV0/85M5jl8dRmaWYZLQRKfVPho0
         YU0LzpkMgyudLoyudxq/obH2krnI8Ikoc8iZ82Id2MMwmKx6rUTrlyKfHWvmwfKK+UkX
         yAbfClSj+VILZTJYOylICqpfg/upmqNk3fKVPlgP3xpk/4dIp8hLRuz4wexAupohmhm1
         jQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxr/Prb54/zy1kmbyYS8uuOBwL7gTKX4x+dREF3kWlc=;
        b=4w29UHNebboYQt7yN5Ni2Hc9Xd9pFYugo7gtpehbPbo2WW1d4CV1fhMACWsKjDTeV6
         QFDg8rEflVgVTpXg24AMs+M6aLJBrAU5qtcVwUOSVQZBIyloonIlZOzjEOT5QVIC+cIE
         krR+5cfBOMOA5z18odWjzAWqUj61Qj8EGSMmnZw1V9NqPjha+JefmtXf3+sdySovAssM
         5vEnq/aB4EOYLMsyv1a7UcyykqmOtmQIvXUs4It/ecBr3Sq8VgtA3r7pCpgU/A6nG7NP
         dETgpwtvYSblcL07v6dEByxL9WhVu0Z+LVBTPYNVpUP1/GNh/CiQaNpMUn4RnaBuYbWQ
         a3bQ==
X-Gm-Message-State: AJIora9jf0ml/aJlu/gYNIQhHLsAEc59XSsgQl29AOMuVCk7Wjx79e64
        QpoEiXGleUdblhmpHfULH8bXOAiYilIj5EA/7bFlyA==
X-Google-Smtp-Source: AGRyM1vI+njWwaFz/dP4qVFCo2KFrB6fXWc8gAu7iNC+UaeYXOOUyZKivYZDCMr6Fjq/7oDnJbs6hYOhlLvWYpEn7CQ=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr30062164ejc.723.1658240539665; Tue, 19
 Jul 2022 07:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-4-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-4-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Jul 2022 15:22:03 +0100
Message-ID: <CAPY8ntDK99H5gvBXGKuLOALaR=eDAqJPQUOS156LtHRpQt-g=A@mail.gmail.com>
Subject: Re: [PATCH v1 11/12] drm/bridge: Drop drm_bridge_funcs.mode_fixup
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
> All users are converted over to drm_bridge_funcs.atomic_check()
> so it is safe to drop the mode_fixup support.
>
> Update the comment for atomic_check with relevant parts from mode_fixup.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_bridge.c |  7 +----
>  include/drm/drm_bridge.h     | 60 ++++++++++--------------------------
>  2 files changed, 17 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b6f56d8f3547..3f5acb19957c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -685,10 +685,6 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>                                                   crtc_state, conn_state);
>                 if (ret)
>                         return ret;
> -       } else if (bridge->funcs->mode_fixup) {
> -               if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> -                                              &crtc_state->adjusted_mode))
> -                       return -EINVAL;
>         }
>
>         return 0;
> @@ -934,8 +930,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>   * @conn_state: new connector state
>   *
>   * First trigger a bus format negotiation before calling
> - * &drm_bridge_funcs.atomic_check() (falls back on
> - * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
> + * &drm_bridge_funcs.atomic_check() op for all the bridges in the encoder chain,
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_check()
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7496f41535b1..8c93369bcc74 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -106,7 +106,7 @@ struct drm_bridge_funcs {
>          * to look at anything else but the passed-in mode, and validate it
>          * against configuration-invariant hardward constraints. Any further
>          * limits which depend upon the configuration can only be checked in
> -        * @mode_fixup.
> +        * @atomic_check.
>          *
>          * RETURNS:
>          *
> @@ -116,46 +116,6 @@ struct drm_bridge_funcs {
>                                            const struct drm_display_info *info,
>                                            const struct drm_display_mode *mode);
>
> -       /**
> -        * @mode_fixup:
> -        *
> -        * This callback is used to validate and adjust a mode. The parameter
> -        * mode is the display mode that should be fed to the next element in
> -        * the display chain, either the final &drm_connector or the next
> -        * &drm_bridge. The parameter adjusted_mode is the input mode the bridge
> -        * requires. It can be modified by this callback and does not need to
> -        * match mode. See also &drm_crtc_state.adjusted_mode for more details.
> -        *
> -        * This is the only hook that allows a bridge to reject a modeset. If
> -        * this function passes all other callbacks must succeed for this
> -        * configuration.
> -        *
> -        * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
> -        * is not called when &drm_bridge_funcs.atomic_check() is implemented,
> -        * so only one of them should be provided.
> -        *
> -        * NOTE:
> -        *
> -        * This function is called in the check phase of atomic modesets, which
> -        * can be aborted for any reason (including on userspace's request to
> -        * just check whether a configuration would be possible). Drivers MUST
> -        * NOT touch any persistent state (hardware or software) or data
> -        * structures except the passed in @state parameter.
> -        *
> -        * Also beware that userspace can request its own custom modes, neither
> -        * core nor helpers filter modes to the list of probe modes reported by
> -        * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> -        * that modes are filtered consistently put any bridge constraints and
> -        * limits checks into @mode_valid.
> -        *
> -        * RETURNS:
> -        *
> -        * True if an acceptable configuration is possible, false if the modeset
> -        * operation should be rejected.
> -        */
> -       bool (*mode_fixup)(struct drm_bridge *bridge,
> -                          const struct drm_display_mode *mode,
> -                          struct drm_display_mode *adjusted_mode);
>         /**
>          * @disable:
>          *
> @@ -466,9 +426,7 @@ struct drm_bridge_funcs {
>          * &drm_bridge_funcs.atomic_check() hooks are called in reverse
>          * order (from the last to the first bridge).
>          *
> -        * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> -        * called when &drm_bridge_funcs.atomic_check() is implemented, so only
> -        * one of them should be provided.
> +        * This method is optional.
>          *
>          * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
>          * &drm_bridge_state.output_bus_cfg.flags it should happen in
> @@ -478,6 +436,20 @@ struct drm_bridge_funcs {
>          * &drm_connector.display_info.bus_flags if the bridge is the last
>          * element in the chain.
>          *
> +        * NOTE:
> +        *
> +        * This function is called in the check phase of atomic modesets, which
> +        * can be aborted for any reason (including on userspace's request to
> +        * just check whether a configuration would be possible). Drivers MUST
> +        * NOT touch any persistent state (hardware or software) or data
> +        * structures except the passed in @state parameter.
> +        *
> +        * Also beware that userspace can request its own custom modes, neither
> +        * core nor helpers filter modes to the list of probe modes reported by
> +        * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> +        * that modes are filtered consistently put any bridge constraints and
> +        * limits checks into @mode_valid.
> +        *
>          * RETURNS:
>          * zero if the check passed, a negative error code otherwise.
>          */
> --
> 2.34.1
>
