Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FA342BCA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhJMKWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 06:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239334AbhJMKWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 06:22:09 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A98C061570
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Oct 2021 03:20:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by baptiste.telenet-ops.be with bizsmtp
        id 5NL32600A0KW32a01NL3z1; Wed, 13 Oct 2021 12:20:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mabMh-004XwN-21; Wed, 13 Oct 2021 12:20:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maa86-002sph-VX; Wed, 13 Oct 2021 11:00:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 4/4] arm64: renesas: defconfig: Enable more support for RZ/G2L
Date:   Wed, 13 Oct 2021 11:00:45 +0200
Message-Id: <619cb14ceae0387de36f344f897b11453a34c98b.1634115568.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
References: <fa758f27d9153ae3d8d92d7452bce9aa881327c7.1634115568.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable more support for the RZ/G2L SoC and the RZ/G2L SMARC EVK board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 45df24076e34f341..01ea7ff02d5d0f06 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -150,6 +150,7 @@ CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_RIIC=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_RCAR=y
 CONFIG_SPI=y
@@ -256,8 +257,10 @@ CONFIG_SND=y
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
+CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
+CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=y
 CONFIG_USB=y
@@ -296,6 +299,7 @@ CONFIG_RTC_DRV_RX8581=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
+CONFIG_RZ_DMAC=y
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
@@ -331,9 +335,11 @@ CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
 CONFIG_IIO=y
 CONFIG_MAX9611=y
+CONFIG_RZG2L_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
-- 
2.25.1

