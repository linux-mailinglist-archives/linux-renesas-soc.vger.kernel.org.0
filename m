Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655A73484E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhCXWr7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbhCXWrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:47:52 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37645C06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:52 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id o5so49941qkb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5tU7UIZx5sKDtekqRNcff9UhagCgiik2vNQpD3Gxa/A=;
        b=azsRpjl/Ug0WsvmhU4tfuZeghZrs95mO0pH1sy4ThKPdLz/lzRvtKeQMHtV9joh3Wl
         CHYyKxdMkSifG3DrkMQuuXW0hqlRJTmgxgkxrbqilbwznuzn8m7g5vX/JujDv5Opok4J
         Z9M9R93eZKBS7vZWwH6AKMzYLu0GdW33HEYsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5tU7UIZx5sKDtekqRNcff9UhagCgiik2vNQpD3Gxa/A=;
        b=HNh2D3coOmIdUN//D2CAZLynO8Y9DcK0rBC6PL8jwtE3Z2xQyzELT0+NbF1MzX8QwF
         qiPWYMImKfzF84KaGrbbRW6Ynk8SD7QqwoHQVPHOTEhHNefPxC/kVGOwcl6Up9EKIkq+
         /HyTI+btmrJBOzWHri9QZ3YyXYIl4yYroRlnPc5Kecatv3ZoltirF0ekOaMHhAqEu3qL
         c+Eg6egap6IyaLvU2k30zjS0jhTHBbH55DtlSBpdLHYZ29y3n9yjwQ23V0etquDo6zz3
         ML2qrTyYL35qLlVQz2g6x0aRmGrjXqfm4svaiKnLyKx7q374LEHuAYMEePRR3dz310zB
         0DfQ==
X-Gm-Message-State: AOAM532UmPd90hYE/h4vmhZf96rY8p0XEEsJ7dKhl7Fv4zFhhgzh4y9z
        6nYc2xz9lXwGYmAHXx83jC3a2pRLKm3ydg==
X-Google-Smtp-Source: ABdhPJwv6aGSrEtVN8puqP2F/tB4rWhSOwVvYIm3aB5R7WQdcMxn6D7MXTMCxca00oxE18AEtZa9tA==
X-Received: by 2002:a37:6a47:: with SMTP id f68mr5550308qkc.12.1616626071003;
        Wed, 24 Mar 2021 15:47:51 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 18sm2987977qkr.77.2021.03.24.15.47.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:47:50 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id i9so292383ybp.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:47:50 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr7029357ybp.476.1616626069874;
 Wed, 24 Mar 2021 15:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:47:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
Message-ID: <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
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
> When the SN65DSI86 is used in DisplayPort mode, its output is likely
> routed to a DisplayPort connector, which can benefit from hotplug
> detection. Support it in such cases, with polling mode only for now.
>
> The implementation is limited to the bridge operations, as the connector
> operations are legacy and new users should use
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f792227142a7..72f6362adf44 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -167,6 +167,8 @@ struct ti_sn_bridge {
>         struct gpio_chip                gchip;
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +
> +       bool                            no_hpd;

This structure is documented by kernel-doc, but you didn't add your new member.


>  };
>
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -862,23 +864,28 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>         ti_sn_bridge_set_refclk_freq(pdata);
>
>         /*
> -        * HPD on this bridge chip is a bit useless.  This is an eDP bridge
> -        * so the HPD is an internal signal that's only there to signal that
> -        * the panel is done powering up.  ...but the bridge chip debounces
> -        * this signal by between 100 ms and 400 ms (depending on process,
> -        * voltage, and temperate--I measured it at about 200 ms).  One
> +        * As this is an eDP bridge, the output will be connected to a fixed
> +        * panel in most systems. HPD is in that case only an internal signal
> +        * to signal that the panel is done powering up. The bridge chip
> +        * debounces this signal by between 100 ms and 400 ms (depending on
> +        * process, voltage, and temperate--I measured it at about 200 ms). One
>          * particular panel asserted HPD 84 ms after it was powered on meaning
>          * that we saw HPD 284 ms after power on.  ...but the same panel said
>          * that instead of looking at HPD you could just hardcode a delay of
> -        * 200 ms.  We'll assume that the panel driver will have the hardcoded
> -        * delay in its prepare and always disable HPD.
> +        * 200 ms. HPD is thus a bit useless. For this type of use cases, we'll
> +        * assume that the panel driver will have the hardcoded delay in its
> +        * prepare and always disable HPD.
>          *
> -        * If HPD somehow makes sense on some future panel we'll have to
> -        * change this to be conditional on someone specifying that HPD should
> -        * be used.
> +        * However, on some systems, the output is connected to a DisplayPort
> +        * connector. HPD is needed in such cases. To accommodate both use
> +        * cases, enable HPD only when requested.
>          */
> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -                          HPD_DISABLE);
> +       if (pdata->no_hpd)
> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> +                                  HPD_DISABLE, HPD_DISABLE);
> +       else
> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> +                                  HPD_DISABLE, 0);

Optionally you could skip the "else". HPD enabled is the default state
and, in general, we don't exhaustively init all registers and rely on
the power-on defaults for ones we don't explicitly control.


>  }
>
>  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> @@ -890,6 +897,15 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +       int val;
> +
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +       return val ? connector_status_connected : connector_status_disconnected;

I would have expected that you would have used the interrupt signal,
but I guess it just polls in this case. I suppose polling has the
advantage that it's simpler... Maybe throw in a comment about why IRQ
isn't being used?


> +}
> +
>  static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
>                                           struct drm_connector *connector)
>  {
> @@ -904,6 +920,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .detect = ti_sn_bridge_detect,
>         .get_edid = ti_sn_bridge_get_edid,
>  };
>
> @@ -1327,6 +1344,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>
> +       pdata->no_hpd = of_property_read_bool(pdata->dev->of_node, "no-hpd");
> +
>         ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
>
>         ret = ti_sn_bridge_parse_regulators(pdata);
> @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = client->dev.of_node;
> -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)

Checking for "no_hpd" here is not the right test IIUC. You want to
check for eDP vs. DP (AKA whether a panel is downstream of you or a
connector). Specifically if downstream of you is a panel then (I
believe) HPD won't assert until you turn on the panel and you won't
turn on the panel (which happens in pre_enable, right?) until HPD
fires, so you've got a chicken-and-egg problem. If downstream of you
is a connector, though, then by definition HPD has to just work
without pre_enable running so then you're OK.

I guess then you'd need to figure out what to do if someone wants to
use "HPD" on eDP. Do you need to put a polling loop in pre_enable
then? Or you could just punt not support this case until someone needs
it.


> +                         | DRM_BRIDGE_OP_EDID;

IMO somewhere in here if HPD is being used like this you should throw
in a call to pm_runtime_get_sync(). I guess in your solution the
regulators (for the bridge, not the panel) and enable pin are just
left on all the time, but plausibly someone might want to build a
system to use HPD and also have the enable pin and/or regulators
controlled by this driver, right?


-Doug
