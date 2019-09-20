Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11AE8B9ACF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2019 01:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407172AbfITXkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 19:40:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407151AbfITXkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 19:40:15 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 078C12F9;
        Sat, 21 Sep 2019 01:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569022813;
        bh=th6OfiK8YccTX5hw1mrdJ3Dr5/om0XbzXVyoneLJQio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MhFmvpEOqmF/Z31KnGvEGJ80pPLQ7WjqVe/yG5Pkzn56Ps96mXjoFXocK6QBhAyKL
         aADvJ8pVpPus0o3gcEewaXhn0DTrfATHLFLIXVQUDEzYmkQSTVP73y0cEZXc1frkgd
         eLxBGBtu+4jFGPB3EeFVJKphNQ0lRAMcsjS/9W+g=
Date:   Sat, 21 Sep 2019 02:40:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar_lvds: Fix color mismatches on R-Car H2 ES2.0
 and later
Message-ID: <20190920234003.GJ12672@pendragon.ideasonboard.com>
References: <20190917062353.16966-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190917062353.16966-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Sep 17, 2019 at 08:23:53AM +0200, Geert Uytterhoeven wrote:
> Commit 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk") states
> that LVDS lanes 1 and 3 are inverted on R-Car H2 ES1 only, and that the
> problem has been fixed in newer revisions.
> 
> However, the code didn't take into account the actual hardware revision,
> thus applying the quirk also on newer hardware revisions, causing green
> color reversals.

Oops :-S

> Fix this by applying the quirk when running on R-Car H2 ES1.x only.
> 
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")

Shouldn't this be

Fixes: 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk")

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Does anyone know if this was fixed in ES2.0, or in any earlier ES1.x?

Or if there's any ES1.x other than ES1.0 ? :-)

> While the issue was present before aforementioned commit, I do not think
> there is a real need to fix the older code variant, as the new LVDS
> encoder was backported to v4.14-ltsi.

Probably not, but I think there's still value in pointing to the right
erroneous commit. It's a Fixes: tag, not a Backport-up-to: tag :-)

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 3fc7e6899cab5843..50c11a7f0467f746 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/sys_soc.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -842,8 +843,23 @@ static int rcar_lvds_get_clocks(struct rcar_lvds *lvds)
>  	return 0;
>  }
>  
> +static const struct rcar_lvds_device_info rcar_lvds_r8a7790es1_info = {
> +	.gen = 2,
> +	.quirks = RCAR_LVDS_QUIRK_LANES,
> +	.pll_setup = rcar_lvds_pll_setup_gen2,
> +};
> +
> +static const struct soc_device_attribute lvds_quirk_matches[] = {
> +	{
> +		.soc_id = "r8a7790", .revision = "ES1.*",

Do you mind splitting this in two lines ?

With these small issues fixes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please let me know if I should fix while applying or if you want to send
a new version.

> +		.data = &rcar_lvds_r8a7790es1_info,
> +	},
> +	{ /* sentinel */ }
> +};
> +
>  static int rcar_lvds_probe(struct platform_device *pdev)
>  {
> +	const struct soc_device_attribute *attr;
>  	struct rcar_lvds *lvds;
>  	struct resource *mem;
>  	int ret;
> @@ -857,6 +873,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	lvds->dev = &pdev->dev;
>  	lvds->info = of_device_get_match_data(&pdev->dev);
>  
> +	attr = soc_device_match(lvds_quirk_matches);
> +	if (attr)
> +		lvds->info = attr->data;
> +
>  	ret = rcar_lvds_parse_dt(lvds);
>  	if (ret < 0)
>  		return ret;
> @@ -893,12 +913,6 @@ static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
>  	.pll_setup = rcar_lvds_pll_setup_gen2,
>  };
>  
> -static const struct rcar_lvds_device_info rcar_lvds_r8a7790_info = {
> -	.gen = 2,
> -	.quirks = RCAR_LVDS_QUIRK_LANES,
> -	.pll_setup = rcar_lvds_pll_setup_gen2,
> -};
> -
>  static const struct rcar_lvds_device_info rcar_lvds_gen3_info = {
>  	.gen = 3,
>  	.quirks = RCAR_LVDS_QUIRK_PWD,
> @@ -930,7 +944,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
>  	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },
>  	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
> -	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
> +	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
>  	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },

-- 
Regards,

Laurent Pinchart
