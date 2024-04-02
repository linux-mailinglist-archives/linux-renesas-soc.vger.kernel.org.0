Return-Path: <linux-renesas-soc+bounces-4204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4EB895009
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1001C233BD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432055B5D3;
	Tue,  2 Apr 2024 10:27:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808875A0E6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053666; cv=none; b=GCnRyayF+cYqRVNpc2Gchwp4HQhOS8KRcFVoH+m6aLYi+KCL5ur4s/94uxihrzz7MgJc0gpP4k5yOzIF7hYzhDz4gu8Hu3DciJLjPU/Wv9jEj3p2zB2f1AwqVP83KcJgXQkkHEz7DeZh+5XmoqnO6pQycQVh4r2QR5mDumyibYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053666; c=relaxed/simple;
	bh=72iQhvc7V9EQQpssLtzpc2soPVfMfnkgm8W2JS6ejKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jg5dvDNTDikBXxZdy9TJLRgAruoHorUu0aQhKASpEdb8m8t5kkhJ/rfRujHGDmFHiRO2WvRHAdg4wtovDilQA+Oim45JKovVynhN/U/5NN++8i49DC9IiVMjGwlwXnRHVWyCQnjU95oCrv9GW4hs/bePfp+zqekm1Nkmo/rTuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4V83wn54Vsz4wxDv
	for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Apr 2024 12:27:37 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 6ATW2C0050SSLxL01ATWqN; Tue, 02 Apr 2024 12:27:30 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbM6-00FYU5-NG;
	Tue, 02 Apr 2024 12:27:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbMY-009Vqg-2q;
	Tue, 02 Apr 2024 12:27:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/2] arm64: renesas: defconfig: Refresh for v6.9-rc1
Date: Tue,  2 Apr 2024 12:27:28 +0200
Message-Id: <3b7fa1cdbabd6531576a5d1e983c0479b26149c1.1712053450.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712053450.git.geert+renesas@glider.be>
References: <cover.1712053450.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Drop CONFIG_CRASH_DUMP=y (auto-enabled since commit 75bc255a7444801d
    ("crash: clean up kdump related config items")),
  - Drop CONFIG_ARM64_ERRATUM_1542419=n and
    CONFIG_ARM64_ERRATUM_2441009=n (no longer auto-enabled since commit
    8c10cc104b73abdf ("arm64: errata: Don't enable workarounds for
    "rare" errata by default")),
  - Move CONFIG_VIDEO_RCAR_ISP (moved in commit b4a2952bb974d033
    ("media: rcar-csi2: Move driver to renesas directory")),
  - Drop CONFIG_IOMMU_IO_PGTABLE_LPAE=y (selected by DRM_PANFROST),
  - Drop CONFIG_CRYPTO_AES_ARM64_CE_BLK=y (auto-enabled since commit
    948ffc66e595e56c ("crypto: arm64/aes-ccm - Reuse existing MAC update
    for AAD input")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 89cd8f0dead77be2..1519280104d2104c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -26,17 +26,14 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
-# CONFIG_ARM64_ERRATUM_1542419 is not set
 # CONFIG_ARM64_ERRATUM_1508412 is not set
 # CONFIG_ARM64_ERRATUM_2051678 is not set
 # CONFIG_ARM64_ERRATUM_2077057 is not set
 # CONFIG_ARM64_ERRATUM_2658417 is not set
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
-# CONFIG_ARM64_ERRATUM_2441009 is not set
 # CONFIG_ARM64_ERRATUM_2645198 is not set
 # CONFIG_ARM64_ERRATUM_2966298 is not set
 # CONFIG_ARM64_ERRATUM_3117295 is not set
@@ -218,8 +215,8 @@ CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
-CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_VIDEO_RCAR_CSI2=y
+CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_VIDEO_RCAR_VIN=y
 CONFIG_VIDEO_RZG2L_CSI2=y
 CONFIG_VIDEO_RZG2L_CRU=y
@@ -373,7 +370,6 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_ARM64_ERRATUM_858921 is not set
 CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
-CONFIG_IOMMU_IO_PGTABLE_LPAE=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77951=y
@@ -435,7 +431,6 @@ CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_CCREE=y
 CONFIG_DMA_CMA=y
-- 
2.34.1


