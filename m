Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C3E66DF00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 14:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjAQNiv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 08:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjAQNiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 08:38:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723E71E1FB;
        Tue, 17 Jan 2023 05:38:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA43410C;
        Tue, 17 Jan 2023 14:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673962705;
        bh=y4XQ2I+wNciwgwpuJ5Hqpsxoc0VJ3iJrbRCD6gQbPRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7Nk4S+JUqTD1HhHRoKP3PS8RRK4HVMX9x6F9JZbDoKGTJpYvF1pk/hytyCRM9WJi
         bmyexqNR/X5TPD95jTmssQ9DFoTQjMbHlj5MGvPqbB2crEeCyodN4UN1uiaY4waiEl
         2Y/V1ijSImP4PmxEKJ1FUzqW7lwjePaarii3JJuA=
Date:   Tue, 17 Jan 2023 15:38:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Message-ID: <Y8ak0SD1YLUZt0Pz@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
 <479e1dca-8d9c-cc75-75d9-3148ccc54f68@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <479e1dca-8d9c-cc75-75d9-3148ccc54f68@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

(CC'ing Mauro and Hans)

On Tue, Jan 10, 2023 at 04:25:37PM +0200, Tomi Valkeinen wrote:
> On 26/12/2022 16:56, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > (CC'ing Daniel and Dave)
> > 
> > On Wed, Dec 21, 2022 at 11:24:41AM +0200, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>
> >> Hi,
> >>
> >> These add new pixel formats for Renesas V3U and V4H SoCs.
> >>
> >> As the display pipeline is split between DRM and V4L2 components, this
> >> series touches both subsystems. I'm sending all these together to
> >> simplify review. If needed, I can later split this to V4L2 and DRM
> >> parts, of which the V4L2 part needs to be merged first.
> > 
> > As the changes on the DRM side are small and shouldn't conflict with
> > anything else queued for v6.3, it would be easier to merge the whole
> > series through the media tree. Daniel, Dave, would you be OK with that ?
> > If so, could you please ack patches 6/7 and 7/7 ?
> 
> Note that these patches depend on the two DRM driver patches in "[PATCH 
> v5 0/7] Renesas V4H DSI & DP output support", which are not very small 
> (but still not big).

Good point. I'm thus leaning more towards merging this through the DRM
tree then. Mauro, can we get your ack on the V4L2 part of this series ?
We'll create a stable branch based on v6.2-rc1 in case it also need to
be merged in the media tree due to last minute conflicts (I'm mainly
thinking about the new formats).

Hans, as there won't be a pull request through the media tree, if you
want to review the new formats, now would be a good time.

> I don't think there's a compile-time dependency between the DRM and V4L2 
> parts, but there's a functional side dependency, so it would be nice to 
> merge these via a single tree. I can't say if DRM or V4L2 tree is 
> easier, but I don't expect conflicts either way.

-- 
Regards,

Laurent Pinchart
