Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818A13484CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 23:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238879AbhCXWpT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 18:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238866AbhCXWox (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 18:44:53 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E1CC06174A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:44:52 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id v70so19824662qkb.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/iyW6kwjqi6FG66ikBN1bNiA6NtYOMym2acDaBscWVA=;
        b=fBlP6kmzrfU3NAufyoAyG4cACwfZnJQ4BYRgdN0kxccpCHnDPb8RAmlw7DXSg7HANx
         3iWcU420zI3miyS8v2if3Cd/0w+ItcKRB7FwcKiDnF6rweijaHFGVbRA5qxoS/iP0Uax
         d4ZBAaaX60UYNq/27clkv6hvgjYwXiUh8vUrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/iyW6kwjqi6FG66ikBN1bNiA6NtYOMym2acDaBscWVA=;
        b=oMIggKkICb8WYM74yJKpcfzesbzSM/4Qqkz+Hkl/EY3/08XP/TjuK24GMgNeahJTHB
         Q+uJZjwYEN09xcdUM8W3xLByeYfLM3sE5n09n/DdSskWWYe4oM7yVXEu46WJiK1RquxY
         xAiHUPmldTOPk2rCGAf4EYlApiejwUrF7Kp3W3USZ58eUAlkYlggJ0GjPs3Pqi/TlWeq
         a/O33U7lAC7WGXoBM2HI/fKD61/SqS1NwFCZJafV5PHK8O2kqCoH/YrD9fS5qF9fTxdM
         a8sBpWh2PV9/whh5aSjGwG6f1zb1bmXo4JbzQNhXeG+kXvZGxonZn+FoVSj07BXNsPE+
         9RLw==
X-Gm-Message-State: AOAM532Hp6quEK2T2tnSpTdN/jKlvlH1lAnCeMGaSITFEKuYTB5N6RyH
        Qrydj232gXW1F4kp3u1xj9u4nwV027NBDw==
X-Google-Smtp-Source: ABdhPJzVVQuYHrIaoriZWdqS1YrMavWYGZVj24qQtOLq1a5M+mnjihFs2bHWkgogTuNovIRReQL9GA==
X-Received: by 2002:a05:620a:2046:: with SMTP id d6mr5650984qka.116.1616625891694;
        Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id v128sm2887772qkc.127.2021.03.24.15.44.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id x189so281409ybg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Mar 2021 15:44:51 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr7016215ybp.476.1616625890751;
 Wed, 24 Mar 2021 15:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 Mar 2021 15:44:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
Message-ID: <CAD=FV=VFwphwow7W_v7XHn+1dQHq0zwT-TyJyp9BaFgcs_t9VQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
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
> To simplify interfacing with the panel, wrap it in a panel-bridge and
> let the DRM bridge helpers handle chaining of operations.
>
> This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> requires all components in the display pipeline to be represented by
> bridges.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 +++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 1d1be791d5ba..c21a7f7d452b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -124,6 +124,7 @@
>   * @edid:         Detected EDID of eDP panel.
>   * @refclk:       Our reference clock.
>   * @panel:        Our panel.
> + * @next_bridge:  The next bridge.

To make it easier for folks who don't work with DRM all day, could you
somehow clarify which direction "next" is talking about. AKA the next
"outward" (towards the sink) or the next "inward" (toward the source)?


>   * @enable_gpio:  The GPIO we toggle to enable the bridge.
>   * @supplies:     Data for bulk enabling/disabling our regulators.
>   * @dp_lanes:     Count of dp_lanes we're using.
> @@ -152,6 +153,7 @@ struct ti_sn_bridge {
>         struct mipi_dsi_device          *dsi;
>         struct clk                      *refclk;
>         struct drm_panel                *panel;
> +       struct drm_bridge               *next_bridge;

There's no reason to store the "panel" pointer anymore, right? It can
just be a local variable in probe?


> @@ -850,8 +856,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>          */
>         regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>                            HPD_DISABLE);
> -
> -       drm_panel_prepare(pdata->panel);

Ugh, I guess conflicts with my EDID patch [1] which assumes that this
function will directly turn the panel on. I'll see if I can find some
solution...

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
