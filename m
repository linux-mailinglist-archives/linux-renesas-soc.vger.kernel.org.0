Return-Path: <linux-renesas-soc+bounces-28909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lLwJFlTrqWk6IAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 21:45:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D021842B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 21:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD043043026
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 20:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CF7341660;
	Thu,  5 Mar 2026 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="B3imj3b0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oeBkCJd6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141720C461
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743505; cv=none; b=axoDlFmDrlGGCdn9irtEaG+71e5Wq48wVY6lTj0SXqSPsoAg1K8m4Ak8apBShIQkqAqx/orzXTtcQpRVh3TFPMr1SYth5KfD7B5yOAG3O8AwWYGaK/XPIaFqCHJTPyWcPgqFxkjLaUfotMdMYSjo9JRLFobJDQjongppQW35wtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743505; c=relaxed/simple;
	bh=5m4cssKODRp7nlXjAv06mPgtRsDcI4EPsdiIjI0DeEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMAaVx3Y3vLBEwyEhUMLDUdzzEB2krJ1qqotDnIfnB+DkWWUT7SFeqymLDhLXb6GnGBHz+gmnXlKhglCM0/aAK/IG4n6g3lRgBJFiDWcSDcC/kUHCw0fOaqefhkY1ll69E1+WVGl0EoMoCJnoybJDUR3kFv/y5quRhDPIDWUNR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=B3imj3b0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oeBkCJd6; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fRhP30tX2z9tgr;
	Thu,  5 Mar 2026 21:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772743495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8jWwVHRcBG2VKlOZWoCRCI4UjdJ9H1kheGjcWjDJHCI=;
	b=B3imj3b0VOob99/2LXpa+0tQzB2DhpF64zCD0EtOQNdXztp1vsAHVEmhP4fhS/PNQzV8uJ
	YKCnG3XkLrJ3avM7FXhlUT5wFNwHH+eRJtPBkgM+H5Bzl5rG1DZ91lOTgJi73C7185OT3o
	Xcg6Ww4fO9fwOqSmShuqXvj1AaAcS8NfLcxwN7X7qrWQLClnUnjADFqN46azYra0Z2/sav
	OGK6th4xBpeMc21SQLbGpg6qlL0ac0iQfe0Yvs2AjDDTg9MwAQd/jV7bpmespmBs49WvXa
	zKWloWXe0CaAWWQ2/b1OQWt2H2c9X4IWoEu0shoNL8mXNypnOTtWCsaVH070jA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=oeBkCJd6;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772743492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8jWwVHRcBG2VKlOZWoCRCI4UjdJ9H1kheGjcWjDJHCI=;
	b=oeBkCJd6T7WhcPSdofq9HBnhPtBiqUVrdKLEZxNUPHBNiKwJeeCx/Aq6Vsgylni9cfS0Vh
	ONO289zC19bbPvj/+r8l4fRHkAhge/z8fVgNkNvu4qvVzizyMdwd0UkIdt2ZWEeS+1C497
	48gs+NpL3fPNECPu8mXSsxvl04p9O6w+DselIXRjfVUut/hF3raUY8M+GfSk21iiXV4JVE
	abw6zhA7U3zi2zTf7kam6btMTjH7SfWVa2JfseDIy/wv/RqI1ZqJ6YkETi0A9Mp6TjZcCw
	Ol+PKRjWPj05dpRG7li+jtbGlSNQkXwxlb/uAiDrmvepmIji16fw8cOlp53CQQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: waveshare-dsi: Use temporary signed variable for DSI lanes validation
Date: Thu,  5 Mar 2026 21:44:18 +0100
Message-ID: <20260305204443.76188-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6bcce76b8bcd82766d8
X-MBO-RS-META: 5mam16ceet597ojxihh3ommgjzmo7npr
X-Rspamd-Queue-Id: 936D021842B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28909-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The struct mipi_dsi_device .lanes field is of type unsigned int.
The return value of drm_of_get_data_lanes_count_ep() is signed int,
and therefore cannot be directly assigned into dsi->lanes followed
by check of dsi->lanes < 0 . Instead, assign the return value into
local temporary signed integer and check for negative return, and
if there is no negative return, assign the temporary signed integer
value into dsi->lanes. Note that drm_of_get_data_lanes_count_ep()
assures the return value is clamped to 1..4 or negative, and never
zero.

Fixes: fca11428425e ("drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603060341.hNj0pl9L-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 0497c7ecbc7a5..91826c1ffdddf 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -66,11 +66,13 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
-	if (dsi->lanes < 0) {
+	ret = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
+	if (ret < 0) {
 		dev_warn(dev, "Invalid or missing DSI lane count %d, falling back to 2 lanes\n",
 			 dsi->lanes);
 		dsi->lanes = 2;	/* Old DT backward compatibility */
+	} else {
+		dsi->lanes = ret;
 	}
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
-- 
2.51.0


