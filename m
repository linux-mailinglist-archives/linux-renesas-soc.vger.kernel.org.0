Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2445A6728F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 21:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjARUDV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 15:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjARUDQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 15:03:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C292D59B47
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 12:02:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 153231056;
        Wed, 18 Jan 2023 21:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674072158;
        bh=RWOtLYR+RaQRE6WCaZmtVaCwx8zGYVzjxkzcmN+lgac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lt6NHGVLHObdo3Fm/8dXRHGzxT9LdFXIzdDcD+G3BU/SLSfN8PyfhjBQffzRAt86I
         wAsCoDD0WvCe63rRHJBFLgR1MryiQ2d89L0/JiXSBVaPUWeVT6gZv3nv4L5rXmzI1y
         j8JDLGwat2scetT4aR2/52JYDlhjG7s3Q04NtyLw=
Date:   Wed, 18 Jan 2023 22:02:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] drm: rcar-du: dsi: add 'select RESET_CONTROLLER'
Message-ID: <Y8hQW23gf73rgRhc@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-2-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:49PM +0200, Tomi Valkeinen wrote:
> The RCAR DSI driver uses reset controller, so we should select it in the
> Kconfig.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index fd2c2eaee26b..a8f862c68b4f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -55,6 +55,7 @@ config DRM_RCAR_MIPI_DSI
>  	def_tristate DRM_RCAR_DU
>  	depends on DRM_RCAR_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +	select RESET_CONTROLLER
>  
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM

-- 
Regards,

Laurent Pinchart
