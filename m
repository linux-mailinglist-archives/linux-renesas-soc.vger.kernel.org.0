Return-Path: <linux-renesas-soc+bounces-10818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4C89E19C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0584161880
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD941E2318;
	Tue,  3 Dec 2024 10:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJ4QnhJF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B41DF739;
	Tue,  3 Dec 2024 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222902; cv=none; b=s/LBr3ZBdQ+H6aOdtCOZ/UKegkValxcRKfJ8sCGDcsH+GPjYVe6kUx5emxzZ3RAUmLvrnaVd26FwjQ0PDLjBLINEiGf2ITTd20rfJOrC1UnaFJik4YU4SAH4PFCwO+PuIl5OLhsD81g9zW/ntxwetAwxntMuEK3uo4pKLAg+hEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222902; c=relaxed/simple;
	bh=dJFQEv4Xxhh02RxjGMUH5vLtFgBKBRerslEin2vZrbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHlReZlPQKCG56JD9YsSQCBGk4hSwkc23Ki5z2bG6IEKiTOkMCko9vZYTeuN/F9rCuJ2F4YJjMmGQuCyKbxjl/RDq9a5gEMOvJ2NynKJKL1L8TeX4BOggEU8bWT/+s0xcM8nlVMSgMhwmabFfuzHdY/Jdqohfn96o4RFRKrCUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJ4QnhJF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E022E1;
	Tue,  3 Dec 2024 11:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733222870;
	bh=dJFQEv4Xxhh02RxjGMUH5vLtFgBKBRerslEin2vZrbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJ4QnhJFmQYcexbMFey5y33sjiXDv4uCgfQrrQExkguUzzHT+hC5aWBsOlL6wpfaI
	 xmU7o/WRG2ab23rcPtuX+a+XDKenJng/v2aJeW+NSW74dtaNnMuYyhgSkzpSW+3eGW
	 kcARFRlFRWjc6Bnw+BG2R1rArLiky0pEXDoOwD/A=
Date: Tue, 3 Dec 2024 12:48:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 6/9] drm/rcar-du: Add support for r8a779h0
Message-ID: <20241203104806.GN10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
 <20241203085654.GJ10736@pendragon.ideasonboard.com>
 <e155c9b1-a43f-4be3-9825-2639ac3bb61d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e155c9b1-a43f-4be3-9825-2639ac3bb61d@ideasonboard.com>

On Tue, Dec 03, 2024 at 11:22:15AM +0200, Tomi Valkeinen wrote:
> On 03/12/2024 10:56, Laurent Pinchart wrote:
> > On Tue, Dec 03, 2024 at 10:01:40AM +0200, Tomi Valkeinen wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add support for r8a779h0. It is very similar to r8a779g0, but has only
> >> one output.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 19 +++++++++++++++++++
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h   |  1 +
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 16 ++++++++++------
> >>   3 files changed, 30 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >> index fb719d9aff10..afbc74e18cce 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> >> @@ -545,6 +545,24 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
> >>   	.dsi_clk_mask =  BIT(1) | BIT(0),
> >>   };
> >>   
> >> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> >> +	.gen = 4,
> >> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> >> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> >> +		  | RCAR_DU_FEATURE_NO_BLENDING
> >> +		  | RCAR_DU_FEATURE_NO_DPTSR,
> >> +	.channels_mask = BIT(0),
> >> +	.routes = {
> >> +		/* R8A779H0 has one MIPI DSI output. */
> >> +		[RCAR_DU_OUTPUT_DSI0] = {
> >> +			.possible_crtcs = BIT(0),
> >> +			.port = 0,
> >> +		},
> >> +	},
> >> +	.num_rpf = 5,
> >> +	.dsi_clk_mask = BIT(0),
> >> +};
> >> +
> >>   static const struct of_device_id rcar_du_of_table[] = {
> >>   	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> >>   	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> >> @@ -571,6 +589,7 @@ static const struct of_device_id rcar_du_of_table[] = {
> >>   	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
> >>   	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
> >>   	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> >> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
> >>   	{ }
> >>   };
> >>   
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >> index 5cfa2bb7ad93..d7004f76f735 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
> >> @@ -32,6 +32,7 @@ struct rcar_du_device;
> >>   #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
> >>   #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
> >>   #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
> >> +#define RCAR_DU_FEATURE_NO_DPTSR	BIT(6)  /* V4M does not have DPTSR */
> > 
> > Do we need a quirk ? At first glance it seems the DPTSR register is only
> > used for DU instances that have two channels, so a check on the number
> > of channels should be enough ?
> 
> What do you mean with "DPTSR register is only used for DU instances that 
> have two channels"? The upstream code sets it for all SoCs, doesn't it, 
> without any checks?

DPTSR is one of those registers that controls features shared between
channels, in this specific case plane assignment to DU channels. The
default register value (i.e. all 0's) splits resources between the
channels. For DU groups with a single channel, there's no need for
resource assignment. Logically speaking, the all 0's register value as
documented in instances that have two channels would assign all the
resources that exist in the single-channel group to the single channel.
When computing the DPTSR value, the driver will (or at least should)
therefore always come up with 0x00000000. Writing that to the register
should be a no-op.

It's not clear if the register is present or not when the group has a
single channel. Some datasheets document the register is not being
applicable. Writing to it has never caused issues, so we may be dealing
with the hardware just ignoring writes to a non-implemented register, or
the register may be there, with only 0x00000000 being a meaningful
value. This being said, some people are concerned about writes to
registers that are not documented as present, as they could possibly
cause issues. Safety certification of the driver could be impacted.
We've updated the DU driver over the past few years to avoid those
writes for this reason.

TL;DR: yes, the DU driver writes to DPTSR for DU groups with a single
channel, but that seem it could be wrong, and we could fix it for all
single-channel groups in one go without introducing this feature bit. I
can test a patch on a M3 board that has a single channel in the second
group.

> Most of the SoCs seem to have two channels, but r8a77970 has one. 
> However, I don't have docs for that one. It could be that it does not 
> have DPTSR register, and indeed we could use the num_crtcs > 1 check there.
> 
> >>   #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
> >>   
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> index 2ccd2581f544..132d930670eb 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> >> @@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> >>   		 */
> >>   		rcrtc = rcdu->crtcs;
> >>   		num_crtcs = rcdu->num_crtcs;
> >> -	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
> >> +	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
> >> +		   rcdu->info->gen == 4) {
> >>   		/*
> >>   		 * On Gen3 dot clocks are setup through per-group registers,
> >>   		 * only available when the group has two channels.
> >> +		 * On Gen4 the registers are there for single channel too.
> >>   		 */
> >>   		rcrtc = &rcdu->crtcs[rgrp->index * 2];
> >>   		num_crtcs = rgrp->num_crtcs;
> >> @@ -185,11 +187,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
> >>   		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
> >>   	rcar_du_group_write(rgrp, DORCR, dorcr);
> >>   
> >> -	/* Apply planes to CRTCs association. */
> >> -	mutex_lock(&rgrp->lock);
> >> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> -			    rgrp->dptsr_planes);
> >> -	mutex_unlock(&rgrp->lock);
> >> +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_NO_DPTSR)) {
> >> +		/* Apply planes to CRTCs association. */
> >> +		mutex_lock(&rgrp->lock);
> >> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> >> +				    rgrp->dptsr_planes);
> >> +		mutex_unlock(&rgrp->lock);
> >> +	}
> >>   }
> >>   
> >>   /*

-- 
Regards,

Laurent Pinchart

