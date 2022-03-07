Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86AE54D07F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 20:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241706AbiCGTxT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 14:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbiCGTxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 14:53:18 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B958932E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 11:52:23 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y12so1766813edc.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 11:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLhnZ7fcJxcYqZ1fq0jluBmo+axHuvOeflUJPS9b+ZI=;
        b=RTexsYkgBQ6u0VMOpTBAYhcV6TBvMux5Z4pN7bJxYj3MpE9uYXper5vCsQML8pT54a
         ArpMG0CK+jFdRuBR4IPKHKZPbb3cODzxjNbfslwd8aWwv805kL/Nwo87LjWH/34RwX8G
         zDtYlTVGT75OAnERWp7RDN3khBcjZzrz2iCo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLhnZ7fcJxcYqZ1fq0jluBmo+axHuvOeflUJPS9b+ZI=;
        b=mcD1qXd3EDcnViyOHeAS4sTn0Q2Txe5rL0RkbcJXeGSTqW/b/pbEJjsxjZ+36Uefiv
         b8DUlt1gHjEuGmHf4bMZn/DjcoEV12HpyJDxGQb2+YFI7JD3KTdZXs6i/6wbnawzh4Ky
         8vL0YQPReGpFLl92Rs0wyzB7Iv4N59OKvi7A6MsDg6VbZqGcfjGZd4r7oXxouRq269Th
         LLMGIAih5/u8SOvt/lqLMOkFSjPU7nYIp/kLrTLgaQ5hhIYnL0buTblsF7UH41pL8qNH
         x/aN/wBVvGnbpPysjsJiYpAkDMNwZKrWfyNzhSmXc/S+xZpfIHTZ/NA+6ae02APTg+X2
         c6rw==
X-Gm-Message-State: AOAM533wJ75ubBumWfUHYl4eLG/1Ap8nkueDG5YvHVFcjkosDvB1e8sD
        jAF45tx89qcENPQoW5bnU7yqPRwD2/ldjQ==
X-Google-Smtp-Source: ABdhPJzo2VqAXiWIjJPjKufhAZo6Pz2I+6pKzhTNDoaXwuQJCfHi/wiepK+y9EFg3I9Es61ndS568w==
X-Received: by 2002:a05:6402:26d3:b0:416:4186:6d7d with SMTP id x19-20020a05640226d300b0041641866d7dmr7333716edd.129.1646682741587;
        Mon, 07 Mar 2022 11:52:21 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id go41-20020a1709070da900b006d643bdd4d4sm5016306ejc.56.2022.03.07.11.52.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 11:52:20 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 19so9606926wmy.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 11:52:20 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr498335wms.88.1646682740331; Mon, 07 Mar
 2022 11:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Mar 2022 11:52:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
Message-ID: <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>
> Notes from Kieran:
>
> RB Tags collected from:
>  https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
>
> However this was over a year ago, so let me know if other patches now
> superceed this one or otherwise invalidate this update.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c55848588123..ffb6c04f6c46 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put_autosuspend(pdata->dev);
> +
> +       return edid;
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .detach = ti_sn_bridge_detach,
> @@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .get_edid = ti_sn_bridge_get_edid,
>  };
>
>  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> @@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = np;
> +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;

This doesn't look right to me. In the eDP case the EDID reading is
driven by the panel.

-Doug
