Return-Path: <linux-renesas-soc+bounces-30421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBreImpBxmlRIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:35:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D02341192
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EE6F307A2FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C333D75C0;
	Fri, 27 Mar 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="exyRGiEB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C863D47DB;
	Fri, 27 Mar 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600451; cv=none; b=Zic+sCIEj7So1bTbtpZEuNl/VybPffLqWwRR7cb1f0tvWcl1pjljY60wMaF8Z/yuKXeQVIIKMxuoFIJSM6oBE/715SIvDHJ9am+8dpoKvCE2cTPndIbqUXxPSWFm5qMGRTKI3OPmeU+V5Xjh3bQOOoy4GXwzmVcAbaWu2KzAHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600451; c=relaxed/simple;
	bh=Rmk3YZOfeV80Jfhg4CfzxfdypSaxPXEVhEAPVsjEkUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGF8IMMdmlErFOp4C7FdVqcxW7LvpLe9ydaEvZq33Xsk56fbsi5h9ZExOgFnvp33+oZsmbNcq5MS12ttSW/dOMgksfoeTb13vC+Eh7QKq97ASp+Cwi/uq98/WwxQ5vTjsbMgQ4pH3pZIHwPgOWdsByc1JGiQq/FTyIoPDnrNJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=exyRGiEB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 347E67CA;
	Fri, 27 Mar 2026 09:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774600367;
	bh=Rmk3YZOfeV80Jfhg4CfzxfdypSaxPXEVhEAPVsjEkUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exyRGiEBRpJf+51y+H0CSqe6/fPqeCUMrzT2XfyVvvcPEENDkOLBHvzewHFmJO0x+
	 VESpApUpUdLHvgmlmgnKKhFU0Bygk9dixMYw9yNhJNLvhmZeOkV99hsa5aN1Lqvu1I
	 qiyYKmsDLhTCda1gvAxuj/Njt/d4mWN1Vox5yxUs=
Date: Fri, 27 Mar 2026 10:34:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Amin GATTOUT <amin.gattout@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
Message-ID: <20260327083404.GA2993961@killaraus.ideasonboard.com>
References: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
 <DHDEL0VTRYDP.2D45EP8E07Y08@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHDEL0VTRYDP.2D45EP8E07Y08@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30421-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 36D02341192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On Fri, Mar 27, 2026 at 08:57:45AM +0100, Luca Ceresoli wrote:
> On Thu Mar 26, 2026 at 9:10 PM CET, Amin GATTOUT wrote:
> > of_drm_find_bridge() is deprecated.
> > Replace it with of_drm_find_and_get_bridge() which increments
> > the bridge refcount as required.
> 
> Thanks for taking care of the conversion to the new API!

I suspect you may be talking to a machine (possibly through a human
proxy).

> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> > @@ -72,7 +72,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  		if (IS_ERR(bridge))
> >  			return PTR_ERR(bridge);
> >  	} else {
> > -		bridge = of_drm_find_bridge(enc_node);
> > +		bridge = of_drm_find_and_get_bridge(enc_node);
> 
> This change alone is not correct I'm afraid. The difference between
> of_drm_find_bridge() and of_drm_find_and_get_bridge() is the latter get a
> reference to the bridge, so you have to put that reference when the bridge
> pointer is no more accessible.
> 
> Have a look at previous commits doing the same API replacement, you can
> find examples similar to this one, where:
> 
>  * the bridge pointer is stored in a local variable (not saved in a struct)
>  * the bridge pointer could be set wither by of_drm_find_bridge() or
>    a function adding a panel bridge
> 
> Luca

-- 
Regards,

Laurent Pinchart

