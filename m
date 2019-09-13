Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FECB1A63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 11:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387536AbfIMJEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 05:04:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387513AbfIMJEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 05:04:09 -0400
Received: from pendragon.ideasonboard.com (bl10-204-24.dsl.telepac.pt [85.243.204.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DFB033A;
        Fri, 13 Sep 2019 11:04:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568365447;
        bh=rBMYwvvqL3UBs1e6XFztfLKo2R8+K/g/9AvBH5KoQa0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZpddhD4Wm8ABiqJwt0ssORXff5gBpf5FQpURY4pipMIeYTH48wsk1C7BKluVcFLPD
         o997vSNrqnHnVX7h3Bvsr1PmmEL0fW+vae3NDxcXf4ASWNvaxP82EdHYVZ6rCOw30S
         KUI2lEiRSANkrnCFWRel45Xazuu0hEDEZRFgnB+E=
Date:   Fri, 13 Sep 2019 12:03:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20190913090359.GC29992@pendragon.ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> > On 11.09.2019 22:25, Kieran Bingham wrote:
> > 
> > > Add direct support for the r8a77980 (V3H).
> > > 
> > > The V3H shares a common, compatible configuration with the r8a77970
> > > (V3M) so that device info structure is reused.
> > 
> >    Do we really need to add yet another compatible in this case?
> > I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> > a patch like this one didn't get posted by me.
> 
> The reason for having per-SoC compat strings is that the IP blocks
> are not versioned and while we can observe that there are similarities
> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> differences may not emerge at some point. By having per-SoC compat strings
> we have the flexibility for the driver to address any such differences as
> the need arises.
> 
> My recollection is that this scheme has been adopted for non-versioned
> Renesas IP blocks since June 2015 and uses of this scheme well before that.

Sure, but we could use

	compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";

in DT without updating the driver. If the r8a77980 turns out to be
different, we'll then update the driver without a need to modify DT. I'm
fine either way, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

-- 
Regards,

Laurent Pinchart
