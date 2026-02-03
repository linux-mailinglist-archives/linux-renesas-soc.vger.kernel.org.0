Return-Path: <linux-renesas-soc+bounces-27857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCVWD552gmm+UwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 23:28:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD0DF3DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 23:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3AC03300E5A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 22:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8AD36F41F;
	Tue,  3 Feb 2026 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o2mZa+JW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66D12E11AA;
	Tue,  3 Feb 2026 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770157723; cv=none; b=AS6FiOmBGOWrweW0hiEJgIPV9NEPEW0dIhpzQ0L/p8NS369R5rRjb2dZQJ+/6nljtkyDEGfSMJ0oHQ6TnZah2zHSFMDnganTmCoI44A9B+zzii4Eluoxt8YHPzaShBZwz0wLVb/hLY956wtzdG4zJ97MsKnN3Y2NbdAJEGV2uxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770157723; c=relaxed/simple;
	bh=l4RNNUHLX/moEp8ihVd7H0HLeHfSNwK7YcCqcN1/+3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ja8xxTMGYbLTck2C6DhhBFylwXylRPAZrCXe18FyFURlJ+pdmTyBLuHEKJ8MhW7qVr9C1g0E+2z2/YKtqkfwezG5oDvdMxbfWiG6HQ/CEXkiwscL08VEGzoZVsfhvowmgCaOK5z45hzaUEKIMLRm4Pqzid67FofIC9VS7Yenw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o2mZa+JW; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f5J6X4jHQz9tjW;
	Tue,  3 Feb 2026 23:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770157716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f1o9nsF9YwvZWpGmMUWR2zMYlmkS0PV7dw8KDeOPo2k=;
	b=o2mZa+JWIjUtAWsm8GylAKwi0CRpo3hyrPxMhO7TDg4u1bN5fTRifX4Uor/7P0crcyCQGy
	fwS3CzFz2uOBprnGT3dtkrxcRfSys4g+KnEq5mlQXK9OAAeP/wyRI1abrsAfm4aDGcNQVK
	wDfTAKg795QMinjfaja7WDNYt142oGAR/kGNbFLD0Ri0SP0xX61MM0CJGByNn4EKxMB4L8
	hDNGhp6nqMObwR2VXqOQixA9hVygnyijRXfDTkGSd0QevKWZvEsEisJ7fR1jd6s2o2Xafz
	ofuXIBttfQQ7RI91Xg7Jk4/su1OJ+3hBMSBU0F4FfJA+NW+lz6gQDmhbV8H+9Q==
Message-ID: <ffd8b675-687e-457b-bbd0-88e91ee3520c@mailbox.org>
Date: Tue, 3 Feb 2026 23:28:32 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
To: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8b8c1e99ae5774b79aa
X-MBO-RS-META: fkiwtde55yfuoi81otfpjf4mqimdbpc1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27857-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,kwiboo.se:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: CEFD0DF3DD
X-Rspamd-Action: no action

On 1/13/26 12:47 AM, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Note that this is similar to e.g. commit
> 6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device at probe")
> and pretty much what every other DSI-to-DPI bridge does.
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/bridge/waveshare-dsi.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
> index 43f4e7412d722..9254446f54958 100644
> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -80,11 +80,6 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
>   				   enum drm_bridge_attach_flags flags)
>   {
>   	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> -	int ret;
> -
> -	ret = ws_bridge_attach_dsi(ws);
> -	if (ret)
> -		return ret;
>   
>   	return drm_bridge_attach(encoder, ws->next_bridge,
>   				 &ws->bridge, flags);
> @@ -179,7 +174,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
>   	ws->bridge.of_node = dev->of_node;
>   	devm_drm_bridge_add(dev, &ws->bridge);
>   
> -	return 0;
> +	return ws_bridge_attach_dsi(ws);
>   }
>   
>   static const struct of_device_id ws_bridge_of_ids[] = {

Is there anything that should be done with this patch ?

