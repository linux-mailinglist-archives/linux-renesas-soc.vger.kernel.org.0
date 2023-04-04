Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0166D5C0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 11:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbjDDJhB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 05:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbjDDJhB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 05:37:01 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEEF125
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 02:36:58 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id gZcu2900i1C8whw06ZcuLR; Tue, 04 Apr 2023 11:36:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pjd5C-00Fv17-KE;
        Tue, 04 Apr 2023 11:36:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pjd5y-000YI5-Ey;
        Tue, 04 Apr 2023 11:36:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable CAN transceiver PHY support
Date:   Tue,  4 Apr 2023 11:36:53 +0200
Message-Id: <12a4bf9526b12c9b2751aa1b35a5e09dfe211e1a.1680600884.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the CAN transceiver PHY driver, which is needed for the NXP
TJR1443AT CAN transceiver on CAN-FD channel zero on the White-Hawk
development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 25916da25b7a9a9f..d11d890647013c5c 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -386,6 +386,7 @@ CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_PHY_CAN_TRANSCEIVER=y
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
-- 
2.34.1

