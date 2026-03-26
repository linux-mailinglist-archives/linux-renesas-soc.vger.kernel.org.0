Return-Path: <linux-renesas-soc+bounces-30394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOiPN6yWxWmq/gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:27:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877833B6CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 21:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2819301DAC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 20:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2DD3A3831;
	Thu, 26 Mar 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mNeN+YLD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A8302767;
	Thu, 26 Mar 2026 20:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774556655; cv=none; b=hnkN3a9IATXT+BeLINNQeS/gx6tsOkUhdFFbAIcnjOsNyVsMsfxf0j/qNVwc3h1HPzzUfm2bkeMwKd35DZKQn4ZQb5a236o2KFALmMx695jlZ/mmFdBiFkXKEYG7ldpHSxbbYkumIu7+Z8W00utNUxa1HhZbaobf3CxMRCup/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774556655; c=relaxed/simple;
	bh=NVhX/uMxZkpkB/iqDu5JZGx9lhZ9UdPlPo1XBRq95bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miN1kzYxX2o2PJ7kas91U7eJ+ooojyOoOAalSX4meBhxvZPw2ZEVV6W1QYXBAFuMLnvcxgJYDjBo76VNbbsW/RMhHMdjqkogxTiYVhMOeKTg/dPQnLMACXUNNEX1j7kRjcbKSGQhC/ASPwaFRyrrs+U9NyruSNosQR/otVxh+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mNeN+YLD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECF6EC59;
	Thu, 26 Mar 2026 21:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774556572;
	bh=NVhX/uMxZkpkB/iqDu5JZGx9lhZ9UdPlPo1XBRq95bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNeN+YLDfw3MuX2TA+viY+TKCOWX3G9bMqKE64cCBilShGkf6X2SAvRqbSZ2O4tRD
	 q5UjEYFaWlqDio3pkykZVhoVjQbxTeo3RWBFlcO4jIRyCOK/tMt15o9jTEoHODLBCw
	 6gTsI4IWQgepC2mxAcjm/5zuryn6gDno7q/hl6uY=
Date: Thu, 26 Mar 2026 22:24:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Amin GATTOUT <amin.gattout@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: Convert to of_drm_find_and_get_bridge()
Message-ID: <20260326202409.GE2770072@killaraus.ideasonboard.com>
References: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-bridge-v1-1-c0c44b53f7b6@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-30394-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,bootlin.com,suse.de,gmail.com,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 6877833B6CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Amin,

On Thu, Mar 26, 2026 at 09:10:15PM +0100, Amin GATTOUT wrote:
> of_drm_find_bridge() is deprecated.
> Replace it with of_drm_find_and_get_bridge() which increments
> the bridge refcount as required.
> 
> Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> index 7ecec7b04a8d..42253c1251b5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> @@ -72,7 +72,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		if (IS_ERR(bridge))
>  			return PTR_ERR(bridge);
>  	} else {
> -		bridge = of_drm_find_bridge(enc_node);
> +		bridge = of_drm_find_and_get_bridge(enc_node);

How did you test this ?

>  		if (!bridge)
>  			return -EPROBE_DEFER;
>  
> 
> ---
> base-commit: d813f421930c5b01b9f61043932de02602dd6ae3
> change-id: 20260326-bridge-43ecbef9d39f

-- 
Regards,

Laurent Pinchart

