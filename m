Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C224E5B18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 23:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345119AbiCWWNC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 18:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241228AbiCWWNA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 18:13:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2C98EB70;
        Wed, 23 Mar 2022 15:11:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61EDC9DE;
        Wed, 23 Mar 2022 23:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648073487;
        bh=Cu9CS4EcUA66RrE2+hvm21/iwXWcI2SNQFBnwa7VelA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uduwI57/WGxWM6rcFpc626bfNvb2SR3SMatQIGW1ipk/Y8xEd+K6E01T46HcdhFiM
         1V1NJQz2j18mbjdGYmWLd4CBPAWIBsGjLdDjKAC8jLHIad4Gofq9YF6N3aAWdW4Ijp
         pMC9Lw+frXy8hsuRmAMc5qazgKOdiUiw+xWzziJU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com> <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com> <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Mar 2022 22:11:25 +0000
Message-ID: <164807348512.1092274.4092058426102648400@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Doug Anderson (2022-03-23 21:47:17)
> Hi,
>=20
> On Thu, Mar 17, 2022 at 6:13 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > @@ -1241,9 +1350,32 @@ static int ti_sn_bridge_probe(struct auxiliary_d=
evice *adev,
> >         pdata->bridge.type =3D pdata->next_bridge->type =3D=3D DRM_MODE=
_CONNECTOR_DisplayPort
> >                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_=
CONNECTOR_eDP;
> >
> > -       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
> >                 pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> >
> > +               if (!pdata->no_hpd)
> > +                       pdata->bridge.ops |=3D DRM_BRIDGE_OP_DETECT;
> > +       }
> > +
> > +       if (!pdata->no_hpd && pdata->irq > 0) {
> > +               ret =3D devm_request_threaded_irq(pdata->dev, pdata->ir=
q, NULL,
> > +                                               ti_sn65dsi86_irq_handle=
r,
> > +                                               IRQF_ONESHOT, "sn65dsi8=
6-irq",
> > +                                               pdata);
> > +               if (ret)
> > +                       return dev_err_probe(pdata->dev, ret,
> > +                                            "Failed to register DP int=
errupt\n");
> > +
> > +               /* Enable IRQ based HPD */
> > +               pdata->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
> > +
> > +               /*
> > +                * Keep the IRQ disabled initially. It will only be ena=
bled when
> > +                * requested through ti_sn_bridge_hpd_enable().
> > +                */
> > +               disable_irq(pdata->irq);
>=20
> Instead, I think you should use `IRQF_NO_AUTOEN` which makes sure that
> no matter what the state of the hardware is your IRQ won't fire
> "early". ...and, of course, it saves a line of code. ;-)
>=20
> Other than that this looks nice to me now so feel free to add my

Aha, thanks, - didn't realise I could do that. I'll remove the
disable_irq, and move the coment above devm_request_threaded_irq, it
still makes sense there with the flag.

I believe I've got the format handling solved on the NO_CONNECTOR patch
from Rob/Sam, so I'm just waiting for some spare cycles to get back and
clean up - and repost the whole of this work as a new series,
incorporating Sam, Rob and Laurent's work with this on top.

--
Kieran


> Reviewed-by tag after the above is fixed.
>=20
> -Doug
