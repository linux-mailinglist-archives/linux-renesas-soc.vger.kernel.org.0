Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DA8C2757
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 22:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731422AbfI3Ux2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 16:53:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59518 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730485AbfI3Ux2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 16:53:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7E39228B90F
Message-ID: <8063b9555d5bce6f2c002e49da3b7afaca9ae0b4.camel@collabora.com>
Subject: Re: [PATCH v4 8/9] drm: rcar-du: kms: Update CMM in atomic commit
 tail
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Doug Anderson <dianders@google.com>,
        Heiko Stuebner <heiko@sntech.de>
Date:   Mon, 30 Sep 2019 17:53:00 -0300
In-Reply-To: <20190906135436.10622-9-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
         <20190906135436.10622-9-jacopo+renesas@jmondi.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+Doug, Heiko:

On Fri, 2019-09-06 at 15:54 +0200, Jacopo Mondi wrote:
> Update CMM settings at in the atomic commit tail helper method.
> The CMM is updated with new gamma values provided to the driver
> in the GAMMA_LUT blob property.
> 
> When resuming from system suspend, the DU driver is responsible for
> reprogramming and enabling the CMM unit if it was in use at the time the
> system entered the suspend state.  Force the color_mgmt_changed flag to
> true if the DRM gamma lut color transformation property was set in the
> CRTC state duplicated at suspend time, as the CMM gets reprogrammed only
> if said flag is active in the rcar_du_atomic_commit_update_cmm() method.
> 
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> Daniel could you have a look if resume bits are worth being moved to the
> DRM core? The color_mgmt_changed flag is set to false when the state is
> duplicated if I read the code correctly, but when this happens in a
> suspend/resume sequence its value should probably be restored to true if
> any color management property was set in the crtc state when system entered
> suspend.
> 

Perhaps we can use the for_each_new_crtc_in_state() helper here,
and move it to the core like this:

--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3234,8 +3234,20 @@ int drm_atomic_helper_resume(struct
drm_device *dev,
                             struct drm_atomic_state *state)
 {
        struct drm_modeset_acquire_ctx ctx;
+       struct drm_crtc_state
*crtc_state;
+       struct drm_crtc *crtc;
+       unsigned int i;
        int err;
 
+       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+   
            /*
+                * Force re-enablement of CMM after system resume if any
+                * of the DRM color transformation properties
was set in
+                * the state saved at system suspend time.
+                */
+               if (crtc_state->gamma_lut)
+                    
   crtc_state->color_mgmt_changed = true;
+       }

This probably is wrong, and should be instead constrained to some
condition of some sort.

FWIW, the Rockchip DRM is going to need this as well.

Any ideas?

Thanks,
Ezequiel

