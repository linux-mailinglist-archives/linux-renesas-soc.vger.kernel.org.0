Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476EA627E93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 13:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbiKNMtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 07:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237319AbiKNMtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 07:49:11 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A71D31E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 04:49:10 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:9cda:b28b:1ded:8138])
        by laurent.telenet-ops.be with bizsmtp
        id kCp62800D3NlhLw01Cp6VU; Mon, 14 Nov 2022 13:49:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtd-000UUA-Tp; Mon, 14 Nov 2022 13:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ouYtc-003gz0-WD; Mon, 14 Nov 2022 13:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779g0: Add L3 cache controller
Date:   Mon, 14 Nov 2022 13:49:00 +0100
Message-Id: <dfd743b32198295afb78bc0ac337ef283fa3879a.1668429870.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668429870.git.geert+renesas@glider.be>
References: <cover.1668429870.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the cache configuration for the first Cortex-A76 CPU core on
the Renesas R-Car V4H (R8A779G0) SoC.

Extracted from a larger patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 0ea48fa18df30b6e..ef75e2603f5ac9d9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -23,6 +23,14 @@ a76_0: cpu@0 {
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
+			next-level-cache = <&L3_CA76_0>;
+		};
+
+		L3_CA76_0: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779G0_PD_A2E0D0>;
+			cache-unified;
+			cache-level = <3>;
 		};
 	};
 
-- 
2.25.1

