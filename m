Return-Path: <linux-renesas-soc+bounces-29705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLydA63kuWlePQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:33:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 688852B4606
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 00:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CD4A3030B00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 23:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0CA3E51D7;
	Tue, 17 Mar 2026 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MXMDiGrS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601836403B;
	Tue, 17 Mar 2026 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773790197; cv=none; b=u9bpt7+c/+TYK+EjxjzJECVaq8rp3tdT7XpJyT29gSQzreEmzj8F54dVZEyuVZ57vBh4fnQizxDEMF7ISQomJL3vCtNLW3M3DlU6ZdLMwaDo6umx+DhS+eS25Jlo8+kEMSJ+On9gkCKYf4oDJ5rfuw6svBSMn/LdwtE4qqEi3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773790197; c=relaxed/simple;
	bh=10fbkQNfdwX5A27Z4ALHm7yHi4nhiv1bo993DzslWMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ3iFy+DIcyEz2z36WZA8hG87aaKsLbdjRwUGVGe0wfV1Ta06w8G5j/Na7VsZnGnY7l1+SoN/TKQixK3yP6wU/DOiSp2iz1pL0Ym1t8AC/g/M/BBK+PqEwUBqCm1hR7j4S+17XFflFn0TFGphYCSYlnSgTtdKTSBrHkq8VONMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MXMDiGrS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7360CB3;
	Wed, 18 Mar 2026 00:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773790121;
	bh=10fbkQNfdwX5A27Z4ALHm7yHi4nhiv1bo993DzslWMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXMDiGrSdU9Qj6JpWul47oft3o47Du5hPaSnZqjPZzz+wiX7ficHtC9dy//br/eNz
	 I1QtB6lP2A2K9kXPWcWk7ufSGRrMLhbiLGa/Y570/VEUQ64r7SF/S20bKfrz29jmsM
	 N9Qt7ujsOxryFfpM4arSWhGHHVZCHk0zH2fVuo58=
Date: Wed, 18 Mar 2026 01:29:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Message-ID: <20260317232952.GD408929@killaraus.ideasonboard.com>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
 <20260316140232.GB31616@killaraus.ideasonboard.com>
 <TYCPR01MB113325ADBA0ACD1872BD4959B8640A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYCPR01MB113325ADBA0ACD1872BD4959B8640A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29705-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch,kwiboo.se,oss.qualcomm.com,bp.renesas.com,rock-chips.com,chromium.org,bootlin.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 688852B4606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:59:57PM +0000, Biju Das wrote:
> On 16 March 2026 14:03, Laurent Pinchart wrote:
> > On Fri, Dec 19, 2025 at 10:46:53AM +0000, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing
> > > ADV7535 IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK
> > > shows that it is missing HPD IRQ during system resume, as the status
> > > change occurs before the IRQ/pincontrol resume. Once the status bit is
> > > set, there won't be any further IRQ unless the status bit is cleared.
> > >
> > > Clear any pending HPD IRQs before powering on the ADV7535 device to
> > > deliver HPD interrupts after resume().
> > 
> > This issue doesn't seem to be specific to the ADV7511. Any device that uses an edge-triggered
> > interrupt could suffer from the same problem.
> > Implementing a work around in the driver doesn't seem to be a solution that would scale.
> 
> I don't see any bridge device is complaining about similar issues in Linux kernel.

This is exactly why this patch concerns me. The issue doesn't seem to be
specific to the ADV7511, yet no other bridge driver implements anything
similar. It seems to indicate something else is wrong.

I understand and agree with the analysis of the issue (although I find
it weird that the interrupt controller or pin controller would be
resumed after the ADV7511), but any device with an edge-triggered
interrupt should then suffer from the same problem. This means it
shouldn't be handled at individual drivers level, unless there's
something I'm missing that makes the problem very specific to the
ADV7511. Otherwise, a more generic solution is needed.

> Looks like, other bridge devices do not have such restriction.
>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
> > >  2 files changed, 33 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > index 8be7266fd4f4..03aa23836ca4 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > @@ -393,6 +393,7 @@ struct adv7511 {
> > >  	bool cec_enabled_adap;
> > >  	struct clk *cec_clk;
> > >  	u32 cec_clk_freq;
> > > +	bool suspended;
> > >  };
> > >
> > >  static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge
> > > *bridge) diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index b9be86541307..8d9467187d7c 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
> > >  	struct drm_connector_state *conn_state;
> > >  	struct drm_crtc_state *crtc_state;
> > >
> > > +	if (adv->i2c_main->irq && adv->suspended) {
> > > +		unsigned int irq;
> > > +
> > > +		/*
> > > +		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
> > > +		 * will miss the IRQ during system resume as the status change
> > > +		 * occurs before IRQ/pincontrol resume. Once the status bit is
> > 
> > That seems very platform-specific.
> 
> OK, I will reword something like. Is it ok for you?
> 
> The HPD status change occurs before the interrupt/pin control resume.
> Once the status bit is set, there will be no further delivery of interrupts
> unless the status bit is cleared. Therefore, clear the interrupt status bit
> for further delivery of HPD interrupts.
> 
> > 
> > > +		 * set there won't be any further IRQ unless the status bit is
> > > +		 * cleared. So, clear the IRQ status bit for further delivery
> > > +		 * of HPD IRQ.
> > > +		 */
> > > +		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
> > > +		if (irq & ADV7511_INT0_HPD)
> > > +			regmap_write(adv->regmap, ADV7511_REG_INT(0),
> > > +				     ADV7511_INT0_HPD);
> > 
> > Why do you need to read and test the IRQ here ? If ADV7511_INT0_HPD isn't set, a write will be a no-op
> > and will keep it cleared. If it is set, it will clear it. It seems that an unconditional
> > 
> > 		regmap_write(adv->regmap, ADV7511_REG_INT(0),
> > 			     ADV7511_INT0_HPD);
> > 
> > should be enough.
> 
> Agreed, I will make this unconditional.

-- 
Regards,

Laurent Pinchart

