Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258824D4C58
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 16:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245297AbiCJOzY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 09:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346783AbiCJOuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 09:50:02 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2CC18A78F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 06:44:53 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w4so7252618edc.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 06:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyJ8K0Z8v0ylejCiK6GPtbAsL2ts5My3FPwBQpZAY0U=;
        b=Bnhq8fAqIddoSbfo50FDK69lba+a1Awliu1kV/ZAiWIejTswDtoOgge+HBYtwIVsIf
         9pe9O3vNnwKBjY6NhCEgPgvy9Mn5+xqoRWLKA4vO7EBKn9irvjtOkc4C/RQDV1ydcXih
         hZuMpq0hKluouylLopa9f2WfYp24HkzDofWKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyJ8K0Z8v0ylejCiK6GPtbAsL2ts5My3FPwBQpZAY0U=;
        b=6XNmm/5XX2GrrYCOssgO8mAFVRgvHC2B884e4vrYs+IVL4zrs3xvrFnkEOd4x+Fr+1
         VEirY1M+E1NHVW5/MumqEq6RK+WjMDyTTOfxozisBSaZIDQKWmIbnAzK5lYVrcyq1FXI
         hGxAJdpYcQFWYDZDYpb+e7AOgeEL04aGdiU0GbzAlcRyTCQ6IGkYzIU8j68pwMLQ8puy
         vui24InNJGx1p1iFl09tBL1spJVVimEI0OeVH+wf2VziFnrU+0bTWY6JBj1P5tJekFuq
         x/QtV3LItmwN984Vfaj2/jPDFkfsGh2r+uaqs1X7tEOqCLhrmrTG5kPnvAUIY1m8zlkP
         zyWQ==
X-Gm-Message-State: AOAM532BqJrF4jpCx/X7IAM98I/3Qkwtpez8/JLLFS8/xs+zckUEFinr
        b9WYL7tp2V7pLbiMK/GolvginKw5lhuvp2iy
X-Google-Smtp-Source: ABdhPJxpyudzCvxIJW7o+UxbBbOfvU5tk/cI3Njd9iQFzYcj7UhUM2Ejx4cfaDJiLN1i9rd2Pp8JlA==
X-Received: by 2002:a05:6402:374:b0:415:e849:2935 with SMTP id s20-20020a056402037400b00415e8492935mr4628569edw.47.1646923492239;
        Thu, 10 Mar 2022 06:44:52 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id qb30-20020a1709077e9e00b006d6f8c77695sm1847940ejc.101.2022.03.10.06.44.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 06:44:50 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id q14so8349553wrc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 06:44:50 -0800 (PST)
X-Received: by 2002:a5d:5232:0:b0:1f7:7c4c:e48 with SMTP id
 i18-20020a5d5232000000b001f77c4c0e48mr3662274wra.679.1646923489694; Thu, 10
 Mar 2022 06:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com> <164691261863.11309.15102491071451078046@Monstersaurus>
In-Reply-To: <164691261863.11309.15102491071451078046@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Mar 2022 06:44:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WXtJcVBp7wb2pDfnZpyZyAHJ57Uxt0+kGS5_pqB4jijw@mail.gmail.com>
Message-ID: <CAD=FV=WXtJcVBp7wb2pDfnZpyZyAHJ57Uxt0+kGS5_pqB4jijw@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 3:43 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Doug,
>
> Quoting Doug Anderson (2022-03-07 19:52:08)
> > Hi,
> >
> > On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> > >
> > > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >
> > > Implement the bridge connector-related .get_edid() operation, and report
> > > the related bridge capabilities and type.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > >
> > > - The connector .get_modes() operation doesn't rely on EDID anymore,
> > >   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
> > >   together
> > >
> > > Notes from Kieran:
> > >
> > > RB Tags collected from:
> > >  https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
> > >
> > > However this was over a year ago, so let me know if other patches now
> > > superceed this one or otherwise invalidate this update.
> > >
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index c55848588123..ffb6c04f6c46 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > >         pm_runtime_put_sync(pdata->dev);
> > >  }
> > >
> > > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > > +                                         struct drm_connector *connector)
> > > +{
> > > +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > > +       struct edid *edid;
> > > +
> > > +       pm_runtime_get_sync(pdata->dev);
> > > +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> > > +       pm_runtime_put_autosuspend(pdata->dev);
> > > +
> > > +       return edid;
> > > +}
> > > +
> > >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> > >         .attach = ti_sn_bridge_attach,
> > >         .detach = ti_sn_bridge_detach,
> > > @@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> > >         .enable = ti_sn_bridge_enable,
> > >         .disable = ti_sn_bridge_disable,
> > >         .post_disable = ti_sn_bridge_post_disable,
> > > +       .get_edid = ti_sn_bridge_get_edid,
> > >  };
> > >
> > >  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > > @@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> > >
> > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > >         pdata->bridge.of_node = np;
> > > +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
> >
> > This doesn't look right to me. In the eDP case the EDID reading is
> > driven by the panel.
>
> Now that I have the optional connector working based on Sam's series I
> think this is the last issue to solve before reposting the DP/HPD
> support.
>
> Are you saying that the bridge.ops should only set DRM_BRIDGE_OP_EDID
> when pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort?

Yes.

-Doug
