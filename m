Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6C03484DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhCXWqz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbhCXWql (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:46:41 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3677EC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:46:41 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id o5so47589qkb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXm7c9BC1Iwf8wNKP3RctSCWQluCcE+3yvxP3P18/PY=;
        b=RbXEwuTTAG125sZM23dAkqMoDE3mi7AnoEM7poj8yZ0c6k5NAh5uG/ls/WKDasGUj1
         yP2r7KdX4A/0gsgF3nauoJ3xx6gIC/JfbNP+zEvGK3RgakiCjORs1gsieksWb//wXpLM
         n7UuTcsvKuDXTfm7kJMLYq/BdgjFxUApBbQJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXm7c9BC1Iwf8wNKP3RctSCWQluCcE+3yvxP3P18/PY=;
        b=lRKvBxDxQiq/Ea0EhUp9/8KH8Iiwyq9KdXVSTsmCRL6ENzgIHmXfLY8AvS5odAzX2b
         gSw0gIiT0nxJ22lGhgaWvm+6p2R19NI/fjI0lLNqKb/ILLyy18BRZKkxeBSksTERlXvQ
         RwGoAtawHZuxsvBGiNBEt3x99/DoRzValITmmy59Cfu75Jf7Ft89iwv3qTkS+nBbwCXE
         wJkkNO150rihUkEnqdZqltK1c92QF4l+aPGDTL0CVN8Ygaw1rzhbIsSAd6Un0DqjyXn7
         w3jPvVgibMlVTjy88nDp2eicDz0Z9c/g2zIlPOjACa7leSTkr6lOMbfnrB3WDpF18bGu
         C58Q==
X-Gm-Message-State: AOAM531kSruMEFQZI4HYYuPwh8Sgbw2uquwVGdXkjHHLrE3KsbJqTlbK
        0WEd8uwHLb1ghzaI9B4a6d0LUc1gvWWHpw==
X-Google-Smtp-Source: ABdhPJw7IdPueIB8J0qgtG8SGtvxLDp2XzMvu5EOu5z+oLQc7hylN2YMnutEBs/g5adaNb5Qr+5dww==
X-Received: by 2002:a05:620a:16d3:: with SMTP id a19mr5420761qkn.88.1616626000262;
        Wed, 24 Mar 2021 15:46:40 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id b27sm2735482qkl.102.2021.03.24.15.46.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id i144so309517ybg.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr7835505ybv.79.1616625999188;
 Wed, 24 Mar 2021 15:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:46:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
Message-ID: <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
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
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type. The .get_edid() operation is
> implemented with the same backend as the EDID retrieval from the
> connector .get_modes() operation.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 ++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index dc300fab4319..6f6e075544e8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -261,6 +261,18 @@ static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
>         pdata->debugfs = NULL;
>  }
>
> +static struct edid *__ti_sn_bridge_get_edid(struct ti_sn_bridge *pdata,
> +                                           struct drm_connector *connector)
> +{
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put(pdata->dev);

As mentioned in my patch [1], the above is a bit iffy for eDP.
Specifically just doing a pm_runtime_get_sync() isn't enough to
actually be able to read the EDID. We also need to do any panel power
sequencing and potentially set the "ignore HPD" bit in the bridge to
actually read the EDID.

I'll try to find some time to make this better--let's see if I get
distracted before I manage it.


> +
> +       return edid;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * DRM Connector Operations
>   */
> @@ -277,11 +289,8 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>         struct edid *edid = pdata->edid;
>         int num, ret;
>
> -       if (!edid) {
> -               pm_runtime_get_sync(pdata->dev);
> -               edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -               pm_runtime_put(pdata->dev);
> -       }
> +       if (!edid)
> +               edid = pdata->edid = __ti_sn_bridge_get_edid(pdata, connector);

It feels weird to me that we are now exposing the get_edid() function
directly but we still need to implement get_modes(). I guess this is
because we might need to fallback to the hardcoded modes? ...but that
seems like it would be a common pattern for eDP bridges...


>         if (edid && drm_edid_is_valid(edid)) {
>                 ret = drm_connector_update_edid_property(connector, edid);
> @@ -871,12 +880,21 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +       return __ti_sn_bridge_get_edid(pdata, connector);
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .pre_enable = ti_sn_bridge_pre_enable,
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .get_edid = ti_sn_bridge_get_edid,
>  };
>
>  /* -----------------------------------------------------------------------------
> @@ -1335,6 +1353,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = client->dev.of_node;
> +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;

Even with the few comments above, I think this is still fine to move
us in the right direction. Unless I manage to fix up the EDID reading
(in which case your patch would conflict and would need to be
tweaked), then:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
