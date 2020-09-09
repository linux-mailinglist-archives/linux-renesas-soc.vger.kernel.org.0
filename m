Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6E4263027
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 17:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgIIPEC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 11:04:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:42384 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727900AbgIIMSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 08:18:45 -0400
IronPort-SDR: nlnEpmgVI3KUEQg0XKz1sAvM3dMWGGL63FJ95xttQCRyPv3z2MxrkYYGS+Hfud/JmLg63D0PVU
 EhQ57JIEH76Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="243129135"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="243129135"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 05:08:37 -0700
IronPort-SDR: 9cxFj3RUQgk5FjzT8W4RE51B+9h4XAtAaSIcKY7Q+rPYRQzO94hwuyucphFcaUvq4rGjf2kzR8
 nE/+gA8i/z5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="304479669"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga006.jf.intel.com with SMTP; 09 Sep 2020 05:08:35 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 09 Sep 2020 15:08:35 +0300
Date:   Wed, 9 Sep 2020 15:08:35 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
Message-ID: <20200909120835.GJ6112@intel.com>
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
 <20200908155208.GF11405@pendragon.ideasonboard.com>
 <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 08, 2020 at 05:05:48PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 08/09/2020 16:52, Laurent Pinchart wrote:
> > Hi Kieran,
> > 
> > On Tue, Sep 08, 2020 at 04:42:58PM +0100, Kieran Bingham wrote:
> >> On 06/08/2020 03:26, Laurent Pinchart wrote:
> >>> When creating a frame buffer, the driver verifies that the pitches for
> >>> the chroma planes match the luma plane. This is done incorrectly for
> >>> fully planar YUV formats, without taking horizontal subsampling into
> >>> account. Fix it.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
<snip>
> >>>  	}, {
> >>>  		.fourcc = DRM_FORMAT_YVU444,
> >>>  		.v4l2 = V4L2_PIX_FMT_YVU444M,
> >>>  		.bpp = 24,
> >>>  		.planes = 3,
> >>> +		.hsub = 1,
> >>>  	},
> >>>  };
> >>>  
> >>
> >> I wonder when we can have a global/generic set of format tables so that
> >> all of this isn't duplicated on a per-driver basis.
> > 
> > Note that this table also contains register values, so at least that
> > part will need to be kept. For the rest, do you mean a 4CC library that
> 
> Yes, the driver specific mappings of course need to be driver specific.
> 
> 
> > would be shared between DRM/KMS and V4L2 ? That's a great idea. Too bad
> > it has been shot down when patches were submitted :-S
> 
> 
>  /o\ ... It just seems like so much data replication that must be used
> by many drivers.
> 
> Even without mapping the DRM/V4L2 fourccs - even a common table in each
> subsystem would be beneficial wouldn't it?
> 
> I mean - RCar-DU isn't the only device that needs to know how many
> planes DRM_FORMAT_YUV422 has, or what horizontal subsampling it uses?
> 
> Anyway, that's not an issue with this patch, it just seems glaring to me
> that these entries are common across all hardware that use them ...
> 
> (the bpp/planes/subsampling of course, not the hardware specific registers).

See drm_format_info() & co.

-- 
Ville Syrjälä
Intel
