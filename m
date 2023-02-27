Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6839D6A40AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 12:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjB0LbN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 06:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjB0LbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:31:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E53E1EBEB;
        Mon, 27 Feb 2023 03:31:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE23556A;
        Mon, 27 Feb 2023 12:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677497465;
        bh=v9QIMXHiIX2q45kNO/iBQh1aBflGm0hbfspKY5Q4vM8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rcCmGVkR5kGXZcDVFczLGugTSbyk19ncTfZAOvnXe+SI2N/BtaB4GrobuxV3XPahH
         KFAd2Z0vxZkYG9rsMWMuHOXRKaAuE58S/+vDc7rIVzCsUwKS3sgAG0B0EleFZivYvD
         asixFwSgW/dmI6DOhsyKGtcT/gKuDyqBMGcfqgLo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y/yAw6sHu82OnOWj@kili>
References: <Y/yAw6sHu82OnOWj@kili>
Subject: Re: [PATCH] drm: rcar-du: Fix a NULL vs IS_ERR() bug
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <error27@gmail.com>
Date:   Mon, 27 Feb 2023 11:31:02 +0000
Message-ID: <167749746289.93391.8800048490344197437@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Dan Carpenter (2023-02-27 10:06:59)
> The drmm_encoder_alloc() function returns error pointers.  It never
> returns NULL.  Fix the check accordingly.

Yes, indeed. Thanks.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Fixes: 7a1adbd23990 ("drm: rcar-du: Use drmm_encoder_alloc() to manage en=
coder")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/=
rcar-du/rcar_du_encoder.c
> index b1787be31e92..7ecec7b04a8d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -109,8 +109,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>         renc =3D drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, =
base,
>                                   &rcar_du_encoder_funcs, DRM_MODE_ENCODE=
R_NONE,
>                                   NULL);
> -       if (!renc)
> -               return -ENOMEM;
> +       if (IS_ERR(renc))
> +               return PTR_ERR(renc);
> =20
>         renc->output =3D output;
> =20
> --=20
> 2.39.1
>
