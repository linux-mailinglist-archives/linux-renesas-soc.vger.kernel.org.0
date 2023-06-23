Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B6873BC0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 17:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbjFWPu7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 11:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjFWPu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 11:50:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F872123;
        Fri, 23 Jun 2023 08:50:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 713CC838;
        Fri, 23 Jun 2023 17:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687535416;
        bh=wZ0sjgpf0JsRYGxuAComxHQGTrrT5jActa99bD+ebvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L07pV5Tn0P3YR9c2Fk5+I3pHrIRX79qtzPhTVpJVzwtGAxpNW2AjXOFNV+mxV4sMg
         XK/IdB4qxnHhlUP95wpSpKnLhNQtw7XL8f+yC/c4OlPzcEi61StWczTX4SYoc8QYNx
         rZQlcTdr/nTn4qSQIRySzbcw9k9yznIBsdaWEUyM=
Date:   Fri, 23 Jun 2023 18:50:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/39] drm: renesas: shmobile: Replace .dev_private with
 container_of()
Message-ID: <20230623155052.GX2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <48a0d1dcdf18ca07b97e2813ba26f9e52198a716.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48a0d1dcdf18ca07b97e2813ba26f9e52198a716.1687423204.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:32AM +0200, Geert Uytterhoeven wrote:
> Now that drm_device is embedded in shmob_drm_device, we can use
> a container_of()-based helper to get the shmob_drm_device pointer from
> the drm_device, instead of using the deprecated drm_device.dev_private
> field.
> 
> While at it, restore reverse Xmas tree ordering of local variable
> declarations.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 20 +++++++++----------
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  4 +---
>  .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  5 +++++
>  .../drm/renesas/shmobile/shmob_drm_plane.c    |  6 +++---
>  4 files changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 40948b56017ff2df..291b3a5014c24f08 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -63,7 +63,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
>  static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>  	const struct drm_display_mode *mode = &crtc->mode;
>  	u32 value;
> @@ -102,7 +102,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  
>  static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>  {
> -	struct shmob_drm_device *sdev = scrtc->crtc.dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
>  	u32 value;
>  
>  	value = lcdc_read(sdev, LDCNT2R);
> @@ -136,7 +136,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>  static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>  	const struct shmob_drm_format_info *format;
>  	struct drm_device *dev = &sdev->ddev;
> @@ -223,7 +223,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	if (!scrtc->started)
>  		return;
> @@ -280,7 +280,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>  static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_crtc *crtc = &scrtc->crtc;
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
>  
> @@ -322,8 +322,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
>  				   int x, int y,
>  				   struct drm_framebuffer *old_fb)
>  {
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
>  	const struct shmob_drm_format_info *format;
>  
>  	format = shmob_drm_format_info(crtc->primary->fb->format->format);
> @@ -428,7 +428,7 @@ static void shmob_drm_crtc_enable_vblank(struct shmob_drm_device *sdev,
>  
>  static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
>  {
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	shmob_drm_crtc_enable_vblank(sdev, true);
>  
> @@ -437,7 +437,7 @@ static int shmob_drm_enable_vblank(struct drm_crtc *crtc)
>  
>  static void shmob_drm_disable_vblank(struct drm_crtc *crtc)
>  {
> -	struct shmob_drm_device *sdev = crtc->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	shmob_drm_crtc_enable_vblank(sdev, false);
>  }
> @@ -511,7 +511,7 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>  					 struct drm_display_mode *adjusted_mode)
>  {
>  	struct drm_device *dev = encoder->dev;
> -	struct shmob_drm_device *sdev = dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(dev);
>  	struct drm_connector *connector = &sdev->connector.connector;
>  	const struct drm_display_mode *panel_mode;
>  
> @@ -581,7 +581,7 @@ static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connecto
>  
>  static int shmob_drm_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct shmob_drm_device *sdev = connector->dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(connector->dev);
>  	struct drm_display_mode *mode;
>  
>  	mode = drm_mode_create(connector->dev);
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 2b77af3a8c97ef8c..1a1d66c6e817e227 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -95,7 +95,7 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
>  static irqreturn_t shmob_drm_irq(int irq, void *arg)
>  {
>  	struct drm_device *dev = arg;
> -	struct shmob_drm_device *sdev = dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(dev);
>  	unsigned long flags;
>  	u32 status;
>  
> @@ -217,8 +217,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	ddev->dev_private = sdev;
> -
>  	ret = shmob_drm_modeset_init(sdev);
>  	if (ret < 0)
>  		return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> index 77bb0da48f37ace8..5e55ba7a207865bd 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.h
> @@ -39,4 +39,9 @@ struct shmob_drm_device {
>  	struct shmob_drm_connector connector;
>  };
>  
> +static inline struct shmob_drm_device *to_shmob_device(struct drm_device *dev)
> +{
> +	return container_of(dev, struct shmob_drm_device, ddev);
> +}
> +
>  #endif /* __SHMOB_DRM_DRV_H__ */
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 258288c80756bf16..c58b9dca34736342 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -63,7 +63,7 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
>  static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
>  				    struct drm_framebuffer *fb)
>  {
> -	struct shmob_drm_device *sdev = splane->plane.dev->dev_private;
> +	struct shmob_drm_device *sdev = to_shmob_device(splane->plane.dev);
>  	u32 format;
>  
>  	/* TODO: Support ROP3 mode */
> @@ -135,8 +135,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  		       uint32_t src_w, uint32_t src_h,
>  		       struct drm_modeset_acquire_ctx *ctx)
>  {
> +	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
>  	struct shmob_drm_plane *splane = to_shmob_plane(plane);
> -	struct shmob_drm_device *sdev = plane->dev->dev_private;
>  	const struct shmob_drm_format_info *format;
>  
>  	format = shmob_drm_format_info(fb->format->format);
> @@ -167,8 +167,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  static int shmob_drm_plane_disable(struct drm_plane *plane,
>  				   struct drm_modeset_acquire_ctx *ctx)
>  {
> +	struct shmob_drm_device *sdev = to_shmob_device(plane->dev);
>  	struct shmob_drm_plane *splane = to_shmob_plane(plane);
> -	struct shmob_drm_device *sdev = plane->dev->dev_private;
>  
>  	splane->format = NULL;
>  

-- 
Regards,

Laurent Pinchart
