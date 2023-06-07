Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8C772697C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jun 2023 21:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjFGTIp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jun 2023 15:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjFGTIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jun 2023 15:08:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4301BF7
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jun 2023 12:08:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A9C74C;
        Wed,  7 Jun 2023 21:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686164896;
        bh=ZOTDgtRUgCUf414TEguEdP0S//himxbkPJH1gvrQNdg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RWopiw4wojJQ/Uf5CTq9+i0UTmBrNObdz+sD+n76k16PfkmSm9N4xA+X7y4DHAySY
         hqG1IBL9IU1y/Vaw7bopZShtrygsUKB49xzSmajK9UxdO1xxtYssJvQwEnJheRf0Qt
         +Wv/WW86OEdWHgadLlbNgJZM1oXqpBte+KFrgA1s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace DRM_INFO() with drm_info()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Wed, 07 Jun 2023 20:08:39 +0100
Message-ID: <168616491938.1159722.12181260879239007363@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2023-05-30 10:26:39)
> drm_info() adds proper context to the kernel log message, as it receives
> the drm_device pointer. It is thus preferred over DRM_INFO(). Replace
> the latter with the former.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 91095f9deb8b..fe4d3b3c9b0c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -713,7 +713,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>         if (ret)
>                 goto error;
> =20
> -       DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
> +       drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
> =20
>         drm_fbdev_generic_setup(&rcdu->ddev, 32);
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
