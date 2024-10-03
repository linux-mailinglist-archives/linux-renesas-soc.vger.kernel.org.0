Return-Path: <linux-renesas-soc+bounces-9337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F298EC9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 12:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B283283176
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C68147C96;
	Thu,  3 Oct 2024 10:02:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786CE84E0D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727949766; cv=none; b=JfNOg0UizagZTkXU/5QQ3K/PnBGYuDfKMnFVm1dNJGgwU9SFzliHkT/tyADSHAtLbjbrncOHo3aDF4kFmxHaku0pRUhIeMmZQi3vxQlcMp7YBgnwYXZ4ui29c7mRDo3A2819iDka31lJV3N841scyMqcoBBx2AJ339ak1DC5xQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727949766; c=relaxed/simple;
	bh=g2bbpjhDyWTZkMTX1lyAtMNNRWxdOC+Va4ZN5p0ofK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S30IQnyurFw2l66n8DDv3Vu4LobPyll4qK8wr4SKLTr8dmss6KLC8P/C88vXBMnXmvMCNVv8uluCOgapdjyo1/0ccsPxZ7FW3ijcnrMRYAPb6L/kBYnz3KXH6ZMCusoVLDb7q6vH6Ks3Ux3WPBLJn13K8ot+a+Jpu4YFVx6EKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by michel.telenet-ops.be with cmsmtp
	id Km2c2D00V5K8SYz06m2cGy; Thu, 03 Oct 2024 12:02:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfE-001BCs-Dx;
	Thu, 03 Oct 2024 12:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swIfM-0068Ya-NE;
	Thu, 03 Oct 2024 12:02:36 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 3/3] arm64: renesas: defconfig: Refresh for v6.12-rc1
Date: Thu,  3 Oct 2024 12:02:34 +0200
Message-Id: <1bd4287487a5c5bcfb50a0f3f8aa62da0f8aad48.1727949523.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727949523.git.geert+renesas@glider.be>
References: <cover.1727949523.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ARM64_POE (Renesas SoCs do not have ARMv8.9 CPU
    cores),
  - Move CONFIG_DRM_RZG2L_MIPI_DSI (moved in commit 1b5dfd1881dbe303
    ("drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index ee49b343313d958a..24be37b05197b266 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -65,6 +65,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_E0PD is not set
 # CONFIG_ARM64_MTE is not set
 # CONFIG_ARM64_EPAN is not set
+# CONFIG_ARM64_POE is not set
 # CONFIG_ARM64_SME is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
@@ -276,8 +277,8 @@ CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
-CONFIG_DRM_RZG2L_MIPI_DSI=y
 CONFIG_DRM_RZG2L_DU=y
+CONFIG_DRM_RZG2L_MIPI_DSI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
-- 
2.34.1


