Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 234915A39AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Aug 2022 21:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbiH0TMP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 27 Aug 2022 15:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbiH0TMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Aug 2022 15:12:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43002F14E7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Aug 2022 12:12:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E1A24A8;
        Sat, 27 Aug 2022 21:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661627531;
        bh=50bK6KEubHdzeolJo4moK8fWd6ZeDT7o3H5DZr9qfew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gvf8yqlQFZOn81XQhunqFU66gOaoaCKOOqmExE+dviPHtsIp/G34pqBYynQUz3xjE
         d3iA7TGIhh3l0w4SBot6ojXTnyPr5B/qAwo7M0StP762dLJNxj5K/ch/l4DZKYNHS9
         hF29l0IDOtbnO7CVCmT+mvky5Ca3/nLI58rRgMKA=
Date:   Sat, 27 Aug 2022 22:12:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/2] drm: rcar-du: Add RZ/G2L DSI driver
Message-ID: <YwpsgydNJ7Q02Liz@pendragon.ideasonboard.com>
References: <20220825134229.2620498-1-biju.das.jz@bp.renesas.com>
 <20220825134229.2620498-3-biju.das.jz@bp.renesas.com>
 <Ywln5oLgj5BS0F1p@pendragon.ideasonboard.com>
 <OS0PR01MB592207846D74BCF795A92C3686749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592207846D74BCF795A92C3686749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sat, Aug 27, 2022 at 07:07:20PM +0000, Biju Das wrote:
> Subject: Re: [PATCH v5 2/2] drm: rcar-du: Add RZ/G2L DSI driver
> > On Thu, Aug 25, 2022 at 02:42:29PM +0100, Biju Das wrote:
> > > This driver supports the MIPI DSI encoder found in the RZ/G2L SoC. It
> > > currently supports DSI mode only.
> > 
> > What other modes than DSI are there ?
> 
> Currently it supports video mode only (video-input operation).
> 
> This mode is tested with DSI connected to ADV7535 bridge.
> 
> But lot of customers are asking for DSI panel support as well.
> So going forward this driver needs to support DSI DCS commands
> for supporting DSI panels.

Ah OK. Then you can update the commit message to say "DSI video mode
only" instead of "DSI mode only".

> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > > v4->v5:
> > >  * Added Ack from Sam.
> > >  * Added a trivial change, replaced rzg2l_mipi_dsi_parse_dt()
> > >    with drm_of_get_data_lanes_count_ep() in probe.
> > > v3->v4:
> > >  * Updated error handling in rzg2l_mipi_dsi_startup() and rzg2l_mipi_dsi_atomic_enable()
> > > v2->v3:
> > >  * pass rzg2l_mipi_dsi pointer to {Link,Phy} register rd/wr function instead
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
> > >  * Added error check for pm, using pm_runtime_resume_and_get() instead of
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
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig               |   8 +
> > >  drivers/gpu/drm/rcar-du/Makefile              |   2 +
> > >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c      | 690 ++++++++++++++++++
> > >  drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h | 151 ++++
> > >  4 files changed, 851 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c
> > >  create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart
