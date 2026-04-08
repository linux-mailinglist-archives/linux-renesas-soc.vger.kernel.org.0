Return-Path: <linux-renesas-soc+bounces-31053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNDtMbrJ1mkLIQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 23:33:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BF3C41C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 23:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6AB83029261
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 21:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCAA30AD0A;
	Wed,  8 Apr 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VNtRtYrH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C826C39E;
	Wed,  8 Apr 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684024; cv=none; b=WnxolClNjcUKBo+T1WSgijsBhuCjewLPglu8OqjhmlMVEM3Fi1y0uEpp7eTwwIeU4muHBDNIVd/iEB3NVWyZQ6vALQRbFE8U1EnWt80hzMDhUDdulevPzanHrDdnLWx46j0SXr/OOOXJLjkG8kjsIQxp2XsExtJVhh5dzrNu2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684024; c=relaxed/simple;
	bh=1PsHHAVlfYudK7174uS0wwaNW8CiA1Xyq+dEBvmz6QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRRrB+A8D8CDCxDK4LVu0MebaVH1jH5X2wC2DcGN7PIa/1/y66Fhsxh77S6fUgxg0DZ0qjcf9XI2MoihjE9qj47wIH7xPSCP8hL+0a15bwQJWZsNaGQns6SHBEFzdU4UVBe84v8mAtRbToFH4xh6lKp672ZvJmQq5olVA81mijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VNtRtYrH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4723D241;
	Wed,  8 Apr 2026 23:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775683932;
	bh=1PsHHAVlfYudK7174uS0wwaNW8CiA1Xyq+dEBvmz6QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNtRtYrHWCMuQAzSAUQPof8hyxmRXRrhoykppZA3vNFc2wRw5D2ChoARk0mO8vWJV
	 GbWjXydt62A8w5DvVM5XmIwLBjUGjov9FSJBfZzLdBttGZSExbe4Da3YmM/jb6D2WF
	 GkAIKxsORpkcdJEDo/S8Kx3SRnkwR4tqcd3O9k+U=
Date: Thu, 9 Apr 2026 00:33:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] drm: renesas: rz-du: rzg2l_du_encoder: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260408213339.GM1965119@killaraus.ideasonboard.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-1-421781c8c061@bootlin.com>
 <a3c30888-9818-4355-9d09-5398172cd698@bootlin.com>
 <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHNYGMWPQWLM.3OBWO5G9NPWK5@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31053-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:url,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2B7BF3C41C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 07:39:03PM +0200, Luca Ceresoli wrote:
> On Wed Apr 8, 2026 at 5:44 PM CEST, Louis Chauvet wrote:
> 
> >> @@ -83,10 +83,21 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
> >>
> >>   		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> >>   							 DRM_MODE_CONNECTOR_DPI);
> >> -		if (IS_ERR(bridge))
> >> -			return PTR_ERR(bridge);
> >> +		if (IS_ERR(bridge)) {
> >> +			// Inhibit the cleanup action on an ERR_PTR
> >> +			ret = PTR_ERR(bridge);
> >> +			bridge = NULL;
> >> +			return ret;
> >> +		}
> >
> > Can't you use
> > https://elixir.bootlin.com/linux/v6.19.11/source/include/linux/cleanup.h#L230?
> >
> > return PTR_ERR(no_free_ptr(bridge));
> 
> Ah, nice cleanup indeed! However, being this patch already reviewed ans
> tested, I'll postpone this cleanup to a later series.

I think this modification is minor enough to keep the tags.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > With or without this modification:
> >
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

-- 
Regards,

Laurent Pinchart

