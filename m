Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBDD2497F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 10:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHSIIu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 04:08:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59599 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726211AbgHSIIr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 04:08:47 -0400
X-IronPort-AV: E=Sophos;i="5.76,330,1592838000"; 
   d="scan'208";a="54954361"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Aug 2020 17:08:45 +0900
Received: from localhost.localdomain (unknown [172.29.53.200])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A860841E772C;
        Wed, 19 Aug 2020 17:08:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774e1-hihope-rzg2h: Enable HS400 mode
Date:   Wed, 19 Aug 2020 09:08:41 +0100
Message-Id: <20200819080841.3475-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

This patch enables HS400 mode on HiHope RZ/G2H board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
index 12f9242e263b..9525d5ed6fce 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
@@ -35,3 +35,7 @@
 	clock-names = "du.0", "du.1", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
+
+&sdhi3 {
+	mmc-hs400-1_8v;
+};
-- 
2.17.1

