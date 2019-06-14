Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC3F457CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 10:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfFNInB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 04:43:01 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46960 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfFNIm5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 04:42:57 -0400
Received: by mail-ed1-f67.google.com with SMTP id d4so2309097edr.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2019 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QgL2xEAvTit++D3krd05nlqQHQWQMdk7SdHziLACmgM=;
        b=XR58Y3i7jh0s5ib+GPkWBYx5jkGGKnL6OtPhGMnIBDHFCkRvO/5LSEA0GQVt6euYoc
         2D8OEuFd0loxWkqqM6jxW3f4fxleyUMo+JEAeloHbyHmGkYy+7cI4/UC2Yq0Ah1Px7bi
         s0SkPljmpvYKvE4ULlepeye+FGxVL2/x4kvfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=QgL2xEAvTit++D3krd05nlqQHQWQMdk7SdHziLACmgM=;
        b=dFf702ArWsmB4KwZRurfzs2AmbF/bnFypaQagXX2ikVejUpqmAAiJFvovMw/dHNRti
         zhYgRk+A4PEL2NYMqkHaR0dU5ojx3ie9Kz934z4QhhzLPk6nOsnXzrmrENx8Js+h5HPF
         Yr88doJNxa3iWtcLeSxZUuI6z0+DXn1/+rJbrKsLB5V3HfJraZhUP0KTXvWwDrt0+D/u
         LcExIIsm2oAgWCe/k0XhT31OwnRXvIpXBbilju2qZQT/KUKbIR7zrD9XvH9IP9S1Meld
         uj4B+JcTj/uCz6W0ju8hIiOhzJG4Oehdn7XKP4AemOaWLio13SFlWzepQHfc3c45rdJB
         Cvqg==
X-Gm-Message-State: APjAAAWvFsN4SjYkWxnTDj6NCpQP7j3HNa+4JK/qV3bSPKIDVedKnqff
        We5S8RMxBCtBcKLOTpLx7t94Rw==
X-Google-Smtp-Source: APXvYqwbZ1p/AAYkMvc204IuHnK2Mme6rVhADerqoPX3axFuelEDR2MDYfkYCclx3wOIYO9+vicaOg==
X-Received: by 2002:a50:b68f:: with SMTP id d15mr25067320ede.39.1560501775062;
        Fri, 14 Jun 2019 01:42:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id i5sm681242edc.20.2019.06.14.01.42.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 01:42:54 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:42:51 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] drm: rcar-du: crtc: Register GAMMA_LUT properties
Message-ID: <20190614084251.GW23020@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614081507.3ky4pcyijjxnr7mp@uno.localdomain>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 10:15:52AM +0200, Jacopo Mondi wrote:
> Hi Laurent,
>    thanks for review
> 
> On Fri, Jun 07, 2019 at 03:03:04PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Thu, Jun 06, 2019 at 04:22:19PM +0200, Jacopo Mondi wrote:
> > > Enable the GAMMA_LUT KMS property using the framework helpers to
> > > register the proeprty and the associated gamma table size maximum size.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > index e6d3df37c827..c920fb5dba65 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > > @@ -1207,6 +1207,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
> > >  	    rcdu->cmms[swindex]) {
> > >  		rcrtc->cmm = rcdu->cmms[swindex];
> > >  		rgrp->cmms_mask |= BIT(hwindex % 2);
> > > +
> > > +		drm_mode_crtc_set_gamma_size(crtc, CMM_GAMMA_LUT_SIZE);
> > > +		drm_crtc_enable_color_mgmt(crtc, 0, false, CMM_GAMMA_LUT_SIZE);
> >
> > This change looks good, but you also need to add support for legacy API.
> > According to the function's documentation,
> >
> >  * Drivers should use drm_atomic_helper_legacy_gamma_set() to implement the
> >  * legacy &drm_crtc_funcs.gamma_set callback.
> >
> 
> Drivers 'shuld' or drivers 'shall' ?
> Isn't this required only to support the 'legacy APIs' ? Do we want that?

You're calling drm_mode_crtc_set_gamma_size, which is only useful for the
legacy ioctls. should here = assuming your hw supports something that
legacy gamma ioctl can use. Feel free to patch up the docs.
-Daniel

> 
> Thanks
>    j
> 
> > >  	}
> > >
> > >  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
