Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C145A32BC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Aug 2022 01:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238322AbiHZXmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 19:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbiHZXmv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 19:42:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952EAE42F8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 16:42:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5264120A;
        Sat, 27 Aug 2022 01:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661557367;
        bh=4Dvzd8Qt8F/N2QEWmU3+l627VznMmWv23c/4F/253jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eWHIOTk5WBrZ59pg4KvOcLWFYBJfDkJCOOLK5ODc3Sbozio0noaoM2Iz8QW32/+6E
         BjmMOLiSOUwCFjKy+LUK+pG6CXeMZE6lu/27NvIzIUgBlbdJQ9MT7pH/hD3cjGPmOa
         RXTJLCO7hNoPwyYsw40ZPpmdpE1JOPTlsHgAdDv4=
Date:   Sat, 27 Aug 2022 02:42:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] drm: rcar-du: Drop unused encoder header files
Message-ID: <YwlacAoQgITHrrpt@pendragon.ideasonboard.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Thu, Aug 25, 2022 at 11:39:04AM +0100, Biju Das wrote:
> Drop unused header files from rcar_du_encoder.c
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 60d6be78323b..bfd5c087eb0a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -9,18 +9,13 @@
>  
>  #include <linux/export.h>
>  #include <linux/of.h>
> -#include <linux/slab.h>
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_managed.h>
> -#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> -#include "rcar_du_kms.h"
>  #include "rcar_lvds.h"
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
