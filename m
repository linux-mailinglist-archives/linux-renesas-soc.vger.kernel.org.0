Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B85711A898
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 11:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfLKKGg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 05:06:36 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:60034 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbfLKKGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 05:06:36 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id ca6a2100N5USYZQ06a6alg; Wed, 11 Dec 2019 11:06:34 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyt8-0007Q5-If; Wed, 11 Dec 2019 11:06:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyt8-0001ul-H7; Wed, 11 Dec 2019 11:06:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: defconfig: Enable CONFIG_ARCH_R8A77960
Date:   Wed, 11 Dec 2019 11:06:33 +0100
Message-Id: <20191211100633.7318-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CONFIG_ARCH_R8A7796 is being replaced by CONFIG_ARCH_R8A77960.
Enable both options for now, so r8a77960 support stays enabled both
before and after the removal of the CONFIG_ARCH_R8A7796 option.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to topic/renesas-defconfig.
Not intended for upstream merge.

 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 2f3848d819d461aa..c9ca5e2a2665c232 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -287,6 +287,7 @@ CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77960=y
 CONFIG_ARCH_R8A77961=y
 CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77970=y
-- 
2.17.1

