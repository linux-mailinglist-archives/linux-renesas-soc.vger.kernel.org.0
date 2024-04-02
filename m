Return-Path: <linux-renesas-soc+bounces-4201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA50894FFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19441F21132
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 10:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549E95A11D;
	Tue,  2 Apr 2024 10:22:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E1E5FDDB
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053325; cv=none; b=eVDmsVhBW0gmII/bmDTcakYRYGhJWJC755rIbv54+VTTY4px5CVcYkHhTQwL3I4U2/hqB3Cw7+eMM2/cMuQ6tIjkP4ARhMq4C81XPBlWjLJtGP0kiYBFDfQK4gpUrGyZbbUVhyeu62aULSI0HxB8B2KWV4tp4gQVngxBRtiwyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053325; c=relaxed/simple;
	bh=T+AgS6UnXpAtc1A47/liJNn4ExmbOY7BNJugi1ljFg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CVuOD9ftqYHZLn20CS6olUbO/bQESnRIbyw+P3nkRb3fFOigqVDGamIUhW+MVBttbd8zMHbBcCyoM4rU9Mak62JryRUjRffoe0r4ThKLg+N9PWuscskrkpfKsyehLJxTaEYwxcKnhnI2OFCLAehP4cK+ql7n3+36FBTFAcPjEO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id 6AMt2C00J0SSLxL06AMtyt; Tue, 02 Apr 2024 12:21:55 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbGg-00FXbh-9s;
	Tue, 02 Apr 2024 12:21:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbH7-009VjH-JD;
	Tue, 02 Apr 2024 12:21:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.9-rc1
Date: Tue,  2 Apr 2024 12:21:52 +0200
Message-Id: <b2e6306a58e18136c05668dbbe9e839efdbe463e.1712053238.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_DRM_PANEL_SIMPLE (moved in commit aaf7f80996834ae5
    ("drm/panel: re-alphabetize the menu list")),
  - Enable warn on W+X mappings at boot (recommended, renamed in commit
    a90f0a02f139a13d ("arm: ptdump: rename CONFIG_DEBUG_WX to
    CONFIG_ARM_DEBUG_WX")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.10.

 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 091e1840933cf2c6..56925adfe8422921 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -139,8 +139,8 @@ CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_RCAR_DU=y
 # CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
 CONFIG_DRM_SHMOBILE=y
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
@@ -235,3 +235,4 @@ CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
+CONFIG_ARM_DEBUG_WX=y
-- 
2.34.1


