Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C7517E55C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 18:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgCIRI3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 13:08:29 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:53280 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgCIRI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 13:08:29 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id CH8S2200X5USYZQ01H8Spu; Mon, 09 Mar 2020 18:08:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jBLtC-0007JK-Ev; Mon, 09 Mar 2020 18:08:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jBLtC-0005RY-CZ; Mon, 09 Mar 2020 18:08:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77961: salvator-xs: Fix memory unit-address
Date:   Mon,  9 Mar 2020 18:08:25 +0100
Message-Id: <20200309170825.20882-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Correct the unit-address of the second memory node, to match the
corresponding reg property.

Fixes: 92980759c1699a3c ("arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.7.

 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
index 4abd78ac1cd597d9..2ffc7e31dd58fc12 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -19,7 +19,7 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
-	memory@400000000 {
+	memory@480000000 {
 		device_type = "memory";
 		reg = <0x4 0x80000000 0x0 0x80000000>;
 	};
-- 
2.17.1

