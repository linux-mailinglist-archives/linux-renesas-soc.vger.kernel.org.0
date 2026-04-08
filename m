Return-Path: <linux-renesas-soc+bounces-31038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOomGqd91mk0FwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:09:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902D3BEB36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B353E303134A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ABD344D99;
	Wed,  8 Apr 2026 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p1IDLQyG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D625F3446DA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775664154; cv=none; b=Y6f8wY7Ue4hhYZ9zkfT1PAjw8H9/QArzirU39ypLSCnAF3G6B6nA5yG1k6d+hHn2L2Rsi7XqWbv8laDMxPkpfqRNYbdu81d9LOolYHatyuNss+S41SFSKAa/khmsrNL5oE5yf7KunGzX+87yQhwK1P+iMOZwLKfjvnUzu+73MoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775664154; c=relaxed/simple;
	bh=DKQrBaYgt90qix20w0dwH5jcs5t76ZNqH9WUFn20/2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llBCdu2pYYIIMuMjkYugaIy1IeNgJD89yla1U7qY365069JAZXtDovmLeW/s3Pu9y3E+ZNqD9XuqlPhOrX7PnyVy6iadmNlfxH542UZKI654JQkFM+e2/Jk/SjeMJOsM6A/epjYwqbN2WIjwfsQg6E7K6tK1pgUm5bjUMvAPk4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p1IDLQyG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BA421A31F6;
	Wed,  8 Apr 2026 16:02:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29CF1603CB;
	Wed,  8 Apr 2026 16:02:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CEB210450178;
	Wed,  8 Apr 2026 18:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775664147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KJRbJxNKCfc6JH7hozu9S72k8eerKMo5kB3arXaP38k=;
	b=p1IDLQyGfxO3wv2RgcPaWJq/raZE/sGDX1nRN6TPvRJ5+VX9BwWkm5q8XbM5gUxXkgWoin
	amDVHzyeh+alDZTY24NhTLHCxmNqIgvnA6kvxl+eiPpm7TmlaZMTNMwS8bJQ0aFGGSO+eM
	xuA7FYrLhqmHd1jY8gD+ddLzfWrp3GDPSJ5yVC1peK7oo9UZgDQ8AXSs/jF1DFujJ5WZs7
	b/rd2+1eIYzwVuo1BO09GPTWhrs1dMftmzZcL7cY4V3ClsUz50ceEv0Tz5suVMCiNr2Pzk
	k2+v5J/Ygm+9/Et4NZP4muyPj7kl1UbY3uYCn9pPkW5uWKU9jqgd1acNn+EPKA==
Message-ID: <4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootlin.com>
Date: Wed, 8 Apr 2026 18:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm: rcar-du: encoder: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Linus Walleij <linusw@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
 <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-3-421781c8c061@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-3-421781c8c061@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31038-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 6902D3BEB36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 18:27, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> We need to handle the two cases: when a panel_bridge is added and when it
> isn't. So:
> 
>   * in the 'else' case a panel_bridge is not added and bridge is found: use
>     of_drm_find_and_get_bridge() to get a reference to the found bridge
>   * in the 'then' case a panel_bridge is found using a devm function which
>     already takes a refcount and will put it on removal, but we need to take
>     another so the following code in this function always get exactly one
>     reference that it needs to put
> 
> In order to put the reference, add the needed drm_bridge_put() calls in the
> existing cleanup function.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v4:
> - fixed conflict after commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak
>    device_link to CMM")
> - Use ARRAY_SIZE() instead of define
> - Unsigned variable for never-negative variable
> - Added comment to clarify the additional drm_bridge_get() in the
>    panel_bridge case
> - Coding style (C comments, line wrap at 80)
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 35 +++++++++++++++++++----
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
>   3 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> index 7ecec7b04a8d..0ae06edf3066 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> @@ -51,7 +51,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>   {
>   	struct rcar_du_encoder *renc;
>   	struct drm_connector *connector;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
>   	int ret;
>   
>   	/*
> @@ -69,20 +69,33 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>   
>   		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
>   							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		if (IS_ERR(bridge)) {
> +			/* Inhibit the cleanup action on an ERR_PTR */
> +			ret = PTR_ERR(bridge);
> +			bridge = NULL;
> +			return ret;

Same as before, can you use no_free_ptr?

With or without this modification:

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +		}
> +
> +		/*
> +		 * The reference taken by devm_drm_panel_bridge_add_typed() is
> +		 * released automatically. Take a second one for the __free()
> +		 * when this function will return.
> +		 */
> +		drm_bridge_get(bridge);
>   	} else {
> -		bridge = of_drm_find_bridge(enc_node);
> +		bridge = of_drm_find_and_get_bridge(enc_node);
>   		if (!bridge)
>   			return -EPROBE_DEFER;
>   
>   		if (output == RCAR_DU_OUTPUT_LVDS0 ||
>   		    output == RCAR_DU_OUTPUT_LVDS1)
> -			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
> +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =
> +				drm_bridge_get(bridge);
>   
>   		if (output == RCAR_DU_OUTPUT_DSI0 ||
>   		    output == RCAR_DU_OUTPUT_DSI1)
> -			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
> +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
> +				drm_bridge_get(bridge);
>   	}
>   
>   	/*
> @@ -135,3 +148,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>   
>   	return drm_connector_attach_encoder(connector, &renc->base);
>   }
> +
> +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rcdu->lvds); i++)
> +		drm_bridge_put(rcdu->lvds[i]);
> +	for (i = 0; i < ARRAY_SIZE(rcdu->dsi); i++)
> +		drm_bridge_put(rcdu->dsi[i]);
> +}
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> index e5ec8fbb3979..b2b5e93f30f8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h
> @@ -25,5 +25,6 @@ struct rcar_du_encoder {
>   int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>   			 enum rcar_du_output output,
>   			 struct device_node *enc_node);
> +void rcar_du_encoder_cleanup(struct rcar_du_device *rcdu);
>   
>   #endif /* __RCAR_DU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index b2d0e4651e35..1119c84e5fe9 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -832,6 +832,8 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
>   
>   		put_device(cmm->dev);
>   	}
> +
> +	rcar_du_encoder_cleanup(rcdu);
>   }
>   
>   int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> 


