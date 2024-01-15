Return-Path: <linux-renesas-soc+bounces-1566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F386A82D7FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 12:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B621F21B0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 11:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23311E86D;
	Mon, 15 Jan 2024 11:03:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0FC1E86A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by andre.telenet-ops.be with bizsmtp
	id az3A2B00F34Hgv901z3AuH; Mon, 15 Jan 2024 12:03:12 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKjZ-00Fdh2-VE;
	Mon, 15 Jan 2024 12:03:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKkI-00Bz8u-O2;
	Mon, 15 Jan 2024 12:03:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] ARM: dts: renesas: r8a73a4: Fix thermal parent clock
Date: Mon, 15 Jan 2024 12:03:05 +0100
Message-Id: <aac49d67d7a38230875543d49e84fcca587fb9e1.1705315614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705315614.git.geert+renesas@glider.be>
References: <cover.1705315614.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Table 8.1, "Summary of Module Power, Reset condition and
Clock assignment" of the R-Mobile APE6 Hardware Manual Rev. 0.7, the
parent clock of the thermal sensor clock is the Common Peripheral (CP)
clock, which runs at 13 MHz (main clock / 2).

As the R-Car Thermal driver does not use the clock rate, this change has
no functional impact.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index 6847acaecc809eaa..b3d5c154cfc1b8c1 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -814,7 +814,7 @@ R8A73A4_CLK_IIC3
 		mstp5_clks: mstp5_clks@e6150144 {
 			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
-			clocks = <&extal2_clk>, <&cpg_clocks R8A73A4_CLK_HP>;
+			clocks = <&cp_clk>, <&cpg_clocks R8A73A4_CLK_HP>;
 			#clock-cells = <1>;
 			clock-indices = <
 				R8A73A4_CLK_THERMAL R8A73A4_CLK_IIC8
-- 
2.34.1


