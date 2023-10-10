Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E7A7BFD26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjJJNSX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjJJNSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:18:22 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9E891
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:18:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a251:6312:1f1a:2a48])
        by laurent.telenet-ops.be with bizsmtp
        id wDJH2A00Z3RY9Je01DJHoi; Tue, 10 Oct 2023 15:18:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qqCcq-005sTH-6p;
        Tue, 10 Oct 2023 15:18:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qqCcr-00GvfW-Ph;
        Tue, 10 Oct 2023 15:18:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable RZ/G3S SoC
Date:   Tue, 10 Oct 2023 15:18:16 +0200
Message-Id: <667fefa37e69a4b022a4a17fdc8e3a391839b904.1696943850.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the RZ/G3S (R9A08G045) SoC in the defconfig for
Renesas ARM64 systems.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 4df57545923a8ac0..a947a43f97e89cb4 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -380,6 +380,7 @@ CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R9A07G043=y
 CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
+CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
-- 
2.34.1

