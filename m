Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4346998E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Feb 2023 16:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjBPPam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Feb 2023 10:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjBPPal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 10:30:41 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60EBC15B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Feb 2023 07:30:39 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:4605:3635:9491:c6bc])
        by albert.telenet-ops.be with bizsmtp
        id MrWd2900E3wKl5506rWdyG; Thu, 16 Feb 2023 16:30:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSgD8-009BmN-Mk;
        Thu, 16 Feb 2023 16:30:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pSgDV-005ttQ-Ea;
        Thu, 16 Feb 2023 16:30:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
Date:   Thu, 16 Feb 2023 16:30:31 +0100
Message-Id: <9232578d9d395d529f64db3333a371e31327f459.1676560856.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676560856.git.geert+renesas@glider.be>
References: <cover.1676560856.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the R-Car Series, 3rd Generation Hardware User’s Manual
Rev. 2.30, the System CPU cores on R-Car E3 do not have their own power
supply, but use the common internal power supply (typical 1.03V).

Hence remove the "opp-microvolt" properties from the Operating
Performance Points table.  They are optional, and unused, when none of
the CPU nodes is tied to a regulator using the "cpu-supply" property.

Fixes: dd7188eb4ed128dc ("arm64: dts: renesas: r8a77990: Add OPPs table for cpu devices")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index d4718f144e33c5a9..4529e9b57c3312f7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -49,17 +49,14 @@ cluster1_opp: opp-table-1 {
 		opp-shared;
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <820000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-microvolt = <820000>;
 			clock-latency-ns = <300000>;
 		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <820000>;
 			clock-latency-ns = <300000>;
 			opp-suspend;
 		};
-- 
2.34.1

