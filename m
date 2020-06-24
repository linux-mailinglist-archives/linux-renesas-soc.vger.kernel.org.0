Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8D6207498
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403949AbgFXNbC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403946AbgFXNbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020D1C061796
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:31:00 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by baptiste.telenet-ops.be with bizsmtp
        id v1Wz2200e3ySsk1011Wzvs; Wed, 24 Jun 2020 15:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0002aF-HJ; Wed, 24 Jun 2020 15:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0001Xg-GQ; Wed, 24 Jun 2020 15:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 7/7] arm64: renesas: defconfig: Enable HD3SS3220 support
Date:   Wed, 24 Jun 2020 15:30:57 +0200
Message-Id: <20200624133057.5860-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624133057.5860-1-geert+renesas@glider.be>
References: <20200624133057.5860-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Texas Instruments HD3SS3220 USB Type-C
controller, which is used on the Silicon Linux CAT874 RZ/G2E board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d761bdfd0b9da95f..f7b43ed12fef707b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -272,6 +272,8 @@ CONFIG_USB_RENESAS_USBHS_UDC=y
 CONFIG_USB_RENESAS_USB3=y
 CONFIG_USB_SNP_UDC_PLAT=y
 CONFIG_USB_BDC_UDC=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_HD3SS3220=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHI=y
 CONFIG_NEW_LEDS=y
-- 
2.17.1

