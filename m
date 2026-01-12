Return-Path: <linux-renesas-soc+bounces-26607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91535D13D2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 16:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C32B3021A6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 15:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFD536166A;
	Mon, 12 Jan 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="uyzmgjaT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0A13FEE;
	Mon, 12 Jan 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232637; cv=none; b=GEIgKIWyBp7Nsr4YS3A1HGv91c96s01XYerwhc6UVtTUoTmMCQU1W499tkiyvSvdwyohY4i6umNUz40EOBpowH0YxeD9OWI5i4NDSnpwn1KkVx4GTliCBObYnqn2ot/4p+BlTzQv4U3PJkSTbgP1ddWkzaZfBZoIIyxV2gqO+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232637; c=relaxed/simple;
	bh=iieFf6Wt28F+pg7k/9CDxA1aMlMJQOEPRhBat/DQWZ0=;
	h=From:To:Cc:Date:Message-ID:MIME-Version:Subject; b=LRvZaysUcvzR/lAUV0McU3mRIDbfJ2kBd+6wHrsaC+uchE9wznjhEOZBkvEfL8qXrj93h0iAc5+Sv7rph4mG4wJETNkxlgENJdRbeZ9odJ/FbGTC9ef3rY+T+rbv7J1uYETtDHSZZVdmgNMfvumR16VDhBp1Ck+CyfigylyM//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=uyzmgjaT; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=cybwSK8LyqAMNEb3Rji+neE2rEFziHN4FtKei8xzkPk=; b=uyzmgjaTOKSdo4/rDU++CatflH
	+wQIDkUTocJ5+J6otP5fSJiamM7y9o6XPCEudd8c6prZ/0CCTr4qkxuc7AumrUTiLVFQlVTAH+a08
	HguoMkbasOJhfaj60qWRcoMYat0qQKPpQZ0NiQdIzPzagtkRYh/qPJYzMST+u6UNGlhU=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:57378 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vfK4u-0005ho-Pi; Mon, 12 Jan 2026 10:43:37 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 12 Jan 2026 10:43:18 -0500
Message-ID: <20260112154333.655352-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when rebooting for some panels
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Since commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
we may get the following kernel panic, for some panels, when rebooting:

  systemd-shutdown[1]: Rebooting.
  Call trace:
   ...
   do_serror+0x28/0x68
   el1h_64_error_handler+0x34/0x50
   el1h_64_error+0x6c/0x70
   rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
   mipi_dsi_device_transfer+0x44/0x58
   mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
   ili9881c_unprepare+0x38/0x88
   drm_panel_unprepare+0xbc/0x108

This happens for panels that need to send MIPI-DSI commands in their
unprepare() callback. Since the MIPI-DSI interface is stopped at that
point, rzg2l_mipi_dsi_host_transfer() triggers the kernel panic.

Fix by moving rzg2l_mipi_dsi_stop() to new callback function
rzg2l_mipi_dsi_atomic_post_disable().

With this change we now have the correct power-down/stop sequence:

  systemd-shutdown[1]: Rebooting.
  rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable(): entry
  ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry
  rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_post_disable(): entry
  reboot: Restarting system

Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
Tested on a custom RZ/G2L board with three different panels/drivers:
   ili9881c -> sending DSI commands in unprepare()
   jd9365da -> not sending DSI commands in unprepare()
   st7703   -> not sending DSI commands in unprepare()
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e0..b164e3a62cc2f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -646,6 +646,13 @@ static void rzg2l_mipi_dsi_atomic_disable(struct drm_bridge *bridge,
 
 	rzg2l_mipi_dsi_stop_video(dsi);
 	rzg2l_mipi_dsi_stop_hs_clock(dsi);
+}
+
+static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,
+					       struct drm_atomic_state *state)
+{
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+
 	rzg2l_mipi_dsi_stop(dsi);
 }
 
@@ -681,6 +688,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bridge_ops = {
 	.atomic_pre_enable = rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable = rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable = rzg2l_mipi_dsi_atomic_disable,
+	.atomic_post_disable = rzg2l_mipi_dsi_atomic_post_disable,
 	.mode_valid = rzg2l_mipi_dsi_bridge_mode_valid,
 };
 

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.47.3


