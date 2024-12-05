Return-Path: <linux-renesas-soc+bounces-10969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B472C9E5D3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 18:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75015281F9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 17:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB48225768;
	Thu,  5 Dec 2024 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HwxXKHoA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6C21A42B;
	Thu,  5 Dec 2024 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733420110; cv=none; b=X8qE5gCYVKfAy/lcjrUI+HxBisAcUn3xnW3vlTnG2pWQhflRU8kZ0wEIDeFrowqhOglfmiMOA9XYPVu4bd7H1CGdiwSjWO21qasHnfbZfPuqX47PeCYKv5ZuCzzmd6qHLkcPU+1EP7UnSu0vumqrsme5LQSiSvJ4pb+e9gtJNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733420110; c=relaxed/simple;
	bh=WQlqs2b3gZl3ijVpbkx65Dbf+b3YV9hOMw6FMzNRzgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJOQ5Ool1nCb68nSeZ5j79DJpxVMWEG6ZcKZNbJyrabdoXcJIcFwGeDAtAJIPhs/qVXAihpTxn/lkZDiiloIZBklxqrpPIU2yFQ9TSePGbRB7WT2O40XtJ+S5xhqRTFod2lHq7zRtTQKeQiS2brcKaTofDHUvu5+D7wtE8gUpTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HwxXKHoA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69D762B3;
	Thu,  5 Dec 2024 18:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733420076;
	bh=WQlqs2b3gZl3ijVpbkx65Dbf+b3YV9hOMw6FMzNRzgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwxXKHoA0W9slXiSRGl9gxsQ5iE6RURj3g8O/5xRzQf8G9ONWEojrYL9F/Hu/8ENF
	 TY7+GZUP0Ko9zxewaSg4d5BMTZxVJ6YzUO91Qf5Xzj09CbWKWTnhxJqMv77YcPdnZB
	 jHpTeH3QNsGTCpJf54wqRxMeyA8R8q4KIeTy0Z/g=
Date: Thu, 5 Dec 2024 19:34:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 02/10] drm/rcar-du: Write DPTSR only if there are more
 than one crtc
Message-ID: <20241205173452.GA21014@pendragon.ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
 <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
 <CAMuHMdVHRWbeQ8UF-xsKuxUNwHc5_kVwSgrTfOkwFFG5vG7fwA@mail.gmail.com>
 <98b43276-2a68-4ba9-999a-c738b8f7654f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98b43276-2a68-4ba9-999a-c738b8f7654f@ideasonboard.com>

On Thu, Dec 05, 2024 at 06:08:24PM +0200, Tomi Valkeinen wrote:
> On 05/12/2024 16:16, Geert Uytterhoeven wrote:
> > Hi Tomi,
> > 
> > CC Jacopo
> > 
> > On Thu, Dec 5, 2024 at 2:45 PM Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Currently the driver always writes DPTSR when setting up the hardware.
> >> However, the register is only meaningful when there are more than one
> >> crtc, and the only SoC with one crtc, V3M, does not have the register
> >> mentioned in its documentation.
> > 
> > R-Car V3H/V3H_2, too.
> 
> Right... I was looking at the number of outputs, not the number of crtcs 
> when going through the SoCs.
> 
> >> So move the write behind a condition.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 12 +++++++-----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> index 2ccd2581f544..0fbf6abbde6e 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> @@ -185,11 +185,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>                  dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >>          rcar_du_group_write(rgrp, DORCR, dorcr);
> >>
> >> -       /* Apply planes to CRTCs association. */
> >> -       mutex_lock(&rgrp->lock);
> >> -       rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> -                           rgrp->dptsr_planes);
> >> -       mutex_unlock(&rgrp->lock);
> >> +       if (rgrp->num_crtcs > 1) {
> >> +               /* Apply planes to CRTCs association. */
> >> +               mutex_lock(&rgrp->lock);
> >> +               rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> +                                   rgrp->dptsr_planes);
> >> +               mutex_unlock(&rgrp->lock);
> >> +       }
> > 
> > This is per group, not per DU, right?
> > The second group on R-Car M3-W/M3-W+ has a single channel, hence no
> > DPTSR2 register.
> > The second group on R-Car M3-N has a single channel, but it's actually
> > the second physical channel in the group, and thus does have DPTSR2.
> 
> That logic does make sense. So that would be if (rgrp->channels_mask & 
> BIT(1)) then write DPTSR? And probably add a comment in the code about this.
> 
> > And apparently we had this discussion before...
> > https://lore.kernel.org/all/CAMuHMdXxf4oePnyLvp84OhSa+wdehCNJBXnhjYO7-1VxpBJ7eQ@mail.gmail.com
> 
> Somehow I hadn't even realized Jacopo had sent these before...

Oops...

I'll let Jacopo and you decide who will send an updated patch.

-- 
Regards,

Laurent Pinchart

