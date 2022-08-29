Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD235A53AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 20:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbiH2SBt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 14:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiH2SBs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:01:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10AB7D7BF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:01:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1600A505;
        Mon, 29 Aug 2022 20:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661796102;
        bh=56OxQz/Su3z8U0M6+rLmt6PtBmUTG2dDxUj/ZvdDJf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gTlT8QnvvgOCwXymNBiv+dzudJ2LzPdEze2tryrltDdt498r5NzvKKERAazqlnw+t
         AbsvP8hFNYgr42xQdUpmysoPc4I+fU7LbvQ8t0rlhATURvp3y3/V5/WhQWkJnpCIcj
         TjExSlp1qOac1L6fPy1ATbHy0MKPDdSKSa7S2gew=
Date:   Mon, 29 Aug 2022 21:01:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <Ywz+/aA3NSQqbXXm@pendragon.ideasonboard.com>
References: <20220829091901.641784-1-biju.das.jz@bp.renesas.com>
 <20220829091901.641784-3-biju.das.jz@bp.renesas.com>
 <CAG3jFys4fKWBGBLX9CNB3xvz4ztgv4vdaTjB-sgrCMy6Zc9Yag@mail.gmail.com>
 <OS0PR01MB5922BB4E4924ECE0E8A3312186769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922BB4E4924ECE0E8A3312186769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Aug 29, 2022 at 04:26:02PM +0000, Biju Das wrote:
> Hi Robert,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v6 2/2] drm: rcar-du: Add RZ/G2L DSI driver
> > 
> > Hey Biju,
> > 
> > The patch does not apply on drm-misc-next, could you rebase it and
> > submit the next version?
> 
> I believe[1] is dependent on this patch series. Sorry for not
> making it clear while sending this patch series out.
> 
> I thought Laurent is going to give a pull request for RCar DU patches.

That's right. The patches apply fine to my branch.

> Based on that assumption, currently my environment is drm-tip + 
> 12 patches from[2], as [2] doesn't have all the latest patches from
> drm-misc-next/drm-tip.
> 
> [1] https://git.linuxtv.org/pinchartl/media.git/commit/drivers/gpu/drm/rcar-du?h=drm/du/next&id=2de250465c3ed5e13bfb5139d9a8c17105d3a1f1
> 
> [2] https://git.linuxtv.org/pinchartl/media.git/log/drivers/gpu/drm/rcar-du?h=drm/du/next
> 
> > Additionally it has a few 'checkpatch --strict' warnings.
> 
> I got a review comment[3] to use (1 << 1) style instead of BIT macro.
> Some of the warnings related to this.
> 
> [3] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220328065115.11724-1-biju.das.jz@bp.renesas.com/
> 
> Laurent, any thoughts??

(1 << x) instead of BIT it correct when the field stores a value, not a
single bit flag.

