Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A923950724E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 17:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354095AbiDSP62 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 11:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351558AbiDSP60 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 11:58:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E6A22BEF;
        Tue, 19 Apr 2022 08:55:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-6-68-nat.elisa-mobile.fi [85.76.6.68])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61EEC25B;
        Tue, 19 Apr 2022 17:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650383740;
        bh=La0FEpdR7N0qJzfxw6OvtA8CicCic6LnoI8ZOAYYD8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vFOEDWSwY0xwH/8ygRECC/eEGnto6L2Ri1tbeFipWTE5AT07kJGqvLkaayL0KMrYs
         B0seryqAAIQrdrzSbut1pFOM1694KML6yUidAOBXVox9ElqvyRL/qGCUBB+EzKIo/z
         8bQur4xQNSbO4X5N8fa30YZimd2Ed706hm2SYYlo=
Date:   Tue, 19 Apr 2022 18:55:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@" <vger.kernel.orglinux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Message-ID: <Yl7beXCaRCj/xJbq@pendragon.ideasonboard.com>
References: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
 <20220316115551.29222-4-biju.das.jz@bp.renesas.com>
 <164992556078.22830.1913645020940169619@Monstersaurus>
 <OS0PR01MB592209477F5EBBBA902DDDC086EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <164996310425.22830.2992726762723537347@Monstersaurus>
 <OS0PR01MB59226E537BB85C234DC87CBD86EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <165037712258.2548121.489298521958356607@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <165037712258.2548121.489298521958356607@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 19, 2022 at 03:05:22PM +0100, Kieran Bingham wrote:
