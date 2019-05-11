Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF041A971
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 22:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfEKUov (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 16:44:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57750 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfEKUov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 16:44:51 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C77942B6;
        Sat, 11 May 2019 22:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557607487;
        bh=7Gwk8NxnUoeEKKn3ykPmKPS5QpxaqBbbq6M4NTN1guk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OXAyS6XyV7YF99Zd3o3a3lywmbElXxiFhC27I1KtBxHRz+/tTLrh06ZuLJpCta9d1
         X9JOYro+8ZWGrkF/trsuII1MGueXekiHmxJWDGEYsSkIhbotRUasyteMGTsgGz6jnf
         b3E+r5brUDR8+YxKUJif3PRynIngavuo449S90zU=
Date:   Sat, 11 May 2019 23:44:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 02/15] drm: Use new
 DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags
Message-ID: <20190511204430.GQ13043@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-3-laurent.pinchart+renesas@ideasonboard.com>
 <88858c1f-1e5f-cc08-d0d6-0dd5201106cb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88858c1f-1e5f-cc08-d0d6-0dd5201106cb@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Apr 24, 2019 at 09:15:22AM +0100, Kieran Bingham wrote:
> On 06/03/2019 23:23, Laurent Pinchart wrote:
> > The DRM_BUS_FLAG_PIXDATA_(POS|NEG)EDGE and
> > DRM_BUS_FLAG_SYNC_(POS|NEG)EDGE flags are deprecated in favour of the
> > new DRM_BUS_FLAG_PIXDATA_(DRIVE|SAMPLE)_(POS|NEG)EDGE and
> > new DRM_BUS_FLAG_SYNC_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags. Replace them
> > through the code.
> > 
> > This effectively changes the value of the .sampling_edge bridge timings
> > field in the dumb-vga-dac driver. This is safe to do as no driver
> > consumes these values yet.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  6 ++---
> >  drivers/gpu/drm/bridge/tc358767.c             |  4 ++--
> >  drivers/gpu/drm/drm_modes.c                   | 12 +++++-----
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c    |  2 +-
> >  drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
> >  drivers/gpu/drm/mxsfb/mxsfb_crtc.c            |  6 ++---
> >  .../gpu/drm/omapdrm/displays/encoder-tfp410.c |  5 ++--
> >  .../displays/panel-lgphilips-lb035q02.c       |  5 ++--
> >  .../omapdrm/displays/panel-nec-nl8048hl11.c   |  5 ++--
> >  .../displays/panel-sharp-ls037v7dw01.c        |  5 ++--
> >  .../omapdrm/displays/panel-sony-acx565akm.c   |  5 ++--
> >  .../omapdrm/displays/panel-tpo-td028ttec1.c   |  5 ++--
> >  .../omapdrm/displays/panel-tpo-td043mtea1.c   |  5 ++--
> >  drivers/gpu/drm/omapdrm/dss/dsi.c             |  4 ++--
> >  drivers/gpu/drm/omapdrm/dss/sdi.c             |  4 ++--
> >  drivers/gpu/drm/omapdrm/omap_encoder.c        |  8 +++----
> >  drivers/gpu/drm/panel/panel-arm-versatile.c   |  4 ++--
> >  drivers/gpu/drm/panel/panel-ilitek-ili9322.c  |  4 ++--
> >  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  2 +-
> >  drivers/gpu/drm/panel/panel-simple.c          | 24 +++++++++----------
> >  drivers/gpu/drm/panel/panel-tpo-tpg110.c      | 10 ++++----
> >  drivers/gpu/drm/pl111/pl111_display.c         |  2 +-
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c            |  4 ++--
> >  drivers/gpu/drm/tve200/tve200_display.c       |  3 ++-
> >  include/drm/drm_bridge.h                      |  9 +++----
> 
> This seems to cover all the uses in my tree.
> 
> 
> Your changes appear to be consistent and cover all uses of the existing,
> now deprecated flags.
> 
> I have a few queries on some of the actual flags used below based on the
> surrounding comments, but even if those comments prompt action - I don't
> think those changes should necessarily be part of this patch.
> 
> Therefore:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  25 files changed, 77 insertions(+), 68 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > index 0805801f4e94..94ed450e308d 100644
> > --- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > +++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
> > @@ -234,7 +234,7 @@ static int dumb_vga_remove(struct platform_device *pdev)
> >   */
> >  static const struct drm_bridge_timings default_dac_timings = {
> >  	/* Timing specifications, datasheet page 7 */
> > -	.sampling_edge = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> >  	.setup_time_ps = 500,
> >  	.hold_time_ps = 1500,
> >  };
> > @@ -245,7 +245,7 @@ static const struct drm_bridge_timings default_dac_timings = {
> >   */
> >  static const struct drm_bridge_timings ti_ths8134_dac_timings = {
> >  	/* From timing diagram, datasheet page 9 */
> > -	.sampling_edge = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> >  	/* From datasheet, page 12 */
> >  	.setup_time_ps = 3000,
> >  	/* I guess this means latched input */
> > @@ -258,7 +258,7 @@ static const struct drm_bridge_timings ti_ths8134_dac_timings = {
> >   */
> >  static const struct drm_bridge_timings ti_ths8135_dac_timings = {
> >  	/* From timing diagram, datasheet page 14 */
> > -	.sampling_edge = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.sampling_edge = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> >  	/* From datasheet, page 16 */
> >  	.setup_time_ps = 2000,
> >  	.hold_time_ps = 500,
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> > index 888980d4bc74..e570c9dee180 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -1222,8 +1222,8 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
> >  					 &bus_format, 1);
> >  	tc->connector.display_info.bus_flags =
> >  		DRM_BUS_FLAG_DE_HIGH |
> > -		DRM_BUS_FLAG_PIXDATA_NEGEDGE |
> > -		DRM_BUS_FLAG_SYNC_NEGEDGE;
> > +		DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE |
> > +		DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
> >  	drm_connector_attach_encoder(&tc->connector, tc->bridge.encoder);
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 869ac6f4671e..56f92a0bba62 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -655,22 +655,22 @@ EXPORT_SYMBOL_GPL(drm_display_mode_to_videomode);
> >   * @bus_flags: information about pixelclk, sync and DE polarity will be stored
> >   * here
> >   *
> > - * Sets DRM_BUS_FLAG_DE_(LOW|HIGH),  DRM_BUS_FLAG_PIXDATA_(POS|NEG)EDGE and
> > - * DISPLAY_FLAGS_SYNC_(POS|NEG)EDGE in @bus_flags according to DISPLAY_FLAGS
> > + * Sets DRM_BUS_FLAG_DE_(LOW|HIGH),  DRM_BUS_FLAG_PIXDATA_DRIVE_(POS|NEG)EDGE
> > + * and DISPLAY_FLAGS_SYNC_(POS|NEG)EDGE in @bus_flags according to DISPLAY_FLAGS
> >   * found in @vm
> >   */
> >  void drm_bus_flags_from_videomode(const struct videomode *vm, u32 *bus_flags)
> >  {
> >  	*bus_flags = 0;
> >  	if (vm->flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
> > -		*bus_flags |= DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +		*bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  	if (vm->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> > -		*bus_flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
> > +		*bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> >  
> >  	if (vm->flags & DISPLAY_FLAGS_SYNC_POSEDGE)
> > -		*bus_flags |= DRM_BUS_FLAG_SYNC_POSEDGE;
> > +		*bus_flags |= DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
> >  	if (vm->flags & DISPLAY_FLAGS_SYNC_NEGEDGE)
> > -		*bus_flags |= DRM_BUS_FLAG_SYNC_NEGEDGE;
> > +		*bus_flags |= DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
> >  
> >  	if (vm->flags & DISPLAY_FLAGS_DE_LOW)
> >  		*bus_flags |= DRM_BUS_FLAG_DE_LOW;
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> > index bf256971063d..83c841b50272 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> > @@ -94,7 +94,7 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
> >  	drm_display_mode_to_videomode(mode, &vm);
> >  
> >  	/* INV_PXCK as default (most display sample data on rising edge) */
> 
> I know it's not directly related to your code change but this comment
> confuses me.
> 
> This doesn't look like it's setting INV_PXCK by default, as it's only
> doing it if the PIXDATA_DRIVE_POSEDGE flag is not set in the bus_flags?
> 
> Aha - it's because it's talking about sampling ... So DRIVE_POSEDGE ==
> SAMPLE_NEGEDGE ...
> 
> So given that - perhaps the below conditional should be:
> >>> + if (!(con->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE))
> ?
> 
> (In fact, I believe that was the purpose of these new macros right?)

I agree with you, but I think this requires going through individual
drivers and checking them one by one. I wanted to keep the
POSEDGE/NEGEDGE names unchanged in this series to ease review.

> > -	if (!(con->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE))
> > +	if (!(con->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE))
> >  		pol |= DCU_SYN_POL_INV_PXCK;
> >  
> >  	if (vm.flags & DISPLAY_FLAGS_HSYNC_LOW)
> > diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
> > index ec3602ebbc1c..311a20c942eb 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> > @@ -295,7 +295,7 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> >  	sig_cfg.enable_pol = !(imx_crtc_state->bus_flags & DRM_BUS_FLAG_DE_LOW);
> >  	/* Default to driving pixel data on negative clock edges */
> >  	sig_cfg.clk_pol = !!(imx_crtc_state->bus_flags &
> > -			     DRM_BUS_FLAG_PIXDATA_POSEDGE);
> > +			     DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE);
> 
> 
> Hrm ... and here again the comment and code don't seem to match ...
> unless I'm mis-interpreting...
> 
> (perhaps clk_pol is the inverse? - though it's defined as "true =
> rising-edge" in include/video/imx-ipu-v3.h).
> 
> If this is wrong, I'd consider it a separate change to this patch though.
> 
> 
> >  	sig_cfg.bus_format = imx_crtc_state->bus_format;
> >  	sig_cfg.v_to_h_sync = 0;
> >  	sig_cfg.hsync_pin = imx_crtc_state->di_hsync_pin;
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > index 0ee1ca8a316a..98e9bda91e80 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > @@ -253,12 +253,12 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
> >  	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
> >  		vdctrl0 |= VDCTRL0_ENABLE_ACT_HIGH;
> >  	/*
> > -	 * DRM_BUS_FLAG_PIXDATA_ defines are controller centric,
> > +	 * DRM_BUS_FLAG_PIXDATA_DRIVE_ defines are controller centric,
> >  	 * controllers VDCTRL0_DOTCLK is display centric.
> >  	 * Drive on positive edge       -> display samples on falling edge
> > -	 * DRM_BUS_FLAG_PIXDATA_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
> > +	 * DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
> >  	 */
> > -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> > +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> >  		vdctrl0 |= VDCTRL0_DOTCLK_ACT_FALLING;
> >  
> >  	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c b/drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c
> > index f1a748353279..a98d8759016d 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c
> > @@ -111,8 +111,9 @@ static int tfp410_probe(struct platform_device *pdev)
> >  	dssdev->output_type = OMAP_DISPLAY_TYPE_DVI;
> >  	dssdev->owner = THIS_MODULE;
> >  	dssdev->of_ports = BIT(1) | BIT(0);
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_POSEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  
> >  	dssdev->next = omapdss_of_find_connected_device(pdev->dev.of_node, 1);
> >  	if (IS_ERR(dssdev->next)) {
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c b/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
> > index f6ef8ff964dd..e36570b2bd15 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c
> > @@ -229,8 +229,9 @@ static int lb035q02_panel_spi_probe(struct spi_device *spi)
> 
> 
> <extra context added by me>
> 
> >  	/*
> >  	 * Note: According to the panel documentation:
> >  	 * DE is active LOW
> >  	 * DATA needs to be driven on the FALLING edge
> >  	 */
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_NEGEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> 
> Wow - I don't think I should look at comments vs code any more ...
> 
> Ok - so this is documented an identified inversion in commit:
> d7b56e6f4e34b6d182b3c4e03c1bd88a3acfb210, so I'll just move on here :)
> 
> I see there is a similar pattern below in other displays where the
> documentation states an inverted polarity so this must be a common thing.

I believe this is caused by delays on the PCB and/or in the display
controller that are not taken into account. We've discussed this in the
past for the adv7123, where the setup time, hold time, pixel clock
frequency and delays need all to be taken into account to pick the best
edge. I unfortunately lack the necessary hardware to test this driver.

> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-nec-nl8048hl11.c b/drivers/gpu/drm/omapdrm/displays/panel-nec-nl8048hl11.c
> > index f445de6369f7..6d3d49b90214 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-nec-nl8048hl11.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-nec-nl8048hl11.c
> > @@ -218,8 +218,9 @@ static int nec_8048_probe(struct spi_device *spi)
> >  	dssdev->type = OMAP_DISPLAY_TYPE_DPI;
> >  	dssdev->owner = THIS_MODULE;
> >  	dssdev->of_ports = BIT(0);
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_POSEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/omapdrm/displays/panel-sharp-ls037v7dw01.c
> > index 64b1369cb274..9532166e71df 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-sharp-ls037v7dw01.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-sharp-ls037v7dw01.c
> > @@ -227,8 +227,9 @@ static int sharp_ls_probe(struct platform_device *pdev)
> >  	 * Note: According to the panel documentation:
> >  	 * DATA needs to be driven on the FALLING edge
> >  	 */
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_NEGEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-sony-acx565akm.c b/drivers/gpu/drm/omapdrm/displays/panel-sony-acx565akm.c
> > index e04663856b31..2a13dbaf35ce 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-sony-acx565akm.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-sony-acx565akm.c
> > @@ -741,8 +741,9 @@ static int acx565akm_probe(struct spi_device *spi)
> >  	dssdev->type = OMAP_DISPLAY_TYPE_SDI;
> >  	dssdev->owner = THIS_MODULE;
> >  	dssdev->of_ports = BIT(0);
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_NEGEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > index 7ddc8c574a61..52ebd5027ded 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
> > @@ -351,8 +351,9 @@ static int td028ttec1_panel_probe(struct spi_device *spi)
> >  	 * Note: According to the panel documentation:
> >  	 * SYNC needs to be driven on the FALLING edge
> >  	 */
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_POSEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_NEGEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td043mtea1.c b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td043mtea1.c
> > index 8440fcb744d9..9c56e5d2292c 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td043mtea1.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td043mtea1.c
> > @@ -449,8 +449,9 @@ static int tpo_td043_probe(struct spi_device *spi)
> >  	 * Note: According to the panel documentation:
> >  	 * SYNC needs to be driven on the FALLING edge
> >  	 */
> > -	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_SYNC_POSEDGE
> > -			  | DRM_BUS_FLAG_PIXDATA_NEGEDGE;
> > +	dssdev->bus_flags = DRM_BUS_FLAG_DE_HIGH
> > +			  | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE
> > +			  | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> >  
> >  	omapdss_display_init(dssdev);
> >  	omapdss_device_register(dssdev);
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > index 64fb788b6647..0f06872e81f7 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -5144,9 +5144,9 @@ static int dsi_init_output(struct dsi_data *dsi)
> >  	out->ops = &dsi_ops;
> >  	out->owner = THIS_MODULE;
> >  	out->of_ports = BIT(0);
> > -	out->bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE
> > +	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
> >  		       | DRM_BUS_FLAG_DE_HIGH
> > -		       | DRM_BUS_FLAG_SYNC_NEGEDGE;
> > +		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
> >  
> >  	out->next = omapdss_of_find_connected_device(out->dev->of_node, 0);
> >  	if (IS_ERR(out->next)) {
> > diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
> > index b2fe2387037a..fcf10bba4f48 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/sdi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
> > @@ -294,8 +294,8 @@ static int sdi_init_output(struct sdi_device *sdi)
> >  	out->of_ports = BIT(1);
> >  	out->ops = &sdi_ops;
> >  	out->owner = THIS_MODULE;
> > -	out->bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE	/* 15.5.9.1.2 */
> > -		       | DRM_BUS_FLAG_SYNC_POSEDGE;
> > +	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
> > +		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
> >  
> >  	out->next = omapdss_of_find_connected_device(out->dev->of_node, 1);
> >  	if (IS_ERR(out->next)) {
> > diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> > index 0d85b3a35767..5527b6f70fe5 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> > @@ -115,17 +115,17 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
> >  
> >  		if (!(vm.flags & (DISPLAY_FLAGS_PIXDATA_POSEDGE |
> >  				  DISPLAY_FLAGS_PIXDATA_NEGEDGE))) {
> > -			if (bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> > +			if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> >  				vm.flags |= DISPLAY_FLAGS_PIXDATA_POSEDGE;
> > -			else if (bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +			else if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >  				vm.flags |= DISPLAY_FLAGS_PIXDATA_NEGEDGE;
> >  		}
> >  
> >  		if (!(vm.flags & (DISPLAY_FLAGS_SYNC_POSEDGE |
> >  				  DISPLAY_FLAGS_SYNC_NEGEDGE))) {
> > -			if (bus_flags & DRM_BUS_FLAG_SYNC_POSEDGE)
> > +			if (bus_flags & DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE)
> >  				vm.flags |= DISPLAY_FLAGS_SYNC_POSEDGE;
> > -			else if (bus_flags & DRM_BUS_FLAG_SYNC_NEGEDGE)
> > +			else if (bus_flags & DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
> >  				vm.flags |= DISPLAY_FLAGS_SYNC_NEGEDGE;
> >  		}
> >  	}
> > diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
> > index b428c4678106..078fa2c0eef8 100644
> > --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> > +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> > @@ -191,7 +191,7 @@ static const struct versatile_panel_type versatile_panels[] = {
> >  			.vrefresh = 390,
> >  			.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> >  	},
> >  	/*
> >  	 * Sanyo ALR252RGT 240x320 portrait display found on the
> > @@ -215,7 +215,7 @@ static const struct versatile_panel_type versatile_panels[] = {
> >  			.vrefresh = 116,
> >  			.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> >  		.ib2 = true,
> >  	},
> >  };
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> > index bd38bf4f1ba6..35497ff08391 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> > @@ -412,11 +412,11 @@ static int ili9322_init(struct drm_panel *panel, struct ili9322 *ili)
> >  	if (ili->conf->dclk_active_high) {
> >  		reg = ILI9322_POL_DCLK;
> >  		connector->display_info.bus_flags |=
> > -			DRM_BUS_FLAG_PIXDATA_POSEDGE;
> > +			DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> >  	} else {
> >  		reg = 0;
> >  		connector->display_info.bus_flags |=
> > -			DRM_BUS_FLAG_PIXDATA_NEGEDGE;
> > +			DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> >  	}
> >  	if (ili->conf->de_active_high) {
> >  		reg |= ILI9322_POL_DE;
> > diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > index 2d99e28ff117..bdcc5d80823d 100644
> > --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > @@ -328,7 +328,7 @@ static const struct seiko_panel_desc seiko_43wvf1g = {
> >  		.height = 57,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> >  };
> >  
> >  static const struct of_device_id platform_of_match[] = {
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 9e8218f6a3f2..64516f23a957 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -914,7 +914,7 @@ static const struct panel_desc cdtech_s043wq26h_ct7 = {
> >  		.width = 95,
> >  		.height = 54,
> >  	},
> > -	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
> > @@ -1034,7 +1034,7 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
> >  		.height = 91,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct display_timing dlc_dlc0700yzg_1_timing = {
> > @@ -1119,7 +1119,7 @@ static const struct panel_desc edt_et057090dhu = {
> >  		.height = 86,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> >  };
> >  
> >  static const struct drm_display_mode edt_etm0700g0dh6_mode = {
> > @@ -1145,7 +1145,7 @@ static const struct panel_desc edt_etm0700g0dh6 = {
> >  		.height = 91,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> >  };
> >  
> >  static const struct panel_desc edt_etm0700g0bdh6 = {
> > @@ -1157,7 +1157,7 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
> >  		.height = 91,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode foxlink_fl500wvr00_a0t_mode = {
> > @@ -1311,7 +1311,7 @@ static const struct panel_desc innolux_at043tn24 = {
> >  		.height = 54,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode innolux_at070tn92_mode = {
> > @@ -1818,7 +1818,7 @@ static const struct panel_desc nec_nl4827hc19_05b = {
> >  		.height = 54,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode netron_dy_e231732_mode = {
> > @@ -1867,8 +1867,8 @@ static const struct panel_desc newhaven_nhd_43_480272ef_atxl = {
> >  		.height = 54,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE |
> > -		     DRM_BUS_FLAG_SYNC_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > +		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct display_timing nlt_nl192108ac18_02d_timing = {
> > @@ -2029,7 +2029,7 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
> >  		.height = 93,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode pda_91_00156_a0_mode = {
> > @@ -2398,7 +2398,7 @@ static const struct panel_desc toshiba_lt089ac29000 = {
> >  		.height = 116,
> >  	},
> >  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> > -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode tpk_f07a_0102_mode = {
> > @@ -2421,7 +2421,7 @@ static const struct panel_desc tpk_f07a_0102 = {
> >  		.width = 152,
> >  		.height = 91,
> >  	},
> > -	.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  };
> >  
> >  static const struct drm_display_mode tpk_f10a_0102_mode = {
> > diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> > index 5a9f8f4d5d24..25f00cfc1af4 100644
> > --- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> > +++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> > @@ -118,7 +118,7 @@ static const struct tpg110_panel_mode tpg110_modes[] = {
> >  			.vtotal = 480 + 10 + 1 + 35,
> >  			.vrefresh = 60,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> >  	{
> >  		.name = "640x480 RGB",
> > @@ -135,7 +135,7 @@ static const struct tpg110_panel_mode tpg110_modes[] = {
> >  			.vtotal = 480 + 18 + 1 + 27,
> >  			.vrefresh = 60,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> >  	{
> >  		.name = "480x272 RGB",
> > @@ -152,7 +152,7 @@ static const struct tpg110_panel_mode tpg110_modes[] = {
> >  			.vtotal = 272 + 2 + 1 + 12,
> >  			.vrefresh = 60,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> >  	{
> >  		.name = "480x640 RGB",
> > @@ -169,7 +169,7 @@ static const struct tpg110_panel_mode tpg110_modes[] = {
> >  			.vtotal = 640 + 4 + 1 + 8,
> >  			.vrefresh = 60,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> >  	{
> >  		.name = "400x240 RGB",
> > @@ -186,7 +186,7 @@ static const struct tpg110_panel_mode tpg110_modes[] = {
> >  			.vtotal = 240 + 2 + 1 + 20,
> >  			.vrefresh = 60,
> >  		},
> > -		.bus_flags = DRM_BUS_FLAG_PIXDATA_POSEDGE,
> > +		.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> >  };
> >  
> > diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> > index 754f6b25f265..0c5d391f0a8f 100644
> > --- a/drivers/gpu/drm/pl111/pl111_display.c
> > +++ b/drivers/gpu/drm/pl111/pl111_display.c
> > @@ -188,7 +188,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
> >  			tim2 |= TIM2_IOE;
> >  
> >  		if (connector->display_info.bus_flags &
> > -		    DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +		    DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >  			tim2 |= TIM2_IPC;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > index 7136fc91c603..ca713d200280 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -561,10 +561,10 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
> >  	 * Following code is a way to avoid quirks all around TCON
> >  	 * and DOTCLOCK drivers.
> >  	 */
> > -	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_POSEDGE)
> > +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> >  		clk_set_phase(tcon->dclk, 240);
> >  
> > -	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +	if (display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >  		clk_set_phase(tcon->dclk, 0);
> >  
> >  	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
> > diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
> > index e8723a2412a6..d775d10dbe6a 100644
> > --- a/drivers/gpu/drm/tve200/tve200_display.c
> > +++ b/drivers/gpu/drm/tve200/tve200_display.c
> > @@ -149,7 +149,8 @@ static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
> >  	/* Vsync IRQ at start of Vsync at first */
> >  	ctrl1 |= TVE200_VSTSTYPE_VSYNC;
> >  
> > -	if (connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_NEGEDGE)
> > +	if (connector->display_info.bus_flags &
> > +	    DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> >  		ctrl1 |= TVE200_CTRL_TVCLKP;
> >  
> >  	if ((mode->hdisplay == 352 && mode->vdisplay == 240) || /* SIF(525) */
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 9da8c93f7976..5e5129206f40 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -246,10 +246,11 @@ struct drm_bridge_timings {
> >  	/**
> >  	 * @sampling_edge:
> >  	 *
> > -	 * Tells whether the bridge samples the digital input signal
> > -	 * from the display engine on the positive or negative edge of the
> > -	 * clock, this should reuse the DRM_BUS_FLAG_PIXDATA_[POS|NEG]EDGE
> > -	 * bitwise flags from the DRM connector (bit 2 and 3 valid).
> > +	 * Tells whether the bridge samples the digital input signals from the> +	 * display engine on the positive or negative edge of the clock. This
> > +	 * should use the DRM_BUS_FLAG_PIXDATA_SAMPLE_[POS|NEG]EDGE and
> > +	 * DRM_BUS_FLAG_SYNC_SAMPLE_[POS|NEG]EDGE bitwise flags from the DRM
> > +	 * connector (bit 2, 3, 6 and 7 valid).
> >  	 */
> >  	u32 sampling_edge;
> >  	/**

-- 
Regards,

Laurent Pinchart
