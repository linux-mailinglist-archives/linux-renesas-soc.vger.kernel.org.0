Return-Path: <linux-renesas-soc+bounces-28672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNcCDcQTpmnlJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 23:48:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4C1E5E7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 23:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD08377D845
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 21:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C0A382F0A;
	Mon,  2 Mar 2026 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LAxHCE/S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AF0382F05;
	Mon,  2 Mar 2026 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487286; cv=none; b=d0opz3GtTdwv9mSCz1rq0ZNroq794xhwZLos8kQA5PnzxOrWUqxBB6t8z/SzWXSY3D+HfCanDYY1laG/9CqKKx1xIkaik5YSkxuo2a/CBdLj5aKW3hmIjwN4jXlzezMqbaUhFaAa3tnQS1dZjaWWqR6qE56U6sTNLC/YQJb2vTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487286; c=relaxed/simple;
	bh=UQGveZAg1RdW8UUbtNEC9Z8+VEui6RAonhnhCSGXybI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxxbrW4wuqdQ9IW/huTRHb9GpnK2oRQ1y7i+aswt7t705Bp/qlWsgFf62PE3tQW1xHnrN0T6XnMOhqjOIOfApSHdLlo+0+jSVhePmve366Q0wVMvBSquES0oqKW3523Cxha8EstepyHQeEbgHVYJOdSy7eDzQJAwfbVqYVG93zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LAxHCE/S; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fPsdl6jx7z9sdH;
	Mon,  2 Mar 2026 22:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772487276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xp8sg5gVtxoKedtyD9+EqXP+jjBRz+jOb9nPGoQLblA=;
	b=LAxHCE/SWju9DJ7RUefqhrCGp/HxEgKgZ+/Dn4G6+umv0DfVTRTARwej2JbHvjkbae3e86
	I7juJ3W6XjL5gZsRcp/14sFIcfOTsH3dr4SyM24H95VQbjAND8Y1vuz/o1Wv2zp36YbJPy
	vgtKGAiOJB0vWg6J/sLCWcOk+MNx+b7o8ezil2X2haqDe/TLBASWyRFLse+UxNdfVzF6uI
	oK35F4svLhLIpWYI2cetsGNsgKflH0y0DQdyypP34WcIJVUsRTeCuKEOcfg8dOLhWNWOt8
	WX5ao+JEpVJfNO8Q5eUge9km80LTrW72+GjwXWoMTZQZaiqqr8/kMiLGKkSbSA==
Message-ID: <e9c7f67d-bfba-411a-80fb-956fd96e1037@mailbox.org>
Date: Mon, 2 Mar 2026 22:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
 <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0a60f08183c5a211308
X-MBO-RS-META: z3bdwrxqqkiyhhkwi8xtr3eyg31pu438
X-Rspamd-Queue-Id: 8CB4C1E5E7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28672-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Action: no action

On 2/6/26 3:34 PM, Luca Ceresoli wrote:
> Hi Marek,
> 
> On Fri Feb 6, 2026 at 1:57 PM CET, Marek Vasut wrote:
>> In order to avoid any probe ordering issue, the best practice is to move
>> the secondary MIPI-DSI device registration and attachment to the
>> MIPI-DSI host at probe time.
>>
>> Besides solving the probe ordering problems, this makes the bridge work
>> with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
>> its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
>> by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
>> and iterates over bridge_list to locate the DSI host bridge.
>>
>> However, unless the WS driver calls mipi_dsi_attach() in probe(), the
>> DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
>> called and the DSI host bridge is not added into bridge_list. Therefore
>> the of_drm_find_and_get_bridge() called from du_probe() will never find
>> the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.
>>
>> The circular dependency here is, that if rcar_du_encoder_init() would
>> manage to find the DSI host bridge, it would call the WS driver .attach
>> callback ws_bridge_bridge_attach(), but this is too late and can never
>> happen. This change avoids the circular dependency.
>>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for the very clear description! R-by confirmed.
Can this be applied now ?

