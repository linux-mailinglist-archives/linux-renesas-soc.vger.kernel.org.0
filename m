Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7384B4A23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 11:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfIQJOR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 05:14:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:30244 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfIQJOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 05:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568711655;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=X70eT9BcUYyLXb8egpwm9Q9sagCspC+jA1g94oae59o=;
        b=dM1eIbrSuxuLJk7rInrQyWF95d0Xs7QaJc2CCm0VEeRXxNWrX51/9dHe23pSZ408UL
        oJJ3absECFYjBsx0v69gL90i7d9eKGaVbnjWiJiMCyyav7mkK677U1bTG4OfRohSncPY
        TYa6u+HzQ7SDblhaVWTbg3YHjqVc4neGpTp97f2Sv6pBuBRKwIeSNBQrvu4hauddGqRA
        bbIQUKOnAiZI5U3qwegkRTHM5PrGHDT8lAr28f8GjNl8tV+nn5YlqqU2aZBdA926kfpf
        PTwCdk9HaZP/W2b1twENnoYV9aydLHbGH808xhVT/kHPhjY+MOYPwr3KTIsJ2Cqd9DDo
        g+Ng==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.27.0 AUTH)
        with ESMTPSA id j02f91v8H9BEA4k
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 17 Sep 2019 11:11:14 +0200 (CEST)
Date:   Tue, 17 Sep 2019 11:11:14 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <662476674.227766.1568711474317@webmail.strato.com>
In-Reply-To: <20190917062353.16966-1-geert+renesas@glider.be>
References: <20190917062353.16966-1-geert+renesas@glider.be>
Subject: Re: [PATCH] drm: rcar_lvds: Fix color mismatches on R-Car H2 ES2.0
 and later
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev20
X-Originating-IP: 85.212.142.246
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On September 17, 2019 at 8:23 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Commit 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk") states
> that LVDS lanes 1 and 3 are inverted on R-Car H2 ES1 only, and that the
> problem has been fixed in newer revisions.
> 
> However, the code didn't take into account the actual hardware revision,
> thus applying the quirk also on newer hardware revisions, causing green
> color reversals.
> 
> Fix this by applying the quirk when running on R-Car H2 ES1.x only.
> 
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Does anyone know if this was fixed in ES2.0, or in any earlier ES1.x?
> 
> While the issue was present before aforementioned commit, I do not think
> there is a real need to fix the older code variant, as the new LVDS
> encoder was backported to v4.14-ltsi.
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
> -- 
> 2.17.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
