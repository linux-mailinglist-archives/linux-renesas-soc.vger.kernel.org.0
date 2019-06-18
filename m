Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E24FB4A77A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 18:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbfFRQrk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 12:47:40 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44914 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730107AbfFRQrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 12:47:39 -0400
Received: by mail-qt1-f196.google.com with SMTP id x47so16122809qtk.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ubPVvmVA8dDY0hpQ3AnprK84aUGTXXLgGckZp9zSJ+U=;
        b=GYABOZwymgtdHFlzMtUk5wky19Ak/yWipvZxjl9BCbvEZCRzyhhUcg2JcaBY9Exx84
         E9HpdLFbl5dCQWAZsUT56N1n/tdjMuUFBClWadcHQmNw396KGe/GtEjsvU5Wsdr7xaza
         PVVHvwaagWa4njhghAE+1MH0IoVvNBz2HNES9xbdY/jRU15C3L8r9CUNF9cbqA2iMqaz
         WXPiF3QSFNwAztxNgsi4sF/nc01RlkVGgK+Xs1jKtzCTAFWir+EHS5VkSoL5YsdaYnyx
         siNGhuPiEV4qepOqYzeQeuMqjFEnNXMDf8N+0KES87dG+DEahJ0vFJ/z64FDfKT0B2hk
         K3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ubPVvmVA8dDY0hpQ3AnprK84aUGTXXLgGckZp9zSJ+U=;
        b=iQqyN0jXCs62km01D7EXUAGvnNBe0/509vX2J9vJbsAYP+CM2TMOnIwGOJ/7+txDJK
         Zu0hIfI1rdRyaKWvghExUFgbAcRyUAo+4PbEG16mX0NiATFwnFFfoZHMhev0lGEAGBIN
         fGU2b5cGZPdA3XyDUV69szH+znv+z7oTZHLCR5dujCmp1zwa79EoDoRVtwXeC3L/GFTP
         W/tcLcxwmzYmzgf2e6brpBQ3p0HV67zPwZ6p+fGIqdb97egeNISBFZoxEn13SHD0ANlP
         dz8NLX7KXw0jaP9CymPs0Iw0ub21vVztzH6kRa+r0crNnEe+Uaqd0BLUgqVJbfX/Lyh9
         GMoQ==
X-Gm-Message-State: APjAAAWVEz56pteUuFTVeBoAvFme7oqqJRWKswZBEZhfrJnt0jaIQKUT
        STuzYLmHHWjFCmHa5uNBoGmZ4g==
X-Google-Smtp-Source: APXvYqyFPpustKZRYpUyCPfbzeSD47N073S2qRbFOzwtsKX2QYIGLMmddJ6h1RpYMrx1sQ8Akb+pWw==
X-Received: by 2002:ac8:3794:: with SMTP id d20mr50345785qtc.392.1560876457552;
        Tue, 18 Jun 2019 09:47:37 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id q17sm7273733qtj.96.2019.06.18.09.47.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 09:47:37 -0700 (PDT)
Date:   Tue, 18 Jun 2019 12:47:36 -0400
From:   Sean Paul <sean@poorly.run>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
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
Message-ID: <20190618164736.GA25413@art_vandelay>
References: <20190617181548.124134-1-sean@poorly.run>
 <20190618072652.GC4800@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190618072652.GC4800@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 10:26:52AM +0300, Laurent Pinchart wrote:
> Hi Sean,
> 
> Thank you for the patch.
> 
> On Mon, Jun 17, 2019 at 02:15:42PM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > drm_atomic_get_crtc_state() returns an error pointer when it fails, so
> > the null check is doing nothing here.
> > 
> > Credit to 0-day/Dan Carpenter for reporting this.
> > 
> > Fixes: 6f3b62781bbd ("drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state")
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> [for rcar lvds]
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Karol Herbst <karolherbst@gmail.com>
> > Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I have no pending conflicting changes for rcar_lvds.c. Do you plan to
> merge this through drm-misc ?

Thanks for your review!

Yeah, since the bug is only in drm-misc-next, this will also go there. Speaking
of which, I just applied it :-)

Sean

> 
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index f2a5d4d997073..1c62578590f46 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -115,8 +115,8 @@ static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
> >  
> >  	/* We're not allowed to modify the resolution. */
> >  	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
> > -	if (!crtc_state)
> > -		return -EINVAL;
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> >  
> >  	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
> >  	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sean Paul, Software Engineer, Google / Chromium OS
