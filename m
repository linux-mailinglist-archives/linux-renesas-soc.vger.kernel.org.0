Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487835437A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244453AbiFHPkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 11:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244488AbiFHPkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 11:40:31 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F94A1CC605
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 08:40:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by andre.telenet-ops.be with bizsmtp
        id gfgR270021qF9lr01fgRkL; Wed, 08 Jun 2022 17:40:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-003E0B-Kx; Wed, 08 Jun 2022 17:40:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyxnE-008kJT-5P; Wed, 08 Jun 2022 17:40:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a779f0: Add L3 cache controller
Date:   Wed,  8 Jun 2022 17:40:19 +0200
Message-Id: <a63715ce1d2d2fcc7ab987f7a1b40847965e8d6a.1654701480.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654701480.git.geert+renesas@glider.be>
References: <cover.1654701480.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the cache configuration for the first Cortex-A55 CPU core on
the Renesas R-Car S4-8 (R8A779F0) SoC.

Extracted from a larger patch in the BSP by LUU HOAI.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index ad8c77edb12699d5..41aa23e557179af8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -23,6 +23,14 @@ a55_0: cpu@0 {
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
+			next-level-cache = <&L3_CA55_0>;
+		};
+
+		L3_CA55_0: cache-controller-0 {
+			compatible = "cache";
+			power-domains = <&sysc R8A779F0_PD_A2E0D0>;
+			cache-unified;
+			cache-level = <3>;
 		};
 	};
 
-- 
2.25.1

