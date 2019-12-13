Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7091711DB40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 01:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731224AbfLMAs0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Dec 2019 19:48:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58452 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731026AbfLMAs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 19:48:26 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A265440;
        Fri, 13 Dec 2019 01:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576198104;
        bh=fzDDFuwCssKk2Lvp2zwH1/AsL1CDBTeNOlHZdV77jgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gYQepg5lJbxpmxMaRo6gyvtBboTn6WuGhBG29W42OR/vsxfAhXdyS0Bnv8ywu1ER5
         2qop6RsqkdzWK/Bpnn1FZ6EtXv3o+mNjBpZ2Lvnpsncfl2SOHEfmhlHyWz+nWJA2ma
         l9prcEVWJCOund9jveN6q7IEGJgiBP3yHricQz0A=
Date:   Fri, 13 Dec 2019 02:48:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20191213004812.GA27328@pendragon.ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
 <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Dec 09, 2019 at 12:41:07PM +0000, Kieran Bingham wrote:
> On 13/09/2019 10:03, Laurent Pinchart wrote:
> > On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
> >> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
> >>> On 11.09.2019 22:25, Kieran Bingham wrote:
> >>>
> >>>> Add direct support for the r8a77980 (V3H).
> >>>>
> >>>> The V3H shares a common, compatible configuration with the r8a77970
> >>>> (V3M) so that device info structure is reused.
> >>>
> >>>    Do we really need to add yet another compatible in this case?
> >>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
> >>> a patch like this one didn't get posted by me.
> >>
> >> The reason for having per-SoC compat strings is that the IP blocks
> >> are not versioned and while we can observe that there are similarities
> >> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
> >> differences may not emerge at some point. By having per-SoC compat strings
> >> we have the flexibility for the driver to address any such differences as
> >> the need arises.
> >>
> >> My recollection is that this scheme has been adopted for non-versioned
> >> Renesas IP blocks since June 2015 and uses of this scheme well before that.
> > 
> > Sure, but we could use
> > 
> > 	compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";
> > 
> > in DT without updating the driver. If the r8a77980 turns out to be
> > different, we'll then update the driver without a need to modify DT. I'm
> > fine either way, so
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks,
> 
> This patch has an RB tag from you, and Simon, but alas I don't believe
> it has been picked up in your drm/du/next branch.
> 
> Is this patch acceptable? Or do I need to repost?

Could you just confirm I should apply this patch, and not go for the
alternative proposal above ?

> >>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

-- 
Regards,

Laurent Pinchart
