Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C1446176
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 16:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfFNOro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 10:47:44 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38562 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfFNOrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 10:47:43 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so1693870edo.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2019 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=d8nVVuvnHsmvk1d0kUURiumam/C7DIvw1DDJ0lOcbU4=;
        b=NAHpzhGXzxQ0niZ/4BWf6AG8C7DK+4x3UafTtP24z/KSVwDcHxZOJWMWPkDDh1X2FA
         5hBGxyhxPcZqYh0g78osiTDMLeAfmAj+ZnNGgOC77XwrBofd3Pq/fezXSSqgiiQqPuI2
         sOas2pYPCGTpSsc//e4MFq2Mga/+zOqOJpmYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=d8nVVuvnHsmvk1d0kUURiumam/C7DIvw1DDJ0lOcbU4=;
        b=Juv4i0/teDZDL4j/fsm7PkHu0PZ4IwzK5HDseWDqwq7t+RLS91DZC9Ayo7vVJ/MwaY
         IpRBx46Bwz46PGyVpzvmOfdrUl+bDRZPauXvWY86LZnCcSYBTU3MAAAU7qALfdJZTJ3B
         3PikTklrAUFJkFu5syUxGwypMY3rkwTpIrPrB4C4oSovwwrIWL5ZBso+l+Os2E1J7X2L
         TSWC7GTUqwW3c2HKE95tSV4AnKxtltxSVT7BM3nIWuB/gTij6KhP8SLkwLj3vVbNaWL6
         g6UIgbjxLXurLcaUpxfToh5cjyOEu0PINZvY8tgb/20iE++uUiMhnnZmlT0JkNr5l8Zj
         QKpw==
X-Gm-Message-State: APjAAAWqcqnL2fN0jwc+lgJLx43sKhYuvF9ENyiEjTJTAZ0qXuQcVoH2
        1JPR+OwjVmpPvjpEFuyuCD+jxA==
X-Google-Smtp-Source: APXvYqzdCp6F1hxUyRMSuiQvQJM1/dCmISnLrE6y1EtpbLtmiXPpE8t7ndRFrI6NCVDtrkae8rrfpg==
X-Received: by 2002:a50:8465:: with SMTP id 92mr25270539edp.151.1560523661264;
        Fri, 14 Jun 2019 07:47:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id e33sm944489eda.83.2019.06.14.07.47.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 07:47:40 -0700 (PDT)
Date:   Fri, 14 Jun 2019 16:47:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614144738.GY23020@phenom.ffwll.local>
Mail-Followup-To: Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-20-jacopo+renesas@jmondi.org>
 <20190607120304.GH7593@pendragon.ideasonboard.com>
 <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
 <20190614084251.GW23020@phenom.ffwll.local>
 <20190614092745.wznk3iv5dgehmjsb@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614092745.wznk3iv5dgehmjsb@uno.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 11:27:45AM +0200, Jacopo Mondi wrote:
> Hi Daniel,
> 
> On Fri, Jun 14, 2019 at 10:42:51AM +0200, Daniel Vetter wrote:
> > On Fri, Jun 14, 2019 at 10:15:52AM +0200, Jacopo Mondi wrote:
> > > Hi Laurent,
> > >    thanks for review
> > >
> > > On Fri, Jun 07, 2019 at 03:03:04PM +0300, Laurent Pinchart wrote:
> > > > Hi Jacopo,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> > > > > Enable the GAMMA_LUT KMS property using the framework helpers to
> > > > > register the proeprty and the associated gamma table size maximum size.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > > ---
> > > > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > > index e6d3df37c827..c920fb5dba65 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > > > @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> > > > >  	    rcdu->cmms[swindex]) {
> > > > >  		rcrtc->cmm = rcdu->cmms[swindex];
> > > > >  		rgrp->cmms_mask |= BIT(hwindex % 2);
> > > > > +
> > > > > +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> > > > > +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
> > > >
> > > > This change looks good, but you also need to add support for legacy API.
> > > > According to the function's documentation,
> > > >
> > > >  * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
> > > >  * legacy &drm_crtc_funcs.gamma_set callback.
> > > >
> > >
> > > Drivers 'shuld' or drivers 'shall' ?
> > > Isn't this required only to support the 'legacy APIs' ? Do we want that?
> >
> > You're calling drm_mode_crtc_set_gamma_size, which is only useful for the
> > legacy ioctls. should here = assuming your hw supports something that
> > legacy gamma ioctl can use. Feel free to patch up the docs.
> 
> Oh, I see. I should either leave the old API alone without calling
> drm_mode_crtc_set_gamma_size(), or set the .gamma_set callback to
> point to drm_atomic_helper_legacy_gamma_set(), which translates the
> old gamma table interface to a blob property and attach it to a crtc
> state which is then commited and applied through the atomic helpers.
> 
> So I would change the doc to prescribe that if the driver intends to
> support the legacy SETGAMMA/GETGAMMA IOCTLs it should declare the
> gamma table size with drm_mode_crtc_set_gamma_size() first, and set
> the .gamma_set crtc callback to drm_atomic_helper_legacy_gamma_set(),
> which translates the legacy interface to a GAMMA_LUT property blob
> and commit it.
> 
> If that works, I'll make a small patch to the documentation in v2.

Not quite what I meant: You should support the legacy gamma ioctl, if your
gamma ramp can be squared into support that. Which generally means yes.
We've been thinking about just wiring this all up by default, but there's
some drivers who use a 256 entry legacy gamma ramp (for backwards compat
with old X11 userspace), but advertise much bigger tables through the new
ioctl. So it's not quite as simple.

But except if you have some really strange hw there's just no good reason
not to support the old legacy ioctl. We also don't just support the new
atomic ioctl on new drivers, they all still support the older interfaces.
This is the same.

That's what I meant should be clarified if it's not yet clear in docs,
plus maybe a new todo entry in Documentation/gpu/todo.rst.
-Daniel

> 
> Thanks
>   j
> 
> 
> > -Daniel
> >
> > >
> > > Thanks
> > >    j
> > >
> > > > >  	}
> > > > >
> > > > >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> > > > >
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Laurent Pinchart
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
