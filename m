Return-Path: <linux-renesas-soc+bounces-7637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878E941581
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 17:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C04F31F242BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 15:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606001A257A;
	Tue, 30 Jul 2024 15:37:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D98197A83
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353856; cv=none; b=XH0p2+crkaLSpyLaKjcty8wwdOYWV5v+Ab6WZaYPfkQDynvRi1wLgdUjy5vI0NwvbX6mHptOXviffXtCLi6UgVtTPFBxiAiIrC1ahsh7aKDx+BvnFc5boK+gdT1BguvTqxnkSce0mzqYrS48ziwl7en5H+V3W61s+unEolm3Quk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353856; c=relaxed/simple;
	bh=Ih/LrLn1CbATo6o7T5d3kYazjKIlQX5sB9OWflmii/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmnIStHe+IOOdZ9rVaq8kHhBOWv53mM459ioVvdPKADCo26dKx9vUFqeKs8Y7N15swJDiwV6W8DwEe0JhTuXUYTFUOErP4mNgyqJTvHSNGLTg3wB10R8HuQAFUmrFugiOF3XUlNqselQI03mTC7Mab/SL5d1/2oBz+LThNJ8PXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:520d:93ad:ff6d:335e])
	by baptiste.telenet-ops.be with bizsmtp
	id trdV2C00H30Ayot01rdV72; Tue, 30 Jul 2024 17:37:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYouQ-004BM5-AP;
	Tue, 30 Jul 2024 17:37:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYoun-00EZBM-BX;
	Tue, 30 Jul 2024 17:37:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
Date: Tue, 30 Jul 2024 17:37:26 +0200
Message-Id: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is not much point in keeping support for RZ/Five peripherals
enabled, as the RZ/Five platform option (ARCH_R9A07G043) is gated behind
NONPORTABLE.  Hence drop all config options that enable built-in or
modular support for peripherals found on RZ/Five SoCs.

Disable USB_XHCI_RCAR explicitly, as its value defaults to the value of
ARCH_RENESAS, which is still enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  1. Perhaps the intention is to keep all RZ/Five peripheral support
     enabled, so RZ/Five users can start from the defconfig, and
     "just"[1] enable NONPORTABLE and ARCH_R9A07G043?

     [1] Nope, need to disable RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO
	 (and whatever else in the future?), too.

  2. Perhaps CONFIG_ARCH_RENESAS=y should be dropped, too?
     In addition to USB_XHCI_RCAR, that would get rid of SOC_BUS,
     PINCTRL_RENESAS, CLK_RENESAS, and SOC_RENESAS.
---
 arch/riscv/configs/defconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444fccdc..b51ef6cd1e3986ed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -137,12 +137,10 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
-CONFIG_RAVB=y
 CONFIG_STMMAC_ETH=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
-CONFIG_CAN_RCAR_CANFD=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -150,7 +148,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
-CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
@@ -159,11 +156,9 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_MV64XXX=m
-CONFIG_I2C_RIIC=y
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
 CONFIG_SPI_PL022=m
-CONFIG_SPI_RSPI=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
@@ -172,7 +167,6 @@ CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
 CONFIG_MFD_AXP20X_I2C=y
@@ -201,11 +195,11 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
+# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_USB_CDNS_SUPPORT=m
@@ -217,7 +211,6 @@ CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
-CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_CONFIGFS=m
 CONFIG_USB_CONFIGFS_SERIAL=y
 CONFIG_USB_CONFIGFS_ACM=y
@@ -235,7 +228,6 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
-CONFIG_MMC_SDHI=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
 CONFIG_MMC_SUNXI=y
@@ -250,7 +242,6 @@ CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_SUN8I_DE2_CCU=m
-CONFIG_RENESAS_OSTM=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -258,7 +249,6 @@ CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
 CONFIG_PHY_SUN4I_USB=m
-CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
-- 
2.34.1


