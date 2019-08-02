Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE6A7ED98
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbfHBHf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:35:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16167 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389759AbfHBHf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:35:27 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="22932017"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:26 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9379E4007528;
        Fri,  2 Aug 2019 16:35:23 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for 12V regulator
Date:   Fri,  2 Aug 2019 08:34:08 +0100
Message-Id: <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Power rail "D12.0V" comes straight from the power barrel connector,
and it's used in both main board and sub board.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 46a77ee..651383c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -65,6 +65,15 @@
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reg_12p0v: regulator-12p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "D12.0V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	sound: sound {
 		compatible = "simple-audio-card";
 
-- 
2.7.4

