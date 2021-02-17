Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED41231D6CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Feb 2021 10:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhBQJHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Feb 2021 04:07:02 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:16507 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229619AbhBQJGh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Feb 2021 04:06:37 -0500
X-IronPort-AV: E=Sophos;i="5.81,184,1610377200"; 
   d="scan'208";a="72330546"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2021 18:06:05 +0900
Received: from localhost.localdomain (unknown [10.166.15.86])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6329040062B2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Feb 2021 18:06:05 +0900 (JST)
From:   Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a77961-ulcb: add HDMI Display support
Date:   Wed, 17 Feb 2021 18:06:03 +0900
Message-Id: <20210217090603.1517-1-yuya.hamamachi.sx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch enables HDMI Display on M3ULCB with R-Car M3-W+.

Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
index 7c6e60f6f32d..294a055f117e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
@@ -30,3 +30,14 @@ memory@600000000 {
 		reg = <0x6 0x00000000 0x1 0x00000000>;
 	};
 };
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&versaclock5 1>,
+		 <&versaclock5 3>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
+};
-- 
2.25.1

