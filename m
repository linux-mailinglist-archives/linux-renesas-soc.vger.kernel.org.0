Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAD526318B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 18:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730851AbgIIQSi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 12:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731020AbgIIQSP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 12:18:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622FBC061756
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2020 09:18:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7287339;
        Wed,  9 Sep 2020 18:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599668277;
        bh=A0Urw1Q+ir9JTbhNf/GNgSjD5P2aV4lZ1tva1AAvqDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TaxILc9JtXbSHor9uxAzaj2ighrAwq42iNeJ4SNyQSpfC8SfThYWDAMAQMBdcfAa3
         JRJdiJAY47ZkFxgt9+abdonjJUrhTR1KemewBo7NWdCQXR9Y10ztm0PvF+XyE8jUYp
         EwdzYjvebrjjK6Gi1trR/SsrteoomXzAVbhfg/ck=
Date:   Wed, 9 Sep 2020 19:17:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
Message-ID: <20200909161730.GC3931@pendragon.ideasonboard.com>
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
 <20200908155208.GF11405@pendragon.ideasonboard.com>
 <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
 <20200909120835.GJ6112@intel.com>
 <490b02de-8b4f-057e-a0c6-07f73f6ce052@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <490b02de-8b4f-057e-a0c6-07f73f6ce052@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Sep 09, 2020 at 05:06:01PM +0100, Kieran Bingham wrote:
> On 09/09/2020 13:08, Ville Syrjälä wrote:
> > On Tue, Sep 08, 2020 at 05:05:48PM +0100, Kieran Bingham wrote:
> >> On 08/09/2020 16:52, Laurent Pinchart wrote:
> >>> On Tue, Sep 08, 2020 at 04:42:58PM +0100, Kieran Bingham wrote:
> >>>> On 06/08/2020 03:26, Laurent Pinchart wrote:
> >>>>> When creating a frame buffer, the driver verifies that the pitches for
> >>>>> the chroma planes match the luma plane. This is done incorrectly for
> >>>>> fully planar YUV formats, without taking horizontal subsampling into
> >>>>> account. Fix it.
> >>>>>
> >>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>>> ---
> > <snip>
> >>>>>  	}, {
> >>>>>  		.fourcc = DRM_FORMAT_YVU444,
> >>>>>  		.v4l2 = V4L2_PIX_FMT_YVU444M,
> >>>>>  		.bpp = 24,
> >>>>>  		.planes = 3,
> >>>>> +		.hsub = 1,
> >>>>>  	},
> >>>>>  };
> >>>>>  
> >>>>
> >>>> I wonder when we can have a global/generic set of format tables so that
> >>>> all of this isn't duplicated on a per-driver basis.
> >>>
> >>> Note that this table also contains register values, so at least that
> >>> part will need to be kept. For the rest, do you mean a 4CC library that
> >>
> >> Yes, the driver specific mappings of course need to be driver specific.
> >>
> >>> would be shared between DRM/KMS and V4L2 ? That's a great idea. Too bad
> >>> it has been shot down when patches were submitted :-S
> >>
> >>  /o\ ... It just seems like so much data replication that must be used
> >> by many drivers.
> >>
> >> Even without mapping the DRM/V4L2 fourccs - even a common table in each
> >> subsystem would be beneficial wouldn't it?
> >>
> >> I mean - RCar-DU isn't the only device that needs to know how many
> >> planes DRM_FORMAT_YUV422 has, or what horizontal subsampling it uses?
> >>
> >> Anyway, that's not an issue with this patch, it just seems glaring to me
> >> that these entries are common across all hardware that use them ...
> >>
> >> (the bpp/planes/subsampling of course, not the hardware specific registers).
> > 
> > See drm_format_info() & co.
> 
> Aha perfect, That's what I was looking for.
> I'm glad to see that's common (at least for the DRM parts).
> 
> The question is - why aren't we using it in RCar-DU.
> 
> Laurent, would you see any issue in obtaining the struct drm_format_info
> rather than re-encoding all the data in these tables?
> 
> And if not - would you prefer to convert on top of this patch, or
> preceding this patch?
> 
> Or simply prefer to keep the existing tables ?
> 
> Given that this fixes a bug - I'd say getting this patch in now is
> probably best.

I'd apply refactoring on top, if desired. You would have to keep the
existing table for the mapping to V4L2 (although this could be moved to
drm_format_info if desired), as well as for the register value. And that
would then lead to a double lookup operation. That's the part that
bothers me the most.

-- 
Regards,

Laurent Pinchart
