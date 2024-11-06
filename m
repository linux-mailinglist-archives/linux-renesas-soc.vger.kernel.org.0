Return-Path: <linux-renesas-soc+bounces-10356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557069BEE7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 14:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879D31C2219C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 13:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4831CC89D;
	Wed,  6 Nov 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YpcLQYW9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E21E22E2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899061; cv=none; b=p66qXsr63+vq6GEbus8W6tvWqYmA0jzaKH1stcHUeLESC/QhHIDS9tq0OvjsH/YiA6OA2QSVRkxPfWL09uBuS5dr9+2x8c2b3e/PRShvSQLM1v9hsreEcnLLpMN1HLm43fTCVvxW477NglhGzkOA3gonAmlrdrVpwTWxZM7GYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899061; c=relaxed/simple;
	bh=WYVykGgIGWOZakRTXDQpTktNipc2LJjx08BB+EWVg18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eA9jR0F3AoV8K6YrUQtyrFL+9Vq7ZIgkO3kcHCI+zIKUW+nB8q7on8AQSHRBjXT3WZLYWM/401k/mG1BKUcJzeYTjKIfr5UCho1NBH0VeDXTpRJegIlEXdAR0UyQu4YZFBDjWL2gqXOD2mosw8U/eivW+9PTkdnmL8F9wV3KJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YpcLQYW9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93DAA475;
	Wed,  6 Nov 2024 14:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730899049;
	bh=WYVykGgIGWOZakRTXDQpTktNipc2LJjx08BB+EWVg18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpcLQYW9ZGo2RrRHelMkVOI0dVW0NEdHFn7+fSkfhem+XpEQVQ1PPtsF2pmCmbLvJ
	 NGANXu00iNoF3Zu+bPWuWtXugx41qCAfQMfVCFbXxWxEu7MPHY1MkcVaXaJIeiw8QI
	 gLM3t9nzYcFpgMYonmEPmxJfHllv1yqa6B/QR8/Q=
Date: Wed, 6 Nov 2024 15:17:31 +0200
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
	Archit Taneja <architt@codeaurora.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: Re: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Message-ID: <20241106131731.GG9369@pendragon.ideasonboard.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
 <20241105160612.GC6317@pendragon.ideasonboard.com>
 <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Wed, Nov 06, 2024 at 10:20:43AM +0000, Biju Das wrote:
> Hi Laurent Pinchart,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 05 November 2024 16:06
> > Subject: Re: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 05, 2024 at 11:12:19AM +0000, Biju Das wrote:
> > > Fix out-of-bounds array in adv7511_dsi_config_timing_gen(), when dsi
> > > lanes = 1.
> > 
> > Does the hardware support using the internal timing generator with a single lane ? If so
> 
> As per the binding documentation [1], ADV7535 supports single lane.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml?h=next-20241106
> 
> > adv7511_dsi_config_timing_gen() should be fixed, otherwise that should be explained in the commit
> 
> On RZ/G2L SMARC EVK platform, lanes=2,3,4 works ok, But with setting lanes=1, video is unstable
> by trying with clock_divider as 6,7 and 8 by updating the array and also disabling internal timing generator.

Is that an issue specific to that board, or to the chip in general ? If
it's specific to the board, disabling 1 lane usage for everybody in the
driver isn't the right option.

> > message, and mentioned with a comment in adv7533_parse_dt(). I would also print an error message in
> > that case.
> 
> OK, this can be done.
> 
> > If the internal timing generator can't be used with a single lane, the DT bindings should also be
> > updated to document that.
> 
> Even single lane with or without internal timing generator does not work on RZ/G2L.
> 
> So, any users of ADV 7535 tested single lane??
> 
> > > Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing
> > > generator")
> > > Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Changes in v2:
> > >  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
> > >  - Dropped Archit Taneja invalid Mail address
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > index 3e57ba838e5e..0c2236e53af5 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > @@ -185,6 +185,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
> > >  	adv->use_timing_gen = !of_property_read_bool(np,
> > >  						"adi,disable-timing-generator");
> > >
> > > +	if (adv->use_timing_gen && num_lanes == 1)
> > > +		return -EINVAL;
> > > +
> > >  	/* TODO: Check if these need to be parsed by DT or not */
> > >  	adv->rgb = true;
> > >  	adv->embedded_sync = false;

-- 
Regards,

Laurent Pinchart

