Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE1226B002
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 23:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbgIOV4C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 17:56:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41866 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgIOV3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 17:29:25 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 550EFFD8;
        Tue, 15 Sep 2020 23:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600205328;
        bh=1fW+9ODHyTgtpvCwB+LlP1H9FsiLZbbOxUQHapfO7TY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DcjNrdPzbHAOZWxm8YFvpLv4pptFk+HGV4svfxm0j9nuLZxzQanTUzdQcbIOJ6+Sf
         8/a+AfI9tY+liC8t9CkZLm4PwIfy27IUaAO24PaWTbqlJDR07/FvsNNbec1YYsTGtb
         L4TsMTNSNWCKNdeEw67z2jFZvtoLoHgdk7j7GVXE=
Date:   Wed, 16 Sep 2020 00:28:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] drm: Kconfig: Update description for DRM_RCAR_DW_HDMI
 config
Message-ID: <20200915212819.GD3998@pendragon.ideasonboard.com>
References: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Sep 11, 2020 at 11:07:41AM +0100, Lad Prabhakar wrote:
> rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoC's, update the
> same to reflect the description for DRM_RCAR_DW_HDMI config.

I'm not sure what you mean by "the same" here. I'd propose

The rcar_dw_hdmi driver is also used on Renesas RZ/G2 SoCs. Update the
Kconfig entry description to reflect this.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you're fine with that, there's no need to resubmit the patch.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index f65d1489dc50..bd8b43fb9753 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,11 +22,11 @@ config DRM_RCAR_CMM
>  	  Enable support for R-Car Color Management Module (CMM).
>  
>  config DRM_RCAR_DW_HDMI
> -	tristate "R-Car DU Gen3 HDMI Encoder Support"
> +	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
>  	depends on DRM && OF
>  	select DRM_DW_HDMI
>  	help
> -	  Enable support for R-Car Gen3 internal HDMI encoder.
> +	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
>  
>  config DRM_RCAR_LVDS
>  	tristate "R-Car DU LVDS Encoder Support"

-- 
Regards,

Laurent Pinchart
