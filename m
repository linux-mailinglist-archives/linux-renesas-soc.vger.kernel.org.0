Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E64B5A7E51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Aug 2022 15:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiHaNLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Aug 2022 09:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiHaNLG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2022 09:11:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2C22AE28
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2022 06:11:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC8A9481;
        Wed, 31 Aug 2022 15:11:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661951461;
        bh=UFHqiEwG5QqkAhy594zByFXHgmz8zX2tkQuvLCr92Qw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DkyXrNBJpV8BMNHytN28DuDuCidiw7FJnK78zjqXElX7vgqS4G6/mEdvaE/NOMENs
         esLxrB13d31Ox3oees5oXgAzUPsiHmC70/Uw+8rVdajVNjVw3epAkvcmXp4VSbN9Oh
         TZe2TZW5WhRoXyvuy6TzjIOgeeGfnHZPNmrMMdLY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Drop leftovers variables from Makefile
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Wed, 31 Aug 2022 14:10:58 +0100
Message-ID: <166195145849.15972.13693258101479446173@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2022-08-27 01:42:20)
> Commit 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
> compatibility") has removed device tree overlay sources used for
> backward compatibility with old bindings, but forgot to remove related
> variables from the Makefile. Fix it.
>=20
> Fixes: 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward compat=
ibility")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/Makefile | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/M=
akefile
> index e7275b5e7ec8..6f132325c8b7 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -14,10 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)            +=3D rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)         +=3D rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)            +=3D rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)                +=3D rcar_mipi_dsi.o
> -
> -# 'remote-endpoint' is fixed up at run-time
> -DTC_FLAGS_rcar_du_of_lvds_r8a7790 +=3D -Wno-graph_endpoint
> -DTC_FLAGS_rcar_du_of_lvds_r8a7791 +=3D -Wno-graph_endpoint
> -DTC_FLAGS_rcar_du_of_lvds_r8a7793 +=3D -Wno-graph_endpoint
> -DTC_FLAGS_rcar_du_of_lvds_r8a7795 +=3D -Wno-graph_endpoint
> -DTC_FLAGS_rcar_du_of_lvds_r8a7796 +=3D -Wno-graph_endpoint
>=20
> base-commit: 2c2d7a67defa198a8b8148dbaddc9e5554efebc8
> --=20
> Regards,
>=20
> Laurent Pinchart
>
