Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCE646D2D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 12:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhLHMA4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 07:00:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51432 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhLHMA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 07:00:56 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F73E8BB;
        Wed,  8 Dec 2021 12:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638964643;
        bh=CKBjaisU+3LuznPUGI3S80xtFDixfFdrhQCc78D6Z+E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rqMicXuGg9TqslZLSmHg/2YdeTuOqCdX1bSrxOKW1l9CX/Hfa+EDWWOl/LLF1km9d
         mJ1zJEKOr7QVSAFPgcPYKCMyLxtkg4rNtBO+ZbvW1SFYUxTpx5iynycxZMIUYzWmMH
         SM05j/ui0/maT8hSLM0xGIY0v2IRHJdTppnuwBHQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed, 08 Dec 2021 11:57:21 +0000
Message-ID: <163896464129.995700.3492964836875185548@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> Use the dev_err_probe() helper, instead of open-coding the same
> operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
>         /* DRM/KMS objects */
>         ret =3D rcar_du_modeset_init(rcdu);
>         if (ret < 0) {
> -               if (ret !=3D -EPROBE_DEFER)
> -                       dev_err(&pdev->dev,
> -                               "failed to initialize DRM/KMS (%d)\n", re=
t);
> +               dev_err_probe(&pdev->dev, ret,
> +                             "failed to initialize DRM/KMS\n");

I've just learned that dev_err_probe() sets a 'reason' for the deferral.
Seems like a nice feature when exploring devices that are still waiting
to probe. Is the message still appropriate enough in that case?

I think it's probably fine, so

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>                 goto error;
>         }
> =20
> --=20
> 2.25.1
>
