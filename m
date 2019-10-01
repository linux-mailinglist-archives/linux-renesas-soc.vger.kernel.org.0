Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2B1C40F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 21:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfJATUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 15:20:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53480 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfJATUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 15:20:33 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8717623F;
        Tue,  1 Oct 2019 21:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569957630;
        bh=Sa0SIsPyN1ATWCS9yyuYZWlyF0yqVPZu5bykCqOt5Uc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f9MxPlRhYTL6Mb7fNBnk14C/A646XeI/c7M5YeLylwqrBw0yM2fLZFBOpUU10lRPP
         RK1ieQ+V22aSCKG5Svwkj4fKwLezyqpunV2HPw9jreE08SgQBTxL/bwLbWR0Ys2sMK
         VFWDgA1xQKOrwLxRzK+8sUdsR3jz5YutSZF9dMrA=
Date:   Tue, 1 Oct 2019 22:20:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Doug Anderson <dianders@google.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 8/9] drm: rcar-du: kms: Update CMM in atomic commit
 tail
Message-ID: <20191001192015.GB21064@pendragon.ideasonboard.com>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-9-jacopo+renesas@jmondi.org>
 <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ezequiel,

On Mon, Sep 30, 2019 at 05:53:00PM -0300, Ezequiel Garcia wrote:
> +Doug, Heiko:
> 
> On Fri, 2019-09-06 at 15:54 +0200, Jacopo Mondi wrote:
> > Update CMM settings at in the atomic commit tail helper method.
> > The CMM is updated with new gamma values provided to the driver
> > in the GAMMA_LUT blob property.
> > 
> > When resuming from system suspend, the DU driver is responsible for
> > reprogramming and enabling the CMM unit if it was in use at the time the
> > system entered the suspend state.  Force the color_mgmt_changed flag to
> > true if the DRM gamma lut color transformation property was set in the
> > CRTC state duplicated at suspend time, as the CMM gets reprogrammed only
> > if said flag is active in the rcar_du_atomic_commit_update_cmm() method.
> > 
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > 
> > Daniel could you have a look if resume bits are worth being moved to the
> > DRM core? The color_mgmt_changed flag is set to false when the state is
> > duplicated if I read the code correctly, but when this happens in a
> > suspend/resume sequence its value should probably be restored to true if
> > any color management property was set in the crtc state when system entered
> > suspend.
> 
> Perhaps we can use the for_each_new_crtc_in_state() helper here,
> and move it to the core like this:
> 
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3234,8 +3234,20 @@ int drm_atomic_helper_resume(struct
> drm_device *dev,
>                              struct drm_atomic_state *state)
>  {
>         struct drm_modeset_acquire_ctx ctx;
> +       struct drm_crtc_state
> *crtc_state;
> +       struct drm_crtc *crtc;
> +       unsigned int i;
>         int err;
>  
> +       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +   
>             /*
> +                * Force re-enablement of CMM after system resume if any
> +                * of the DRM color transformation properties
> was set in
> +                * the state saved at system suspend time.
> +                */
> +               if (crtc_state->gamma_lut)
> +                    
>    crtc_state->color_mgmt_changed = true;
> +       }
> 
> This probably is wrong, and should be instead constrained to some
> condition of some sort.
> 
> FWIW, the Rockchip DRM is going to need this as well.
> 
> Any ideas?

That's more or less what I had in mind, yes. The question is if
something like this would make sense. If there's a consensus it would, I
think it can be done as part of this series.

-- 
Regards,

Laurent Pinchart
