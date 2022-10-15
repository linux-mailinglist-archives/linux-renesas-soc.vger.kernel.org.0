Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982B85FFB1A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Oct 2022 17:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJOPv6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 15 Oct 2022 11:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiJOPv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 11:51:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A134F390
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Oct 2022 08:51:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8E2B480;
        Sat, 15 Oct 2022 17:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665849114;
        bh=7oMy/aBqrhTf68SvCTY/lmiiYuiwCnZUj4vWaGuVS0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Op3aDy1LFc2MT79eG/u4Ww6Rdv1Q4iJm7TeAmY4T4iUGtQVTJO8Bqyfe9VgUuRGoo
         MR951x8E9+ZjJHxVsRSXG4rHCXG+BKtR0CSbCX5PDsSz4AwiJsH4PhaS1vppk6ypPZ
         GuWcYLQyOpAnS7s+ay3qdv73cCfw3lmrzlwKV468=
Date:   Sat, 15 Oct 2022 18:51:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 3/3] drm: rcar-du: rzg2l_mipi_dsi: Enhance device
 lanes check
Message-ID: <Y0rXA4WAPt/3YZO9@pendragon.ideasonboard.com>
References: <20220920105501.396999-1-biju.das.jz@bp.renesas.com>
 <20220920105501.396999-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920105501.396999-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Sep 20, 2022 at 11:55:01AM +0100, Biju Das wrote:
> Enhance device lanes check by reading TXSETR register at probe(),
> and enforced in rzg2l_mipi_dsi_host_attach().
> 
> As per HW manual, we can read TXSETR register only after
> DPHY initialization.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v8:
>  * New patch.
> ---
>  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c | 122 ++++++++++++++++-------
>  1 file changed, 88 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> index 8579208db218..aa95b85a2964 100644
> --- a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> @@ -171,6 +171,11 @@ static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 d
>  	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
>  }
>  
> +static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
> +{
> +	return ioread32(dsi->mmio + reg);
> +}
> +
>  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>  {
>  	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> @@ -180,19 +185,11 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>   * Hardware Setup
>   */
>  
> -static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> -				  const struct drm_display_mode *mode)
> +static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> +				    unsigned long hsfreq)
>  {
>  	const struct rzg2l_mipi_dsi_timings *dphy_timings;
> -	unsigned long hsfreq;
> -	unsigned int i, bpp;
> -	u32 txsetr;
> -	u32 clstptsetr;
> -	u32 lptrnstsetr;
> -	u32 clkkpt;
> -	u32 clkbfht;
> -	u32 clkstpt;
> -	u32 golpbkt;
> +	unsigned int i;
>  	u32 dphyctrl0;
>  	u32 dphytim0;
>  	u32 dphytim1;
> @@ -200,19 +197,6 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	u32 dphytim3;
>  	int ret;
>  
> -	/*
> -	 * Relationship between hsclk and vclk must follow
> -	 * vclk * bpp = hsclk * 8 * lanes
> -	 * where vclk: video clock (Hz)
> -	 *       bpp: video pixel bit depth
> -	 *       hsclk: DSI HS Byte clock frequency (Hz)
> -	 *       lanes: number of data lanes
> -	 *
> -	 * hsclk(bit) = hsclk(byte) * 8
> -	 */
> -	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
> -
>  	/* All DSI global operation timings are set with recommended setting */
>  	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
>  		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
> @@ -220,12 +204,6 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  			break;
>  	}
>  
> -	ret = pm_runtime_resume_and_get(dsi->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	clk_set_rate(dsi->vclk, mode->clock * 1000);
> -
>  	/* Initializing DPHY before accessing LINK */
>  	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
>  		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
> @@ -259,10 +237,62 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  
>  	ret = reset_control_deassert(dsi->rstc);
>  	if (ret < 0)
> -		goto err_pm_put;
> +		return ret;
>  
>  	udelay(1);
>  
> +	return 0;
> +}
> +
> +static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
> +{
> +	u32 dphyctrl0;
> +
> +	dphyctrl0 = rzg2l_mipi_dsi_phy_read(dsi, DSIDPHYCTRL0);
> +
> +	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
> +	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> +
> +	reset_control_assert(dsi->rstc);
> +}
> +
> +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> +				  const struct drm_display_mode *mode)
> +{
> +	unsigned long hsfreq;
> +	unsigned int bpp;
> +	u32 txsetr;
> +	u32 clstptsetr;
> +	u32 lptrnstsetr;
> +	u32 clkkpt;
> +	u32 clkbfht;
> +	u32 clkstpt;
> +	u32 golpbkt;
> +	int ret;
> +
> +	/*
> +	 * Relationship between hsclk and vclk must follow
> +	 * vclk * bpp = hsclk * 8 * lanes
> +	 * where vclk: video clock (Hz)
> +	 *       bpp: video pixel bit depth
> +	 *       hsclk: DSI HS Byte clock frequency (Hz)
> +	 *       lanes: number of data lanes
> +	 *
> +	 * hsclk(bit) = hsclk(byte) * 8
> +	 */
> +	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
> +
> +	ret = pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	clk_set_rate(dsi->vclk, mode->clock * 1000);
> +
> +	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> +	if (ret < 0)
> +		goto err_phy;
> +
>  	/* Enable Data lanes and Clock lanes */
>  	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> @@ -301,7 +331,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  
>  	return 0;
>  
> -err_pm_put:
> +err_phy:
> +	rzg2l_mipi_dsi_dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  
>  	return ret;
> @@ -309,7 +340,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  
>  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
>  {
> -	reset_control_assert(dsi->rstc);
> +	rzg2l_mipi_dsi_dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  }
>  
> @@ -666,7 +697,9 @@ static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
>  
>  static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  {
> +	unsigned int num_data_lanes;
>  	struct rzg2l_mipi_dsi *dsi;
> +	u32 txsetr;
>  	int ret;
>  
>  	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> @@ -681,7 +714,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dsi->dev, ret,
>  				     "missing or invalid data-lanes property\n");
>  
> -	dsi->num_data_lanes = ret;
> +	num_data_lanes = ret;
>  
>  	dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dsi->mmio))
> @@ -710,6 +743,24 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dsi->dev);
>  
> +	ret = pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		goto err_pm_disable;
> +
> +	/*
> +	 * TXSETR register can be read only after DPHY init. But during probe
> +	 * mode->clock and format are not available. So initialize DPHY with
> +	 * timing parameters for 80Mbps.
> +	 */
> +	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
> +	if (ret < 0)
> +		goto err_phy;
> +
> +	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
> +	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
> +	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	pm_runtime_put(dsi->dev);
> +
>  	/* Initialize the DRM bridge. */
>  	dsi->bridge.funcs = &rzg2l_mipi_dsi_bridge_ops;
>  	dsi->bridge.of_node = dsi->dev->of_node;
> @@ -723,6 +774,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_phy:
> +	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	pm_runtime_put(dsi->dev);
>  err_pm_disable:
>  	pm_runtime_disable(dsi->dev);
>  	return ret;

-- 
Regards,

Laurent Pinchart
