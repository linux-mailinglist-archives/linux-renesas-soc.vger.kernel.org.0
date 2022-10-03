Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04465F3040
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 14:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiJCM0V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 08:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJCM0U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 08:26:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F39A32D87
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 05:26:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE4D7440;
        Mon,  3 Oct 2022 14:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664799978;
        bh=l6kAghhGQzoT10LBUDIpg2R8/PADqRlHOE6BOq1ZWqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPR1NQ27vHQJnq125N5WiyNnGLnP7p/LaHoCjVegQQWlcxX8ttHLe+L8XobMXUvLy
         MpAVNGwWyTRjM62aNTIeDRRMxuGk0H/cuwTBbxdXsqxI85Ld0WZa2cQgK8B7MaTWj9
         DH7dA2kxeZLJfzjLy22jeIq0M3xMG9ygMYiTc+qk=
Date:   Mon, 3 Oct 2022 15:26:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and
 RCAR_MIPI_DSI
Message-ID: <YzrU51q/k4+DgaMK@pendragon.ideasonboard.com>
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
 <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
 <CAMuHMdUV7TY=mfTS6ShOqPbT8JAC-nQFmUWdsyGtP86Op+0SaQ@mail.gmail.com>
 <37521172-d358-ff90-682b-ffe66effd063@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37521172-d358-ff90-682b-ffe66effd063@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Mon, Oct 03, 2022 at 10:31:24AM +0300, Tomi Valkeinen wrote:
> On 03/10/2022 10:01, Geert Uytterhoeven wrote:
> > On Mon, Oct 3, 2022 at 8:56 AM Tomi Valkeinen wrote:
> >> On 02/10/2022 01:03, Laurent Pinchart wrote:
> >>> When the R-Car MIPI DSI driver was added, it was a standalone encoder
> >>> driver without any dependency to or from the R-Car DU driver. Commit
> >>> 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> >>> added a direct call from the DU driver to the MIPI DSI driver, without
> >>> updating Kconfig to take the new dependency into account. Fix it the
> >>> same way that the LVDS encoder is handled.
> >>>
> >>> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>    drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
> >>>    1 file changed, 9 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> >>> index c959e8c6be7d..fd2c2eaee26b 100644
> >>> --- a/drivers/gpu/drm/rcar-du/Kconfig
> >>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> >>> @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> >>>        select OF_FLATTREE
> >>>        select OF_OVERLAY
> >>>
> >>> +config DRM_RCAR_USE_MIPI_DSI
> >>> +     bool "R-Car DU MIPI DSI Encoder Support"
> >>> +     depends on DRM_BRIDGE && OF
> >>> +     default DRM_RCAR_DU
> >>> +     help
> >>> +       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> >>> +
> >>>    config DRM_RCAR_MIPI_DSI
> >>> -     tristate "R-Car DU MIPI DSI Encoder Support"
> >>> -     depends on DRM && DRM_BRIDGE && OF
> >>> +     def_tristate DRM_RCAR_DU
> >>> +     depends on DRM_RCAR_USE_MIPI_DSI
> >>>        select DRM_MIPI_DSI
> >>> -     help
> >>> -       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> >>>
> >>>    config DRM_RCAR_VSP
> >>>        bool "R-Car DU VSP Compositor Support" if ARM
> >>>
> >>> base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb
> >>
> >> Interesting dependency issue. Took me a while to understand it =).
> >>
> >> But is there a reason to not have "depends on DRM_RCAR_DU" for
> >> DRM_RCAR_USE_MIPI_DSI and DRM_RCAR_USE_LVDS? Now the menu items are
> >> available even if RCAR_DU is n. That's also the case for
> >> DRM_RCAR_DW_HDMI, but I'm not sure if that's supposed to be usable even
> >> without RCAR_DU.
> > 
> > See
> > https://lore.kernel.org/linux-renesas-soc/cover.1639559338.git.geert+renesas@glider.be/
> > 
> > Didn't get to implement the suggested improvements yet...
> 
> Ok, looks good.
> 
> But I started to wonder, for LVDS and DSI (maybe for HDMI too), what's 
> the point of modules here...
> 
> If RCAR_DU, LVDS and DSI are compiled as modules, you can load either 
> LVDS or DSI module, but those won't do anything alone. So in practice 
> you always need to load RCAR_DU module too. But if LVDS or DSI are 
> enabled in the kconfig, you _have_ to load those before RCAR_DU.
> 
> In other words, you can never, e.g. load RCAR_DU and LVDS, but not DSI, 
> if all three are enabled.
> 
> So why not just compile LVDS and DSI into the RCAR_DU module, 
> simplifying the dependencies, removing this issue altogether?

Patches are welcome :-) I'd do that for v6.2 though, not as a v6.1 fix.

-- 
Regards,

Laurent Pinchart
