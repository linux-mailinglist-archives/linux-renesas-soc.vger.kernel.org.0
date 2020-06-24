Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2250D20749A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403951AbgFXNbD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403950AbgFXNbC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:02 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47A0C061798
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:31:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by xavier.telenet-ops.be with bizsmtp
        id v1Wz2200W3ySsk1011Wz2D; Wed, 24 Jun 2020 15:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0002Zz-DK; Wed, 24 Jun 2020 15:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0001XQ-CZ; Wed, 24 Jun 2020 15:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/7] arm64: renesas: defconfig: Enable WL1837 support
Date:   Wed, 24 Jun 2020 15:30:52 +0200
Message-Id: <20200624133057.5860-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624133057.5860-1-geert+renesas@glider.be>
References: <20200624133057.5860-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Texas Instruments WL1837 Wi-Fi and Bluetooth
module, which is used on the HiHope RZ/G2[MN] and Silicon Linux RZ/G2E
boards.

Drop CONFIG_LEDS_TRIGGERS=y, as it is selected by CONFIG_BT_LEDS and
CONFIG_MAC80211_LEDS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8a9dc37a4b32a906..1b626e1894bb90c8 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -87,6 +87,13 @@ CONFIG_NETFILTER=y
 CONFIG_CAN=y
 CONFIG_CAN_RCAR=y
 CONFIG_CAN_RCAR_CANFD=y
+CONFIG_BT=y
+CONFIG_BT_LEDS=y
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_MAC80211_LEDS=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_HOTPLUG_PCI_PCIE=y
@@ -116,7 +123,8 @@ CONFIG_RAVB=y
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-# CONFIG_WLAN is not set
+CONFIG_WLCORE=y
+CONFIG_WLCORE_SDIO=y
 CONFIG_INPUT_MATRIXKMAP=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
@@ -125,6 +133,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_INPUT_MISC=y
 # CONFIG_SERIO is not set
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C_CHARDEV=y
@@ -261,7 +270,6 @@ CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-- 
2.17.1