> Quoting Biju Das (2022-04-14 22:37:37)
> > > Subject: RE: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L
> > > VSPD
> > > 
> > > Quoting Biju Das (2022-04-14 12:34:53)
> > > > > Subject: Re: [PATCH v6 3/3] media: renesas: vsp1: Add support for
> > > > > RZ/G2L VSPD
> > > > >
> > > > > Quoting Biju Das (2022-03-16 11:55:51)
> > > > > > The RZ/G2L VSPD provides a single VSPD instance. It has the
> > > > > > following sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> > > > > >
> > > > > > The VSPD block on RZ/G2L does not have a version register, so
> > > > > > added a new compatible string "renesas,rzg2l-vsp2" with a data
> > > > > > pointer containing the info structure. Also the reset line is
> > > > > > shared with the DU module.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v5->v6:
> > > > > >  * Rebased to media_staging and updated commit header
> > > > > >  * Removed the extra tab from rzg2l_vsp2_device_info
> > > > > >  * Changed the function vsp1_lookup->vsp1_lookup_info and
> > > > > >    all info match related code moved here.
> > > > > >  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
> > > > > >    distinguish HW & SW IP_VSP_Version.
> > > > > >  * Used 0x80 for RZG2L VSPD model and SoC identification
> > > > > >  * Updated Switch() for LIF0 buffer attribute handling.
> > > > > > v4->v5:
> > > > > >  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
> > > > > >  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
> > > > > >    for RZ/G2L SoC's.
> > > > > > v3->v4:
> > > > > >  * Added Rb tag from Geert
> > > > > >  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> > > > > > v2->v3:
> > > > > >  * Fixed version comparison in vsp1_lookup()
> > > > > > v1->v2:
> > > > > >  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
> > > > > >  * Added standalone device info for rzg2l-vsp2.
> > > > > >  * Added vsp1_lookup helper function.
> > > > > >  * Updated comments for LIF0 buffer attribute register
> > > > > >  * Used last ID for rzg2l-vsp2.
> > > > > > RFC->v1:
> > > > > >  * Used data pointer containing info structure to retrieve version information
> > > > > > RFC:
> > > > > > ---
> > > > > >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 56 ++++++++++++++--
> > > ---
> > > > > >  .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 ++++--
> > > > > >  .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 +++
> > > > > >  3 files changed, 62 insertions(+), 20 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > > > > b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > > > > index 159b68fa0829..f1f52c0c1c59 100644
> > > > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > > > > > @@ -812,11 +812,47 @@ static const struct vsp1_device_info
> > > > > vsp1_device_infos[] = {
> > > > > >         },
> > > > > >  };
> > > > > >
> > > > > > +static const struct vsp1_device_info rzg2l_vsp2_device_info = {
> > > > > > +       .version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> > > > > > +       .model = "VSP2-D",
> > > > > > +       .gen = 3,
> > > > > > +       .features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> > > > > > +       .lif_count = 1,
> > > > > > +       .rpf_count = 2,
> > > > > > +       .wpf_count = 1,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct vsp1_device_info *vsp1_lookup_info(struct
> > > > > > +vsp1_device *vsp1) {
> > > > > > +       const struct vsp1_device_info *info;
> > > > > > +       unsigned int i;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * Try the info stored in match data first for devices that don't have
> > > > > > +        * a version register.
> > > > > > +        */
> > > > > > +       info = of_device_get_match_data(vsp1->dev);
> > > > > > +       if (info)
> > > > >
> > > > > Presumably - as this will not call vsp1_read(vsp1, VI6_IP_VERSION),
> > > > > we could/should always set vsp1->version here, or'ing in the _SW
> > > > > flag with the derived version and SoC identifiers from the info
> > > > > structure.
> > > >
> > > > OK, I have prototyped as per your suggestion, and it looks good.
> > > >
> > > > Here it is
> > > >
> > > >       if (info) {
> > > >               vsp1->quirks = LIF_BUF_ATTR_QUIRKS;
> > > 
> > > No - quirks are device specific - they (/it) shouldn't be here.  I think
> > > it should be something that is set in the vsp1_device_info like the
> > > features flags.
> > 
> > If we want to add it in vsp1_sevice_info, then the list grows as
> > Currently both V3M and V3H SoC's have single info structure and the info->version
> > for both V3M and V3H is "VI6_IP_VERSION_MODEL_VSPD_V3" 
> > 
> > OK, I will expand this to separate info structure for V3M and V3H.
> 
> I think that's reasonable. I see some more discussion with Laurent in v7
> already - so perhaps best to re-review on a v8 anyway.
> 
> > > Then a helper would come with it just like the vsp1_feature()
> > > 
> > > 
> > >       #define vsp1_quirk(vsp1, f) ((vsp1)->info->quirks & (f))
> > > 
> > > so that code reliant upon a device specific quirk would read:
> > > 
> > >       if (vsp1_quirk(vsp1, VSP1_QUIRK_LIF_BUF_ATTR)
> > >               .... do thing ...
> > > 
> > > But it should still keep the comments explaining why the quirk is there
> > > and what it's doing of course.
> > 
> > OK.
> > 
> > > >               vsp1->version = VI6_IP_VERSION_VSP_SW | info->version |
> > > >                               VI6_IP_VERSION_SOC_RZG2L;
> > > 
> > > I think vsp1_device_info should be extended with a .soc to set
> > > VI6_IP_VERSION_SOC_RZG2L in rzg2l_vsp2_device_info, because (planning
> > > ahead to when you add a second or third of these) the SOC could be
> > > different.
> > 
> > The IP is identical for all RZ/G2L alike SoC's (for eg:- RZ/V2L, RZ/G2{L,LC} and RZ/G2UL)
> > The same generic VSPD quirk change works on all these SoC's. For me, it is just unnecessary wastage
> > of memory for adding separate vsp1_device_info for all RZ/G2L alike SoC's.
> 
> But what happens for RZG3L?
> 
> To me - adding a new platform support should be adding a new
> vsp1_device_info either in vsp1_device_infos, or directly matched with a
> compatible string as you have implemented here.
> 
> But this means /all/ devices added by compatible string are
> VI6_IP_VERSION_SOC_RZG2L which likely isn't true in the future.
> 
> Put differently, Having a vsp1_device_infos passed by matching the
> compatible string does not mean the device is an RZG2L, which is what
> this code is defining.
> 
> > On V3M case we need to separate as V3H doesn't need quirk where as V3M it need, 
> > here it is not the case all SoC's need quirks.
> > 
> > If it all need to be extended, we can start with 0x80 for VI6_IP_VERSION_SOC_RZG2L, 0x81 for
> > VI6_IP_VERSION_SOC_RZV2L etc.. I don't think it is required unless I am missing something.
> > 
> > Please let me know your thoughts on this.
> > 
> > > > > > +               return info;
> > > > > > +
> > > > > > +       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> > > > > > +
> > > > > > +       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > > > > > +               info = &vsp1_device_infos[i];
> > > > > > +
> > > > > > +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
> > > >
> > > > Here it is
> > > >               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version) {
> > > >                        if ((vsp1->version & VI6_IP_VERSION_MASK) ==
> > > >                          (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > > >                                vsp1->quirks = LIF_BUF_ATTR_QUIRKS;
> > > >
> > > 
> > > As above - I think that should be stored per vsp1_device_info.
> > 
> > Ok, will add separate info for V3M and V3H.
> 
> i think that's best, I hope Laurent agrees, I'm not sure he's seen the
> comments on this thread as he replied to v7.

That's fine with me, but I'm curious to see how it will look like, as
the device info structure is currently matched based on the model only,
not the SoC. I don't want to duplicate all instances of device info
per-SoC when they don't differ.

> > > > > > +                       return info;
> > > > > > +       }
> > > > > > +
> > > > > > +       dev_err(vsp1->dev, "unsupported IP version 0x%08x\n",
> > > > > > + vsp1->version);
> > > > > > +
> > > > > > +       return NULL;
> > > > > > +}
> > > > > > +
> > > > > >  static int vsp1_probe(struct platform_device *pdev)  {
> > > > > >         struct vsp1_device *vsp1;
> > > > > >         struct device_node *fcp_node;
> > > > > > -       unsigned int i;
> > > > > >         int ret;
> > > > > >         int irq;
> > > > > >
> > > > > > @@ -872,25 +908,16 @@ static int vsp1_probe(struct platform_device*pdev)
> > > > > >         if (ret < 0)
> > > > > >                 goto done;
> > > > > >
> > > > > > -       vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> > > > > > -
> > > > > > -       for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > > > > > -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> > > > > > -                   vsp1_device_infos[i].version) {
> > > > > > -                       vsp1->info = &vsp1_device_infos[i];
> > > > > > -                       break;
> > > > > > -               }
> > > > > > -       }
> > > > > > -
> > > > > > +       vsp1->info = vsp1_lookup_info(vsp1);
> > > > > >         if (!vsp1->info) {
> > > > > > -               dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> > > > > > -                       vsp1->version);
> > > > > >                 vsp1_device_put(vsp1);
> > > > > >                 ret = -ENXIO;
> > > > > >                 goto done;
> > > > > >         }
> > > > > >
> > > > > > -       dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
> > > > > > +       if ((vsp1->version & VI6_IP_VERSION_VSP_MASK) != VI6_IP_VERSION_VSP)
> > > > > > +               vsp1->version = VI6_IP_VERSION_VSP_SW | vsp1->info->version |
> > > > > > +                               VI6_IP_VERSION_SOC_RZG2L;
> > > > >
> > > > > It seems odd to have this specific version assignment here.
> > > > > Shouldn't that be set during vsp1_lookup_info() in the case that
> > > > > there is a match from of_device_get_match_data()? That way it would
> > > > > be extendable by adding just a new vsp1_device_info structure for
> > > > > the next platform that has this issue. This implies that they will
> > > > > 'always' be RZG2L but that information should live in the
> > > vsp1_device_info structure I think.
> > > > >
> > > >
> > > > We can remove this assignment from here and move vsp1_lookup_info.
> > > >
> > > > > Could be handled when/if we get a new device added I guess, but I
> > > > > think that VI6_IP_VERSION_SOC_RZG2L should be something that is
> > > > > retrieved from the vsp1_device_info structure.
> > > > >
> > > > > Re-reading the vsp1_lookup_info() function - it does seem like
> > > > > something suited to there, as the vsp1->version is never read from
> > > > > hardware in the new case.
> > > >
> > > > Ok, Agreed.
> > > >
> > > > > >
> > > > > >         /*
> > > > > >          * Previous use of the hardware (e.g. by the bootloader) could leave
> > > > > > @@ -941,6 +968,7 @@ static int vsp1_remove(struct platform_device *pdev)
> > > > > >  static const struct of_device_id vsp1_of_match[] = {
> > > > > >         { .compatible = "renesas,vsp1" },
> > > > > >         { .compatible = "renesas,vsp2" },
> > > > > > +       { .compatible = "renesas,rzg2l-vsp2", .data =
> > > > > > + &rzg2l_vsp2_device_info },
> > > > > >         { },
> > > > > >  };
> > > > > >  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff= --git
> > > > > > a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > > > > > b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > > > > > index 6a6857ac9327..e36ed2d2b22b 100644
> > > > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > > > > > @@ -107,6 +107,7 @@ static void lif_configure_stream(struct
> > > > > > vsp1_entity *entity,
> > > > > >
> > > > > >         case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
> > > > > >         case VI6_IP_VERSION_MODEL_VSPD_V3:
> > > > > > +       case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
> > > > > >                 hbth = 0;
> > > > > >                 obth = 1500;
> > > > > >                 lbth = 0;
> > > > > > @@ -130,16 +131,21 @@ static void lif_configure_stream(struct vsp1_entity *entity,
> > > > > >                         VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
> > > > > >
> > > > > >         /*
> > > > > > -        * On R-Car V3M the LIF0 buffer attribute register has to be set to a
> > > > > > -        * non-default value to guarantee proper operation (otherwise artifacts
> > > > > > -        * may appear on the output). The value required by the manual is not
> > > > > > -        * explained but is likely a buffer size or threshold.
> > > > > > +        * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to be
> > > > > > +        * set to a non-default value to guarantee proper operation (otherwise
> > > > > > +        * artifacts may appear on the output). The value required by the
> > > > > > +        * manual is not explained but is likely a buffer size or threshold.
> > > > > >          */
> > > > > > -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
> > > > > > -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > > > > > +       switch (entity->vsp1->version) {
> > > > > > +       case (VI6_IP_VERSION_VSP | VI6_IP_VERSION_MODEL_VSPD_V3 |
> > > > > > +             VI6_IP_VERSION_SOC_V3M):
> > > > > > +       case (VI6_IP_VERSION_VSP_SW | VI6_IP_VERSION_MODEL_VSPD_RZG2L |
> > > > > > +             VI6_IP_VERSION_SOC_RZG2L):
> > > > >
> > > > > If this is going to grow - I would think it would be better served
> > > > > with a feature flag - although this isn't so much of a feature, and
> > > > > more of a quirk, so I wonder if that would push us closer to getting a
> > > > > quirks flag.
> > > > >
> > > > > I'm weary that this may not scale otherwise, but ... for now this
> > > > > works, but I think it means we have multiple ways of handling
> > > > > platform specific code already.
> > > >
> > > > Here it is
> > > >
> > > > if (lif->quirks)
> > > >           vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> > > >                            VI6_LIF_LBA_LBA0 |
> > > >                             (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> > > 
> > > I think
> > > 
> > >       if (vsp1_quirk(vsp1, VSP1_QUIRK_LIF_BUF_ATTR)
> > >               vsp1_lif_write(lif, dlb, VI6_LIF_LBA, |
> > >                              (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> > > 
> > > and keeping the block comment above would be better. There's a risk of the
> > > platfoms defining the quirk, and the comment describing the platforms
> > > affected getting out of sync but I think that's going to be cleaner than
> > > extending this with a growing set of unreadable model and soc masks.
> > > 
> > > 
> > > > And the below change in vsp1_lif_create
> > > >
> > > >   lif->quirks = vsp1->quirks & LIF_BUF_ATTR_QUIRKS;
> > > 
> > > I don't think the lif needs a quirk flag storage. It can come from the
> > > vsp1->info (Through a helper)/
> > 
> > OK. Agreed.
> > 
> > > > > >                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> > > > > >                                VI6_LIF_LBA_LBA0 |
> > > > > >                                (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> > > > > > +               break;
> > > > > > +       }
> > > > > >  }
> > > > > >
> > > > > >  static const struct vsp1_entity_operations lif_entity_ops = {
> > > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > > > > > b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > > > > > index fae7286eb01e..e66553c42e50 100644
> > > > > > --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > > > > > @@ -767,6 +767,8 @@
> > > > > >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
> > > > > >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
> > > > > >  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> > > > > > +/* RZ/G2L SoC's have no version register, So use 0x80 as the model version */
> > > > > > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x80 << 8)
> > > > > >
> > > > > >  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
> > > > > >  #define VI6_IP_VERSION_SOC_H2          (0x01 << 0)
> > > > > > @@ -780,6 +782,12 @@
> > > > > >  #define VI6_IP_VERSION_SOC_M3N         (0x04 << 0)
> > > > > >  #define VI6_IP_VERSION_SOC_E3          (0x04 << 0)
> > > > > >  #define VI6_IP_VERSION_SOC_V3U         (0x05 << 0)
> > > > > > +/* RZ/G2L SoC's have no version register, So use 0x80 for SoC Identification */
> > > > > > +#define VI6_IP_VERSION_SOC_RZG2L       (0x80 << 0)
> > > > > > +
> > > > > > +#define VI6_IP_VERSION_VSP_MASK                (0xffff << 16)
> > > > > > +#define VI6_IP_VERSION_VSP             (0x0101 << 16) /* HW VSP version */
> > > > >
> > > > > Is this constant on all supported platforms? both Gen2 and Gen3? (Is
> > > > > there a gen1?). Does it need to be specified to the generation?
> > > >
> > > > I have checked Gen1 and Gen2 HW manual I don't find this info. So I
> > > > would like to remove this macro as it is unused after quirk changes.
> > > >
> > > 
> > > If it's unused, then yes - I think it can be removed.
> > > 
> > > > I am planning to send V7 with these changes, please let me know if you
> > > > have any feedback.
> > > 
> > > I think I'm too late ... but comments above.
> > > 
> > > > > There's nothing specifically complex there or blocking I don't think
> > > > > - so with comments considered as required:
> > > > >
> > > > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > >
> > > > > > +#define VI6_IP_VERSION_VSP_SW          (0xfffe << 16) /* SW VSP version
> > > > > */
> > > > > >
> > > > > >  /* -----------------------------------------------------------------------------
> > > > > >   * RPF CLUT Registers

-- 
Regards,

Laurent Pinchart
