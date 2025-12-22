Return-Path: <linux-renesas-soc+bounces-25970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAFFCD5468
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 10:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B318B3009820
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 09:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECC33101A0;
	Mon, 22 Dec 2025 09:15:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E991430FF3A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394930; cv=none; b=foJP/8WedP7LaG/bL/tiJWdWs2SPi5GUy6ka3nqMaBXEWpJbjAbQ2DSfUz5nxgTgmtsb5HqTVgDh2Rk9ZhUYYoCOaLDCozMIFDJwOc566gzC6N4Y9GIC3Xw3TvAi1LiEWO5XXS4bhf4HxfqHZV/DXHaBdS5K1/wA9lsFzeDvJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394930; c=relaxed/simple;
	bh=GYlaJG8HVb3/T0+HZ1NCXqAJHSSUU18pysP8rVQ6t1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=azDHiXcyb2azM8tvDmUUi423z4CuKgiR/rQWWpn45AjRWhHkI4H+8YjPb7BH1TKZc3Ajp/TCbk2sv49sG8MQvd+56Dj4v9t6rF+JADCCQKoTB3rkrjQmyDgb5qhoZVkhGVtgEEGVJUddKQdqTBQ4fOuF00Lr/JU2RvpPh35wREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B1FC4CEF1;
	Mon, 22 Dec 2025 09:15:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.19-rc1
Date: Mon, 22 Dec 2025 10:15:24 +0100
Message-ID: <b6cab5810eb468a3e57693123ed17a8afcd5eba1.1766394880.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Enable Renesas RZ/G3S PCIe host controller support, as used on the
    RZ/G3S SMARC EVK board,
  - Drop CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=n (removed in commit
    37d55c92e9db3f7f ("serial: drop SERIAL_8250_DEPRECATED_OPTIONS")),
  - Enable Renesas Window WWDT Watchdog support, as used on R-Car Gen3
    and later,
  - Enable ARM Mali-C55 Image Signal Processor and Renesas RZ/V2H(P)
    Input Video Control support, as used on the RZ/V2H EVK and Kakip
    boards,
  - Enable Imagination Technologies PowerVR Series 6 support, as used on
    R-Car M3-W/W+, M3-N, and V3U boards,
  - Enable Renesas RZ/T2H ADC support, as used on the RZ/T2H and RZ/N2H
    EVKs,
  - Enable Renesas RZ/G3E USB 3.0 PHY support, as used on various
    RZ/G3E, RZ/V2H, and RZ/V2N boards,
  - Drop CONFIG_CRYPTO_ANSI_CPRNG=y (removed in commit c7dcb041ce7d32c0
    ("crypto: ansi_cprng - Remove unused ansi_cprng algorithm")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 5f15b48663b53f84..65582f6cfca510ae 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -113,6 +113,7 @@ CONFIG_HOTPLUG_PCI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=y
 CONFIG_PCIE_RCAR_GEN4_HOST=y
 CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCI_ENDPOINT=y
@@ -168,7 +169,6 @@ CONFIG_INPUT_MISC=y
 CONFIG_INPUT_DA9063_ONKEY=y
 # CONFIG_SERIO is not set
 CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
 # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
@@ -215,6 +215,7 @@ CONFIG_RZG3E_THERMAL=y
 CONFIG_RZG3S_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
+CONFIG_RENESAS_WWDT=y
 CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_MFD_BD9571MWV=y
@@ -234,11 +235,13 @@ CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_MALI_C55=y
 CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_VIDEO_RCAR_VIN=y
 CONFIG_VIDEO_RZG2L_CSI2=y
 CONFIG_VIDEO_RZG2L_CRU=y
+CONFIG_VIDEO_RZV2H_IVC=y
 CONFIG_VIDEO_RENESAS_FCP=y
 CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_VSP1=y
@@ -303,6 +306,7 @@ CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_DRM_PANFROST=y
+CONFIG_DRM_POWERVR=y
 CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
@@ -399,6 +403,7 @@ CONFIG_RENESAS_RPCIF=y
 CONFIG_IIO=y
 CONFIG_MAX9611=y
 CONFIG_RZG2L_ADC=y
+CONFIG_RZT2H_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_RENESAS_RCAR=y
 CONFIG_PWM_RENESAS_RZG2L_GPT=y
@@ -412,6 +417,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
+CONFIG_PHY_RZ_G3E_USB3=y
 # CONFIG_ARM64_BRBE is not set
 CONFIG_NVMEM_RCAR_EFUSE=y
 CONFIG_TEE=y
@@ -434,7 +440,6 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_CCREE=y
-- 
2.43.0


