Return-Path: <linux-renesas-soc+bounces-7393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F8933D9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 15:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10DBD1C221ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920EF17FADC;
	Wed, 17 Jul 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+97cxOm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661EC17E8FA;
	Wed, 17 Jul 2024 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721222975; cv=none; b=AxIF3vqjY8sX9zHa3ovtuyWk8HHf2/ahYmwzzSOhjx9/nRn1UlxcIpmtJnacdx0kuebFGvUTOSuU40EhDSJJari9mMHJeWkJp6ZthEYJ5I7z3n0RQK8x3FIAebEIFseEKmQ4kv9TphALg3lCjsOhQp6RiRv84z7r6/ycZERBIoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721222975; c=relaxed/simple;
	bh=YQ6l5cI7YXYE0o/kYF2+JwI6tetVX1FjRrXMMaCr4Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAtbA58NmZwOznFblCgRsQmfG3oHXPt1gLZKGdPfc3HIanrSTdkkQPcBkQOVh3wBMlE/KdI6XdriklaWxhqfDDWMJ/ReYjXdwXTVQDcCBvc968DBBMY/YD7ld85ZJCEOVE83VlnnfaBSnQLmGnnMfvA213mJW88ExwC0x5L4pdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+97cxOm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CA3C32782;
	Wed, 17 Jul 2024 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721222975;
	bh=YQ6l5cI7YXYE0o/kYF2+JwI6tetVX1FjRrXMMaCr4Es=;
	h=From:To:Cc:Subject:Date:From;
	b=W+97cxOmuKI9hdL9xkKNeVX31I3x/EYwg5GZW1Bjm/nrA7+LCA8d4B9GQBajn/gm3
	 LPTDWi2kZdwxeUaa1PdHiiPPD8vlaIm+GfRC183XHbFSUI/d0jhLgInuTGhWiVyEau
	 ph2qNorzT+21ln+XMPl9sD1L8x/FC+i6bScA672ujqVC4t3i6lIsxF9nqKeeqAcrWJ
	 aCOghHARZbKCn2GwlokCWXdQCzPd5sqqnTSNAoWr3O9P0FvTs6K52cge4ljWIaaBoe
	 E4sk9dJJqmPHsv5LMbS6waPYChe1vqkTbBjFdxak0Oy6t+0SUoL4C6nlKJDWAkRuwf
	 cJ059Z6JSmMhw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: run savedefconfig for defconfig
Date: Wed, 17 Jul 2024 14:29:24 +0100
Message-ID: <20240717-shrubs-concise-51600886babf@spud>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3914; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=jCFQHxaVV64m1uEzxmaK5W8JzwULgV2ZW1IVTbFyuYA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnTj5v8Fd8WySamaB7wnFPwpdyUTbutPifrT9B/75nx9 4eO5ivBjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkGxMjw8MNa288yNa9Yyd3 84Qk/xThB2VFDHUGaX3PZIX+9b2bOI+RYVakpBDX9kYWTd3Lx3buvRmmlih/ZuqeuiNplZ+yzu2 bwwEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

It's been a while since this was run, and there's a few things that have
changed. Firstly, almost all of the Renesas stuff vanishes because the
config for the RZ/Five is gated behind NONPORTABLE. Several options
(like CONFIG_PM) are removed as they are the default values.

To retain DEFVFREQ_THERMAL and BLK_DEV_THROTTLING, add PM_DEVFREQ and
BLK_CGROUP respectively.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/configs/defconfig | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3f1f055866af..0d678325444f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -7,6 +7,7 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
 CONFIG_RT_GROUP_SCHED=y
@@ -35,9 +36,6 @@ CONFIG_ARCH_THEAD=y
 CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_PM=y
-CONFIG_CPU_IDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=m
@@ -52,13 +50,11 @@ CONFIG_ACPI=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_BLK_DEV_THROTTLING=y
+CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=m
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
@@ -102,9 +98,9 @@ CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_CGROUP=m
 CONFIG_NETLINK_DIAG=y
 CONFIG_CGROUP_NET_PRIO=y
+CONFIG_CAN=m
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
-CONFIG_CAN=m
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
@@ -153,8 +149,8 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
-CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
@@ -179,7 +175,6 @@ CONFIG_DEVFREQ_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
-CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -193,11 +188,9 @@ CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-CONFIG_SND_SOC_RZ=m
 CONFIG_SND_DESIGNWARE_I2S=m
 CONFIG_SND_SOC_STARFIVE=m
 CONFIG_SND_SOC_JH7110_PWMDAC=m
@@ -239,34 +232,31 @@ CONFIG_USB_CONFIGFS_F_FS=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SDHI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
-CONFIG_MMC_SDHI=y
 CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
-CONFIG_RZ_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
-CONFIG_RENESAS_OSTM=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_SUN8I_DE2_CCU=m
+CONFIG_RENESAS_OSTM=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
-CONFIG_ARCH_R9A07G043=y
+CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
-CONFIG_RZG2L_ADC=m
-CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0


