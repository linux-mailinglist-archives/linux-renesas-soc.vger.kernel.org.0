Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA23A296AB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 09:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369882AbgJWH4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 03:56:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:4251 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S369745AbgJWH4A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 03:56:00 -0400
X-IronPort-AV: E=Sophos;i="5.77,407,1596466800"; 
   d="scan'208";a="60383619"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Oct 2020 16:55:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CAE74401140F;
        Fri, 23 Oct 2020 16:55:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a774c0-ek874: Add optee node
Date:   Fri, 23 Oct 2020 08:55:30 +0100
Message-Id: <20201023075530.19295-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add optee device tree node to EK874 board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
index e7b6619ab224..ac48b4ee237f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874.dts
@@ -11,4 +11,11 @@
 / {
 	model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875)";
 	compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
-- 
2.17.1

