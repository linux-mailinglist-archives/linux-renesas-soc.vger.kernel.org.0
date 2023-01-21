Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1AC6766F5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjAUO7x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjAUO7x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:53 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 584A91F93E;
        Sat, 21 Jan 2023 06:59:44 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="147051279"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E66EC42BC259;
        Sat, 21 Jan 2023 23:59:39 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 11/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD, Peripheral and Host
Date:   Sat, 21 Jan 2023 14:58:52 +0000
Message-Id: <20230121145853.4792-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB3 Host, Peripheral and DRD modules on RZ/V2M EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Enabled all the USB3 nodes
---
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 11e1d51c7c0e..2cd1c9f6dc6a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -84,6 +84,18 @@ &uart0 {
 	status = "okay";
 };
 
+&usb3drd {
+	status = "okay";
+};
+
+&usb3host {
+	status = "okay";
+};
+
+&usb3peri {
+	status = "okay";
+};
+
 &wdt0 {
 	status = "okay";
 };
-- 
2.25.1

