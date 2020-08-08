Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA6923F943
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 00:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgHHWO4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 18:14:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38660 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgHHWO4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 18:14:56 -0400
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3030DF9;
        Sun,  9 Aug 2020 00:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596924892;
        bh=r7hf7EgufZlTn8rVV8MpIWTBFm5knrHF8nG3RI/xP/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pkeCatPYjgOMF1yjUpwk8YSjwj1swrFOvJWQUN0+nh2WOzVCk+sOIC+uafsQybvji
         +0lE42K2igg+/XW05KpQQ0axiO/vL3Bp18wMmKdsTFrv1K0F0qx0Wb2Hq2dQ/DO6Ef
         TFE3r2DZ8cCCu/LlRqMpBUsGeY639+JeBvE4lTnk=
Date:   Sun, 9 Aug 2020 01:14:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/8] dumbfb: Fix pitch for tri-planar formats
Message-ID: <20200808221439.GA6186@pendragon.ideasonboard.com>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
 <8181b48a-ce19-4083-c96e-493d75a1691f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8181b48a-ce19-4083-c96e-493d75a1691f@ti.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Thu, Aug 06, 2020 at 12:21:39PM +0300, Tomi Valkeinen wrote:
> On 06/08/2020 05:18, Laurent Pinchart wrote:
> > The BO pitches are unconditionally set to the frame buffer pitch, for
> > all planes. This is correct for semiplanar YUV formats, as they
> > subsample chroma horizontally by two but combined U and V in a single
> > plane, cancelling each other. For fully planar YUV formats, however, the
> > horizontal subsampling need to be taken into account to compute the
> > pitch. Fix it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  kms++/src/dumbframebuffer.cpp | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/kms++/src/dumbframebuffer.cpp b/kms++/src/dumbframebuffer.cpp
> > index 18f3f152943d..4c3c03164a90 100644
> > --- a/kms++/src/dumbframebuffer.cpp
> > +++ b/kms++/src/dumbframebuffer.cpp
> > @@ -42,6 +42,14 @@ DumbFramebuffer::DumbFramebuffer(Card& card, uint32_t width, uint32_t height, Pi
> >  		struct drm_mode_create_dumb creq = drm_mode_create_dumb();
> >  		creq.width = width;
> >  		creq.height = height / pi.ysub;
> > +		/*
> > +		 * For fully planar YUV buffers, the chroma planes don't combine
> > +		 * U and V components, their width must thus be divided by the
> > +		 * horizontal subsampling factor.
> > +		 */
> > +		if (format_info.type == PixelColorType::YUV &&
> > +		    format_info.num_planes == 3)
> > +			creq.width /= pi.xsub;
> 
> This feels a bit of a hack... I think we should somehow have the
> relevant information in the PixelFormatInfo. Having the same plane
> info, { 8, 2, 2 }, for both NV12 UV plane and YUV420 U and V planes
> doesn't sound correct.
> 
> Should NV12's UV plane be { 16, 2, 2 }? Subsampled formats are
> confusing... =)

I'll give it a try. I however wonder if all drivers will expect 16bpp.
The ones based on drm_gem_cma_dumb_create() will be fine, but other
drivers may not expect this.

-- 
Regards,

Laurent Pinchart
