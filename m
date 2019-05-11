Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 723D71A96D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 22:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfEKUga (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 16:36:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57702 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfEKUga (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 16:36:30 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74C12B6;
        Sat, 11 May 2019 22:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557606987;
        bh=SbZkJJ8vo4OmG062o90zpWv9Wbc8FQI5/YgNhE98pMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iQxFzWoN6xY9ohSfoGcSlnwE3CDwK+P0KddF3kjK5HNoQtSoXRYa3YjtYy1D2RMFf
         NYRjDGlkwihsVrK5piWG6pqldDZZ05MHFNTIoHCaUG2rX+GHcLb+HHw6GJMbp/0U7a
         JsyGMBt/js4301y2fBXWPMN5YrW8LahIq3Zc7g9Y=
Date:   Sat, 11 May 2019 23:36:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH/RFC 04/15] drm: bridge: Add dual_link field to the
 drm_bridge_timings structure
Message-ID: <20190511203611.GP13043@pendragon.ideasonboard.com>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-5-laurent.pinchart+renesas@ideasonboard.com>
 <eed9204e-a54e-98d8-99f0-cdc8675704e1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eed9204e-a54e-98d8-99f0-cdc8675704e1@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Apr 24, 2019 at 09:12:48AM +0100, Kieran Bingham wrote:
> On 06/03/2019 23:23, Laurent Pinchart wrote:
> > Extend the drm_bridge_timings structure with a new dual_link field to
> > indicate that the bridge's input bus carries data on two separate
> > physical links. The first use case is LVDS dual-link mode where even-
> > and odd-numbered pixels are transferred on separate LVDS links.
> 
> Do you foresee this becoming a bitfield in the future if there are more
> options?
> 
> I don't think that affects this right now though, and it's fine as a bool.

I don't know yet. Maybe we'll combine this with other flags, maybe not.
It's a bit of a ad-hoc parameter, if/when other link types require a
similar feature, we'll likely refactor this.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > ---
> >  include/drm/drm_bridge.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index d4428913a4e1..aea1fcfd92a7 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -265,6 +265,14 @@ struct drm_bridge_timings {
> >  	 * input signal after the clock edge.
> >  	 */
> >  	u32 hold_time_ps;
> > +	/**
> > +	 * @dual_link:
> > +	 *
> > +	 * True if the bus operates in dual-link mode. The exact meaning is
> > +	 * dependent on the bus type. For LVDS buses, this indicates that even-
> > +	 * and odd-numbered pixels are received on separate links.
> > +	 */
> > +	bool dual_link;
> >  };
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
