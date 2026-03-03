Return-Path: <linux-renesas-soc+bounces-28688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J6JEqCYpmltRgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:15:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2B1EAA88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 09:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569473016508
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 08:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07467382360;
	Tue,  3 Mar 2026 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wFav8NOA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8258C38839D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525685; cv=none; b=uyfIWzHIGa9FQ9UXfUAKFWVfPBIMN8k2ErC3tJ62+j1B7jWDVkqWlUE3JjVruayVEF4SkK8xOqJn4uurWBR55YSTSqfK8evFGEmd61/464babPDep7sAHFcB8GUqUjZvS3f6FXt0gcL9FUq4VMWdoHRlZOhBQbX9OiWeQ59S3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525685; c=relaxed/simple;
	bh=Sig7A8dzv3ykz7IFcfIV7N8IocVLXKDEnhTUf2gPWGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dW3tLeruxc7aILl3IkV0Eollqig4Y0TBbqSwxNBndtpTN5Fwz3ft9uJPoeBuQEN6VyaCRQ0sEBoriX4riIxpaNvlchPXUWMoiB9DAZVH/8EiNUsHsFUutULIcIoP6YPLKsnRc0JW6ooOYE0dL+xzFl4drQ1lOv/QP4vdfPRR3MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wFav8NOA; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 704524E411DD;
	Tue,  3 Mar 2026 08:14:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41FB15FF29;
	Tue,  3 Mar 2026 08:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A1E11036956C;
	Tue,  3 Mar 2026 09:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772525673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AP13vgzwh3NW+FqntMYmrLkblrevrDIovoRMTTtQweg=;
	b=wFav8NOAzpXPRonYSvL8M5/XZkCA4FBc+4Jr54TGm23oXE7JQIxAFWchhws5JeQmajh6Kl
	S6hGKWPDmotTgvY/LClHnZuai+knrR+zdyGjE6NHAUTe/UnmvDm8OZ19xoXUf5yfzpt/FL
	gOCbGNjKJMtAju7YxcWZuqBhBThQJSd55hp/jI11FAEnnhIw8l6JDsYclBBLhopmdSXXr9
	IhD1S0Q/cH3YH5NfOJnyVeg4xcS1NK8F21ECqyd8HABj/TLaYzAhdMJ41nYmtFOwgZWbMe
	O4cLP8Oms4l5BDAM+gaTkkEAoaeNqCCL5q4am3ua4IWaDmMeYhoe/wAMHVwzWQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
References: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our
 DSI device at probe
Message-Id: <177252566811.105892.7171788198806025494.b4-ty@bootlin.com>
Date: Tue, 03 Mar 2026 09:14:28 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: ACE2B1EAA88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28688-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 13:57:53 +0100, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
> 
> Besides solving the probe ordering problems, this makes the bridge work
> with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
> its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
> by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
> and iterates over bridge_list to locate the DSI host bridge.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: waveshare-dsi: Register and attach our DSI device at probe
      commit: b8eb97ead862de7a321dd55a901542a372f8f1cd

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


