Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E1A4D461D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 12:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbiCJLov (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 06:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233471AbiCJLop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 06:44:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4399F13FACF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 03:43:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B19494AB;
        Thu, 10 Mar 2022 12:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646912621;
        bh=vhSlSbIAIeTx7W4jXct0DPFUBYu3d62MHycSYQkm0MI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EkcBlfSYOxzP83BhaSG840F7DenwPXdhwrzPCCHeaq0mK2tpiwm0G+Bcwk4nHnAib
         rC3GYS5Kh1R/iX9/Tx2d0srr9eh3PhOxIJUG8tBoSc6kCld/DFaqePWDbooslowjjJ
         AJbHcHV2MsXyURM5bc6G8qWvsPttM0MtAIF5UBfM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-2-kieran.bingham+renesas@ideasonboard.com> <CAD=FV=VAwCzQvCPzAOk9i8u7-pfbO3cGVa8nqj6V1eQc8mRwFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Implement bridge connector operations
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
To:     Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Mar 2022 11:43:38 +0000
Message-ID: <164691261863.11309.15102491071451078046@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Doug,

Quoting Doug Anderson (2022-03-07 19:52:08)
> Hi,
>=20
> On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Implement the bridge connector-related .get_edid() operation, and report
> > the related bridge capabilities and type.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - The connector .get_modes() operation doesn't rely on EDID anymore,
> >   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
> >   together
> >
> > Notes from Kieran:
> >
> > RB Tags collected from:
> >  https://lore.kernel.org/all/20210322030128.2283-9-laurent.pinchart+ren=
esas@ideasonboard.com/
> >
> > However this was over a year ago, so let me know if other patches now
> > superceed this one or otherwise invalidate this update.
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index c55848588123..ffb6c04f6c46 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1154,6 +1154,19 @@ static void ti_sn_bridge_post_disable(struct drm=
_bridge *bridge)
> >         pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > +                                         struct drm_connector *connect=
or)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +       struct edid *edid;
> > +
> > +       pm_runtime_get_sync(pdata->dev);
> > +       edid =3D drm_get_edid(connector, &pdata->aux.ddc);
> > +       pm_runtime_put_autosuspend(pdata->dev);
> > +
> > +       return edid;
> > +}
> > +
> >  static const struct drm_bridge_funcs ti_sn_bridge_funcs =3D {
> >         .attach =3D ti_sn_bridge_attach,
> >         .detach =3D ti_sn_bridge_detach,
> > @@ -1162,6 +1175,7 @@ static const struct drm_bridge_funcs ti_sn_bridge=
_funcs =3D {
> >         .enable =3D ti_sn_bridge_enable,
> >         .disable =3D ti_sn_bridge_disable,
> >         .post_disable =3D ti_sn_bridge_post_disable,
> > +       .get_edid =3D ti_sn_bridge_get_edid,
> >  };
> >
> >  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > @@ -1248,6 +1262,8 @@ static int ti_sn_bridge_probe(struct auxiliary_de=
vice *adev,
> >
> >         pdata->bridge.funcs =3D &ti_sn_bridge_funcs;
> >         pdata->bridge.of_node =3D np;
> > +       pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> > +       pdata->bridge.type =3D DRM_MODE_CONNECTOR_eDP;
>=20
> This doesn't look right to me. In the eDP case the EDID reading is
> driven by the panel.

Now that I have the optional connector working based on Sam's series I
think this is the last issue to solve before reposting the DP/HPD
support.

Are you saying that the bridge.ops should only set DRM_BRIDGE_OP_EDID
when pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort?

--
Regards

Kieran


>=20
> -Doug
