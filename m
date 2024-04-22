Return-Path: <linux-renesas-soc+bounces-4762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4A8ACAB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF181F211C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A997F145B01;
	Mon, 22 Apr 2024 10:30:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4791442F0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781856; cv=none; b=U0XuwTnTMMTVwpc+pn5mI+VN859h/r2uDFZND05cZQp/jgrhwX7K2/w56nt1fsvbnpx4A5diqunL6gfwi79Vms35ULzRPjd6Te+R2sXMDrRyQNhp1lDdVYzUqGOWW4UH50f0coAUwxDBwx1DrZit/u3zlYeO0Ve+ZWin1Mk18zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781856; c=relaxed/simple;
	bh=MaqnY49x5SmqUYudp7l8w0I2GuXzY25oZgCrWljHjd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLiuKts4XxzA+SVlt6Wp3aOcSXKsw0en899DlNyMxmCwo2dLuSly9QNQyd/QDeW5Ua1/RI7xG/KNV7qlHRi+u6QYFdKZ2vfmGF1rn1GQUFQwEAACvES5s08WQdYYY1zazkOG9b35qFwsPvcWKMbNawbQJ9nqpvzS1EdN26OBXEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id EAWj2C00H0SSLxL01AWjqs; Mon, 22 Apr 2024 12:30:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqw1-001cwT-Eo;
	Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqwd-005i4H-G5;
	Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/11] Revert "drm/display: Make all helpers visible and switch to depends on"
Date: Mon, 22 Apr 2024 12:30:39 +0200
Message-Id: <3db958e3f4002e26cd963596d810c37feb315fb3.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
References: <cover.1713780345.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d674858ff979550a0e97b4ac766f2640f0d9d7e7, as helper
code should always be selected by the driver that needs it, for the
convenience of the final user configuring a kernel.

The user who configures a kernel should not need to know which helpers
are needed for the driver he is interested in.  Making a driver depend
on helper code means that the user needs to know which helpers to enable
first, which is very user-unfriendly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/display/Kconfig | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index c77e7f85bd674dc9..864a6488bfdf1499 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -1,21 +1,20 @@
 # SPDX-License-Identifier: MIT
 
 config DRM_DISPLAY_HELPER
-	tristate "DRM Display Helpers"
+	tristate
 	depends on DRM
 	help
 	  DRM helpers for display adapters.
 
 config DRM_DISPLAY_DP_AUX_BUS
-	tristate "DRM DisplayPort AUX bus support"
+	tristate
 	depends on DRM
 	depends on OF || COMPILE_TEST
 
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_DISPLAY_DP_HELPER
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
@@ -25,24 +24,23 @@ config DRM_DISPLAY_DP_AUX_CEC
 	  that do support this they often do not hook up the CEC pin.
 
 config DRM_DISPLAY_DP_AUX_CHARDEV
-	bool "DRM DisplayPort AUX Interface"
-	depends on DRM
-	depends on DRM_DISPLAY_HELPER
-	depends on DRM_DISPLAY_DP_HELPER
+	bool "DRM DP AUX Interface"
+	depends on DRM && DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Choose this option to enable a /dev/drm_dp_auxN node that allows to
 	  read and write values to arbitrary DPCD registers on the DP aux
 	  channel.
 
 config DRM_DISPLAY_DP_HELPER
-	bool "DRM DisplayPort Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
 config DRM_DISPLAY_DP_TUNNEL
-	bool "DRM DisplayPort tunnels support"
-	depends on DRM_DISPLAY_DP_HELPER
+	bool
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  Enable support for DisplayPort tunnels. This allows drivers to use
 	  DP tunnel features like the Bandwidth Allocation mode to maximize the
@@ -62,13 +60,13 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 	  If in doubt, say "N".
 
 config DRM_DISPLAY_HDCP_HELPER
-	bool "DRM HDCD Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDCP.
 
 config DRM_DISPLAY_HDMI_HELPER
-	bool "DRM HDMI Helpers"
+	bool
 	depends on DRM_DISPLAY_HELPER
 	help
 	  DRM display helpers for HDMI.
-- 
2.34.1


