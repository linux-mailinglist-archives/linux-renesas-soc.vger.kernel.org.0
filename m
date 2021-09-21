Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA9241305E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 10:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhIUIrs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 04:47:48 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8367 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231269AbhIUIrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:47:48 -0400
X-IronPort-AV: E=Sophos;i="5.85,310,1624287600"; 
   d="scan'208";a="94677100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2021 17:46:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E42364000A88;
        Tue, 21 Sep 2021 17:46:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Add Mic routing
Date:   Tue, 21 Sep 2021 09:46:05 +0100
Message-Id: <20210921084605.16250-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add audio routing for Mic with bias to reduce noise when doing
audio capture.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 1791c21dfe74..39e05169aaaa 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -47,6 +47,12 @@
 		simple-audio-card,frame-master = <&cpu_dai>;
 		simple-audio-card,mclk-fs = <256>;
 
+		simple-audio-card,widgets = "Microphone", "Microphone Jack";
+		simple-audio-card,routing =
+			    "L2", "Mic Bias",
+			    "R2", "Mic Bias",
+			    "Mic Bias", "Microphone Jack";
+
 		cpu_dai: simple-audio-card,cpu {
 			sound-dai = <&ssi0>;
 		};
-- 
2.17.1

