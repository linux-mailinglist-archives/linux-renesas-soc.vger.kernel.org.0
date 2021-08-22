Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7651C3F3CD0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Aug 2021 02:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhHVACU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Aug 2021 20:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhHVACU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Aug 2021 20:02:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A388C061575
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Aug 2021 17:01:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8400A8F;
        Sun, 22 Aug 2021 02:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629590496;
        bh=prBVbLvTR9FFd7PKJjWNml62nJaJOiTBu5r2+3c7/ZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sxxdMuMp65CVwW5gbnQE+fFviTitztJJqwK7ELD4u5vaSVC38+wqdfeSF+hPPYY1L
         d689wdTNy1QiLQ/3GTgU2dyditoOuw/MaTjb3NaNKL9LAvMDqy9choQwHBDoBIzbfL
         zvBMr4K62rlgxnLlhXwZc+1ca0+fCvtHGlgOOpyo=
Date:   Sun, 22 Aug 2021 03:01:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
Message-ID: <YSGT19Be+KtOnVoZ@pendragon.ideasonboard.com>
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
 <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Aug 10, 2021 at 05:51:57PM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 10, 2021 at 5:47 PM Geert Uytterhoeven wrote:
> > On Thu, May 20, 2021 at 8:51 AM Laurent Pinchart wrote:
> > > Replace the manual panel handling with usage of the DRM panel bridge
> > > helper. This simplifies the driver, and brings support for
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch, which is now commit e9e056949c927e5b ("drm:
> > rcar-du: lvds: Convert to DRM panel bridge helper") in drm-next.
> >
> > This causes the following scary messages in the kernel log on Ebisu-4D:
> >
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> 
> > Reverting this commit fixes the issue.
> 
> Oops, that's not true (should not write tentative messages while booting
> a test kernel, and press send without checking first ;-)
> 
> Reverting the commit doesn't seem to make a difference.
> But the parent 5bcc48395b9f35da ("drm: bridge: dw-hdmi: Attach to
> next bridge if available") of the bad commit is fine.

Thanks for the report. I've reproduced this and will send a fix shortly.

-- 
Regards,

Laurent Pinchart
