Return-Path: <linux-renesas-soc+bounces-28004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EUkMmblhWnCHwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 13:58:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524EFDC73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 13:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CFF230094D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 12:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8550E3AEF41;
	Fri,  6 Feb 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FQtnmZx+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xr/k269h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F53644DB;
	Fri,  6 Feb 2026 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382692; cv=none; b=ZI5ZpZPEyTJOvmHGh+10GaTLATGq5Hg+pfdRhYvFs+RRVqKliSa5qQQ/v0F6788yKBiuY+dFcArmPRx4lBWdpvnAL8edcL1guyTum9zFmHelBMx6VpoHRq7Wsu8fv10mF8x4G8Kf4Wd0Z8hBIrVm18MDxpYgjRmGaPK/NOmeA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382692; c=relaxed/simple;
	bh=0BCwj7+OybXEwow2+aiHN4hG1F5D6vqrTvgpkGQnl8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BpwNo4Zu7OF2Qj+VMvP7pHtP42GDaVU1dzdn+LgVvRkNVJomK/dWJQBuz1kjJAG4I+c/mhZ0ofaQfdfV9o1EfJXeIZ6XGKDoR+TLwJq5kn1TDPRWVQIEwonntYJgc+fvyK6axhFAh5lDL+YgsNSFnvbVT/2GlaUSAXoK0yIUflk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FQtnmZx+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Xr/k269h; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f6vJx6ppXz9vHM;
	Fri,  6 Feb 2026 13:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770382690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=llgXl1mE8bc/+pFeFK8Wf0YdvBqmM9KcT1a3EQ5d55c=;
	b=FQtnmZx+cNsWxhGtEVONGv7U1ygvr9t2SH18ew1lt0NNElAZ8lOz3U4yA/VWb/tg7RwRQj
	dHLiU+jPkQ5+e8TKv1BZt/IMMbjhpNsS3uc5Z9SGy1RHmV+Y6x810FmjDo9noQRSVrIF7g
	p0r7vT2fhUZB5h2XOAg3v1l/hvUueyyRDvtJcDE9pr0p+3ONPb/8N/A4kOAc/xnMWLd8ut
	7JRbe+ZsSiOFzquGpUwR4rvdZDznY/0GE9eJB27KxD6zin/BGZORcyMgsia8irheMeoaX0
	7IzX9hFF+/QruRd9sO/z1LaEvuzPwptbPEu2HY7LoPl0e2D79RoXeJMfgz9GUQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Xr/k269h";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770382688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=llgXl1mE8bc/+pFeFK8Wf0YdvBqmM9KcT1a3EQ5d55c=;
	b=Xr/k269h0oQIaFECs9ujS9B7jQDQlNf0KRkSqFXgv8YjiHqa5gqu15zosi9JzmOdHMADMf
	hgsEQsK0mfXUpQIvDBjknQo250+sUgBR7N2vU4QBrP1iGeaQzSIbhjc5aV6LDWRkG7jgk1
	eAzJd2FOxNlD0gjcbcKHcs44GrEhPiyrXPy4feyeVidP1QDCQmmABKXzeIZNV1FZIp/pbZ
	4IM+82SOdjbYtpAqDX9EkTvFHFH/PCu5KZb9ll1/KtesWBil4d8urhweQiS50u8FnTd/nO
	gO1UIDG4LEC6Xt9N3/dhM/wbxcWBPEAasRSe4+29Cau1zOg227eaOWnAcZpdwQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our DSI device at probe
Date: Fri,  6 Feb 2026 13:57:53 +0100
Message-ID: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ebf340d77ff1dffcde5
X-MBO-RS-META: h9kizgeey8nho63mht4btn5efcornqr7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28004-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,bootlin.com,intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,lists.freedesktop.org:email,ideasonboard.com:email,kwiboo.se:email]
X-Rspamd-Queue-Id: 4524EFDC73
X-Rspamd-Action: no action

In order to avoid any probe ordering issue, the best practice is to move
the secondary MIPI-DSI device registration and attachment to the
MIPI-DSI host at probe time.

Besides solving the probe ordering problems, this makes the bridge work
with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
and iterates over bridge_list to locate the DSI host bridge.

However, unless the WS driver calls mipi_dsi_attach() in probe(), the
DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
called and the DSI host bridge is not added into bridge_list. Therefore
the of_drm_find_and_get_bridge() called from du_probe() will never find
the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.

The circular dependency here is, that if rcar_du_encoder_init() would
manage to find the DSI host bridge, it would call the WS driver .attach
callback ws_bridge_bridge_attach(), but this is too late and can never
happen. This change avoids the circular dependency.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Note that this is similar to e.g. commit
6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device at probe")
and pretty much what every other DSI-to-DPI bridge does.
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Update commit message with issue description
    - Add RB from Luca
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 43f4e7412d722..9254446f54958 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -80,11 +80,6 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
-	int ret;
-
-	ret = ws_bridge_attach_dsi(ws);
-	if (ret)
-		return ret;
 
 	return drm_bridge_attach(encoder, ws->next_bridge,
 				 &ws->bridge, flags);
@@ -179,7 +174,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
 	ws->bridge.of_node = dev->of_node;
 	devm_drm_bridge_add(dev, &ws->bridge);
 
-	return 0;
+	return ws_bridge_attach_dsi(ws);
 }
 
 static const struct of_device_id ws_bridge_of_ids[] = {
-- 
2.51.0


