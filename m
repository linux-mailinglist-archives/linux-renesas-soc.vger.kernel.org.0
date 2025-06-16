Return-Path: <linux-renesas-soc+bounces-18357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69885ADAF0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE173A8C7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 11:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F562E7F06;
	Mon, 16 Jun 2025 11:48:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15972E6D2F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 11:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074539; cv=none; b=DOQ2xM/IPLwTHYotN2YU+jSRHNgK234CA4H65DC+yu6KA/TivnX3lbCRsUhhEr0QmF7NQso0VfdUAwu+OVsSQg2DJT6kkS7L/21vSQrM8A6n0OYbAvhJ8xgsJLRZBE56LKej9BquUpXXLCSiONbIDs7KE9rqiFn7iUUsMv1jKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074539; c=relaxed/simple;
	bh=vYYEwMwc91yC8j3nwH6Xx3s6PLpFf+WQtB7ikyK7gv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fwno3mlFVGIAX+rlfZJoZAbEBKyY3YKVmI75hex+SGUeq/ePQHWy88vAhpJBsR+78pffmS3FcXYOXOXfLeG76Wjbai9qggIsTYV9UtSsZeGHTIIpnS4kizZ3apJhFmSxMqGQXCPH7KKov2lrO2gVrtgLkiuTb9MUGePBM00qMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A9CC4CEEA;
	Mon, 16 Jun 2025 11:48:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas: defconfig: Refresh for v6.16-rc2
Date: Mon, 16 Jun 2025 13:48:50 +0200
Message-ID: <00ef7f91186caa5dac755cfa1d682c75b107d3bc.1750074453.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable AmpereOne AC04_CPU_23 erratum support (not applicable),
  - Disable ARM Scalable Matrix Extension support again (no Renesas SoC
    has ARMv9 CPU cores),
  - Enable PCI Power Control driver for PCI slots, as used on the
    Sparrow Hawk board,
  - Enable Renesas RZ/V2H(P) RZ/V2H(P) GBETH support using the Synopsys
    DesignWare Ethernet Quality-of-Service IP block version 5.20, as used on
    the RZ/V2H EVK board:
      - Enable STMicroelectronics Multi-Gigabit Ethernet driver support,
      - Disable the generic DWMAC driver, as it is not needed,
      - The actual DWMAC glue layer support (DWMAC_RENESAS_GBETH) is
	auto-enabled if ARCH_RENESAS is set.
  - Drop CONFIG_DRM_RZG2L_MIPI_DSI=y (auto-enabled since commit
    7e6cb7290b4a92a6 ("drm: renesas: rz-du: Add Kconfig dependency
    between RZG2L_DU and RZG2L_MIPI_DSI"),
  - Enable Renesas RZ/V2H(P) USB2PHY port reset control support, as used
    on the RZ/V2H EVK board,
  - Drop CONFIG_CRYPTO_SHA2_ARM64_CE=y (removed in commit
    6e36be511d2846f4 ("crypto: arm64/sha256 - implement library instead
    of shash") in crypto/master).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

 arch/arm64/configs/renesas_defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d219c9eef753eb93..6797e512dc538718 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -28,6 +28,7 @@ CONFIG_PROFILING=y
 CONFIG_KEXEC=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
+# CONFIG_AMPERE_ERRATUM_AC04_CPU_23 is not set
 # CONFIG_ARM64_ERRATUM_1508412 is not set
 # CONFIG_ARM64_ERRATUM_2051678 is not set
 # CONFIG_ARM64_ERRATUM_2077057 is not set
@@ -70,6 +71,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_POE is not set
 # CONFIG_ARM64_HAFT is not set
 # CONFIG_ARM64_GCS is not set
+# CONFIG_ARM64_SME is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -118,6 +120,7 @@ CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
+CONFIG_PCI_PWRCTRL_SLOT=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_DMIID is not set
@@ -147,6 +150,8 @@ CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
 CONFIG_RTSN=y
+CONFIG_STMMAC_ETH=y
+# CONFIG_DWMAC_GENERIC is not set
 CONFIG_MARVELL_10G_PHY=y
 CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
@@ -282,7 +287,6 @@ CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_RZG2L_DU=y
-CONFIG_DRM_RZG2L_MIPI_DSI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
@@ -397,6 +401,7 @@ CONFIG_PWM_RENESAS_RZG2L_GPT=y
 CONFIG_PWM_RENESAS_RZ_MTU3=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_RESET_RZV2H_USB2PHY=y
 CONFIG_PHY_CAN_TRANSCEIVER=y
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
@@ -426,7 +431,6 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_CCREE=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


