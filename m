Return-Path: <linux-renesas-soc+bounces-29794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCEDLvrDumkGbgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:25:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1D2BE26E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 16:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1E55300AEC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962393CE496;
	Wed, 18 Mar 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I4w94R6l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1DC38655B;
	Wed, 18 Mar 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847543; cv=none; b=Kqo9YtoC/KQE8k6xZ5Rd4njBbi/2aj3pt5blHB8ipmmrfGCA4AWbbtEPxzG+NAhQPvTgBiQIdw0ZqJcISjb4y1q29pMsOrN3U6FrBFtYS0KepsiGSsiAevE4P3bCRdoFRGWAi8s3ZX1qG+uAwLpirx0PNpF6E/JHsiu4bvZxmIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847543; c=relaxed/simple;
	bh=EvRalwX2ntkbXZJQ1JFLu87v3wLuX2lWaocS5pxY0iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZQZUNDVAnveHl4li6krbcKG9MSDx+CM+NnKg4a4Yz+t9JBDSyQxoxCh78X07wBooOFuC1vuhFtWDOer2MTcnsmqSXHJD8DVUNYDSIT8dO9uHEJxzlOqUfahSZs3frhffXJ6lU1/jGTnuuLjxe7BKIepr3n5Plmcua9Jr2ZAIA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I4w94R6l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9F349460;
	Wed, 18 Mar 2026 16:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773847462;
	bh=EvRalwX2ntkbXZJQ1JFLu87v3wLuX2lWaocS5pxY0iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4w94R6lkXRcA8DjzP/FlxDWi6EjYqb7DT1HbLjRytTyzKpp/uq485r7z5sSVf5wA
	 MuPWFMGC6Bz4mAfUJ6ISl+ZTtsMy/DRbsegEAfnO3OfyjRLFXKhHwpShI0JU45q7fN
	 IIXH2xXaj43xmwZKTP97oOlugpTNb208oHdCcAGU=
Date: Wed, 18 Mar 2026 17:25:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
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
Subject: Re: [PATCH v3 3/4] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260318152533.GA633439@killaraus.ideasonboard.com>
References: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com>
 <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-3-10f502520357@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-3-10f502520357@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29794-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 28F1D2BE26E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

Thank you for the patch.

On Wed, Mar 18, 2026 at 10:39:37AM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> We need to handle the two cases: when a panel_bridge is added and when it
> isn't. So:
> 
>  * in the 'else' case a panel_bridge is not added and bridge is found: use
>    of_drm_find_and_get_bridge() to get a reference to the found bridge
>  * in the 'then' case a panel_bridge is found using a devm function which
>    already takes a refcount and will put it on removal, but we need to take
>    another so the following code in this function always get exactly one
>    reference that it needs to put
> 
> In order to put the reference, add the needed drm_bridge_put() calls in the
> existing cleanup function.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 28 ++++++++++++++++++-----
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
>  3 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> index 7ecec7b04a8d..5789fc75092f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> @@ -51,7 +51,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  {
>  	struct rcar_du_encoder *renc;
>  	struct drm_connector *connector;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
>  	int ret;
>  
>  	/*
> @@ -69,20 +69,26 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  
>  		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>  							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		if (IS_ERR(bridge)) {
> +			// Inhibit the cleanup action on an ERR_PTR

C-style comments.

Shouldn't drm_bridge_put() be extended to be a no-op when called on an
ERR_PTR ?

> +			ret = PTR_ERR(bridge);
> +			bridge = NULL;
> +			return ret;
> +		}
> +

A comment here would be good.

		/*
		 * The reference taken by devm_drm_panel_bridge_add_typed() is
		 * released automatically. Take a second one for the __free()
		 * when this function will return.
		 */

> +		drm_bridge_get(bridge);
>  	} else {
> -		bridge = of_drm_find_bridge(enc_node);
> +		bridge = of_drm_find_and_get_bridge(enc_node);
>  		if (!bridge)
>  			return -EPROBE_DEFER;
>  
>  		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>  		    output == RCAR_DU_OUTPUT_LVDS1)
> -			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
> +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = drm_bridge_get(bridge);

Line wrap.

>  
>  		if (output == RCAR_DU_OUTPUT_DSI0 ||
>  		    output == RCAR_DU_OUTPUT_DSI1)
> -			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
> +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = drm_bridge_get(bridge);

Same.

>  	}
>  
>  	/*
> @@ -135,3 +141,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  
>  	return drm_connector_attach_encoder(connector, &renc->base);
>  }
> +
> +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu)
> +{
> +	int i;

i is never negative, make it unsigned.

> +
> +	for (i = 0; i < RCAR_DU_MAX_LVDS; i++)

Use ARRAY_SIZE() here.

> +		drm_bridge_put(rcdu->lvds[i]);
> +	for (i = 0; i < RCAR_DU_MAX_DSI; i++)

Same here.

I have tested the patch and it seems to behave fine.

> +		drm_bridge_put(rcdu->dsi[i]);
> +}
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> index e5ec8fbb3979..b2b5e93f30f8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> @@ -25,5 +25,6 @@ struct rcar_du_encoder {
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node);
> +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu);
>  
>  #endif /* __RCAR_DU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 60e6f43b8ab2..82d16a999ee6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -836,6 +836,8 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
>  
>  	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i)
>  		platform_device_put(rcdu->cmms[i]);
> +
> +	rcar_du_encoder_cleanup(rcdu);
>  }
>  
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> 

-- 
Regards,

Laurent Pinchart

