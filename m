Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144C74D3102
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 15:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbiCIOcg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 09:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiCIOcf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 09:32:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F801520FE
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 06:31:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D333482;
        Wed,  9 Mar 2022 15:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646836294;
        bh=LEOW4OYA5U//mJD9N030KJ3+JFOrhIDuwhZRHkcIc1o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=guijci/wwWHZl0h0pBr3u6DHgcS1LrTif0Rg8i2NHAqYxv3GyFDoXn964e6QpMmrl
         yWh7wt9Ih2DmAf33yatYthIbg3hgeiCspSQcnMh6cV8ka2553FUk4VjoCrcLTB8vpw
         sGRpxl48nT23iewtKlzsSiL17sjjenWR8DZMAw8A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com> <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Support hotplug detection
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
To:     Doug Anderson <dianders@chromium.org>
Date:   Wed, 09 Mar 2022 14:31:31 +0000
Message-ID: <164683629185.123014.16028460289820448890@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Doug Anderson (2022-03-07 23:22:17)
> Hi,
>=20
> On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > @@ -1264,6 +1321,14 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >                 return PTR_ERR(pdata->next_bridge);
> >         }
> >
> > +       pdata->no_hpd =3D of_property_read_bool(np, "no-hpd");
> > +       if (pdata->next_bridge->type !=3D DRM_MODE_CONNECTOR_DisplayPor=
t &&
> > +           !pdata->no_hpd) {
> > +               dev_warn(pdata->dev,
> > +                        "HPD support requires a DisplayPort connector\=
n");
>=20
> Maybe "HPD support only implemented for full DP connectors".
>=20
> Plausibly someone could come up with a reason to hook HPD up for eDP
> one day, but so far we haven't seen it.
>=20

Ok, updated.


>=20
> > @@ -1272,7 +1337,8 @@ static int ti_sn_bridge_probe(struct auxiliary_de=
vice *adev,
> >
> >         pdata->bridge.funcs =3D &ti_sn_bridge_funcs;
> >         pdata->bridge.of_node =3D np;
> > -       pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> > +       pdata->bridge.ops =3D (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT=
 | DRM_BRIDGE_OP_HPD)
> > +                         | DRM_BRIDGE_OP_EDID;
>=20
> Seems like "OP_HPD" ought to be dependent on whether the IRQ was
> provided, right? AKA you could have "detect" because HPD is plumbed
> through to the bridge but not "HPD" if the IRQ from the bridge isn't
> hooked up to the main processor...

Yes, I think that's right. If there's no IRQ, then OP_HPD shouldn't be
set, and it will fall back to polling.

I'll fix that up.

> > @@ -1840,6 +1906,34 @@ static int ti_sn65dsi86_parse_regulators(struct =
ti_sn65dsi86 *pdata)
> >                                        pdata->supplies);
> >  }
> >
> > +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D arg;
> > +       int ret;
> > +       int hpd;
>=20
> `hpd` should be an `unsigned int` to match the prototype of regmap-read.

Agreed, and updated.

> > @@ -1881,6 +1975,16 @@ static int ti_sn65dsi86_probe(struct i2c_client =
*client,
> >                 return dev_err_probe(dev, PTR_ERR(pdata->refclk),
> >                                      "failed to get reference clock\n");
> >
> > +       if (client->irq > 0) {
> > +               ret =3D devm_request_threaded_irq(dev, client->irq, NUL=
L,
> > +                                               ti_sn65dsi86_irq_handle=
r,
> > +                                               IRQF_ONESHOT, "sn65dsi8=
6-irq",
> > +                                               pdata);
> > +               if (ret)
> > +                       return dev_err_probe(dev, ret,
> > +                                            "Failed to register DP int=
errupt\n");
> > +       }
>=20
> Is this the right place to request the IRQ, or should it be in
> ti_sn_bridge_probe(). As soon as you request it the interrupt can go
> off, but you're relying on a bunch of bridge stuff to have been
> initted, right?

Indeed, it will be relying upon the bridge to have been set up.

You're right I believe, ti_sn_bridge_probe() sounds reasonable. And only
after that should we enable the interrupts.

Fixing ... (But getting stuck/blocked by the connector changes, so ..
I'll keep plowing through).

> > @@ -1888,6 +1992,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *=
client,
> >         pm_runtime_set_autosuspend_delay(pdata->dev, 500);
> >         pm_runtime_use_autosuspend(pdata->dev);
> >
> > +       /* Enable interrupt handling */
> > +       regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
>=20
> Shouldn't we only enable interrupt handling if client->irq > 0? AKA
> combine this with the "if" statement?

Agreed.

> -Doug
