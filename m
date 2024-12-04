Return-Path: <linux-renesas-soc+bounces-10907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF349E3C7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 15:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BAC2B39AAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4436C1F7082;
	Wed,  4 Dec 2024 14:04:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC71E570E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321040; cv=none; b=VgOwUQX0lklcOIbhXE+lrP2zDLxlEcpk/TgO7tPfKooF9to2PU/KaaKnL8vKskhQEVOXODc/rCzVNtt2nUSEEI9ejZqlpDUwz9jjwtcBR7mNPItDngnkBmoUyMhHBLF4ixi5+FnDi1XAFGTAR0iXbGuOE0cCZyw7y08iJPGAA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321040; c=relaxed/simple;
	bh=v3JTuHYTHEgRfDJoAIrKFMf3V6Ys164Axxr4QPurcmA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eT1JO8xyGrVuKyImcyQkcRWjAc4AcWO/sJD73y6deWvtD6gZw82UGCZIQtfql0cHVNx+h5CiLFE0j1iDv9fC1WvEPH7XGxTD0dKdokCu9ha5+pF6lUrWybahXNzxYuPgVsYoSNumh+8FfuMb7gK++5//YAZd0HVur35WZmkqV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:8249:563a:8153:89fa])
	by xavier.telenet-ops.be with cmsmtp
	id ke3p2D00K1ljHKM01e3pxJ; Wed, 04 Dec 2024 15:03:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpyn-000HEM-1z;
	Wed, 04 Dec 2024 15:03:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIpyn-00DJeY-O2;
	Wed, 04 Dec 2024 15:03:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.13-rc1
Date: Wed,  4 Dec 2024 15:03:48 +0100
Message-Id: <6c2212abecd41e99b0acff3620a0b11f76a7e942.1733320915.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable HiSilicon Hip09 162100801 erratum support (not applicable),
  - Drop CONFIG_ARM64_SME=n (marked broken in commit 81235ae0c846e1fb
    ("arm64: Kconfig: Make SME depend on BROKEN for now")),
  - Disable Hardware managed Access Flag for Table descriptors Feature
    (FEAT_HAFT) support (Renesas SoCs do not have ARMv8.9 or ARMv9.4 CPU
    cores,
  - Disable Guarded Control Stack (GCS) support (Renesas SoCs do not
    have ARMv9.4 CPU cores),
  - Enable Renesas ISL28022 power monitor support, as used on the RZ/G3S
    SMARC development board,
  - Disable Chrome hardware platform support (not applicable),
  - Enable RZ/G3S VBATTB clock controller support, as used on the RZ/G3S
    SMARC SoM,
  - Enable R-Car Gen4 E-FUSE support, as used on the Spider development
    board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/arm64/configs/renesas_defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 24be37b05197b266..b6713b6f4b023b78 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_CAVIUM_TX2_ERRATUM_219 is not set
 # CONFIG_FUJITSU_ERRATUM_010001 is not set
 # CONFIG_HISILICON_ERRATUM_161600802 is not set
+# CONFIG_HISILICON_ERRATUM_162100801 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
@@ -66,7 +67,8 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_MTE is not set
 # CONFIG_ARM64_EPAN is not set
 # CONFIG_ARM64_POE is not set
-# CONFIG_ARM64_SME is not set
+# CONFIG_ARM64_HAFT is not set
+# CONFIG_ARM64_GCS is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -193,6 +195,7 @@ CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_BD9571MWV=y
+CONFIG_SENSORS_ISL28022=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
@@ -366,12 +369,12 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=y
-CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 # CONFIG_FSL_ERRATUM_A008585 is not set
 # CONFIG_HISILICON_ERRATUM_161010101 is not set
@@ -416,6 +419,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
+CONFIG_NVMEM_RCAR_EFUSE=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_COUNTER=y
-- 
2.34.1


