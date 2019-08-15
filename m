Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06BFD8EDA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732714AbfHOOEE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:04:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732705AbfHOOED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:04:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D31720644;
        Thu, 15 Aug 2019 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565877843;
        bh=MIPucA8nlaeUB0gX1iRzjKyYa/bVxtRZHYmUpn/icYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBJbzT98lJdPARaPU38GixwII164snNT2WYHBu4XVIXpmEdEfq+P1WZZvxzWZs193
         OvmX0xjRRBV2zIUPLjWQAZAvQqnwEUmE9oJpcIY91mnI4Cl4IXk5UO2ugysErxjjLX
         vKaSjOA2qaWKLfb+Ed0yLok/T2iukEID/1Bntyb4=
Date:   Thu, 15 Aug 2019 16:04:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20190815140400.GA7174@kroah.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190815131838.GP5011@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815131838.GP5011@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 15, 2019 at 04:18:38PM +0300, Laurent Pinchart wrote:
> Hi Fabrizio,
> 
> (CC'ing Greg as the architect of the SPDX move)

_one of_, not the one that did the most of he work, that would be Thomas :)

> On Thu, Aug 15, 2019 at 12:04:27PM +0100, Fabrizio Castro wrote:
> > The information represented by drm_bridge_timings is also
> > needed by panels, therefore rename drm_bridge_timings to
> > drm_timings.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Link: https://www.spinics.net/lists/linux-renesas-soc/msg43271.html
> > 
> > ---
> > v1->v2:
> > * new patch
> > 
> > I have copied the license from include/drm/drm_bridge.h as that's
> > where the struct originally came from. What's the right SPDX license
> > to use in this case?
> 
> https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files
> 
> Greg, any idea on how we should handle this ?

Ugh, what lunacy.  But drm_bridge.h is NOT under any "public domain"
license, so why is that an issue here?  This looks like a "normal" bsd 3
clause license to me, right?

So I would just use "BSD-3-Clause" as the SPDX license here, if I were
doing this patch...

thanks,

greg k-h
