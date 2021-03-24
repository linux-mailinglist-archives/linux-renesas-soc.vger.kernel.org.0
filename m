Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6717A3484E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhCXWr0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbhCXWrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:47:21 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C3BC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:20 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o5so48866qkb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8WdGt1t0T8Zm9fu1FD2a5P7lZ9YFS8pFD0IMcWsA6ng=;
        b=isY5DCYNbVu/s92nJ7NtbWIJq7KSn6z6GsqA2Ent70ODNyDKcZnsLCDoP2EfDmu1I8
         54glC6krK7SW1xwp8+qtFmk6JVhQdttu313b024myEqYQQcvEqqFb3jTp99VLBH/cCH3
         Ys10NMAQBTlxHhfx9gQKrs8jVWOhxHmrVDw5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8WdGt1t0T8Zm9fu1FD2a5P7lZ9YFS8pFD0IMcWsA6ng=;
        b=ru4zVIhjaJhnbbPkLN3HqkAT75aAp1XrSugKCo47TMh5OmvTt0w5LHwbxB0310UHBH
         71fmvRkVzCTF/UYPkXoO7XfqCiyUcBDNMbdmy/rjd22VEFUHwqfDgpyj4h1WDUN/e45E
         2MK3oWJPvKYSEnVXXlEBb5A7gDf+whdbCcxFmvNcPP80om2o2CjSKsD/wduigcbQiT71
         VPIPHJRYAmqgEa/dgULYQLtHTHr+StkEFk2olzU/xS4lm3vH9K6hvz35lR8+eWwG8wLy
         Ia4AyTbCD0u29VivMBj/HdjdXvyUGjl6NmZxnGylmxKYaIkup7cGTK8OOr6NQ5cDHXLH
         DAmQ==
X-Gm-Message-State: AOAM5321RO9DGJ7XEPSH5787s9HzgfSWx/6ztMNuC1s8uxAdgfinJvw6
        /FVZTdMNMWheYm4CGWSZzZ1EAeg7/Bvocg==
X-Google-Smtp-Source: ABdhPJynNUQpuugryDQKpD9uO3I9XPoRddiIV9ves6vWHWe6NNcwxfMmZ7RqNSeJl0N1U+gvpbFaLA==
X-Received: by 2002:a05:620a:914:: with SMTP id v20mr5631665qkv.140.1616626039588;
        Wed, 24 Mar 2021 15:47:19 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id k8sm2343314qth.74.2021.03.24.15.47.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:47:18 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id x189so286252ybg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:18 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr8254860ybi.276.1616626038338;
 Wed, 24 Mar 2021 15:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:47:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
Message-ID: <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is not a panel, and disable eDP
> features in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 ++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e2527d597ccb..f792227142a7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -55,6 +55,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)
>  #define  VSTREAM_ENABLE                                BIT(3)
>  #define  LN_POLRS_OFFSET                       4
>  #define  LN_POLRS_MASK                         0xf0
> @@ -86,6 +87,8 @@
>  #define SN_DATARATE_CONFIG_REG                 0x94
>  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
>  #define  DP_DATARATE(x)                                ((x) << 5)
> +#define SN_TRAINING_SETTING_REG                        0x95
> +#define  SCRAMBLE_DISABLE                      BIT(4)
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> @@ -723,6 +726,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
>                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
>
> +       /* For DisplayPort, use the standard DP scrambler seed. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> +                                  ASSR_CONTROL, 0);

I don't actually know anything about DP scrambler seeds. However:

1. From reading the docs, this field seems to be documented to be
"read only" unless:

1a) The "TEST2" pin is pulled high when you power on the bridge.
1b) You set "ASSR_OVERRIDE" (page select to page 7, write to register
0x16, page select back to page 0).

I don't know if TEST2 is being pulled high in your hardware, but at
least I can see that 1b) isn't done. So I'm guessing that this line is
a no-op? If I had to guess from all the hoops they're making you jump
through there's some sort of errata around standard scrambling on this
bridge chip. Are you sure it works OK?


2. The docs I see claim that this field is 2 bits big. It seems like
it would be nice to honor. Yeah, it's silly because 0x11 and 0x10 are
"reserved" so it's really more like a 1-bit field, but still seems
like it would be better to set both bits, or at least add a comment
explaining why you're not matching the datasheet.


3. Your patch doesn't seem to touch the bit of code in
ti_sn_bridge_enable() that says this:

/**
 * The SN65DSI86 only supports ASSR Display Authentication method and
 * this method is enabled by default. An eDP panel must support this
 * authentication method. We need to enable this method in the eDP panel
 * at DisplayPort address 0x0010A prior to link training.
 */
drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);

Won't that be a problem?


> +
>         /* enable DP PLL */
>         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
>
> @@ -734,6 +742,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>                 goto exit;
>         }
>
> +       /* For DisplayPort, disable scrambling mode. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);

I'm assuming that this is the important part of your patch? Would be
sorta nice to include the "why" in your comment. Why do you want to
disable scrambling mode for DP but not for eDP? Maybe you care about
compatibility but not EMI if you're hooking up to random DP things?

-Doug
