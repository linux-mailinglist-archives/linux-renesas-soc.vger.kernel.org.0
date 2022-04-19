Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A099D507A51
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 21:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343912AbiDSTg7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 15:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbiDSTg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 15:36:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF73B2AC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 12:34:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9188F25B;
        Tue, 19 Apr 2022 21:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650396852;
        bh=LCGrXtaW0w6WZPepYNtxm5kzk8jV96rIVGLdX2wU83Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QVJCzEkTcngbIIDhFihYEm6mfXUQknbfh6paj7eBA0rnQcbXj3m/9ULzTtlC8zZH8
         c64g6wZQeOcQXNE+57UPrVZshhbkKxOBgyrPenE76L2jS2QpS9iOINRQXduX9zjQMi
         1tvZTfAftz8Zw/JvSSSvMhoBrZvNMUeHiv1cqITY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
References: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on HPD interrupt
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sam Ravnborg <sam@ravnborg.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>
Date:   Tue, 19 Apr 2022 20:34:10 +0100
Message-ID: <165039685035.2572957.11698995076786964955@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2022-04-19 15:24:53)
> Connector detection using poll method won't work in case of bridge
> attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
> the code defaults to HPD.
>=20
> Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
> it will fall back to polling, if HPD is not available.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 668dcefbae17..b3f10c54e064 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, c=
onst struct i2c_device_id *id)
>                 goto err_unregister_cec;
> =20
>         adv7511->bridge.funcs =3D &adv7511_bridge_funcs;
> -       adv7511->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> -                           | DRM_BRIDGE_OP_HPD;
> +       adv7511->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +       if (adv7511->i2c_main->irq)
> +               adv7511->bridge.ops |=3D DRM_BRIDGE_OP_HPD;
> +
>         adv7511->bridge.of_node =3D dev->of_node;
>         adv7511->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> =20
> --=20
> 2.25.1
>
