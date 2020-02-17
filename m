Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE38D160FC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 11:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729142AbgBQKRw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 05:17:52 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:56532 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQKRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 05:17:51 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 3mHm220015USYZQ01mHmiq; Mon, 17 Feb 2020 11:17:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3dTG-0003vS-03; Mon, 17 Feb 2020 11:17:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3dTF-0000zU-TV; Mon, 17 Feb 2020 11:17:45 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Replace ARCH_R8A7796 by ARCH_R8A77960
Date:   Mon, 17 Feb 2020 11:17:41 +0100
Message-Id: <20200217101741.3758-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CONFIG_ARCH_R8A7796 was replaced by CONFIG_ARCH_R8A77960, cfr. commits
39e57e14d7eaf818 ("soc: renesas: Add ARCH_R8A77960 for existing R-Car
M3-W") and 24240845c87185fe ("soc: renesas: Remove ARCH_R8A7796").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-fixes for v5.6.

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0f212889c931a83d..51b8b8555a6e4065 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -771,7 +771,7 @@ CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77960=y
 CONFIG_ARCH_R8A77961=y
 CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77970=y
-- 
2.17.1

