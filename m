Return-Path: <linux-renesas-soc+bounces-3220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C868681C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 21:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1076286B2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBEB12C55D;
	Mon, 26 Feb 2024 20:13:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA1C7F7EC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708978393; cv=none; b=YUJxmDUhuiHqvFdvfoAXi9GQ594k2it3B1iLaYDIGClrm8l71AlIQt0OAc2m8qfgbcLe3e2gPk9uZ80AcV+yOq2BDcfHFoH7eZEgQ2t/CgmR1daHGAv9XrDhPomP7rpl59v6yIG9IXuFGLhBu/WfvPiGuCIRTok5Zx6972cpTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708978393; c=relaxed/simple;
	bh=SL60ZbjF/RMbCPMOxTJLUUVySYhn+o7ABsiPfO+a+KI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V9BaEF1j+vsLfwG3zLFaHTreSkel0CWXPJ/2Vs3WbALdwXRQ91G8Q3tUR56mqlKF8ulndGtevNeZK3cneCe1RNeEgYAvVBCM754E+07FdJsJ/EATeu+xFiAvWirkWin69pcyZQHDONJuPYxiJRpYWv5twnnkJoh/lE6YW9f+pGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,186,1705330800"; 
   d="scan'208";a="199324495"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2024 05:13:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4523640078AF;
	Tue, 27 Feb 2024 05:13:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: renesas_defconfig: Enable Renesas DA9062 PMIC
Date: Mon, 26 Feb 2024 20:13:05 +0000
Message-Id: <20240226201305.429790-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the config for the Renesas DA9062 PMIC and built-in RTC, GPIO and
ONKEY drivers as it is populated on RZ/{G2UL,Five} SMARC EVK development
boards.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 887cc620f3d9..1b23e8311b82 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -156,6 +156,7 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_INPUT_MISC=y
+CONFIG_INPUT_DA9063_ONKEY=y
 # CONFIG_SERIO is not set
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
@@ -185,6 +186,7 @@ CONFIG_SPI_RSPI=y
 CONFIG_SPI_RZV2M_CSI=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
+CONFIG_PINCTRL_DA9062=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
@@ -199,6 +201,7 @@ CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
 CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_DA9062=y
 CONFIG_RZ_MTU3=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -343,6 +346,7 @@ CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_RX8581=y
+CONFIG_RTC_DRV_DA9063=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
-- 
2.25.1


