Return-Path: <linux-renesas-soc+bounces-33626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M/y5K4vgImrhegEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:43:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A46648F24
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:43:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="Joei6JJ/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C05A630226BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DD83B14B2;
	Fri,  5 Jun 2026 14:35:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B4B36D503
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 14:35:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670141; cv=none; b=jKLBG4SF0ACm/IPCPXUtHWS5rBplNUcf/cRwNyr94Vs9Ob9b0DOik0JP7zW9kcij8EIGmfGxJcR80Mg+evaJQGAuFydLsBvQLTUicGcduGGJe7ivHjluDpj7FyIlY58N781m5Tw/8nUv8wdHj69/3PTrK4HgxLA1ONQRHlqJ0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670141; c=relaxed/simple;
	bh=4Be3tAP2Lsg/1BJlGAqo+63noml+3afh0zhiAHwhG1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkzZC+oxQteKlsxM+IyOi9RRRKnsYsRU3BpO4pJ+Ng3KDkJwSOcAXzd8FxgLrLS7ABFn9DoO8sfP0pXH41iDIC5ZRlSyKmlJbeI3LQvoL4FDB41D0gRgw2E+0QfFRqr8GF2hLWZLXlWtQ1x22Vdv8g9T42AKzWrlElGGpFcAlpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Joei6JJ/; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E35B11B9A;
	Fri,  5 Jun 2026 16:35:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780670110;
	bh=4Be3tAP2Lsg/1BJlGAqo+63noml+3afh0zhiAHwhG1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Joei6JJ/k30lB+i4rxoWV00uUqq/O3QwYTsTAl9b1WEB80bPF1aqzqJMfXkdPn+EJ
	 XUmYP62qd0NTgijNH5WsZg+Dy7pgyBG8GJolo9m7DDIGFRbaZZkCB7P/6Le+QRATyn
	 Hs7hS/z/eIM3hpzt8y3laWxZEFXhnsBGI2dKCr54=
Date: Fri, 5 Jun 2026 17:35:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 59/76] drm/renesas: rcar-du: lvds: Switch to
 atomic_create_state
Message-ID: <20260605143534.GH84912@killaraus.ideasonboard.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-59-875d828d31bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-59-875d828d31bc@kernel.org>
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-33626-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:jernejskrabec@gmail.com,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,ideasonboard.com,glider.be,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,lists.freedesktop.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09A46648F24

On Sat, May 30, 2026 at 04:00:04PM +0200, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Magnus Damm <magnus.damm@gmail.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> index 154410745a74..e433ce61d431 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -656,11 +656,11 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.attach = rcar_lvds_attach,
>  	.destroy = rcar_lvds_destroy,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.atomic_enable = rcar_lvds_atomic_enable,
>  	.atomic_disable = rcar_lvds_atomic_disable,
>  	.mode_fixup = rcar_lvds_mode_fixup,
>  };
>  

-- 
Regards,

Laurent Pinchart

