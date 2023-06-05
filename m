Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F15723019
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 21:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbjFETrv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 15:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235868AbjFETro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 15:47:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49E2115
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 12:47:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AB0C2BC;
        Mon,  5 Jun 2023 21:47:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685994435;
        bh=SagWXUKu17YEY12VTjvQyCfRd1/rjBTIgFk2N0IiizA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=peMRB+vYmBIjh1IcqAkKYgS1WMluCuhv3Zgajrq4N5zsZ9I5yelmVo8gqJZnWWE2B
         A2uhGHmp9T5YbxltUZGVe+ervRGQl5PABExoEec5Zq83vjaEa+rTcv7QSqTc9M5khX
         wD4ze80PRWAkAVCiokdM9EQO7Dv2IaPajmlNvLe0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230604104958.7034-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230604104958.7034-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of KMS init errors
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Mon, 05 Jun 2023 20:47:37 +0100
Message-ID: <168599445763.3090799.10057103910320805653@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2023-06-04 11:49:58)
> The (large) rcar_du_modeset_init() function can fail for many reasons,
> two of two involving probe deferral. Use dev_err_probe() in those code
> paths to record the cause of the probe deferral, in order to help
> debugging probe issues.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Change since v1:
>=20
> - Fix compilation

Always helps ;-)

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 12a8839fe3be..5b752adb1b02 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device *pde=
v)
>         /* DRM/KMS objects */
>         ret =3D rcar_du_modeset_init(rcdu);
>         if (ret < 0) {
> +               /*
> +                * Don't use dev_err_probe(), as it would overwrite the p=
robe
> +                * deferral reason recorded in rcar_du_modeset_init().
> +                */
>                 if (ret !=3D -EPROBE_DEFER)
>                         dev_err(&pdev->dev,
>                                 "failed to initialize DRM/KMS (%d)\n", re=
t);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..78b665984e35 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> =20
>         /* Initialize the Color Management Modules. */
>         ret =3D rcar_du_cmm_init(rcdu);
> -       if (ret)
> +       if (ret) {
> +               dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n=
");

This could remain a single line return statement with:

		return dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n");

Or if you're really concerned about 80 chars:

		return dev_err_probe(rcdu->dev, ret,
				     "failed to initialize CMM\n");

which is still one line cheaper than adding braces to the if statement!

Anyway, either way is functional so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>                 return ret;
> +       }
> =20
>         /* Create the CRTCs. */
>         for (swindex =3D 0, hwindex =3D 0; swindex < rcdu->num_crtcs; ++h=
windex) {
> @@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> =20
>         /* Initialize the encoders. */
>         ret =3D rcar_du_encoders_init(rcdu);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               dev_err_probe(rcdu->dev, ret, "failed to initialize encod=
ers\n");

(same here of course)

>                 return ret;
> +       }
> =20
>         if (ret =3D=3D 0) {
>                 dev_err(rcdu->dev, "error: no encoder could be initialize=
d\n");
> --=20
> Regards,
>=20
> Laurent Pinchart
>
