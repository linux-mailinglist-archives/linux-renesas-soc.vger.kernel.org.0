Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2379523F8F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 23:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgHHVGy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 17:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHVGy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 17:06:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E28C061756;
        Sat,  8 Aug 2020 14:06:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37A64F9;
        Sat,  8 Aug 2020 23:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596920813;
        bh=wBoG54W+/jDooiVBY76hppIsOwwlaHbKCiW74XOTc/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wbOX5wvD20ZYK7WxF1vHAF8CqhL16GWG0UV+DlPa31b4mjzq1ScU9TPhd3zXeO/VQ
         czp/pItI0cINu6VmtM3ywKTeh1y0QfWFvmxSts4XnT78eu7sXzl5GaIQJ1823T1dUe
         aFGb/Tk8k+yyTnxWCb66QIx2OzNcVLXkHbIc0/pg=
Date:   Sun, 9 Aug 2020 00:06:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 4/7] drm: rcar-du: lvds: Add r8a7742 support
Message-ID: <20200808210631.GQ6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:51PM +0100, Lad Prabhakar wrote:
> The LVDS encoders on RZ/G1H SoC is identical to the R-Car Gen2 family. Add
> support for RZ/G1H (R8A7742) SoC to the LVDS encoder driver.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index ab0d49618cf9..34b833cc05be 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -982,6 +982,7 @@ static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
>  };
>  
>  static const struct of_device_id rcar_lvds_of_table[] = {
> +	{ .compatible = "renesas,r8a7742-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7743-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },

-- 
Regards,

Laurent Pinchart
