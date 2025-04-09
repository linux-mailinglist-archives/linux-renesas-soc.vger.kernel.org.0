Return-Path: <linux-renesas-soc+bounces-15669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017B7A82598
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 15:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E763F19E6199
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 13:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959A525DD0F;
	Wed,  9 Apr 2025 13:07:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674DE26156D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204078; cv=none; b=pFrcdiih/t5y/tOp/+wo4US2aO1s4VT/66j4bMmZKRnJdmuvUoT799gghUajrS3HikE4IW/uGWMp2ulr7XIkX5eUV4k7GSDWApkIsE1cSQe48wT3a4z4699+m3nwH2CLyUry6WIk9mHgQwFhNLa4ipD25I8EH1cf7UbKPDJTZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204078; c=relaxed/simple;
	bh=UCzv3+YjXr1kJ13XPAbipkBdCjKymuGjg6jo1WTQy68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+8XA1jNiHEGvPS2IqGJ/UaCf+lts1aloYh+ulvGdO/ARyAX7Tr89adi/wtnnr0bfGkxWkPo/jbCutar7KqlRec997OIa/OKiChp6dMtQW+FWsM9wP+kgqWuXOArNIDb5VesYFyAiDjZvdzs866LzhuF13L5WP6rqDll1i2DqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4ZXjsw3Xrrz4wxqM
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Apr 2025 15:07:48 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d6c1:79b5:9acd:4fad])
	by xavier.telenet-ops.be with cmsmtp
	id b17g2E00K1LzlAN0117gvM; Wed, 09 Apr 2025 15:07:40 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2V9X-00000000DQT-1pQF;
	Wed, 09 Apr 2025 15:07:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2UuB-00000003JDE-0RVX;
	Wed, 09 Apr 2025 14:51:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.15-rc1
Date: Wed,  9 Apr 2025 14:51:41 +0200
Message-ID: <7c1e94ef1d150a4ea1c08492d33e608acb5402ec.1744203030.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable Rockchip 3568002 erratum support (not applicable),
  - Move CONFIG_DRM_I2C_NXP_TDA998X=y (moved in commit 325ba852d148434c
    ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")),
  - Drop CONFIG_SCHED_DEBUG=n (removed in commit b52173065e0aad82
    ("sched/debug: Remove CONFIG_SCHED_DEBUG")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 81d063ca7cfbef04..54face65d831129a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_E1041 is not set
 # CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
+# CONFIG_ROCKCHIP_ERRATUM_3568002 is not set
 # CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
@@ -277,13 +278,13 @@ CONFIG_VIDEO_ADV7604_CEC=y
 # CONFIG_MEDIA_TUNER_XC5000 is not set
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_EMULATION=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_RZG2L_DU=y
 CONFIG_DRM_RZG2L_MIPI_DSI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_THINE_THC63LVD1024=y
 CONFIG_DRM_TI_SN65DSI86=y
@@ -454,5 +455,4 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-- 
2.43.0


