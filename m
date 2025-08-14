Return-Path: <linux-renesas-soc+bounces-20490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586EB25F73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 10:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0669F3A6D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 08:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B5120013A;
	Thu, 14 Aug 2025 08:48:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE661DD0C7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Aug 2025 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161293; cv=none; b=kyqIuN6zDnXSOe+6WZF5xKmZ7qgrF7b9N7ue5mKRbRHlR54VYRqVDAR0UZWoV616VXOYi0pwZfPn0grSfu1FR3bK7AFrNaUbDqMFj3zP1PbdEIq2gU42OV8gdTYCA9dm7HuEJSj+GlLU6zlPgrYoqcXxqvNwJ4fCWJJ9EH4RdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161293; c=relaxed/simple;
	bh=Db7x/dC8rsolzTrb84fQU285YJkcLut48Wx2x5orPpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZasheZQpmunhnXs3XChR8HVz+nudmMzf/CwIxtTAQuzyuUCJqU6RYSpy5nG/sW7OeFzqUU0remCrJxioanQ+tkRvSouRUk8j83nj6a6aPLwbP7GktwHDPzN+FKjxa8JEFB1CEQImSG/Rja6r6vh7SaS300tSU9J48MLTGO+Q0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51DBC4CEED;
	Thu, 14 Aug 2025 08:48:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.17-rc1
Date: Thu, 14 Aug 2025 10:48:06 +0200
Message-ID: <66827be4b9db9bfa813edaa27310c6f65534ccfa.1755161250.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Drop CONFIG_JUMP_LABEL=y (auto-enabled since commit 727c2a53cf959f59
    ("arm64: Unconditionally select CONFIG_JUMP_LABEL")),
  - Enable support for the Renesas RZ/T2H SCI variant, as used on
    the RZ/T2H and RZ/N2H EVKs,
  - Enable support for I3C and the Renesas I3C controller, as used on
    the Renesas RZ/G3E and RZ/G3S SoMs,
  - Enable Renesas RZ/V2H RSPI controller support, as used on the RZ/V2H
    EVK and Kakip boards,
  - Move CONFIG_SND_SIMPLE_CARD, CONFIG_SND_AUDIO_GRAPH_CARD, and
    CONFIG_SND_AUDIO_GRAPH_CARD2 (moved in commit acc84d15e45393fb
    ("ASoC: generic: Standardize ASoC menu"),
  - Disable support for branch stack sampling using FEAT_BRBE (no
    Renesas SoC has ARMv9.2 CPU cores yet),
  - Drop CONFIG_CRYPTO_SHA1_ARM64_CE=y (removed in commit
    00d549bb89e471b7 ("lib/crypto: arm64/sha1: Migrate optimized code
    into library")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 6797e512dc538718..9acaae96a5628184 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -80,7 +80,6 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
-CONFIG_JUMP_LABEL=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_SLAB_FREELIST_HARDENED=y
@@ -180,6 +179,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RSCI=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
@@ -190,9 +190,12 @@ CONFIG_I2C_RIIC=y
 CONFIG_I2C_RZV2M=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_RCAR=y
+CONFIG_I3C=y
+CONFIG_RENESAS_I3C=y
 CONFIG_SPI=y
 CONFIG_SPI_RPCIF=y
 CONFIG_SPI_RSPI=y
+CONFIG_SPI_RZV2H_RSPI=y
 CONFIG_SPI_RZV2M_CSI=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
@@ -310,6 +313,9 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
+CONFIG_SND_SIMPLE_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_MSIOF=y
 CONFIG_SND_SOC_RZ=y
@@ -319,9 +325,6 @@ CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SOC_SIMPLE_MUX=y
 CONFIG_SND_SOC_WM8978=y
-CONFIG_SND_SIMPLE_CARD=y
-CONFIG_SND_AUDIO_GRAPH_CARD=y
-CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
@@ -407,6 +410,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
+# CONFIG_ARM64_BRBE is not set
 CONFIG_NVMEM_RCAR_EFUSE=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
@@ -430,7 +434,6 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_CCREE=y
 CONFIG_DMA_CMA=y
-- 
2.43.0


