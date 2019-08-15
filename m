Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424628EDE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732859AbfHOOOq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:14:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46460 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbfHOOOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:14:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EC442AF;
        Thu, 15 Aug 2019 16:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565878483;
        bh=CpWruMPwP6AjzSnh7pkBxx25Ie389i+DKRZU7zUWBn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gBYs3AHjWSM3z/BNO/Qh4DDFXlRIByhKgXhqLdbs9maiJWWP0H6KTlIicnHJcJ5e5
         gnDCiqT4MDTafxfHq6ddvkKxqikOPrkue9pJ0BnXaGBOssOAREAOjchw3RAOMu8YJG
         ZlEnUoO1lmQ8SvW4BS1RqJ3gndEFC95FrgUWnnhw=
Date:   Thu, 15 Aug 2019 17:14:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 3/9] drm: Rename drm_bridge_timings to drm_timings
Message-ID: <20190815141440.GA20322@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
 <20190815140400.GA7174@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190815140400.GA7174@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Thu, Aug 15, 2019 at 04:04:00PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrote:
> > Hi Fabrizio,
> > 
> > (CC'ing Greg as the architect of the SPDX move)
> 
> _one of_, not the one that did the most of he work, that would be Thomas :)
> 
> > On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> > > The information represented by drm_bridge_timings is also
> > > needed by panels, therefore rename drm_bridge_timings to
> > > drm_timings.
> > > 
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.html
> > > 
> > > ---
> > > v1->v2:
> > > * new patch
> > > 
> > > I have copied the license from include/drm/drm_bridge.h as that's
> > > where the struct originally came from. What's the right SPDX license
> > > to use in this case?
> > 
> > https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files
> > 
> > Greg, any idea on how we should handle this ?
> 
> Ugh, what lunacy.  But drm_bridge.h is NOT under any "public domain"
> license, so why is that an issue here?  This looks like a "normal" bsd 3
> clause license to me, right?

You're right, I overread part of the text in drm_bridge.h, it seems to
indeed be covered by a BSD 3 clause license. Sorry for the noise.

> So I would just use "BSD-3-Clause" as the SPDX license here, if I were
> doing this patch...

-- 
Regards,

Laurent Pinchart
