Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C125464BCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 11:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348733AbhLAKng (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 05:43:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348748AbhLAKnc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 05:43:32 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3F6F8AE;
        Wed,  1 Dec 2021 11:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638355210;
        bh=KDYfE+iWoo4Xy5yAhjYgpvkqpAa2gGcvTUCWmD0EpzU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XheD9NocKBWiE4v3q/N5dtc5Iv3fhWgEEnoCrLoSiX06QjVnwghs2FCqDGhOOYMBn
         bWIqwdon7j+eXmATrQn47C0ZLJ5drb0Z8OM3UrLnPQZYlqlSw8iV7wOvveuq0nCCNR
         GESMojcl567g04Pxs/a4WWvD2sIu5IfPAwjvUGg4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20211201052406.13074-1-laurent.pinchart+renesas@ideasonboard.com> <20211201052406.13074-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/2] drm: rcar-du: Add R-Car DSI driver
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Wed, 01 Dec 2021 10:40:07 +0000
Message-ID: <163835520787.3059017.7474171156509265390@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-12-01 05:24:06)
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>=20
> The driver supports the MIPI DSI/CSI-2 TX encoder found in the R-Car V3U
> SoC. It currently supports DSI mode only.
>=20
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

And as there have been some changes to the probe / bridge handling:

(Re)Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Changes since v2:
>=20
> - Support probing of child DSI devices
> - Use devm_drm_of_get_bridge() helper
>=20
> Changes since v1:
>=20
> - Use U suffix for unsigned constants
> - Fix indentation in Makefile
> - Select DRM_MIPI_DSI
> - Report correct fout frequency in debug message
> - Move dsi_setup_info.err to local variable
> ---
>  drivers/gpu/drm/rcar-du/Kconfig              |   7 +
>  drivers/gpu/drm/rcar-du/Makefile             |   1 +
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 817 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h | 172 ++++
>  4 files changed, 997 insertions(+)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kc=
onfig
> index 3e588ddba245..1675df21d91f 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -45,6 +45,13 @@ config DRM_RCAR_LVDS
>         select OF_FLATTREE
>         select OF_OVERLAY
> =20
> +config DRM_RCAR_MIPI_DSI
> +       tristate "R-Car DU MIPI DSI Encoder Support"
> +       depends on DRM && DRM_BRIDGE && OF
> +       select DRM_MIPI_DSI
> +       help
> +         Enable support for the R-Car Display Unit embedded MIPI DSI enc=
oders.
> +
>  config DRM_RCAR_VSP
>         bool "R-Car DU VSP Compositor Support" if ARM
>         default y if ARM64
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/M=
akefile
> index 4d1187ccc3e5..286bc81b3e7c 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DRM_RCAR_CMM)            +=3D rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)              +=3D rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)         +=3D rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)            +=3D rcar_lvds.o
> +obj-$(CONFIG_DRM_RCAR_MIPI_DSI)                +=3D rcar_mipi_dsi.o
> =20
>  # 'remote-endpoint' is fixed up at run-time
>  DTC_FLAGS_rcar_du_of_lvds_r8a7790 +=3D -Wno-graph_endpoint
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rc=
ar-du/rcar_mipi_dsi.c
> new file mode 100644
> index 000000000000..fcaec3308d68
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -0,0 +1,817 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_mipi_dsi.c  --  R-Car MIPI DSI Encoder
> + *
> + * Copyright (C) 2020 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rcar_mipi_dsi_regs.h"
> +
> +struct rcar_mipi_dsi {
> +       struct device *dev;
> +       const struct rcar_mipi_dsi_device_info *info;
> +       struct reset_control *rstc;
> +
> +       struct mipi_dsi_host host;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct drm_connector connector;
> +
> +       void __iomem *mmio;
> +       struct {
> +               struct clk *mod;
> +               struct clk *pll;
> +               struct clk *dsi;
> +       } clocks;
> +
> +       struct drm_display_mode display_mode;
> +       enum mipi_dsi_pixel_format format;
> +       unsigned int num_data_lanes;
> +       unsigned int lanes;
> +};
> +
> +static inline struct rcar_mipi_dsi *
> +bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
> +{
> +       return container_of(bridge, struct rcar_mipi_dsi, bridge);
> +}
> +
> +static inline struct rcar_mipi_dsi *
> +host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
> +{
> +       return container_of(host, struct rcar_mipi_dsi, host);
> +}
> +
> +static const u32 phtw[] =3D {
> +       0x01020114, 0x01600115, /* General testing */
> +       0x01030116, 0x0102011d, /* General testing */
> +       0x011101a4, 0x018601a4, /* 1Gbps testing */
> +       0x014201a0, 0x010001a3, /* 1Gbps testing */
> +       0x0101011f,             /* 1Gbps testing */
> +};
> +
> +static const u32 phtw2[] =3D {
> +       0x010c0130, 0x010c0140, /* General testing */
> +       0x010c0150, 0x010c0180, /* General testing */
> +       0x010c0190,
> +       0x010a0160, 0x010a0170,
> +       0x01800164, 0x01800174, /* 1Gbps testing */
> +};
> +
> +static const u32 hsfreqrange_table[][2] =3D {
> +       { 80000000U,   0x00 }, { 90000000U,   0x10 }, { 100000000U,  0x20=
 },
> +       { 110000000U,  0x30 }, { 120000000U,  0x01 }, { 130000000U,  0x11=
 },
> +       { 140000000U,  0x21 }, { 150000000U,  0x31 }, { 160000000U,  0x02=
 },
> +       { 170000000U,  0x12 }, { 180000000U,  0x22 }, { 190000000U,  0x32=
 },
> +       { 205000000U,  0x03 }, { 220000000U,  0x13 }, { 235000000U,  0x23=
 },
> +       { 250000000U,  0x33 }, { 275000000U,  0x04 }, { 300000000U,  0x14=
 },
> +       { 325000000U,  0x25 }, { 350000000U,  0x35 }, { 400000000U,  0x05=
 },
> +       { 450000000U,  0x16 }, { 500000000U,  0x26 }, { 550000000U,  0x37=
 },
> +       { 600000000U,  0x07 }, { 650000000U,  0x18 }, { 700000000U,  0x28=
 },
> +       { 750000000U,  0x39 }, { 800000000U,  0x09 }, { 850000000U,  0x19=
 },
> +       { 900000000U,  0x29 }, { 950000000U,  0x3a }, { 1000000000U, 0x0a=
 },
> +       { 1050000000U, 0x1a }, { 1100000000U, 0x2a }, { 1150000000U, 0x3b=
 },
> +       { 1200000000U, 0x0b }, { 1250000000U, 0x1b }, { 1300000000U, 0x2b=
 },
> +       { 1350000000U, 0x3c }, { 1400000000U, 0x0c }, { 1450000000U, 0x1c=
 },
> +       { 1500000000U, 0x2c }, { 1550000000U, 0x3d }, { 1600000000U, 0x0d=
 },
> +       { 1650000000U, 0x1d }, { 1700000000U, 0x2e }, { 1750000000U, 0x3e=
 },
> +       { 1800000000U, 0x0e }, { 1850000000U, 0x1e }, { 1900000000U, 0x2f=
 },
> +       { 1950000000U, 0x3f }, { 2000000000U, 0x0f }, { 2050000000U, 0x40=
 },
> +       { 2100000000U, 0x41 }, { 2150000000U, 0x42 }, { 2200000000U, 0x43=
 },
> +       { 2250000000U, 0x44 }, { 2300000000U, 0x45 }, { 2350000000U, 0x46=
 },
> +       { 2400000000U, 0x47 }, { 2450000000U, 0x48 }, { 2500000000U, 0x49=
 },
> +       { /* sentinel */ },
> +};
> +
> +struct vco_cntrl_value {
> +       u32 min_freq;
> +       u32 max_freq;
> +       u16 value;
> +};
> +
> +static const struct vco_cntrl_value vco_cntrl_table[] =3D {
> +       { .min_freq =3D 40000000U,   .max_freq =3D 55000000U,   .value =
=3D 0x3f },
> +       { .min_freq =3D 52500000U,   .max_freq =3D 80000000U,   .value =
=3D 0x39 },
> +       { .min_freq =3D 80000000U,   .max_freq =3D 110000000U,  .value =
=3D 0x2f },
> +       { .min_freq =3D 105000000U,  .max_freq =3D 160000000U,  .value =
=3D 0x29 },
> +       { .min_freq =3D 160000000U,  .max_freq =3D 220000000U,  .value =
=3D 0x1f },
> +       { .min_freq =3D 210000000U,  .max_freq =3D 320000000U,  .value =
=3D 0x19 },
> +       { .min_freq =3D 320000000U,  .max_freq =3D 440000000U,  .value =
=3D 0x0f },
> +       { .min_freq =3D 420000000U,  .max_freq =3D 660000000U,  .value =
=3D 0x09 },
> +       { .min_freq =3D 630000000U,  .max_freq =3D 1149000000U, .value =
=3D 0x03 },
> +       { .min_freq =3D 1100000000U, .max_freq =3D 1152000000U, .value =
=3D 0x01 },
> +       { .min_freq =3D 1150000000U, .max_freq =3D 1250000000U, .value =
=3D 0x01 },
> +       { /* sentinel */ },
> +};
> +
> +static void rcar_mipi_dsi_write(struct rcar_mipi_dsi *dsi, u32 reg, u32 =
data)
> +{
> +       iowrite32(data, dsi->mmio + reg);
> +}
> +
> +static u32 rcar_mipi_dsi_read(struct rcar_mipi_dsi *dsi, u32 reg)
> +{
> +       return ioread32(dsi->mmio + reg);
> +}
> +
> +static void rcar_mipi_dsi_clr(struct rcar_mipi_dsi *dsi, u32 reg, u32 cl=
r)
> +{
> +       rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) & ~clr=
);
> +}
> +
> +static void rcar_mipi_dsi_set(struct rcar_mipi_dsi *dsi, u32 reg, u32 se=
t)
> +{
> +       rcar_mipi_dsi_write(dsi, reg, rcar_mipi_dsi_read(dsi, reg) | set);
> +}
> +
> +static int rcar_mipi_dsi_phtw_test(struct rcar_mipi_dsi *dsi, u32 phtw)
> +{
> +       u32 status;
> +       int ret;
> +
> +       rcar_mipi_dsi_write(dsi, PHTW, phtw);
> +
> +       ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               !(status & (PHTW_DWEN | PHTW_CWEN)),
> +                               2000, 10000, false, dsi, PHTW);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "PHY test interface write timeout (0x%0=
8x)\n",
> +                       phtw);
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Hardware Setup
> + */
> +
> +struct dsi_setup_info {
> +       unsigned long fout;
> +       u16 vco_cntrl;
> +       u16 prop_cntrl;
> +       u16 hsfreqrange;
> +       u16 div;
> +       unsigned int m;
> +       unsigned int n;
> +};
> +
> +static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
> +                                         struct clk *clk, unsigned long =
target,
> +                                         struct dsi_setup_info *setup_in=
fo)
> +{
> +
> +       const struct vco_cntrl_value *vco_cntrl;
> +       unsigned long fout_target;
> +       unsigned long fin, fout;
> +       unsigned long hsfreq;
> +       unsigned int best_err =3D -1;
> +       unsigned int divider;
> +       unsigned int n;
> +       unsigned int i;
> +       unsigned int err;
> +
> +       /*
> +        * Calculate Fout =3D dot clock * ColorDepth / (2 * Lane Count)
> +        * The range out Fout is [40 - 1250] Mhz
> +        */
> +       fout_target =3D target * mipi_dsi_pixel_format_to_bpp(dsi->format)
> +                   / (2 * dsi->lanes);
> +       if (fout_target < 40000000 || fout_target > 1250000000)
> +               return;
> +
> +       /* Find vco_cntrl */
> +       for (vco_cntrl =3D vco_cntrl_table; vco_cntrl->min_freq !=3D 0; v=
co_cntrl++) {
> +               if (fout_target > vco_cntrl->min_freq &&
> +                   fout_target <=3D vco_cntrl->max_freq) {
> +                       setup_info->vco_cntrl =3D vco_cntrl->value;
> +                       if (fout_target >=3D 1150000000)
> +                               setup_info->prop_cntrl =3D 0x0c;
> +                       else
> +                               setup_info->prop_cntrl =3D 0x0b;
> +                       break;
> +               }
> +       }
> +
> +       /* Add divider */
> +       setup_info->div =3D (setup_info->vco_cntrl & 0x30) >> 4;
> +
> +       /* Find hsfreqrange */
> +       hsfreq =3D fout_target * 2;
> +       for (i =3D 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
> +               if (hsfreq > hsfreqrange_table[i][0] &&
> +                       hsfreq <=3D hsfreqrange_table[i+1][0]) {
> +                       setup_info->hsfreqrange =3D hsfreqrange_table[i+1=
][1];
> +                       break;
> +               }
> +       }
> +
> +       /*
> +        * Calculate n and m for PLL clock
> +        * Following the HW manual the ranges of n and m are
> +        * n =3D [3-8] and m =3D [64-625]
> +        */
> +       fin =3D clk_get_rate(clk);
> +       divider =3D 1 << setup_info->div;
> +       for (n =3D 3; n < 9; n++) {
> +               unsigned long fpfd;
> +               unsigned int m;
> +
> +               fpfd =3D fin / n;
> +
> +               for (m =3D 64; m < 626; m++) {
> +                       fout =3D fpfd * m / divider;
> +                       err =3D abs((long)(fout - fout_target) * 10000 /
> +                                 (long)fout_target);
> +                       if (err < best_err) {
> +                               setup_info->m =3D m - 2;
> +                               setup_info->n =3D n - 1;
> +                               setup_info->fout =3D fout;
> +                               best_err =3D err;
> +                               if (err =3D=3D 0)
> +                                       goto done;
> +                       }
> +               }
> +       }
> +
> +done:
> +       dev_dbg(dsi->dev,
> +               "%pC %lu Hz -> Fout %lu Hz (target %lu Hz, error %d.%02u%=
%), PLL M/N/DIV %u/%u/%u\n",
> +               clk, fin, setup_info->fout, fout_target, best_err / 100,
> +               best_err % 100, setup_info->m, setup_info->n, setup_info-=
>div);
> +       dev_dbg(dsi->dev,
> +               "vco_cntrl =3D 0x%x\tprop_cntrl =3D 0x%x\thsfreqrange =3D=
 0x%x\n",
> +               setup_info->vco_cntrl, setup_info->prop_cntrl,
> +               setup_info->hsfreqrange);
> +}
> +
> +static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi)
> +{
> +       struct drm_display_mode *mode =3D &dsi->display_mode;
> +       u32 setr;
> +       u32 vprmset0r;
> +       u32 vprmset1r;
> +       u32 vprmset2r;
> +       u32 vprmset3r;
> +       u32 vprmset4r;
> +
> +       /* Configuration for Pixel Stream and Packet Header */
> +       if (mipi_dsi_pixel_format_to_bpp(dsi->format) =3D=3D 24)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RG=
B24);
> +       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) =3D=3D 18)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RG=
B18);
> +       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) =3D=3D 16)
> +               rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RG=
B16);
> +       else {
> +               dev_warn(dsi->dev, "unsupported format");
> +               return;
> +       }
> +
> +       /* Configuration for Blanking sequence and Input Pixel */
> +       setr =3D TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
> +            | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
> +            | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
> +       rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
> +
> +       /* Configuration for Video Parameters */
> +       vprmset0r =3D (mode->flags & DRM_MODE_FLAG_PVSYNC ?
> +                    TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
> +                 | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
> +                    TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
> +                 | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
> +
> +       vprmset1r =3D TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
> +                 | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start=
);
> +
> +       vprmset2r =3D TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdispla=
y)
> +                 | TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
> +
> +       vprmset3r =3D TXVMVPRMSET3R_HACTIVE(mode->hdisplay)
> +                 | TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start=
);
> +
> +       vprmset4r =3D TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdispla=
y)
> +                 | TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
> +
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET0R, vprmset0r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET1R, vprmset1r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET2R, vprmset2r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET3R, vprmset3r);
> +       rcar_mipi_dsi_write(dsi, TXVMVPRMSET4R, vprmset4r);
> +}
> +
> +static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi)
> +{
> +       struct drm_display_mode *mode =3D &dsi->display_mode;
> +       struct dsi_setup_info setup_info =3D {};
> +       unsigned int timeout;
> +       int ret, i;
> +       int dsi_format;
> +       u32 phy_setup;
> +       u32 clockset2, clockset3;
> +       u32 ppisetr;
> +       u32 vclkset;
> +
> +       /* Checking valid format */
> +       dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +       if (dsi_format < 0) {
> +               dev_warn(dsi->dev, "invalid format");
> +               return -EINVAL;
> +       }
> +
> +       /* Parameters Calculation */
> +       rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
> +                                     mode->clock * 1000, &setup_info);
> +
> +       /* LPCLK enable */
> +       rcar_mipi_dsi_set(dsi, LPCLKSET, LPCLKSET_CKEN);
> +
> +       /* CFGCLK enabled */
> +       rcar_mipi_dsi_set(dsi, CFGCLKSET, CFGCLKSET_CKEN);
> +
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +
> +       rcar_mipi_dsi_set(dsi, PHTC, PHTC_TESTCLR);
> +       rcar_mipi_dsi_clr(dsi, PHTC, PHTC_TESTCLR);
> +
> +       /* PHY setting */
> +       phy_setup =3D rcar_mipi_dsi_read(dsi, PHYSETUP);
> +       phy_setup &=3D ~PHYSETUP_HSFREQRANGE_MASK;
> +       phy_setup |=3D PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
> +       rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(phtw); i++) {
> +               ret =3D rcar_mipi_dsi_phtw_test(dsi, phtw[i]);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       /* PLL Clock Setting */
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +       rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
> +
> +       clockset2 =3D CLOCKSET2_M(setup_info.m) | CLOCKSET2_N(setup_info.=
n)
> +                 | CLOCKSET2_VCO_CNTRL(setup_info.vco_cntrl);
> +       clockset3 =3D CLOCKSET3_PROP_CNTRL(setup_info.prop_cntrl)
> +                 | CLOCKSET3_INT_CNTRL(0)
> +                 | CLOCKSET3_CPBIAS_CNTRL(0x10)
> +                 | CLOCKSET3_GMP_CNTRL(1);
> +       rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
> +       rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
> +
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +       rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +       udelay(10);
> +       rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
> +
> +       ppisetr =3D PPISETR_DLEN_3 | PPISETR_CLEN;
> +       rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
> +
> +       rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +       rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       usleep_range(400, 500);
> +
> +       /* Checking PPI clock status register */
> +       for (timeout =3D 10; timeout > 0; --timeout) {
> +               if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
> +                   (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
> +                   (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
> +                       break;
> +
> +               usleep_range(1000, 2000);
> +       }
> +
> +       if (!timeout) {
> +               dev_err(dsi->dev, "failed to enable PPI clock\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(phtw2); i++) {
> +               ret =3D rcar_mipi_dsi_phtw_test(dsi, phtw2[i]);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       /* Enable DOT clock */
> +       vclkset =3D VCLKSET_CKEN;
> +       rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +
> +       if (dsi_format =3D=3D 24)
> +               vclkset |=3D VCLKSET_BPP_24;
> +       else if (dsi_format =3D=3D 18)
> +               vclkset |=3D VCLKSET_BPP_18;
> +       else if (dsi_format =3D=3D 16)
> +               vclkset |=3D VCLKSET_BPP_16;
> +       else {
> +               dev_warn(dsi->dev, "unsupported format");
> +               return -EINVAL;
> +       }
> +       vclkset |=3D VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
> +               |  VCLKSET_LANE(dsi->lanes - 1);
> +
> +       rcar_mipi_dsi_set(dsi, VCLKSET, vclkset);
> +
> +       /* After setting VCLKSET register, enable VCLKEN */
> +       rcar_mipi_dsi_set(dsi, VCLKEN, VCLKEN_CKEN);
> +
> +       dev_dbg(dsi->dev, "DSI device is started\n");
> +
> +       return 0;
> +}
> +
> +static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
> +{
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_RSTZ);
> +       rcar_mipi_dsi_clr(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
> +
> +       dev_dbg(dsi->dev, "DSI device is shutdown\n");
> +}
> +
> +static int rcar_mipi_dsi_clk_enable(struct rcar_mipi_dsi *dsi)
> +{
> +       int ret;
> +
> +       reset_control_deassert(dsi->rstc);
> +
> +       ret =3D clk_prepare_enable(dsi->clocks.mod);
> +       if (ret < 0)
> +               goto err_reset;
> +
> +       ret =3D clk_prepare_enable(dsi->clocks.dsi);
> +       if (ret < 0)
> +               goto err_clock;
> +
> +       return 0;
> +
> +err_clock:
> +       clk_disable_unprepare(dsi->clocks.mod);
> +err_reset:
> +       reset_control_assert(dsi->rstc);
> +       return ret;
> +}
> +
> +static void rcar_mipi_dsi_clk_disable(struct rcar_mipi_dsi *dsi)
> +{
> +       clk_disable_unprepare(dsi->clocks.dsi);
> +       clk_disable_unprepare(dsi->clocks.mod);
> +
> +       reset_control_assert(dsi->rstc);
> +}
> +
> +static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
> +{
> +       /*
> +        * In HW manual, we need to check TxDDRClkHS-Q Stable? but it dont
> +        * write how to check. So we skip this check in this patch
> +        */
> +       u32 status;
> +       int ret;
> +
> +       /* Start HS clock. */
> +       rcar_mipi_dsi_set(dsi, PPICLCR, PPICLCR_TXREQHS);
> +
> +       ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & PPICLSR_TOHS,
> +                               2000, 10000, false, dsi, PPICLSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable HS clock\n");
> +               return ret;
> +       }
> +
> +       rcar_mipi_dsi_set(dsi, PPICLSCR, PPICLSCR_TOHS);
> +
> +       return 0;
> +}
> +
> +static int rcar_mipi_dsi_start_video(struct rcar_mipi_dsi *dsi)
> +{
> +       u32 status;
> +       int ret;
> +
> +       /* Wait for the link to be ready. */
> +       ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               !(status & (LINKSR_LPBUSY | LINKSR_HSBUSY=
)),
> +                               2000, 10000, false, dsi, LINKSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Link failed to become ready\n");
> +               return ret;
> +       }
> +
> +       /* De-assert video FIFO clear. */
> +       rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_VFCLR);
> +
> +       ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & TXVMSR_VFRDY,
> +                               2000, 10000, false, dsi, TXVMSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Failed to de-assert video FIFO clear\n=
");
> +               return ret;
> +       }
> +
> +       /* Enable transmission in video mode. */
> +       rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_EN_VIDEO);
> +
> +       ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +                               status & TXVMSR_RDY,
> +                               2000, 10000, false, dsi, TXVMSR);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "Failed to enable video transmission\n"=
);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Bridge
> + */
> +
> +static int rcar_mipi_dsi_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{
> +       struct rcar_mipi_dsi *dsi =3D bridge_to_rcar_mipi_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, dsi->next_bridge, bridg=
e,
> +                                flags);
> +}
> +
> +static void rcar_mipi_dsi_mode_set(struct drm_bridge *bridge,
> +                                  const struct drm_display_mode *mode,
> +                                  const struct drm_display_mode *adjuste=
d_mode)
> +{
> +       struct rcar_mipi_dsi *dsi =3D bridge_to_rcar_mipi_dsi(bridge);
> +
> +       dsi->display_mode =3D *adjusted_mode;
> +}
> +
> +static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
> +{
> +       struct rcar_mipi_dsi *dsi =3D bridge_to_rcar_mipi_dsi(bridge);
> +       int ret;
> +
> +       ret =3D rcar_mipi_dsi_clk_enable(dsi);
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "failed to enable DSI clocks\n");
> +               return;
> +       }
> +
> +       ret =3D rcar_mipi_dsi_startup(dsi);
> +       if (ret < 0)
> +               goto err_dsi_startup;
> +
> +       rcar_mipi_dsi_set_display_timing(dsi);
> +
> +       ret =3D rcar_mipi_dsi_start_hs_clock(dsi);
> +       if (ret < 0)
> +               goto err_dsi_start_hs;
> +
> +       rcar_mipi_dsi_start_video(dsi);
> +
> +       return;
> +
> +err_dsi_start_hs:
> +       rcar_mipi_dsi_shutdown(dsi);
> +err_dsi_startup:
> +       rcar_mipi_dsi_clk_disable(dsi);
> +}
> +
> +static void rcar_mipi_dsi_disable(struct drm_bridge *bridge)
> +{
> +       struct rcar_mipi_dsi *dsi =3D bridge_to_rcar_mipi_dsi(bridge);
> +
> +       rcar_mipi_dsi_shutdown(dsi);
> +       rcar_mipi_dsi_clk_disable(dsi);
> +}
> +
> +static enum drm_mode_status
> +rcar_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
> +                               const struct drm_display_info *info,
> +                               const struct drm_display_mode *mode)
> +{
> +       if (mode->clock > 297000)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops =3D {
> +       .attach =3D rcar_mipi_dsi_attach,
> +       .mode_set =3D rcar_mipi_dsi_mode_set,
> +       .enable =3D rcar_mipi_dsi_enable,
> +       .disable =3D rcar_mipi_dsi_disable,
> +       .mode_valid =3D rcar_mipi_dsi_bridge_mode_valid,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Host setting
> + */
> +
> +static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> +                                    struct mipi_dsi_device *device)
> +{
> +       struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> +       int ret;
> +
> +       if (device->lanes > dsi->num_data_lanes)
> +               return -EINVAL;
> +
> +       dsi->lanes =3D device->lanes;
> +       dsi->format =3D device->format;
> +
> +       dsi->next_bridge =3D devm_drm_of_get_bridge(dsi->dev, dsi->dev->o=
f_node,
> +                                                 1, 0);
> +       if (IS_ERR(dsi->next_bridge)) {
> +               ret =3D PTR_ERR(dsi->next_bridge);
> +               dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /* Initialize the DRM bridge. */
> +       dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> +       dsi->bridge.of_node =3D dsi->dev->of_node;
> +       drm_bridge_add(&dsi->bridge);
> +
> +       return 0;
> +}
> +
> +static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> +                                       struct mipi_dsi_device *device)
> +{
> +       struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> +
> +       drm_bridge_remove(&dsi->bridge);
> +
> +       return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops rcar_mipi_dsi_host_ops =3D {
> +       .attach =3D rcar_mipi_dsi_host_attach,
> +       .detach =3D rcar_mipi_dsi_host_detach,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Probe & Remove
> + */
> +
> +static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
> +{
> +       struct device_node *ep;
> +       u32 data_lanes[4];
> +       int ret;
> +
> +       ep =3D of_graph_get_endpoint_by_regs(dsi->dev->of_node, 1, 0);
> +       if (!ep) {
> +               dev_dbg(dsi->dev, "unconnected port@1\n");
> +               return -ENODEV;
> +       }
> +
> +       ret =3D of_property_read_variable_u32_array(ep, "data-lanes", dat=
a_lanes,
> +                                                 1, 4);
> +       of_node_put(ep);
> +
> +       if (ret < 0) {
> +               dev_err(dsi->dev, "missing or invalid data-lanes property=
\n");
> +               return -ENODEV;
> +       }
> +
> +       dsi->num_data_lanes =3D ret;
> +       return 0;
> +}
> +
> +static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *dsi,
> +                                          const char *name,
> +                                          bool optional)
> +{
> +       struct clk *clk;
> +
> +       clk =3D devm_clk_get(dsi->dev, name);
> +       if (!IS_ERR(clk))
> +               return clk;
> +
> +       if (PTR_ERR(clk) =3D=3D -ENOENT && optional)
> +               return NULL;
> +
> +       dev_err_probe(dsi->dev, PTR_ERR(clk), "failed to get %s clock\n",
> +                     name ? name : "module");
> +
> +       return clk;
> +}
> +
> +static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
> +{
> +       dsi->clocks.mod =3D rcar_mipi_dsi_get_clock(dsi, NULL, false);
> +       if (IS_ERR(dsi->clocks.mod))
> +               return PTR_ERR(dsi->clocks.mod);
> +
> +       dsi->clocks.pll =3D rcar_mipi_dsi_get_clock(dsi, "pll", true);
> +       if (IS_ERR(dsi->clocks.pll))
> +               return PTR_ERR(dsi->clocks.pll);
> +
> +       dsi->clocks.dsi =3D rcar_mipi_dsi_get_clock(dsi, "dsi", true);
> +       if (IS_ERR(dsi->clocks.dsi))
> +               return PTR_ERR(dsi->clocks.dsi);
> +
> +       if (!dsi->clocks.pll && !dsi->clocks.dsi) {
> +               dev_err(dsi->dev, "no input clock (pll, dsi)\n");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int rcar_mipi_dsi_probe(struct platform_device *pdev)
> +{
> +       struct rcar_mipi_dsi *dsi;
> +       struct resource *mem;
> +       int ret;
> +
> +       dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
> +       if (dsi =3D=3D NULL)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, dsi);
> +
> +       dsi->dev =3D &pdev->dev;
> +       dsi->info =3D of_device_get_match_data(&pdev->dev);
> +
> +       ret =3D rcar_mipi_dsi_parse_dt(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Acquire resources. */
> +       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       dsi->mmio =3D devm_ioremap_resource(dsi->dev, mem);
> +       if (IS_ERR(dsi->mmio))
> +               return PTR_ERR(dsi->mmio);
> +
> +       ret =3D rcar_mipi_dsi_get_clocks(dsi);
> +       if (ret < 0)
> +               return ret;
> +
> +       dsi->rstc =3D devm_reset_control_get(dsi->dev, NULL);
> +       if (IS_ERR(dsi->rstc)) {
> +               dev_err(dsi->dev, "failed to get cpg reset\n");
> +               return PTR_ERR(dsi->rstc);
> +       }
> +
> +       /* Initialize the DSI host. */
> +       dsi->host.dev =3D dsi->dev;
> +       dsi->host.ops =3D &rcar_mipi_dsi_host_ops;
> +       ret =3D mipi_dsi_host_register(&dsi->host);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int rcar_mipi_dsi_remove(struct platform_device *pdev)
> +{
> +       struct rcar_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> +
> +       mipi_dsi_host_unregister(&dsi->host);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id rcar_mipi_dsi_of_table[] =3D {
> +       { .compatible =3D "renesas,r8a779a0-dsi-csi2-tx" },
> +       { }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
> +
> +static struct platform_driver rcar_mipi_dsi_platform_driver =3D {
> +       .probe          =3D rcar_mipi_dsi_probe,
> +       .remove         =3D rcar_mipi_dsi_remove,
> +       .driver         =3D {
> +               .name   =3D "rcar-mipi-dsi",
> +               .of_match_table =3D rcar_mipi_dsi_of_table,
> +       },
> +};
> +
> +module_platform_driver(rcar_mipi_dsi_platform_driver);
> +
> +MODULE_DESCRIPTION("Renesas R-Car MIPI DSI Encoder Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/d=
rm/rcar-du/rcar_mipi_dsi_regs.h
> new file mode 100644
> index 000000000000..0e7a9274749f
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * rcar_mipi_dsi_regs.h  --  R-Car MIPI DSI Interface Registers Definiti=
ons
> + *
> + * Copyright (C) 2020 Renesas Electronics Corporation
> + */
> +
> +#ifndef __RCAR_MIPI_DSI_REGS_H__
> +#define __RCAR_MIPI_DSI_REGS_H__
> +
> +#define LINKSR                         0x010
> +#define LINKSR_LPBUSY                  (1 << 1)
> +#define LINKSR_HSBUSY                  (1 << 0)
> +
> +/*
> + * Video Mode Register
> + */
> +#define TXVMSETR                       0x180
> +#define TXVMSETR_SYNSEQ_PULSES         (0 << 16)
> +#define TXVMSETR_SYNSEQ_EVENTS         (1 << 16)
> +#define TXVMSETR_VSTPM                 (1 << 15)
> +#define TXVMSETR_PIXWDTH               (1 << 8)
> +#define TXVMSETR_VSEN_EN               (1 << 4)
> +#define TXVMSETR_VSEN_DIS              (0 << 4)
> +#define TXVMSETR_HFPBPEN_EN            (1 << 2)
> +#define TXVMSETR_HFPBPEN_DIS           (0 << 2)
> +#define TXVMSETR_HBPBPEN_EN            (1 << 1)
> +#define TXVMSETR_HBPBPEN_DIS           (0 << 1)
> +#define TXVMSETR_HSABPEN_EN            (1 << 0)
> +#define TXVMSETR_HSABPEN_DIS           (0 << 0)
> +
> +#define TXVMCR                         0x190
> +#define TXVMCR_VFCLR                   (1 << 12)
> +#define TXVMCR_EN_VIDEO                        (1 << 0)
> +
> +#define TXVMSR                         0x1a0
> +#define TXVMSR_STR                     (1 << 16)
> +#define TXVMSR_VFRDY                   (1 << 12)
> +#define TXVMSR_ACT                     (1 << 8)
> +#define TXVMSR_RDY                     (1 << 0)
> +
> +#define TXVMSCR                                0x1a4
> +#define TXVMSCR_STR                    (1 << 16)
> +
> +#define TXVMPSPHSETR                   0x1c0
> +#define TXVMPSPHSETR_DT_RGB16          (0x0e << 16)
> +#define TXVMPSPHSETR_DT_RGB18          (0x1e << 16)
> +#define TXVMPSPHSETR_DT_RGB18_LS       (0x2e << 16)
> +#define TXVMPSPHSETR_DT_RGB24          (0x3e << 16)
> +#define TXVMPSPHSETR_DT_YCBCR16                (0x2c << 16)
> +
> +#define TXVMVPRMSET0R                  0x1d0
> +#define TXVMVPRMSET0R_HSPOL_HIG                (0 << 17)
> +#define TXVMVPRMSET0R_HSPOL_LOW                (1 << 17)
> +#define TXVMVPRMSET0R_VSPOL_HIG                (0 << 16)
> +#define TXVMVPRMSET0R_VSPOL_LOW                (1 << 16)
> +#define TXVMVPRMSET0R_CSPC_RGB         (0 << 4)
> +#define TXVMVPRMSET0R_CSPC_YCbCr       (1 << 4)
> +#define TXVMVPRMSET0R_BPP_16           (0 << 0)
> +#define TXVMVPRMSET0R_BPP_18           (1 << 0)
> +#define TXVMVPRMSET0R_BPP_24           (2 << 0)
> +
> +#define TXVMVPRMSET1R                  0x1d4
> +#define TXVMVPRMSET1R_VACTIVE(x)       (((x) & 0x7fff) << 16)
> +#define TXVMVPRMSET1R_VSA(x)           (((x) & 0xfff) << 0)
> +
> +#define TXVMVPRMSET2R                  0x1d8
> +#define TXVMVPRMSET2R_VFP(x)           (((x) & 0x1fff) << 16)
> +#define TXVMVPRMSET2R_VBP(x)           (((x) & 0x1fff) << 0)
> +
> +#define TXVMVPRMSET3R                  0x1dc
> +#define TXVMVPRMSET3R_HACTIVE(x)       (((x) & 0x7fff) << 16)
> +#define TXVMVPRMSET3R_HSA(x)           (((x) & 0xfff) << 0)
> +
> +#define TXVMVPRMSET4R                  0x1e0
> +#define TXVMVPRMSET4R_HFP(x)           (((x) & 0x1fff) << 16)
> +#define TXVMVPRMSET4R_HBP(x)           (((x) & 0x1fff) << 0)
> +
> +/*
> + * PHY-Protocol Interface (PPI) Registers
> + */
> +#define PPISETR                                0x700
> +#define PPISETR_DLEN_0                 (0x1 << 0)
> +#define PPISETR_DLEN_1                 (0x3 << 0)
> +#define PPISETR_DLEN_2                 (0x7 << 0)
> +#define PPISETR_DLEN_3                 (0xf << 0)
> +#define PPISETR_CLEN                   (1 << 8)
> +
> +#define PPICLCR                                0x710
> +#define PPICLCR_TXREQHS                        (1 << 8)
> +#define PPICLCR_TXULPSEXT              (1 << 1)
> +#define PPICLCR_TXULPSCLK              (1 << 0)
> +
> +#define PPICLSR                                0x720
> +#define PPICLSR_HSTOLP                 (1 << 27)
> +#define PPICLSR_TOHS                   (1 << 26)
> +#define PPICLSR_STPST                  (1 << 0)
> +
> +#define PPICLSCR                       0x724
> +#define PPICLSCR_HSTOLP                        (1 << 27)
> +#define PPICLSCR_TOHS                  (1 << 26)
> +
> +#define PPIDLSR                                0x760
> +#define PPIDLSR_STPST                  (0xf << 0)
> +
> +/*
> + * Clocks registers
> + */
> +#define LPCLKSET                       0x1000
> +#define LPCLKSET_CKEN                  (1 << 8)
> +#define LPCLKSET_LPCLKDIV(x)           (((x) & 0x3f) << 0)
> +
> +#define CFGCLKSET                      0x1004
> +#define CFGCLKSET_CKEN                 (1 << 8)
> +#define CFGCLKSET_CFGCLKDIV(x)         (((x) & 0x3f) << 0)
> +
> +#define DOTCLKDIV                      0x1008
> +#define DOTCLKDIV_CKEN                 (1 << 8)
> +#define DOTCLKDIV_DOTCLKDIV(x)         (((x) & 0x3f) << 0)
> +
> +#define VCLKSET                                0x100c
> +#define VCLKSET_CKEN                   (1 << 16)
> +#define VCLKSET_COLOR_RGB              (0 << 8)
> +#define VCLKSET_COLOR_YCC              (1 << 8)
> +#define VCLKSET_DIV(x)                 (((x) & 0x3) << 4)
> +#define VCLKSET_BPP_16                 (0 << 2)
> +#define VCLKSET_BPP_18                 (1 << 2)
> +#define VCLKSET_BPP_18L                        (2 << 2)
> +#define VCLKSET_BPP_24                 (3 << 2)
> +#define VCLKSET_LANE(x)                        (((x) & 0x3) << 0)
> +
> +#define VCLKEN                         0x1010
> +#define VCLKEN_CKEN                    (1 << 0)
> +
> +#define PHYSETUP                       0x1014
> +#define PHYSETUP_HSFREQRANGE(x)                (((x) & 0x7f) << 16)
> +#define PHYSETUP_HSFREQRANGE_MASK      (0x7f << 16)
> +#define PHYSETUP_CFGCLKFREQRANGE(x)    (((x) & 0x3f) << 8)
> +#define PHYSETUP_SHUTDOWNZ             (1 << 1)
> +#define PHYSETUP_RSTZ                  (1 << 0)
> +
> +#define CLOCKSET1                      0x101c
> +#define CLOCKSET1_LOCK_PHY             (1 << 17)
> +#define CLOCKSET1_LOCK                 (1 << 16)
> +#define CLOCKSET1_CLKSEL               (1 << 8)
> +#define CLOCKSET1_CLKINSEL_EXTAL       (0 << 2)
> +#define CLOCKSET1_CLKINSEL_DIG         (1 << 2)
> +#define CLOCKSET1_CLKINSEL_DU          (1 << 3)
> +#define CLOCKSET1_SHADOW_CLEAR         (1 << 1)
> +#define CLOCKSET1_UPDATEPLL            (1 << 0)
> +
> +#define CLOCKSET2                      0x1020
> +#define CLOCKSET2_M(x)                 (((x) & 0xfff) << 16)
> +#define CLOCKSET2_VCO_CNTRL(x)         (((x) & 0x3f) << 8)
> +#define CLOCKSET2_N(x)                 (((x) & 0xf) << 0)
> +
> +#define CLOCKSET3                      0x1024
> +#define CLOCKSET3_PROP_CNTRL(x)                (((x) & 0x3f) << 24)
> +#define CLOCKSET3_INT_CNTRL(x)         (((x) & 0x3f) << 16)
> +#define CLOCKSET3_CPBIAS_CNTRL(x)      (((x) & 0x7f) << 8)
> +#define CLOCKSET3_GMP_CNTRL(x)         (((x) & 0x3) << 0)
> +
> +#define PHTW                           0x1034
> +#define PHTW_DWEN                      (1 << 24)
> +#define PHTW_TESTDIN_DATA(x)           (((x) & 0xff) << 16)
> +#define PHTW_CWEN                      (1 << 8)
> +#define PHTW_TESTDIN_CODE(x)           (((x) & 0xff) << 0)
> +
> +#define PHTC                           0x103c
> +#define PHTC_TESTCLR                   (1 << 0)
> +
> +#endif /* __RCAR_MIPI_DSI_REGS_H__ */
> --=20
> Regards,
>=20
> Laurent Pinchart
>
