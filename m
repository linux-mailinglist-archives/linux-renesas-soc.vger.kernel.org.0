Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 563A972002F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 13:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbjFBLPS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 07:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234872AbjFBLPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 07:15:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4B8CE;
        Fri,  2 Jun 2023 04:15:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 668CE6E0;
        Fri,  2 Jun 2023 13:14:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685704490;
        bh=/MdE2sKvMfcS77XSPTNugqlB7UUuZXVPDVGR3BOs8aM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vMfEvTEQs2G6eO7fAlcijX2NScsMfBlh6DbVz48zfnTDWFQT60gOTkBb9IivCuKZe
         lfQQVhI+vVjodQAmTMZEkxZ4ULyJoca4F2PU743Xvb9y3UPYU2hmkCTikMdIbDIdVh
         6Ph7ZquJyEuZ4sXNdD9vO7JjNT/i8XMzXS+k8wtI=
Date:   Fri, 2 Jun 2023 14:15:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
 support
Message-ID: <20230602111510.GE26944@pendragon.ideasonboard.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB59220E8306506F3E0B17968A86789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922CC640A93CF85033FB47086469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230529141349.GA15264@pendragon.ideasonboard.com>
 <OS0PR01MB5922B66349F301074C51018F864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230529154504.GC15264@pendragon.ideasonboard.com>
 <OS0PR01MB59222EFBB7C6549620192AAF86499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59222EFBB7C6549620192AAF86499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Jun 01, 2023 at 12:12:59PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display
> > Unit support
> > 
> > On Mon, May 29, 2023 at 02:22:06PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L
> > > > Display Unit support
> > > > On Thu, May 25, 2023 at 02:30:10PM +0000, Biju Das wrote:
> > > > > Hi DRM maintainers,
> > > > >
> > > > > Gentle ping.
> > > >
> > > > Sorry, I was on holidays the last two weeks.
> > > >
> > > > > Are we happy with moving all Renesas drm drivers to Renesas
> > > > > specific directory or preference is for separate one??
> > > >
> > > > This works for me.
> > > >
> > > > > If it is later, I can send RZ/G2L drm driver separate.
> > > > >
> > > > > Otherwise, I need to rebase and resend.
> > > >
> > > > Your series applies cleanly on top of the latest drm-next branch. Is
> > > > there a specific need to rebase and resend ?
> > >
> > > Nope. After my patch series there were some patches from Geert for
> > > drm/shmobile merged to drm-misc-next by Thomas.
> > >
> > > Maybe git managed this automatically??
> > 
> > Probably, git is nice :-)
> > 
> > > > I haven't had time to review patch 4/5 (the driver) yet. All the
> > > > rest looks good to me. Should I already include 1/5 in my next pull
> > request ?
> > >
> > > Yes, please.
> > 
> > OK, I will do so. I've reviewed 4/5 in the meantime, but changes are
> > needed, so I won't wait for v10 before applying 1/5.
> 
> I have incorporated review comments for v9. I need to rebase my changes.
> 
> Is the pull request being done to drm-misc-next?

I've just sent the pull request for drm-next, and have CC'ed you.

