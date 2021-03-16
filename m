Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C42133E0B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 22:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCPVir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 17:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhCPViQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 17:38:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED91C06174A;
        Tue, 16 Mar 2021 14:38:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2858CD8B;
        Tue, 16 Mar 2021 22:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615930693;
        bh=JLfYaUWMFQrrk1yH5XJnkvC7K7r5WIEAGtjhPVHoDp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pVrLbpKGeRiWE8bSOFDxKwHARc+s/gXth1t1T80hYJBfQkk7VIylTcwoXA96bHWkt
         LlBAdhroYFsegn5jn3gCmmz6dZO1IUW46WtY5S6gcWWwgRFmPbvCS7toLqcUA49i82
         D3S1rQvy1x8R6Sy2MAS4+g2fOdYWpCYzX0rA2p7s=
Date:   Tue, 16 Mar 2021 23:37:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Message-ID: <YFElIZacukBWa7YA@pendragon.ideasonboard.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
 <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
 <c757d90e-da85-6862-36fc-2343795de4b4@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c757d90e-da85-6862-36fc-2343795de4b4@xs4all.nl>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hans,

On Tue, Mar 16, 2021 at 09:21:15AM +0100, Hans Verkuil wrote:
> On 15/03/2021 04:42, Laurent Pinchart wrote:
> > On Wed, Mar 10, 2021 at 02:50:23PM +0000, Biju Das wrote:
> >>> On 10/03/2021 13:56, Biju Das wrote:
> >>>> Thanks for the feedback.
> >>>>> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer
> >>>>> access
> >>>>>
> >>>>> Hi Biju,
> >>>>>
> >>>>> On 01/03/2021 12:08, Biju Das wrote:
> >>>>>> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when
> >>>>>> UIF module is not used.
> >>>>>>
> >>>>>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display
> >>>>>> pipeline")
> >>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
> >>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> b/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> index f6d2f47a4058..06f74d410973 100644
> >>>>>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
> >>>>>> vsp1_device *vsp1,
> >>>>>
> >>>>>
> >>>>> This looks like it complicates these conditionals more than we
> >>>>> perhaps need to.
> >>>>>
> >>>>> What do you think about adding something above the block comment here?:
> >>>>
> >>>> It is much better.
> >>>>
> >>>> This patch is accepted in media tree[1]. So not sure, should I send a
> >>>> follow up patch as optimization or drop this patch and send new one.
> >>>
> >>> Oh, I didn't realise these were in already. Sorry, I didn't see any review
> >>> on the list, and it was the earliest I had got to them.
> >>>
> >>>> Please suggest.
> >>>
> >>> Up to you, I don't think this would get dropped now it's integrated.
> >>> It's in, so if you want to update on top I believe that's fine.
> >>
> >> OK, Will send follow up patch as optimization.
> > 
> > That would be nice.
> > 
> > I don't think this patch should have been fast-tracked as a fix, as
> > RZ/G2L isn't supported in mainline yet as far as I can tell.
> > 
> > Hans, next time, could we get a notification instead of a silent merge ?
> 
> My apologies, it seemed a trivial fix, but I should have checked with you.
> 
> I jumped the gun here :-(

No worries, it can happen :-)

> >>>>> 	if (!drm_pipe->uif)
> >>>>> 		return 0;
> >>>>>
> >>>>>
> >>>>>>  	 * make sure it is present in the pipeline's list of entities if it
> >>>>>>  	 * wasn't already.
> >>>>>>  	 */
> >>>>>> -	if (!use_uif) {
> >>>>>> +	if (drm_pipe->uif && !use_uif) {
> >>>>>>  		drm_pipe->uif->pipe = NULL;
> >>>>>> -	} else if (!drm_pipe->uif->pipe) {
> >>>>>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>
> >>>>> 	drm_pipe->uif->pipe = pipe;
> >>>>>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
> >>>>>>  	}
> >>>>>>

-- 
Regards,

Laurent Pinchart
