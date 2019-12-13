Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148E411E884
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbfLMQlS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:41:18 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:40638 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728334AbfLMQlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:41:18 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id dUhG2100J5USYZQ06UhGJ6; Fri, 13 Dec 2019 17:41:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0006um-Mi; Fri, 13 Dec 2019 17:41:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifo0C-0000zO-Lc; Fri, 13 Dec 2019 17:41:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] arm64: dts: renesas: r8a77970: Group tuples in thermal reg property
Date:   Fri, 13 Dec 2019 17:41:15 +0100
Message-Id: <20191213164115.3697-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213164115.3697-1-geert+renesas@glider.be>
References: <20191213164115.3697-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve human readability and enable automatic validation, the tuples
in "reg" properties should be grouped.

Fix this by grouping the tuples in the thermal node's "reg" property
using angle brackets.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 6e1456032851c88f..dbf1c677dbc6e51f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -302,8 +302,8 @@
 
 		thermal: thermal@e6190000 {
 			compatible = "renesas,thermal-r8a77970";
-			reg =  <0 0xe6190000 0 0x10
-				0 0xe6190100 0 0x120>;
+			reg = <0 0xe6190000 0 0x10>,
+			      <0 0xe6190100 0 0x120>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