> > > > > Please let me know your preference.
> > > > >
> > > > > Cheers,
> > > > > Biju
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Biju Das
> > > > > > Sent: Monday, May 15, 2023 8:58 AM
> > > > > > To: David Airlie <airlied@gmail.com>; Daniel Vetter
> > > > > > <daniel@ffwll.ch>; Philipp Zabel <p.zabel@pengutronix.de>; Geert
> > > > > > Uytterhoeven <geert+renesas@glider.be>; Laurent Pinchart
> > > > > > <laurent.pinchart@ideasonboard.com>; Kieran Bingham
> > > > > > <kieran.bingham+renesas@ideasonboard.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org;
> > > > > > linux-renesas-soc@vger.kernel.org;
> > > > > > Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Prabhakar
> > > > > > Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Subject: RE: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L
> > > > > > Display Unit support
> > > > > >
> > > > > > Hi All,
> > > > > >
> > > > > > Gentle ping. Are we happy with this patch series?
> > > > > >
> > > > > > Cheers,
> > > > > > Biju
> > > > > >
> > > > > > > Subject: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L
> > > > > > > Display Unit support
> > > > > > >
> > > > > > > RZ/G2L LCD controller composed of Frame compression
> > > > > > > Processor(FCPVD), Video signal processor (VSPD) and Display
> > > > > > > unit(DU). The output of LCDC is connected to Display parallel
> > > > > > > interface and MIPI link video interface.
> > > > > > >
> > > > > > > The output from DSI is connected to ADV7535.
> > > > > > >
> > > > > > > Created a vendor specific directory renesas and moved all
> > > > > > > renesas drm drivers to it (rcar-du and shmobile). Then added
> > > > > > > support for RZ/G2L DU DRM driver by creating rz_du directory.
> > > > > > >
> > > > > > > Ref:
> > > > > > >
> > > > > > >
> > > > > > > v8->v9:
> > > > > > >  * Added Rb tag from Laurent and Acked-by tag from Kieran for
> > > > patch#1.
> > > > > > >  * Added Rb tag from Laurent and Geert for patch#3.
> > > > > > >  * Dropped reset_control_assert() from error patch for
> > > > > > > rzg2l_du_crtc_get() as
> > > > > > >    suggested by Philipp Zabel.
> > > > > > >  * Added Rb tag from Laurent oatch#5.
> > > > > > >  * Updated MAINTAINERS entries for common parts(Makefile and
> > > > Kconfig).
> > > > > > > v7->v8:
> > > > > > >  * Moved rcar-du and shmobile DRM drivers to renesas specific
> > > > > > > vendor directory.
> > > > > > >  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
> > > > > > >  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
> > > > > > >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by
> > > > > > > creating rz_du folder.
> > > > > > >  * Updated MAINTAINERS entries.
> > > > > > > v6->v7:
> > > > > > >  * Split DU lib and  RZ/G2L du driver as separate patch series
> > as
> > > > > > >    DU support added to more platforms based on RZ/G2L alike
> > SoCs.
> > > > > > >  * Rebased to latest drm-tip.
> > > > > > >  * Added patch #2 for binding support for RZ/V2L DU
> > > > > > >  * Added patch #4 for driver support for RZ/V2L DU
> > > > > > >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> > > > > > >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> > > > > > >  * Added patch #7 for Enabling DU on SMARC EVK based on
> > > > > > > RZ/{G2L,V2L} SoCs.
> > > > > > >  * Added patch #8 for Enabling DU on SMARC EVK based on
> > > > > > > RZ/G2LC
> > > > SoC.
> > > > > > > v5->v6:
> > > > > > >  * Merged DU lib and RZ/G2L du driver in same patch series
> > > > > > >  * Rebased to latest drm-misc.
> > > > > > >  * Merged patch#1 to RZ/G2L Driver patch.
> > > > > > >  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
> > > > > > >  * Optimized rzg2l_du_output_name() by removing unsupported
> > > > outputs.
> > > > > > >
> > > > > > > v4->v5:
> > > > > > >  * Added Rb tag from Rob for binding patch.
> > > > > > >  * Started using RCar DU libs(kms, vsp and encoder)
> > > > > > >  * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
> > > > > > >    rcar_du_format_info and rcar_du_encoder.
> > > > > > > v3->v4:
> > > > > > >  * Changed compatible name from
> > > > > > > renesas,du-r9a07g044->renesas,r9a07g044-
> > > > > > > du
> > > > > > >  * started using same compatible for RZ/G2{L,LC}
> > > > > > >  * Removed rzg2l_du_group.h and struct rzg2l_du_group
> > > > > > >  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
> > > > > > >  * Removed rzg2l_du_group_restart
> > > > > > >  * Updated rzg2l_du_crtc_set_display_timing
> > > > > > >  * Removed mode_valid callback.
> > > > > > >  * Updated rzg2l_du_crtc_create() parameters
> > > > > > >  * Updated compatible
> > > > > > >  * Removed RZG2L_DU_MAX_GROUPS
> > > > > > > V2->v3:
> > > > > > >  * Added new bindings for RZ/G2L DU
> > > > > > >  * Removed indirection and created new DRM driver based on
> > > > > > > R-Car DU
> > > > > > > v1->v2:
> > > > > > >  * Based on [1], all references to 'rzg2l_lcdc' replaced with
> > > > > > 'rzg2l_du'
> > > > > > >  * Updated commit description for bindings
> > > > > > >  * Removed LCDC references from bindings
> > > > > > >  * Changed clock name from du.0->aclk from bindings
> > > > > > >  * Changed reset name from du.0->du from bindings
> > > > > > >  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
> > > > > > >  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
> > > > > > >  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
> > > > > > >  * Added forward declaration for struct reset_control
> > > > > > >
> > > > > > > [1]
> > > > > > >
> > > > > > > Biju Das (5):
> > > > > > >   drm: Place Renesas drivers in a separate dir
> > > > > > >   dt-bindings: display: Document Renesas RZ/G2L DU bindings
> > > > > > >   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU
> > > > bindings
> > > > > > >   drm: Add RZ/G2L DU Support
> > > > > > >   MAINTAINERS: Add maintainer for RZ DU drivers
> > > > > > >
> > > > > > >  .../bindings/display/renesas,rzg2l-du.yaml    | 129 +++
> > > > > > >  MAINTAINERS                                   |  16 +-
> > > > > > >  drivers/gpu/drm/Kconfig                       |   4 +-
> > > > > > >  drivers/gpu/drm/Makefile                      |   3 +-
> > > > > > >  drivers/gpu/drm/renesas/Kconfig               |   5 +
> > > > > > >  drivers/gpu/drm/renesas/Makefile              |   5 +
> > > > > > >  drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig |   0
> > > > > > >  .../gpu/drm/{ => renesas}/rcar-du/Makefile    |   0
> > > > > > >  .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c  |   0
> > > > > > >  .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h  |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_crtc.c  |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_crtc.h  |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_drv.c   |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_drv.h   |   0
> > > > > > >  .../{ => renesas}/rcar-du/rcar_du_encoder.c   |   0
> > > > > > >  .../{ => renesas}/rcar-du/rcar_du_encoder.h   |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_group.c |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_group.h |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_kms.c   |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_kms.h   |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_plane.c |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_plane.h |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_regs.h  |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_vsp.c   |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_du_vsp.h   |   0
> > > > > > >  .../{ => renesas}/rcar-du/rcar_du_writeback.c |   0
> > > > > > >  .../{ => renesas}/rcar-du/rcar_du_writeback.h |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c  |   0
> > > > > > >  .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c |   0
> > > > > > >  .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h |   0
> > > > > > >  .../{ => renesas}/rcar-du/rcar_lvds_regs.h    |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c |   0
> > > > > > >  .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h |   0
> > > > > > >  .../rcar-du/rcar_mipi_dsi_regs.h              |   0
> > > > > > >  .../{ => renesas}/rcar-du/rzg2l_mipi_dsi.c    |   0
> > > > > > >  .../rcar-du/rzg2l_mipi_dsi_regs.h             |   0
> > > > > > >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
> > > > > > >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> > > > > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714
> > > > > > > ++++++++++++++++ drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > > > > > > ++++++++++++++++ |
> > > > > > > 99 +++ drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188
> > > > > > > +++++ drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> > > > > > > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> > > > > > > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770
> > > > > > > ++++++++++++++++++ drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.
> > > > > > > ++++++++++++++++++ h  |
> > > > > > > 43 + drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
> > > > > > >  .../gpu/drm/{ => renesas}/shmobile/Kconfig    |   0
> > > > > > >  .../gpu/drm/{ => renesas}/shmobile/Makefile   |   0
> > > > > > >  .../shmobile/shmob_drm_backlight.c            |   0
> > > > > > >  .../shmobile/shmob_drm_backlight.h            |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_crtc.c   |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_crtc.h   |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_drv.c    |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_drv.h    |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_kms.c    |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_kms.h    |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_plane.c  |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_plane.h  |   0
> > > > > > >  .../{ => renesas}/shmobile/shmob_drm_regs.h   |   0
> > > > > > >  62 files changed, 2816 insertions(+), 8 deletions(-)  create
> > > > > > > mode
> > > > > > > 100644
> > > > > > > Documentation/devicetree/bindings/display/renesas,rzg2l-du.yam
> > > > > > > l  create mode 100644 drivers/gpu/drm/renesas/Kconfig  create
> > > > > > > mode
> > > > > > > 100644 drivers/gpu/drm/renesas/Makefile  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/Makefile (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_crtc.h (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_encoder.c (100%) rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_group.c (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_kms.h (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_regs.h (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_du_writeback.c (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h
> > > > > > > (100%) rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_dw_hdmi.c (100%) rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h
> > > > > > > (100%) rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_lvds_regs.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_mipi_dsi.c (100%)  rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h (100%)
> > > > > > > rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%) rename
> > > > > > > drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c
> > > > > > > (100%) rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/rcar-du/rzg2l_mipi_dsi_regs.h
> > > > > > > (100%)  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/Kconfig
> > > > > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > > > > > >  create mode 100644
> > > > > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > > > > > >  rename drivers/gpu/drm/{ => renesas}/shmobile/Kconfig (100%)
> > > > > > > rename drivers/gpu/drm/{ => renesas}/shmobile/Makefile (100%)
> > > > > > > rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_backlight.c (100%) rename
> > > > > > > drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_crtc.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_crtc.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_drv.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_drv.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_kms.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_kms.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_plane.c
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_plane.h
> > > > > > > (100%)  rename drivers/gpu/drm/{ =>
> > > > > > > renesas}/shmobile/shmob_drm_regs.h
> > > > > > > (100%)

-- 
Regards,

Laurent Pinchart
