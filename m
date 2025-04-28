Return-Path: <linux-renesas-soc+bounces-16403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A245A9F076
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 14:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACE93AB112
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 12:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07FF224244;
	Mon, 28 Apr 2025 12:16:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E0EEAA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842584; cv=none; b=o2f0udPgC4NW02/pMtu5ZNRmalWVFvqWsEcE/Bo3DmXiLYxZJCT+OGkQeni5MxbTCFx+6xwbfnZNlF+A4qCJMtwOL5/1dTbsFpTCJGZ2N6Ty0WraW9MuwvIkhePhG5D//Kp+xq7qgb2EMo8Gx5MFd7ayNxGykX8fF9AbhxCEmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842584; c=relaxed/simple;
	bh=5Eh26aXCbUaZqoJiyLfceWQEONZ+2LkWW0xyL30k25E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN9bsf0QZXkXU0DJ2nIOvZ8GYGLWt4oIbku1xkxEmc1C0/dq/L8Cg/l/Ub/wGmVjzsfxx75dRem+9isEcF9CfSpo615RDO1Pqjgv+mPuka9fnvuyebyDb5hjCnRwcGUoqnVtiO43LxEvHCa1s3xtaKsGCCJ9+2aGDhjOuWdv+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by baptiste.telenet-ops.be with cmsmtp
	id icGG2E0054Aed8c01cGGhx; Mon, 28 Apr 2025 14:16:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NPD-00000000F9q-08Oo;
	Mon, 28 Apr 2025 14:16:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NPE-00000006xrW-0WPb;
	Mon, 28 Apr 2025 14:16:16 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Enable more support for RZN1D-DB/EB
Date: Mon, 28 Apr 2025 14:16:13 +0200
Message-ID: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable more support for the Renesas RZN1D-DB and RZN1D-EB development
and expansion boards:
  - Polled GPIO buttons (also used on the Marzen development board),
  - Synopsys DesignWare I2C adapters,
  - National Semiconductor LM75 sensors and compatibles (which requires
    not disabling Hardware Monitoring support),
  - Arasan SDHCI controllers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.16.
---
 arch/arm/configs/shmobile_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 357cb144150be852..0ea34d5d797c818a 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -63,6 +63,7 @@ CONFIG_SMSC_PHY=y
 CONFIG_CAN_RCAR=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_GPIO_POLLED=y
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
@@ -84,6 +85,7 @@ CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DEMUX_PINCTRL=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_EMEV2=y
 CONFIG_I2C_GPIO=y
 CONFIG_I2C_RIIC=y
@@ -104,7 +106,7 @@ CONFIG_GPIO_PCF857X=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_RMOBILE=y
 CONFIG_POWER_SUPPLY=y
-# CONFIG_HWMON is not set
+CONFIG_SENSORS_LM75=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_RCAR_THERMAL=y
@@ -174,6 +176,9 @@ CONFIG_USB_RENESAS_USBHS_UDC=y
 CONFIG_USB_RENESAS_USBF=y
 CONFIG_USB_ETH=y
 CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ARASAN=y
 CONFIG_MMC_SDHI=y
 CONFIG_MMC_SH_MMCIF=y
 CONFIG_NEW_LEDS=y
-- 
2.43.0


