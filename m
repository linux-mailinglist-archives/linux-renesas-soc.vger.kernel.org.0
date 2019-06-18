Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0464149A89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfFRH1M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:27:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49170 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfFRH1M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:27:12 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5EEED5;
        Tue, 18 Jun 2019 09:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560842829;
        bh=aSUwOkHaJ8zFU/e9BXcyehPVPIcptxKEFlC1H40lBK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JkBMxTSBHHD6MGgFwY1CW5s7wioMLTed8kw2A7iZzclu7BeGnSgAuhqvfytoYWxX+
         ILMSt5BHHPTKqrIIrfQrMM5YLUbI2LsfUr6IjPQ99h5vr81aw9VFRdL8D5y3csNJgx
         9ACu1YqEb6S8/W/DQTgDSVC3SbWweLcZslKQztB8=
Date:   Tue, 18 Jun 2019 10:26:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Karol Herbst <karolherbst@gmail.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kbuild test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/rcar-du: Fix error check when retrieving crtc state
Message-ID: <20190618072652.GC4800@pendragon.ideasonboard.com>
References: <20190617181548.124134-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617181548.124134-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sean,

Thank you for the patch.

On Mon, Jun 17, 2019 at 02:15:42PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> drm_atomic_get_crtc_state() returns an error pointer when it fails, so
> the null check is doing nothing here.
> 
> Credit to 0-day/Dan Carpenter for reporting this.
> 
> Fixes: 6f3b62781bbd ("drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> [for rcar lvds]
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I have no pending conflicting changes for rcar_lvds.c. Do you plan to
merge this through drm-misc ?

> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index f2a5d4d997073..1c62578590f46 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -115,8 +115,8 @@ static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
>  
>  	/* We're not allowed to modify the resolution. */
>  	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
> -	if (!crtc_state)
> -		return -EINVAL;
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
>  
>  	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
>  	    crtc_state->mode.vdisplay != panel_mode->vdisplay)

-- 
Regards,

Laurent Pinchart