> > On Mon, 29 Aug 2022 at 11:19, Biju Das wrote:
> > >
> > > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC. It
> > > currently supports DSI video mode only.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > > v5->v6:
> > >  * Updated commit description
> > >  * Moved handling of arst and prst from rzg2l_mipi_dsi_startup-
> > >runtime
> > >    PM suspend/resume handlers.
> > >  * Max lane capability read at probe(), and enforced in
> > >    rzg2l_mipi_dsi_host_attach()
> > >  * Simplified vich1ppsetr setting.
> > >  * Renamed hsclk_running_mode,hsclk_mode->is_clk_cont.
> > >  * Fixed typo in probe error message(arst->rst).
> > >  * Reordered DRM bridge initaization in probe()
> > >  * Updated typo in e-mail address.
> > > v4->v5:
> > >  * Added Ack from Sam.
> > >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> > >    with drm_of_get_data_lanes_count_ep() in probe.
> > > v3->v4:
> > >  * Updated error handling in rzg2l_mipi_dsi_startup() and
> > > rzg2l_mipi_dsi_atomic_enable()
> > > v2->v3:
> > >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function
> > instead
> > >    of the memory pointer
> > >  * Fixed the comment in rzg2l_mipi_dsi_startup()
> > >  * Removed unnecessary dbg message from rzg2l_mipi_dsi_start_video()
> > >  * DRM bridge parameter initialization moved to probe
> > >  * Replaced dev_dbg->dev_err in rzg2l_mipi_dsi_parse_dt()
> > >  * Inserted the missing blank lane after return in probe()
> > >  * Added missing MODULE_DEVICE_TABLE
> > >  * Added include linux/bits.h in header file
> > >  * Fixed various macros in header file.
> > >  * Reorder the make file for DSI, so that it is no more dependent
> > >    on RZ/G2L DU patch series.
> > > v1->v2:
> > >  * Rework based on dt-binding change (DSI + D-PHY) as single block
> > >  * Replaced link_mmio and phy_mmio with mmio in struct rzg2l_mipi_dsi
> > >  * Replaced rzg2l_mipi_phy_write with rzg2l_mipi_dsi_phy_write
> > >    and rzg2l_mipi_dsi_link_write
> > >  * Replaced rzg2l_mipi_phy_read->rzg2l_mipi_dsi_link_read
> > > RFC->v1:
> > >  * Added "depends on ARCH_RENESAS || COMPILE_TEST" on KCONFIG
> > >    and dropped DRM as it is implied by DRM_BRIDGE
> > >  * Used devm_reset_control_get_exclusive() for reset handle
> > >  * Removed bool hsclkmode from struct rzg2l_mipi_dsi
> > >  * Added error check for pm, using pm_runtime_resume_and_get() instead
> > of
> > >    pm_runtime_get_sync()
> > >  * Added check for unsupported formats in rzg2l_mipi_dsi_host_attach()
> > >  * Avoided read-modify-write stopping hsclock
> > >  * Used devm_platform_ioremap_resource for resource allocation
> > >  * Removed unnecessary assert call from probe and remove.
> > >  * wrap the line after the PTR_ERR() in probe()
> > >  * Updated reset failure messages in probe
> > >  * Fixed the typo arstc->prstc
> > >  * Made hex constants to lower case.
> > > RFC:
> > >  *
> > > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> > > hwork.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F2022011217461
> > > 2.10773-23-biju.das.jz%40bp.renesas.com%2F&amp;data=05%7C01%7Cbiju.das
> > > .jz%40bp.renesas.com%7C003e031f5e7f454bdfdf08da89d4d82d%7C53d82571da19
> > > 47e49cb4625a166a4a2a%7C0%7C0%7C637973844501238222%7CUnknown%7CTWFpbGZs
> > > b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> > > %7C3000%7C%7C%7C&amp;sdata=uNJMSsB3FHHDBnczS4jLEL8OADLe03K6gksF2aNn31k
> > > %3D&amp;reserved=0
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> > >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> > >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 703
> > ++++++++++++++++++
> > >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> > >  4 files changed, 864 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig
> > > b/drivers/gpu/drm/rcar-du/Kconfig index c959e8c6be7d..58ffb8c2443b
> > > 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -51,6 +51,14 @@ config DRM_RCAR_MIPI_DSI
> > >         help
> > >           Enable support for the R-Car Display Unit embedded MIPI DSI
> > encoders.
> > >
> > > +config DRM_RZG2L_MIPI_DSI
> > > +       tristate "RZ/G2L MIPI DSI Encoder Support"
> > > +       depends on DRM_BRIDGE && OF
> > > +       depends on ARCH_RENESAS || COMPILE_TEST
> > > +       select DRM_MIPI_DSI
> > > +       help
> > > +         Enable support for the RZ/G2L Display Unit embedded MIPI DSI
> > encoders.
> > > +
> > >  config DRM_RCAR_VSP
> > >         bool "R-Car DU VSP Compositor Support" if ARM
> > >         default y if ARM64
> > > diff --git a/drivers/gpu/drm/rcar-du/Makefile
> > > b/drivers/gpu/drm/rcar-du/Makefile
> > > index 6f132325c8b7..b8f2c82651d9 100644
> > > --- a/drivers/gpu/drm/rcar-du/Makefile
> > > +++ b/drivers/gpu/drm/rcar-du/Makefile
> > > @@ -14,3 +14,5 @@ obj-$(CONFIG_DRM_RCAR_DU)             += rcar-du-
> > drm.o
> > >  obj-$(CONFIG_DRM_RCAR_DW_HDMI)         += rcar_dw_hdmi.o
> > >  obj-$(CONFIG_DRM_RCAR_LVDS)            += rcar_lvds.o
> > >  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)                += rcar_mipi_dsi.o
> > > +
> > > +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)       += rzg2l_mipi_dsi.o
> > > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > > new file mode 100644
> > > index 000000000000..46a71e39e336
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > > @@ -0,0 +1,703 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * RZ/G2L MIPI DSI Encoder Driver
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corporation  */ #include
> > > +<linux/clk.h> #include <linux/delay.h> #include <linux/io.h> #include
> > > +<linux/iopoll.h> #include <linux/module.h> #include <linux/of.h>
> > > +#include <linux/of_device.h> #include <linux/of_graph.h> #include
> > > +<linux/platform_device.h> #include <linux/pm_runtime.h> #include
> > > +<linux/reset.h> #include <linux/slab.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drm_panel.h>
> > > +#include <drm/drm_probe_helper.h>
> > > +
> > > +#include "rzg2l_mipi_dsi_regs.h"
> > > +
> > > +struct rzg2l_mipi_dsi {
> > > +       struct device *dev;
> > > +       void __iomem *mmio;
> > > +
> > > +       struct reset_control *rstc;
> > > +       struct reset_control *arstc;
> > > +       struct reset_control *prstc;
> > > +
> > > +       struct mipi_dsi_host host;
> > > +       struct drm_bridge bridge;
> > > +       struct drm_bridge *next_bridge;
> > > +
> > > +       struct clk *vclk;
> > > +
> > > +       enum mipi_dsi_pixel_format format;
> > > +       unsigned int num_data_lanes;
> > > +       unsigned int max_lanes;
> > > +       unsigned int lanes;
> > > +       unsigned long mode_flags;
> > > +};
> > > +
> > > +static inline struct rzg2l_mipi_dsi * bridge_to_rzg2l_mipi_dsi(struct
> > > +drm_bridge *bridge) {
> > > +       return container_of(bridge, struct rzg2l_mipi_dsi, bridge); }
> > > +
> > > +static inline struct rzg2l_mipi_dsi * host_to_rzg2l_mipi_dsi(struct
> > > +mipi_dsi_host *host) {
> > > +       return container_of(host, struct rzg2l_mipi_dsi, host); }
> > > +
> > > +static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32
> > > +reg, u32 data) {
> > > +       iowrite32(data, dsi->mmio + reg); }
> > > +
> > > +static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32
> > > +reg, u32 data) {
> > > +       iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg); }
> > > +
> > > +static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32
> > > +reg) {
> > > +       return ioread32(dsi->mmio + LINK_REG_OFFSET + reg); }
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * Hardware Setup
> > > + */
> > > +
> > > +static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > > +                                 const struct drm_display_mode *mode)
> > > +{
> > > +       unsigned long hsfreq;
> > > +       u32 txsetr;
> > > +       u32 clstptsetr;
> > > +       u32 lptrnstsetr;
> > > +       u32 clkkpt;
> > > +       u32 clkbfht;
> > > +       u32 clkstpt;
> > > +       u32 golpbkt;
> > > +       unsigned int bpp;
> > > +       struct {
> > > +               u32 tclk_miss;
> > > +               u32 t_init;
> > > +               u32 tclk_prepare;
> > > +               u32 tclk_settle;
> > > +               u32 tclk_trail;
> > > +               u32 tclk_post;
> > > +               u32 tclk_pre;
> > > +               u32 tclk_zero;
> > > +               u32 tlpx;
> > > +               u32 ths_prepare;
> > > +               u32 ths_settle;
> > > +               u32 ths_exit;
> > > +               u32 ths_trail;
> > > +               u32 ths_zero;
> > > +       } timings;
> > > +       u32 dphyctrl0;
> > > +       u32 dphytim0;
> > > +       u32 dphytim1;
> > > +       u32 dphytim2;
> > > +       u32 dphytim3;
> > > +       int ret;
> > > +
> > > +       /*
> > > +        * Relationship between hsclk and vclk must follow
> > > +        * vclk * bpp = hsclk * 8 * lanes
> > > +        * where vclk: video clock (Hz)
> > > +        *       bpp: video pixel bit depth
> > > +        *       hsclk: DSI HS Byte clock frequency (Hz)
> > > +        *       lanes: number of data lanes
> > > +        *
> > > +        * hsclk(bit) = hsclk(byte) * 8
> > > +        */
> > > +       bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +       hsfreq = (mode->clock * bpp * 8) / (8 * dsi->lanes);
> > > +
> > > +       /* All DSI global operation timings are set with recommended
> > setting */
> > > +       if (hsfreq > 250000) {
> > > +               timings.tclk_miss = 1;
> > > +               timings.t_init = 79801;
> > > +               timings.tclk_prepare = 8;
> > > +               timings.tclk_settle = 9;
> > > +               timings.tclk_trail = 7;
> > > +               timings.tclk_post = 35;
> > > +               timings.tclk_pre = 4;
> > > +               timings.tclk_zero = 33;
> > > +               timings.tlpx = 6;
> > > +               timings.ths_prepare = 9;
> > > +               timings.ths_settle = 9;
> > > +               timings.ths_exit = 13;
> > > +               timings.ths_trail = 9;
> > > +               timings.ths_zero = 16;
> > > +       } else {
> > > +               timings.tclk_miss = 1;
> > > +               timings.t_init = 79801;
> > > +               timings.tclk_prepare = 8;
> > > +               timings.tclk_settle = 9;
> > > +               timings.tclk_trail = 10;
> > > +               timings.tclk_post = 94;
> > > +               timings.tclk_pre = 13;
> > > +               timings.tclk_zero = 33;
> > > +               timings.tlpx = 6;
> > > +               timings.ths_prepare = 12;
> > > +               timings.ths_settle = 9;
> > > +               timings.ths_exit = 13;
> > > +               timings.ths_trail = 17;
> > > +               timings.ths_zero = 23;
> > > +       }
> > > +
> > > +       ret = pm_runtime_resume_and_get(dsi->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       clk_set_rate(dsi->vclk, mode->clock * 1000);
> > > +
> > > +       /* Initializing DPHY before accessing LINK */
> > > +       dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS |
> > DSIDPHYCTRL0_CMN_MASTER_EN |
> > > +                   DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 |
> > > + DSIDPHYCTRL0_EN_BGR;
> > > +
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > > +       usleep_range(20, 30);
> > > +
> > > +       dphyctrl0 |= DSIDPHYCTRL0_EN_LDO1200;
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
> > > +       usleep_range(10, 20);
> > > +
> > > +       dphytim0 = DSIDPHYTIM0_TCLK_MISS(timings.tclk_miss) |
> > > +                  DSIDPHYTIM0_T_INIT(timings.t_init);
> > > +       dphytim1 = DSIDPHYTIM1_THS_PREPARE(timings.ths_prepare) |
> > > +                  DSIDPHYTIM1_TCLK_PREPARE(timings.tclk_prepare) |
> > > +                  DSIDPHYTIM1_THS_SETTLE(timings.ths_settle) |
> > > +                  DSIDPHYTIM1_TCLK_SETTLE(timings.tclk_settle);
> > > +       dphytim2 = DSIDPHYTIM2_TCLK_TRAIL(timings.tclk_trail) |
> > > +                  DSIDPHYTIM2_TCLK_POST(timings.tclk_post) |
> > > +                  DSIDPHYTIM2_TCLK_PRE(timings.tclk_pre) |
> > > +                  DSIDPHYTIM2_TCLK_ZERO(timings.tclk_zero);
> > > +       dphytim3 = DSIDPHYTIM3_TLPX(timings.tlpx) |
> > > +                  DSIDPHYTIM3_THS_EXIT(timings.ths_exit) |
> > > +                  DSIDPHYTIM3_THS_TRAIL(timings.ths_trail) |
> > > +                  DSIDPHYTIM3_THS_ZERO(timings.ths_zero);
> > > +
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM0, dphytim0);
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM1, dphytim1);
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
> > > +       rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
> > > +
> > > +       ret = reset_control_deassert(dsi->rstc);
> > > +       if (ret < 0)
> > > +               goto err_rstc;
> > > +
> > > +       udelay(1);
> > > +
> > > +       /* Enable Data lanes and Clock lanes */
> > > +       txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) |
> > TXSETR_CLEN;
> > > +       rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
> > > +
> > > +       /*
> > > +        * Global timings characteristic depends on high speed Clock
> > Frequency
> > > +        * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> > > +        * - videoclock = 148.5 (MHz)
> > > +        * - bpp: maximum 24bpp
> > > +        * - data lanes: maximum 4 lanes
> > > +        * Therefore maximum hsclk will be 891 Mbps.
> > > +        */
> > > +       if (hsfreq > 445500) {
> > > +               clkkpt = 12;
> > > +               clkbfht = 15;
> > > +               clkstpt = 48;
> > > +               golpbkt = 75;
> > > +       } else if (hsfreq > 250000) {
> > > +               clkkpt = 7;
> > > +               clkbfht = 8;
> > > +               clkstpt = 27;
> > > +               golpbkt = 40;
> > > +       } else {
> > > +               clkkpt = 8;
> > > +               clkbfht = 6;
> > > +               clkstpt = 24;
> > > +               golpbkt = 29;
> > > +       }
> > > +
> > > +       clstptsetr = CLSTPTSETR_CLKKPT(clkkpt) |
> > CLSTPTSETR_CLKBFHT(clkbfht) |
> > > +                    CLSTPTSETR_CLKSTPT(clkstpt);
> > > +       rzg2l_mipi_dsi_link_write(dsi, CLSTPTSETR, clstptsetr);
> > > +
> > > +       lptrnstsetr = LPTRNSTSETR_GOLPBKT(golpbkt);
> > > +       rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
> > > +
> > > +       return 0;
> > > +
> > > +err_rstc:
> > > +       pm_runtime_put(dsi->dev);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi
> > *dsi,
> > > +                                             const struct
> > > +drm_display_mode *mode) {
> > > +       u32 vich1ppsetr;
> > > +       u32 vich1vssetr;
> > > +       u32 vich1vpsetr;
> > > +       u32 vich1hssetr;
> > > +       u32 vich1hpsetr;
> > > +       int dsi_format;
> > > +       u32 delay[2];
> > > +       u8 index;
> > > +
> > > +       /* Configuration for Pixel Packet */
> > > +       dsi_format = mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +       switch (dsi_format) {
> > > +       case 24:
> > > +               vich1ppsetr = VICH1PPSETR_DT_RGB24;
> > > +               break;
> > > +       case 18:
> > > +               vich1ppsetr = VICH1PPSETR_DT_RGB18;
> > > +               break;
> > > +       }
> > > +
> > > +       if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
> > > +           !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
> > > +               vich1ppsetr |= VICH1PPSETR_TXESYNC_PULSE;
> > > +
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
> > > +
> > > +       /* Configuration for Video Parameters */
> > > +       vich1vssetr = VICH1VSSETR_VACTIVE(mode->vdisplay) |
> > > +                     VICH1VSSETR_VSA(mode->vsync_end - mode-
> > >vsync_start);
> > > +       vich1vssetr |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
> > > +                       VICH1VSSETR_VSPOL_HIGH :
> > > + VICH1VSSETR_VSPOL_LOW;
> > > +
> > > +       vich1vpsetr = VICH1VPSETR_VFP(mode->vsync_start - mode-
> > >vdisplay) |
> > > +                     VICH1VPSETR_VBP(mode->vtotal - mode->vsync_end);
> > > +
> > > +       vich1hssetr = VICH1HSSETR_HACTIVE(mode->hdisplay) |
> > > +                     VICH1HSSETR_HSA(mode->hsync_end - mode-
> > >hsync_start);
> > > +       vich1hssetr |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ?
> > > +                       VICH1HSSETR_HSPOL_HIGH :
> > > + VICH1HSSETR_HSPOL_LOW;
> > > +
> > > +       vich1hpsetr = VICH1HPSETR_HFP(mode->hsync_start - mode-
> > >hdisplay) |
> > > +                     VICH1HPSETR_HBP(mode->htotal - mode->hsync_end);
> > > +
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1VSSETR, vich1vssetr);
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1VPSETR, vich1vpsetr);
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
> > > +
> > > +       /*
> > > +        * Configuration for Delay Value
> > > +        * Delay value based on 2 ranges of video clock.
> > > +        * 74.25MHz is videoclock of HD@60p or FHD@30p
> > > +        */
> > > +       if (mode->clock > 74250) {
> > > +               delay[0] = 231;
> > > +               delay[1] = 216;
> > > +       } else {
> > > +               delay[0] = 220;
> > > +               delay[1] = 212;
> > > +       }
> > > +
> > > +       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
> > > +               index = 0;
> > > +       else
> > > +               index = 1;
> > > +
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET1R,
> > > +                                 VICH1SET1R_DLY(delay[index])); }
> > > +
> > > +static int rzg2l_mipi_dsi_start_hs_clock(struct rzg2l_mipi_dsi *dsi)
> > > +{
> > > +       bool is_clk_cont;
> > > +       u32 hsclksetr;
> > > +       u32 status;
> > > +       int ret;
> > > +
> > > +       is_clk_cont = !(dsi->mode_flags &
> > > + MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > > +
> > > +       /* Start HS clock */
> > > +       hsclksetr = HSCLKSETR_HSCLKRUN_HS | (is_clk_cont ?
> > > +                                            HSCLKSETR_HSCLKMODE_CONT
> > :
> > > +
> > HSCLKSETR_HSCLKMODE_NON_CONT);
> > > +       rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR, hsclksetr);
> > > +
> > > +       if (is_clk_cont) {
> > > +               ret = read_poll_timeout(rzg2l_mipi_dsi_link_read,
> > status,
> > > +                                       status & PLSR_CLLP2HS,
> > > +                                       2000, 20000, false, dsi,
> > PLSR);
> > > +               if (ret < 0) {
> > > +                       dev_err(dsi->dev, "failed to start HS
> > clock\n");
> > > +                       return ret;
> > > +               }
> > > +       }
> > > +
> > > +       dev_dbg(dsi->dev, "Start High Speed Clock with %s clock mode",
> > > +               is_clk_cont ? "continuous" : "non-continuous");
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rzg2l_mipi_dsi_stop_hs_clock(struct rzg2l_mipi_dsi *dsi) {
> > > +       bool is_clk_cont;
> > > +       u32 status;
> > > +       int ret;
> > > +
> > > +       is_clk_cont = !(dsi->mode_flags &
> > > + MIPI_DSI_CLOCK_NON_CONTINUOUS);
> > > +
> > > +       /* Stop HS clock */
> > > +       rzg2l_mipi_dsi_link_write(dsi, HSCLKSETR,
> > > +                                 is_clk_cont ?
> > HSCLKSETR_HSCLKMODE_CONT :
> > > +                                 HSCLKSETR_HSCLKMODE_NON_CONT);
> > > +
> > > +       if (is_clk_cont) {
> > > +               ret = read_poll_timeout(rzg2l_mipi_dsi_link_read,
> > status,
> > > +                                       status & PLSR_CLHS2LP,
> > > +                                       2000, 20000, false, dsi,
> > PLSR);
> > > +               if (ret < 0) {
> > > +                       dev_err(dsi->dev, "failed to stop HS
> > clock\n");
> > > +                       return ret;
> > > +               }
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi) {
> > > +       u32 vich1set0r;
> > > +       u32 status;
> > > +       int ret;
> > > +
> > > +       /* Configuration for Blanking sequence and start video input*/
> > > +       vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
> > > +                    VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
> > > +
> > > +       ret = read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > > +                               status & VICH1SR_VIRDY,
> > > +                               2000, 20000, false, dsi, VICH1SR);
> > > +       if (ret < 0)
> > > +               dev_err(dsi->dev, "Failed to start video signal
> > > + input\n");
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi) {
> > > +       u32 status;
> > > +       int ret;
> > > +
> > > +       rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R,
> > VICH1SET0R_VSTPAFT);
> > > +       ret = read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > > +                               (status & VICH1SR_STOP) && (!(status &
> > VICH1SR_RUNNING)),
> > > +                               2000, 20000, false, dsi, VICH1SR);
> > > +       if (ret < 0)
> > > +               goto err;
> > > +
> > > +       ret = read_poll_timeout(rzg2l_mipi_dsi_link_read, status,
> > > +                               !(status & LINKSR_HSBUSY),
> > > +                               2000, 20000, false, dsi, LINKSR);
> > > +       if (ret < 0)
> > > +               goto err;
> > > +
> > > +       return 0;
> > > +
> > > +err:
> > > +       dev_err(dsi->dev, "Failed to stop video signal input\n");
> > > +       return ret;
> > > +}
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * Bridge
> > > + */
> > > +
> > > +static int rzg2l_mipi_dsi_attach(struct drm_bridge *bridge,
> > > +                                enum drm_bridge_attach_flags flags) {
> > > +       struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> > > +
> > > +       return drm_bridge_attach(bridge->encoder, dsi->next_bridge,
> > bridge,
> > > +                                flags); }
> > > +
> > > +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> > > +                                        struct drm_bridge_state
> > > +*old_bridge_state) {
> > > +       struct drm_atomic_state *state = old_bridge_state->base.state;
> > > +       struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> > > +       const struct drm_display_mode *mode;
> > > +       struct drm_connector *connector;
> > > +       struct drm_crtc *crtc;
> > > +       int ret;
> > > +
> > > +       connector = drm_atomic_get_new_connector_for_encoder(state,
> > bridge->encoder);
> > > +       crtc = drm_atomic_get_new_connector_state(state, connector)-
> > >crtc;
> > > +       mode = &drm_atomic_get_new_crtc_state(state,
> > > + crtc)->adjusted_mode;
> > > +
> > > +       ret = rzg2l_mipi_dsi_startup(dsi, mode);
> > > +       if (ret < 0)
> > > +               return;
> > > +
> > > +       rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> > > +
> > > +       ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
> > > +       if (ret < 0)
> > > +               goto err_hs_clock;
> > > +
> > > +       ret = rzg2l_mipi_dsi_start_video(dsi);
> > > +       if (ret < 0)
> > > +               goto err_video;
> > > +
> > > +       return;
> > > +
> > > +err_video:
> > > +       rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > > +err_hs_clock:
> > > +       reset_control_assert(dsi->rstc);
> > > +       pm_runtime_put(dsi->dev);
> > > +}
> > > +
> > > +static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
> > > +                                         struct drm_bridge_state
> > > +*old_bridge_state) {
> > > +       struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> > > +
> > > +       rzg2l_mipi_dsi_stop_video(dsi);
> > > +       rzg2l_mipi_dsi_stop_hs_clock(dsi);
> > > +       reset_control_assert(dsi->rstc);
> > > +       pm_runtime_put(dsi->dev);
> > > +}
> > > +
> > > +static enum drm_mode_status
> > > +rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> > > +                                const struct drm_display_info *info,
> > > +                                const struct drm_display_mode *mode)
> > > +{
> > > +       if (mode->clock > 148500)
> > > +               return MODE_CLOCK_HIGH;
> > > +
> > > +       return MODE_OK;
> > > +}
> > > +
> > > +static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
> > > +       .attach = rzg2l_mipi_dsi_attach,
> > > +       .atomic_duplicate_state =
> > drm_atomic_helper_bridge_duplicate_state,
> > > +       .atomic_destroy_state =
> > drm_atomic_helper_bridge_destroy_state,
> > > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> > > +       .atomic_enable = rzg2l_mipi_dsi_atomic_enable,
> > > +       .atomic_disable = rzg2l_mipi_dsi_atomic_disable,
> > > +       .mode_valid = rzg2l_mipi_dsi_bridge_mode_valid, };
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * Host setting
> > > + */
> > > +
> > > +static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > > +                                     struct mipi_dsi_device *device)
> > > +{
> > > +       struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
> > > +       int ret;
> > > +
> > > +       if (dsi->max_lanes < dsi->lanes || device->lanes > dsi-
> > >num_data_lanes) {
> > > +               dev_err(dsi->dev, "Invalid lanes");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
> > > +       case 24:
> > > +       case 18:
> > > +               break;
> > > +       default:
> > > +               dev_warn(dsi->dev, "unsupported format");
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       dsi->lanes = device->lanes;
> > > +       dsi->format = device->format;
> > > +       dsi->mode_flags = device->mode_flags;
> > > +
> > > +       dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev-
> > >of_node,
> > > +                                                 1, 0);
> > > +       if (IS_ERR(dsi->next_bridge)) {
> > > +               ret = PTR_ERR(dsi->next_bridge);
> > > +               dev_err(dsi->dev, "failed to get next bridge: %d\n",
> > ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       drm_bridge_add(&dsi->bridge);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> > > +                                     struct mipi_dsi_device *device)
> > > +{
> > > +       struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
> > > +
> > > +       drm_bridge_remove(&dsi->bridge);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
> > > +       .attach = rzg2l_mipi_dsi_host_attach,
> > > +       .detach = rzg2l_mipi_dsi_host_detach, };
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * Power Management
> > > + */
> > > +
> > > +static int __maybe_unused rzg2l_mipi_pm_runtime_suspend(struct device
> > > +*dev) {
> > > +       struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
> > > +
> > > +       reset_control_assert(dsi->prstc);
> > > +       reset_control_assert(dsi->arstc);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __maybe_unused rzg2l_mipi_pm_runtime_resume(struct device
> > > +*dev) {
> > > +       struct rzg2l_mipi_dsi *dsi = dev_get_drvdata(dev);
> > > +       int ret;
> > > +
> > > +       ret = reset_control_deassert(dsi->arstc);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       ret = reset_control_deassert(dsi->prstc);
> > > +       if (ret < 0)
> > > +               reset_control_assert(dsi->arstc);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops rzg2l_mipi_pm_ops = {
> > > +       SET_RUNTIME_PM_OPS(rzg2l_mipi_pm_runtime_suspend,
> > > +rzg2l_mipi_pm_runtime_resume, NULL) };
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * Probe & Remove
> > > + */
> > > +
> > > +static int rzg2l_mipi_dsi_probe(struct platform_device *pdev) {
> > > +       struct rzg2l_mipi_dsi *dsi;
> > > +       int ret;
> > > +
> > > +       dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> > > +       if (!dsi)
> > > +               return -ENOMEM;
> > > +
> > > +       platform_set_drvdata(pdev, dsi);
> > > +       dsi->dev = &pdev->dev;
> > > +
> > > +       ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0,
> > 1, 4);
> > > +       if (ret < 0)
> > > +               return dev_err_probe(dsi->dev, ret,
> > > +                                    "missing or invalid data-lanes
> > > + property\n");
> > > +
> > > +       dsi->num_data_lanes = ret;
> > > +
> > > +       dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(dsi->mmio))
> > > +               return PTR_ERR(dsi->mmio);
> > > +
> > > +       dsi->vclk = devm_clk_get(dsi->dev, "vclk");
> > > +       if (IS_ERR(dsi->vclk))
> > > +               return PTR_ERR(dsi->vclk);
> > > +
> > > +       dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
> > > +       if (IS_ERR(dsi->rstc))
> > > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > > +                                    "failed to get rst\n");
> > > +
> > > +       dsi->arstc = devm_reset_control_get_exclusive(dsi->dev,
> > "arst");
> > > +       if (IS_ERR(dsi->arstc))
> > > +               return dev_err_probe(&pdev->dev, PTR_ERR(dsi->arstc),
> > > +                                    "failed to get arst\n");
> > > +
> > > +       dsi->prstc = devm_reset_control_get_exclusive(dsi->dev,
> > "prst");
> > > +       if (IS_ERR(dsi->prstc))
> > > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->prstc),
> > > +                                    "failed to get prst\n");
> > > +
> > > +       platform_set_drvdata(pdev, dsi);
> > > +
> > > +       pm_runtime_enable(dsi->dev);
> > > +
> > > +       ret = pm_runtime_resume_and_get(dsi->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       dsi->max_lanes = ((rzg2l_mipi_dsi_link_read(dsi, TXSETR) >>
> > 16) & 0x3) + 1;
> > > +       pm_runtime_put(dsi->dev);
> > > +
> > > +       /* Initialize the DRM bridge. */
> > > +       dsi->bridge.funcs = &rzg2l_mipi_dsi_bridge_ops;
> > > +       dsi->bridge.of_node = dsi->dev->of_node;
> > > +
> > > +       /* Init host device */
> > > +       dsi->host.dev = dsi->dev;
> > > +       dsi->host.ops = &rzg2l_mipi_dsi_host_ops;
> > > +       ret = mipi_dsi_host_register(&dsi->host);
> > > +       if (ret < 0)
> > > +               goto out_pm_get;
> > > +
> > > +       return 0;
> > > +
> > > +out_pm_get:
> > > +       pm_runtime_disable(dsi->dev);
> > > +       return ret;
> > > +}
> > > +
> > > +static int rzg2l_mipi_dsi_remove(struct platform_device *pdev) {
> > > +       struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
> > > +
> > > +       mipi_dsi_host_unregister(&dsi->host);
> > > +       pm_runtime_disable(&pdev->dev);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
> > > +       { .compatible = "renesas,rzg2l-mipi-dsi" },
> > > +       { /* sentinel */ }
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
> > > +
> > > +static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
> > > +       .probe  = rzg2l_mipi_dsi_probe,
> > > +       .remove = rzg2l_mipi_dsi_remove,
> > > +       .driver = {
> > > +               .name = "rzg2l-mipi-dsi",
> > > +               .pm = &rzg2l_mipi_pm_ops,
> > > +               .of_match_table = rzg2l_mipi_dsi_of_table,
> > > +       },
> > > +};
> > > +
> > > +module_platform_driver(rzg2l_mipi_dsi_platform_driver);
> > > +
> > > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > > +MODULE_DESCRIPTION("Renesas RZ/G2L MIPI DSI Encoder Driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > > b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > > new file mode 100644
> > > index 000000000000..1dbc16ec64a4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h
> > > @@ -0,0 +1,151 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * RZ/G2L MIPI DSI Interface Registers Definitions
> > > + *
> > > + * Copyright (C) 2022 Renesas Electronics Corporation  */
> > > +
> > > +#ifndef __RZG2L_MIPI_DSI_REGS_H__
> > > +#define __RZG2L_MIPI_DSI_REGS_H__
> > > +
> > > +#include <linux/bits.h>
> > > +
> > > +/* DPHY Registers */
> > > +#define DSIDPHYCTRL0                   0x00
> > > +#define DSIDPHYCTRL0_CAL_EN_HSRX_OFS   BIT(16)
> > > +#define DSIDPHYCTRL0_CMN_MASTER_EN     BIT(8)
> > > +#define DSIDPHYCTRL0_RE_VDD_DETVCCQLV18        BIT(2)
> > > +#define DSIDPHYCTRL0_EN_LDO1200                BIT(1)
> > > +#define DSIDPHYCTRL0_EN_BGR            BIT(0)
> > > +
> > > +#define DSIDPHYTIM0                    0x04
> > > +#define DSIDPHYTIM0_TCLK_MISS(x)       ((x) << 24)
> > > +#define DSIDPHYTIM0_T_INIT(x)          ((x) << 0)
> > > +
> > > +#define DSIDPHYTIM1                    0x08
> > > +#define DSIDPHYTIM1_THS_PREPARE(x)     ((x) << 24)
> > > +#define DSIDPHYTIM1_TCLK_PREPARE(x)    ((x) << 16)
> > > +#define DSIDPHYTIM1_THS_SETTLE(x)      ((x) << 8)
> > > +#define DSIDPHYTIM1_TCLK_SETTLE(x)     ((x) << 0)
> > > +
> > > +#define DSIDPHYTIM2                    0x0c
> > > +#define DSIDPHYTIM2_TCLK_TRAIL(x)      ((x) << 24)
> > > +#define DSIDPHYTIM2_TCLK_POST(x)       ((x) << 16)
> > > +#define DSIDPHYTIM2_TCLK_PRE(x)                ((x) << 8)
> > > +#define DSIDPHYTIM2_TCLK_ZERO(x)       ((x) << 0)
> > > +
> > > +#define DSIDPHYTIM3                    0x10
> > > +#define DSIDPHYTIM3_TLPX(x)            ((x) << 24)
> > > +#define DSIDPHYTIM3_THS_EXIT(x)                ((x) << 16)
> > > +#define DSIDPHYTIM3_THS_TRAIL(x)       ((x) << 8)
> > > +#define DSIDPHYTIM3_THS_ZERO(x)                ((x) << 0)
> > > +
> > > +/* --------------------------------------------------------*/
> > > +/* Link Registers */
> > > +#define LINK_REG_OFFSET                        0x10000
> > > +
> > > +/* Link Status Register */
> > > +#define LINKSR                         0x10
> > > +#define LINKSR_LPBUSY                  BIT(13)
> > > +#define LINKSR_HSBUSY                  BIT(12)
> > > +#define LINKSR_VICHRUN1                        BIT(8)
> > > +#define LINKSR_SQCHRUN1                        BIT(4)
> > > +#define LINKSR_SQCHRUN0                        BIT(0)
> > > +
> > > +/* Tx Set Register */
> > > +#define TXSETR                         0x100
> > > +#define TXSETR_NUMLANECAP              (0x3 << 16)
> > > +#define TXSETR_DLEN                    (1 << 9)
> > > +#define TXSETR_CLEN                    (1 << 8)
> > > +#define TXSETR_NUMLANEUSE(x)           (((x) & 0x3) << 0)
> > > +
> > > +/* HS Clock Set Register */
> > > +#define HSCLKSETR                      0x104
> > > +#define HSCLKSETR_HSCLKMODE_CONT       (1 << 1)
> > > +#define HSCLKSETR_HSCLKMODE_NON_CONT   (0 << 1)
> > > +#define HSCLKSETR_HSCLKRUN_HS          (1 << 0)
> > > +#define HSCLKSETR_HSCLKRUN_LP          (0 << 0)
> > > +
> > > +/* Reset Control Register */
> > > +#define RSTCR                          0x110
> > > +#define RSTCR_SWRST                    BIT(0)
> > > +#define RSTCR_FCETXSTP                 BIT(16)
> > > +
> > > +/* Reset Status Register */
> > > +#define RSTSR                          0x114
> > > +#define RSTSR_DL0DIR                   (1 << 15)
> > > +#define RSTSR_DLSTPST                  (0xf << 8)
> > > +#define RSTSR_SWRSTV1                  (1 << 4)
> > > +#define RSTSR_SWRSTIB                  (1 << 3)
> > > +#define RSTSR_SWRSTAPB                 (1 << 2)
> > > +#define RSTSR_SWRSTLP                  (1 << 1)
> > > +#define RSTSR_SWRSTHS                  (1 << 0)
> > > +
> > > +/* Clock Lane Stop Time Set Register */
> > > +#define CLSTPTSETR                     0x314
> > > +#define CLSTPTSETR_CLKKPT(x)           ((x) << 24)
> > > +#define CLSTPTSETR_CLKBFHT(x)          ((x) << 16)
> > > +#define CLSTPTSETR_CLKSTPT(x)          ((x) << 2)
> > > +
> > > +/* LP Transition Time Set Register */
> > > +#define LPTRNSTSETR                    0x318
> > > +#define LPTRNSTSETR_GOLPBKT(x)         ((x) << 0)
> > > +
> > > +/* Physical Lane Status Register */
> > > +#define PLSR                           0x320
> > > +#define PLSR_CLHS2LP                   BIT(27)
> > > +#define PLSR_CLLP2HS                   BIT(26)
> > > +
> > > +/* Video-Input Channel 1 Set 0 Register */
> > > +#define VICH1SET0R                     0x400
> > > +#define VICH1SET0R_VSEN                        BIT(12)
> > > +#define VICH1SET0R_HFPNOLP             BIT(10)
> > > +#define VICH1SET0R_HBPNOLP             BIT(9)
> > > +#define VICH1SET0R_HSANOLP             BIT(8)
> > > +#define VICH1SET0R_VSTPAFT             BIT(1)
> > > +#define VICH1SET0R_VSTART              BIT(0)
> > > +
> > > +/* Video-Input Channel 1 Set 1 Register */
> > > +#define VICH1SET1R                     0x404
> > > +#define VICH1SET1R_DLY(x)              (((x) & 0xfff) << 2)
> > > +
> > > +/* Video-Input Channel 1 Status Register */
> > > +#define VICH1SR                                0x410
> > > +#define VICH1SR_VIRDY                  BIT(3)
> > > +#define VICH1SR_RUNNING                        BIT(2)
> > > +#define VICH1SR_STOP                   BIT(1)
> > > +#define VICH1SR_START                  BIT(0)
> > > +
> > > +/* Video-Input Channel 1 Pixel Packet Set Register */
> > > +#define VICH1PPSETR                    0x420
> > > +#define VICH1PPSETR_DT_RGB18           (0x1e << 16)
> > > +#define VICH1PPSETR_DT_RGB18_LS                (0x2e << 16)
> > > +#define VICH1PPSETR_DT_RGB24           (0x3e << 16)
> > > +#define VICH1PPSETR_TXESYNC_PULSE      (1 << 15)
> > > +#define VICH1PPSETR_VC(x)              ((x) << 22)
> > > +
> > > +/* Video-Input Channel 1 Vertical Size Set Register */
> > > +#define VICH1VSSETR                    0x428
> > > +#define VICH1VSSETR_VACTIVE(x)         (((x) & 0x7fff) << 16)
> > > +#define VICH1VSSETR_VSPOL_LOW          (1 << 15)
> > > +#define VICH1VSSETR_VSPOL_HIGH         (0 << 15)
> > > +#define VICH1VSSETR_VSA(x)             (((x) & 0xfff) << 0)
> > > +
> > > +/* Video-Input Channel 1 Vertical Porch Set Register */
> > > +#define VICH1VPSETR                    0x42c
> > > +#define VICH1VPSETR_VFP(x)             (((x) & 0x1fff) << 16)
> > > +#define VICH1VPSETR_VBP(x)             (((x) & 0x1fff) << 0)
> > > +
> > > +/* Video-Input Channel 1 Horizontal Size Set Register */
> > > +#define VICH1HSSETR                    0x430
> > > +#define VICH1HSSETR_HACTIVE(x)         (((x) & 0x7fff) << 16)
> > > +#define VICH1HSSETR_HSPOL_LOW          (1 << 15)
> > > +#define VICH1HSSETR_HSPOL_HIGH         (0 << 15)
> > > +#define VICH1HSSETR_HSA(x)             (((x) & 0xfff) << 0)
> > > +
> > > +/* Video-Input Channel 1 Horizontal Porch Set Register */
> > > +#define VICH1HPSETR                    0x434
> > > +#define VICH1HPSETR_HFP(x)             (((x) & 0x1fff) << 16)
> > > +#define VICH1HPSETR_HBP(x)             (((x) & 0x1fff) << 0)
> > > +
> > > +#endif /* __RZG2L_MIPI_DSI_REGS_H__ */

-- 
Regards,

Laurent Pinchart
