Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FD65A4F84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 16:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiH2Opf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 10:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiH2Opf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 10:45:35 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A076E2FE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 07:45:33 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so16129545ejb.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 07:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=s0iyuPNI7/LMzM/1LbFoSsF66QYWRPhdYVPrV2uXI5w=;
        b=qv6EPlo5PvL8WyfIyQIWqiF3Z5reqqPldwuC8tt4SNYy1qBQHtmeA6jE8EWl1pCh9W
         /i0ZTnd3//qac/ZM5yxsqkdbHKpE2YM6XRMIeyGe36P0Q1VMReV7ytKMyd9qMcqPYXDM
         Nh8rxZ3kKn5RhN/Un7mXO1rWvi/fz1oJhZ/zM6YBGraqijh9/iFyEeAzpEzo+/wkEnvy
         NNb8MW8ZztzqE3JlW/RRsMMCIwILsnhLCQw9JjdEYNVsUXz7lrXHgOkiyFNWUfjt9kBI
         TrCOKoiwZVauKE4x0iL0Va8/HXfOz7usCRFFtqLZCKpFZQep3z3Sf52AhPpT3hlLcJD4
         I5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=s0iyuPNI7/LMzM/1LbFoSsF66QYWRPhdYVPrV2uXI5w=;
        b=lYmk49sem3x+9FAWMpYDrR2b12eg3MVsYIaZ00thNpxBcM9oQsGNZ8OThXsuWrenPj
         rF6UuM79+kQnH2UI9B7VsycEY/Qjc9alwdVUorJXtq17rUu7tg4OsQx1uSNePeqjqMbB
         8FuUni/JWKbGpdQfb0CtsDqeLPodcNeza9Q3f+qwo4wURADmYlAW3ErqiU6RMCyh0NvQ
         6zcfcJPtippRS5ngXIzlY+ez7zMsueg5FelBoikh6hZWgiri3rRxSrxkEN5gkfrJbohe
         6LeZvhXwzBi/rvp3forIlletqsebqYoO/TFhWykzXcS8xjdnxCwTDsEjqN9VmmXhTlQ2
         jamA==
X-Gm-Message-State: ACgBeo1Gc9bymA/wWz0nJG6CDqN5piQ3BRo7rhXDqMe0Ii/39x2phhlm
        1oHNB7Ve+vGiaJDU3CEfFisyNYZfnzzyNITpVh2Ipg==
X-Google-Smtp-Source: AA6agR6DKVxl7xbKKtZ9hcuxEKytF7lflxCPIwmH8lLJ2deCJOT+IHJqk1EkXTf66WsMZUZELf1yAq3IKwg5/LFgvpE=
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr9899976ejb.514.1661784331836; Mon, 29
 Aug 2022 07:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com> <YwlvEa7c6xnhvGyj@pendragon.ideasonboard.com>
In-Reply-To: <YwlvEa7c6xnhvGyj@pendragon.ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 29 Aug 2022 16:45:20 +0200
Message-ID: <CAG3jFyuLFLTfmmEAg-jJVh1Ov=F10QBLs+ssAbYyWmFM0RbbRA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 27 Aug 2022 at 03:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tomi,
>
> On Wed, Aug 24, 2022 at 04:00:34PM +0300, Tomi Valkeinen wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Implement the bridge connector-related .get_edid() and .detect()
> > operations, and report the related bridge capabilities and type.
> >
> > These ops are only added for DP mode. They should also be used for eDP
> > mode, but the driver seems to be mostly used for eDP and, according to
> > the comments, they've had issues with eDP panels and HPD. So better be
> > safe and only enable them for DP for now.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> This patch is missing a third-party review, so I won't apply the series
> to my tree but will let you pushing it through drm-misc once we get the
> necessary review.
>
> > ---
> > Changes since v1:
> >
> > - The connector .get_modes() operation doesn't rely on EDID anymore,
> >   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
> >   together
> >  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
> >
> > Changes since v2: [Kieran]
> >  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
> >
> > Changes since v3: [Kieran]
> >  - Remove PM calls in ti_sn_bridge_get_edid() and simplify
> >
> > Changes since v4:
> >  - Add .detect()
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 +++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index a6b15ea4e84d..dd20624adc70 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -29,6 +29,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_bridge_connector.h>
> > +#include <drm/drm_edid.h>
> >  #include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> > @@ -68,6 +69,7 @@
> >  #define  BPP_18_RGB                          BIT(0)
> >  #define SN_HPD_DISABLE_REG                   0x5C
> >  #define  HPD_DISABLE                         BIT(0)
> > +#define  HPD_DEBOUNCED_STATE                 BIT(4)
> >  #define SN_GPIO_IO_REG                               0x5E
> >  #define  SN_GPIO_INPUT_SHIFT                 4
> >  #define  SN_GPIO_OUTPUT_SHIFT                        0
> > @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> >       pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +     int val = 0;
> > +
> > +     pm_runtime_get_sync(pdata->dev);
>
> Would this
>
>         int ret;
>
>         ret = pm_runtime_resume_and_get(pdata->dev);
>         if (ret)
>                 return connector_status_disconnected;
>
> (or possibly connector_status_unknown) help avoiding problems ?
>
> Apart from that, the patch looks good to me.
>
> > +     regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > +     pm_runtime_put_autosuspend(pdata->dev);
> > +
> > +     return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > +                                      : connector_status_disconnected;
> > +}
> > +
> > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > +                                       struct drm_connector *connector)
> > +{
> > +     struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > +
> > +     return drm_get_edid(connector, &pdata->aux.ddc);
> > +}
> > +
> >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> >       .mode_valid = ti_sn_bridge_mode_valid,
> > +     .get_edid = ti_sn_bridge_get_edid,
> > +     .detect = ti_sn_bridge_detect,
> >       .atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> >       .atomic_enable = ti_sn_bridge_atomic_enable,
> >       .atomic_disable = ti_sn_bridge_atomic_disable,
> > @@ -1262,6 +1287,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> >       pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
> >                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
> >
> > +     if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > +             pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > +
> >       drm_bridge_add(&pdata->bridge);
> >
> >       ret = ti_sn_attach_host(pdata);
> > --
> > 2.34.1

I think this patch looks good, please add my r-b.

@Laurent: I'll let you apply this, if you want the above suggestion to
be included.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
