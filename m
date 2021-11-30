Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42330463C4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 17:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239221AbhK3Qzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 11:55:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238952AbhK3Qzm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 11:55:42 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6E938F0;
        Tue, 30 Nov 2021 17:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638291141;
        bh=/qo/1h+AI+95RAVaCrSem/C7p8191icfDAyS7X505+o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AI4r0unlo95F6nqxljkuVGR0mRJ3qZuIIdaoQZFTLG/1ERwMee3D13Qhr163vjMoK
         +e1PXTi+DYF/Czq5aaXoQegiB2r9rnVugg2uaJ5amOEWSjhcLCncXjPnpQO1VujXQc
         azKOQM9kvc+FNc3K+xl03p0CZkvH3adhnnc3Pa+U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com> <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm: rcar-du: mipi-dsi: Use devm_drm_of_get_bridge helper
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Date:   Tue, 30 Nov 2021 16:52:19 +0000
Message-ID: <163829113971.3059017.15142528562599981704@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Quoting Kieran Bingham (2021-11-30 16:25:13)
> Instead of open coding the calls for
>   drm_of_find_panel_or_bridge()
>   devm_drm_panel_bridge_add()
>=20
> use the devm_drm_of_get_bridge() helper directly.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - New patch
>=20
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rc=
ar-du/rcar_mipi_dsi.c
> index 0a9f197ef62c..1dfe20d3d0f2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -637,7 +637,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_=
host *host,
>                                         struct mipi_dsi_device *device)
>  {
>         struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> -       struct drm_panel *panel;
> +       struct device *dev =3D dsi->dev;
>         int ret;
> =20
>         if (device->lanes > dsi->num_data_lanes)
> @@ -646,20 +646,9 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi=
_host *host,
>         dsi->lanes =3D device->lanes;
>         dsi->format =3D device->format;
> =20
> -       ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &pan=
el,
> -                                         &dsi->next_bridge);
> -       if (ret) {
> -               dev_err_probe(dsi->dev, ret, "could not find next bridge\=
n");
> -               return ret;
> -       }
> -
> -       if (!dsi->next_bridge) {
> -               dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, =
panel);
> -               if (IS_ERR(dsi->next_bridge)) {
> -                       dev_err(dsi->dev, "failed to create panel bridge\=
n");
> -                       return PTR_ERR(dsi->next_bridge);
> -               }
> -       }
> +       dsi->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1,=
 0);
> +       if (IS_ERR(dsi->next_bridge))
> +               return PTR_ERR(dsi->next_bridge);

I did make a change here to make this:

	dsi->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
	if (IS_ERR(dsi->next_bridge)) {
		dev_err(dev, "failed to get next bridge\n");
		return PTR_ERR(dsi->next_bridge);
	}

But it seems I got out of sequence and saved out the wrong patch ;-(

If you think it's better with the error print, please add it while
squashing, or if you really need, I can send an updated patch and
retest.

--
Kieran


> =20
>         /* Initialize the DRM bridge. */
>         dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> --=20
> 2.30.2
>
