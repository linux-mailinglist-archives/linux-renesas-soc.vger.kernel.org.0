Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3891525FD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 12:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350241AbiEMKPV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 06:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiEMKPT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 06:15:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B4227EB85
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 May 2022 03:15:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 497DD5A4;
        Fri, 13 May 2022 12:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652436915;
        bh=iYmkML+vl0LJ0Ak1nVMPFnrebvvh9tOSY6bzl1L3XyU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CxXVQi6xZlZGnIualJ5kXlnY4PlHidXteRUCDZ4CYEn85TUuul75g1cWxV0bwQcP7
         9vnFTTEeNqiNDobkwHrV8miXXjjAqjWSo2Rr4i+nksTfXhXtJISQ+dGzr+dbg+UZlN
         kdp1Hp+utADYrTE3L/rRk6qCZWyuvJFL9D3qlxJI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
References: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>
Date:   Fri, 13 May 2022 11:15:12 +0100
Message-ID: <165243691268.2416244.4640685679737534741@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2022-04-26 09:41:57)
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>=20
> As per R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf,
> unexpected image output(such as incorrect colors or planes being
> invisible) can happen on the below conditions, as PnALPHAR register
> is not initialized by reset.
>=20
> When alpha blending (PpMRm.PpSPIM=3D0b101) is performed and:
>         =E2=80=A2two Planes are enabled on any DUn (n=3D0,1,2,3)
>                 oDSPRn=3D 0x0000 0031 or 0x0000 0013
>         =E2=80=A2or DU0 and DU1 is used for display at the same time
>                 oDSPR0=3D 0x0000 0001 and DSPR1=3D 0x0000 0003
>                 oDSPR0=3D 0x0000 0003 and DSPR1=3D 0x0000 0001
>         =E2=80=A2or DU2 and DU3(H3 Only) is used for display at the same =
time
>                 oDSPR2=3D 0x0000 0001 and DSPR3=3D 0x0000 0003
>                 oDSPR2=3D 0x0000 0003 and DSPR3=3D 0x0000 0001
>=20
> This patch set PnALPHAR register to 0 to avoid this issue.
>=20
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description
>  * Updated the code comments
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rc=
ar-du/rcar_du_plane.c
> index f214a8b6cfd3..aa80c44dd8d7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -510,6 +510,18 @@ static void rcar_du_plane_setup_format_gen3(struct r=
car_du_group *rgrp,
> =20
>         rcar_du_plane_write(rgrp, index, PnDDCR4,
>                             state->format->edf | PnDDCR4_CODE);
> +
> +       /*
> +        * On Gen3, some DU channels have two planes, each being wired to=
 a
> +        * separate VSPD instance. The DU can then blend two planes. While
> +        * this feature isn't used by the driver, issues related to alpha
> +        * blending (such as incorrect colors or planes being invisible) =
may
> +        * still occur if the PnALPHAR register has a stale value. Set the
> +        * register to 0 to avoid this.
> +        */
> +

Sounds reasonable.

> +       /* TODO: Check if alpha-blending should be disabled in PnMR. */

How will this be done? Do you have a specific test in mind to determine
if it causes issues? Or does it need validating through the hardware
teams?



> +       rcar_du_plane_write(rgrp, index, PnALPHAR, 0);


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>  }
> =20
>  static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
> --=20
> 2.25.1
>
