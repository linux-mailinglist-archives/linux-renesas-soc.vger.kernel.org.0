Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 314D06EDA67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Apr 2023 04:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjDYC7y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 22:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjDYC7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 22:59:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC7319BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Apr 2023 19:59:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3652375B;
        Tue, 25 Apr 2023 04:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682391580;
        bh=cvn4DhnPBPMal8Tb5PuWsyC0mX3H2c28QvPlu4ba/Ik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ahw99SUp1Q8PGl1UoX5Sn8kXQOijNZs8iwyLV/GGnonr/Yv7knOCIg4tVXHrcQESQ
         mWzvj5s1A8bKMhbU47hvlDthi4oGfTnXFwEWCDJ2ZFHYjUYqqNzd9rDTjBSzXbjxO1
         9tcixpkbLIHb0kJ8MEBt/FS7ZR6ylC7+fhIxxmO8=
Date:   Tue, 25 Apr 2023 06:00:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 5/5] MAINTAINERS: Add maintainer for RZ DU drivers
Message-ID: <20230425030001.GC11371@pendragon.ideasonboard.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424161024.136316-6-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Apr 24, 2023 at 05:10:24PM +0100, Biju Das wrote:
> Add my self as maintainer for RZ DU drivers.
> While at it, update the entries for rcar-du and shmobile.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v8:
>  * New patch
> ---
>  MAINTAINERS | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1218a2ec6d97..42db5be4482c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6948,7 +6948,7 @@ F:	drivers/gpu/host1x/
>  F:	include/linux/host1x.h
>  F:	include/uapi/drm/tegra_drm.h
>  
> -DRM DRIVERS FOR RENESAS
> +DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:	dri-devel@lists.freedesktop.org
> @@ -6959,9 +6959,18 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
> -F:	drivers/gpu/drm/renesas/
> +F:	drivers/gpu/drm/renesas/rcar-du/
> +F:	drivers/gpu/drm/renesas/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
>  
> +DRM DRIVERS FOR RENESAS RZ
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:	drivers/gpu/drm/renesas/rz-du/
> +
>  DRM DRIVERS FOR ROCKCHIP
>  M:	Sandy Huang <hjc@rock-chips.com>
>  M:	Heiko Stübner <heiko@sntech.de>

-- 
Regards,

Laurent Pinchart
