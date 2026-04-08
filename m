Return-Path: <linux-renesas-soc+bounces-31052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DbUBlbJ1mkLIQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 23:32:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7517A3C419E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 23:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ACCD3026306
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 21:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D5A26C39E;
	Wed,  8 Apr 2026 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gMSp+Qwn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E625A645;
	Wed,  8 Apr 2026 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683923; cv=none; b=Ij1AjEwUv4JDt6b0fWvy3YgEZ9xXz/BTHMLmo3TXBL4A1Jfo/QytOKVjngfqwhr/n3qga8K6mBbBhQmDXixxX+ib15k8upK/hPkaxFEySQDdaWm14RRLHSPjfFTYTlluOX16KPN0WwhzR2NKSCdq7uw2HXaRzPe2ug5BHsjEfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683923; c=relaxed/simple;
	bh=oAC1/K/V1XBRxFt3ULj40F2D7Cto95HCk2G145TRZY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFeAeUSkJVry92VSA0LcfPoDHeiQ3SsntqK/Ry17S+/OMINnxENETeNzclatRQbf/RLh28qkZ6P0pVXgcAyEMmWZHLnYxC9idyiGyxFNNX5L+agKZ7zuIWU2wFCAWdd+2R3IiLf7dJazj/1aLvCcUjNayCvvSjY/vX3FUvYfQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gMSp+Qwn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D3172241;
	Wed,  8 Apr 2026 23:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775683830;
	bh=oAC1/K/V1XBRxFt3ULj40F2D7Cto95HCk2G145TRZY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMSp+QwnN623dVRBFHiTqntRHjnCxX1D7YwQcxPqxZo/B5D3P7rtrGdZDclkKs3K6
	 XAMs6yUVUXOwkY7ATV1KKf5OIeFChkeqG2ySh98XyuaD/Oz5Fm6yxAMo9pFqVqOvo2
	 OxXwL4uwsRgyvNTgQQWDHC2MBzix6SyMICGLx3W0=
Date: Thu, 9 Apr 2026 00:31:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Subject: Re: [PATCH v4 3/4] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260408213156.GL1965119@killaraus.ideasonboard.com>
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-3-421781c8c061@bootlin.com>
 <4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootlin.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31052-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 7517A3C419E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:03:01PM +0200, Louis Chauvet wrote:
> On 4/2/26 18:27, Luca Ceresoli wrote:
> > of_drm_find_bridge() is deprecated. Move to its replacement
> > of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> > is put when done.
> > 
> > We need to handle the two cases: when a panel_bridge is added and when it
> > isn't. So:
> > 
> >   * in the 'else' case a panel_bridge is not added and bridge is found: use
> >     of_drm_find_and_get_bridge() to get a reference to the found bridge
> >   * in the 'then' case a panel_bridge is found using a devm function which
> >     already takes a refcount and will put it on removal, but we need to take
> >     another so the following code in this function always get exactly one
> >     reference that it needs to put
> > 
> > In order to put the reference, add the needed drm_bridge_put() calls in the
> > existing cleanup function.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v4:
> > - fixed conflict after commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak
> >    device_link to CMM")
> > - Use ARRAY_SIZE() instead of define
> > - Unsigned variable for never-negative variable
> > - Added comment to clarify the additional drm_bridge_get() in the
> >    panel_bridge case
> > - Coding style (C comments, line wrap at 80)
> > ---
> >   drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 35 +++++++++++++++++++----
> >   drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
> >   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
> >   3 files changed, 32 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> > index 7ecec7b04a8d..0ae06edf3066 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> > @@ -51,7 +51,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >   {
> >   	struct rcar_du_encoder *renc;
> >   	struct drm_connector *connector;
> > -	struct drm_bridge *bridge;
> > +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
> >   	int ret;
> >   
> >   	/*
> > @@ -69,20 +69,33 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >   
> >   		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> >   							 DRM_MODE_CONNECTOR_DPI);
> > -		if (IS_ERR(bridge))
> > -			return PTR_ERR(bridge);
> > +		if (IS_ERR(bridge)) {
> > +			/* Inhibit the cleanup action on an ERR_PTR */
> > +			ret = PTR_ERR(bridge);
> > +			bridge = NULL;
> > +			return ret;
> 
> Same as before, can you use no_free_ptr?

That would be nice. You could then drop the comment, as no_free_ptr
makes it explicit.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> With or without this modification:
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> > +		}
> > +
> > +		/*
> > +		 * The reference taken by devm_drm_panel_bridge_add_typed() is
> > +		 * released automatically. Take a second one for the __free()
> > +		 * when this function will return.
> > +		 */
> > +		drm_bridge_get(bridge);
> >   	} else {
> > -		bridge = of_drm_find_bridge(enc_node);
> > +		bridge = of_drm_find_and_get_bridge(enc_node);
> >   		if (!bridge)
> >   			return -EPROBE_DEFER;
> >   
> >   		if (output == RCAR_DU_OUTPUT_LVDS0 ||
> >   		    output == RCAR_DU_OUTPUT_LVDS1)
> > -			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
> > +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =
> > +				drm_bridge_get(bridge);
> >   
> >   		if (output == RCAR_DU_OUTPUT_DSI0 ||
> >   		    output == RCAR_DU_OUTPUT_DSI1)
> > -			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
> > +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
> > +				drm_bridge_get(bridge);
> >   	}
> >   
> >   	/*
> > @@ -135,3 +148,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >   
> >   	return drm_connector_attach_encoder(connector, &renc->base);
> >   }
> > +
> > +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(rcdu->lvds); i++)
> > +		drm_bridge_put(rcdu->lvds[i]);
> > +	for (i = 0; i < ARRAY_SIZE(rcdu->dsi); i++)
> > +		drm_bridge_put(rcdu->dsi[i]);
> > +}
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> > index e5ec8fbb3979..b2b5e93f30f8 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> > @@ -25,5 +25,6 @@ struct rcar_du_encoder {
> >   int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >   			 enum rcar_du_output output,
> >   			 struct device_node *enc_node);
> > +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu);
> >   
> >   #endif /* __RCAR_DU_ENCODER_H__ */
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > index b2d0e4651e35..1119c84e5fe9 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > @@ -832,6 +832,8 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
> >   
> >   		put_device(cmm->dev);
> >   	}
> > +
> > +	rcar_du_encoder_cleanup(rcdu);
> >   }
> >   
> >   int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > 

-- 
Regards,

Laurent Pinchart

