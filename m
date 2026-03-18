Return-Path: <linux-renesas-soc+bounces-29759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOfzMdOKumnSXgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:21:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4792BABAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146DF30DF427
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D45375AD3;
	Wed, 18 Mar 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qaLRF/EP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FF277C86
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832428; cv=none; b=AUy90D4pZ5BO7a72F/eksdJ84x9UcdK0tFkYGXSvF2z0OlbyaeQDU+cwmOnfEZh4NJ8rl7DtJH8XCQX6WiQhlw+7iZMf9+lYkgGdMwn2Dj6vBpPy/vvQa0pKvGWA0EwJog+ugqdCQm3G2ASNOQCHEyNdwkjKSBNtCDv5c2BD+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832428; c=relaxed/simple;
	bh=kezOWi+Y/xWmOoKYVNDub0JBhGMIjj8YtFSMTo7i91o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNLMNORxuaROS6UwM1jyJrBFy0lvSJfXt9JWIpDqFOqulkDBOlTNqo8HFlcoytHwvN0M/XTbv02EeodKLanyXQB9WAXUjIJX+Om+/nZDPCij8RKbF1YPFWjMuSjeNqBWYeCyzMZHwXdXn6j3+CIYZ/go9h3f5fu+H1qR4ivrFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qaLRF/EP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CE007460;
	Wed, 18 Mar 2026 12:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773832352;
	bh=kezOWi+Y/xWmOoKYVNDub0JBhGMIjj8YtFSMTo7i91o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaLRF/EPead4EDfD8PzWORi3ykRZS0QfFOkhU/AagZWdbC7q/xjxh9cUcSEcAyfGJ
	 DvVR5EYhy0d3cqSfvJlElYqU1oJNSRC/Fy4WBP785kYoKclaWyfuerHS7EQskuFHZ+
	 9veEtORAOru2tbcaIEFuCrH6Joc317yQrbIxRWvA=
Date: Wed, 18 Mar 2026 13:13:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"tomi.valkeinen" <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH 1/4] drm: rcar-du: Ensure correct suspend/resume ordering
 with VSP
Message-ID: <20260318111343.GF408929@killaraus.ideasonboard.com>
References: <20260317231930.595719-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com>
 <TY3PR01MB11346D728D12D6330033B1E46864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346D728D12D6330033B1E46864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29759-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 2A4792BABAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:32:53AM +0000, Biju Das wrote:
> On 17 March 2026 23:19, Laurent Pinchart wrote:
> > 
> > The VSP serves as an interface to memory and a compositor to the DU. It therefore needs to be
> > suspended after and resumed before the DU, to be properly stopped and restarted in a controlled
> > fashion driven by the DU driver. This currently works by chance. Avoid relying on luck by enforcing
> > the correct suspend/resume ordering with device links.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> FYI, made similar changes on rz-du and confirm S2ram and s2idle works fine on RZ/G3L.

Thank you for testing, I'm happy it fixed your issue.

> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 16 ++++++++++++++++  drivers/gpu/drm/renesas/rcar-
> > du/rcar_du_vsp.h |  2 ++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-
> > du/rcar_du_vsp.c
> > index 94c22d2db197..a4a49dcd8233 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > @@ -20,6 +20,7 @@
> >  #include <drm/drm_vblank.h>
> > 
> >  #include <linux/bitops.h>
> > +#include <linux/device.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > @@ -458,6 +459,9 @@ static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
> > 
> >  	kfree(vsp->planes);
> > 
> > +	if (vsp->link)
> > +		device_link_del(vsp->link);
> > +
> >  	put_device(vsp->vsp);
> >  }
> > 
> > @@ -482,6 +486,18 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  	if (ret < 0)
> >  		return ret;
> > 
> > +	/*
> > +	 * Enforce suspend/resume ordering between the DU (consumer) and the
> > +	 * VSP (supplier). The DU will be suspended before and resume after the
> > +	 * VSP.
> > +	 */
> > +	vsp->link = device_link_add(rcdu->dev, vsp->vsp, DL_FLAG_STATELESS);
> > +	if (!vsp->link) {
> > +		dev_err(rcdu->dev, "Failed to create device link to VSP %s\n",
> > +			dev_name(vsp->vsp));
> > +		return -EINVAL;
> > +	}
> > +
> >  	ret = vsp1_du_init(vsp->vsp);
> >  	if (ret < 0)
> >  		return ret;
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/renesas/rcar-
> > du/rcar_du_vsp.h
> > index 67630f0b6599..a6731249db34 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.h
> > @@ -12,6 +12,7 @@
> > 
> >  #include <drm/drm_plane.h>
> > 
> > +struct device_link;
> >  struct drm_framebuffer;
> >  struct rcar_du_format_info;
> >  struct rcar_du_vsp;
> > @@ -26,6 +27,7 @@ struct rcar_du_vsp_plane {  struct rcar_du_vsp {
> >  	unsigned int index;
> >  	struct device *vsp;
> > +	struct device_link *link;
> >  	struct rcar_du_device *dev;
> >  	struct rcar_du_vsp_plane *planes;
> >  	unsigned int num_planes;

-- 
Regards,

Laurent Pinchart

