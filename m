Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6F714CBD41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbiCCMBI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiCCMBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:01:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE4E16DAD8
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:00:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C8B1027;
        Thu,  3 Mar 2022 13:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646308819;
        bh=LINoj1eRyRokNcOfj+X8FwRZsCXkdmmejy92Uas5GdU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XDlkPf2KEpwYZpqnf7PS1Sg7y3BoTKE/Tl+epDasitGYnUsLafWqHupcmeniWzw5z
         0kWWg5M2EnhW0VVXS/J+UpTfnLLj+W0rMfRBHTzjCFkHlipmbEhkWjAnmCZuO9/VLB
         sJGS8Qs21XV0ZIeQkXuzYNzJZqfGGgMMv16y1spQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com> <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 2/2] drm: rcar-du: Don't restart group when enabling plane on Gen3
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Thu, 03 Mar 2022 12:00:17 +0000
Message-ID: <164630881737.3471399.5762223685912960284@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-02-21 17:13:40)
> On Gen3 hardware enabling a VSP plane doesn't change any register that
> requires DRES to take effect. Avoid a group restart in that case.

This also makes it clear that the need_restart is due to the change
occuring in the VSP1 sink, so I think this is cleaner all round.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 9 ---------
>  2 files changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index 9b058d6cb032..22aeeb1cc1fb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -560,6 +560,12 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgr=
p,
>                 if (rcdu->vspd1_sink !=3D vspd1_sink) {
>                         rcdu->vspd1_sink =3D vspd1_sink;
>                         rcar_du_set_dpad0_vsp1_routing(rcdu);
> +
> +                       /*
> +                        * Changes to the VSP1 sink take effect on DRES a=
nd thus
> +                        * need a restart of the group.
> +                        */
> +                       rgrp->need_restart =3D true;
>                 }
>         }
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar=
-du/rcar_du_vsp.c
> index b7fc5b069cbc..32530d698e75 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -84,15 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
> =20
>         __rcar_du_plane_setup(crtc->group, &state);
> =20
> -       /*
> -        * Ensure that the plane source configuration takes effect by req=
uesting
> -        * a restart of the group. See rcar_du_plane_atomic_update() for =
a more
> -        * detailed explanation.
> -        *
> -        * TODO: Check whether this is still needed on Gen3.
> -        */
> -       crtc->group->need_restart =3D true;
> -
>         vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
