Return-Path: <linux-renesas-soc+bounces-11099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F909E939B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 13:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9A3164C0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 12:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA092236FC;
	Mon,  9 Dec 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CVg4sCWF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC5228CB9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Dec 2024 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746371; cv=none; b=s7xPEbjV+rqPMshISkJhGzVwRVo7jEQBIY8hW42bcmbBq9e3fGjX+QYzf95mvbQnHGTErQap3tfCjxK132Ew8I/QBoiCqU9QIQtdFv6ck93xn9zkum8R7zFiqyP2AOYDPeJcQBH279tVrR9KfEySW7U+s13cRVWr29IU/Ie2LCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746371; c=relaxed/simple;
	bh=HPdEhNeCa9d+5UCt4BEFPtOkoZ4FUNpxJMBp6KEER10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ourwUrWp/fER0CdMxgGWMLCyr5rotJJlrv8+01lqGHKTaD7XcEFFv7oZE4gsnBFXkaiRGqU3lQd6prId4dNlSgSoY9NUCGVgbhpvoCbCVSIYmUbqRP9GT4H8P2YtznDsTDrXZr/p/7j/vwK9EmDcmxMP4HVAp9UDlDAAdOOo43w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CVg4sCWF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFFBD89A;
	Mon,  9 Dec 2024 13:12:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733746336;
	bh=HPdEhNeCa9d+5UCt4BEFPtOkoZ4FUNpxJMBp6KEER10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVg4sCWFbyzDm24I3WKAVOYPrWRjXFg+W8mFlot8An2INjlug0adBjBsbuEnIDaTG
	 JmrXZubA9A5EkFr0K1oe3YsiA5nN+ifOZuECh/2Ey7KnLD8VJLOQhmPKhTd3QqOZWK
	 FgeTWhRhUhXdoB0F2mLkcB/9r8PYPmrSIc0JtcfI=
Date: Mon, 9 Dec 2024 14:12:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Message-ID: <20241209121231.GH11343@pendragon.ideasonboard.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Mon, Dec 09, 2024 at 08:29:40AM +0000, Biju Das wrote:
> Hi All,
> 
> Gentle ping to apply the series, if you are happy.

v7 seems to have all the necessary Rb, and I believe you now have
drm-misc commit access. Andrzej, Neil, Rob, can Biju push DRM bridge
patches to drm-misc once they have been reviewed, even if none of you
have provided Rb tags, or do you want to handle this yourselves ?

> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 19 November 2024 18:44
> > Subject: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
> > 
> > This patch series aims to fix 2 bugs in the ADV7535 driver
> > 
> > 1) use-after-free bug in adv7533_attach_dsi()
> > 2) Drop unsupported single lane.
> > 
> > Changes in v6:
> >  - Fixed memory leak by adding goto stattement in error path of
> >    adv7511_init_regulators().
> >  - Added Rb tag from Adam for patch#3.
> > Changes in v5:
> >  - Updated commit description for patch#1.
> >  - restored host_node in struct adv7511.
> >  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
> >    in error path of probe() and also in the remove().
> > Changes in v4:
> >  - Updated commit description for patch#1.
> >  - Dropped host_node from struct adv7511 and instead used a local pointer
> >    in probe(). Also freeing of host_node pointer after use is done in
> >    probe().
> >  - Added link to ADV7533 data sheet.
> >  - Collected tags
> > Changes in v3:
> >  - Replace __free construct with readable of_node_put().
> >  - Dropped single lane support from bindings and driver.
> > changes in v2:
> >  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
> >  - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.
> > 
> > Biju Das (3):
> >   drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
> >   dt-bindings: display: adi,adv7533: Drop single lane support
> >   drm: adv7511: Drop dsi single lane support
> > 
> >  .../bindings/display/bridge/adi,adv7533.yaml         |  2 +-
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         | 12 ++++++++++--
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             |  4 +---
> >  3 files changed, 12 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart

