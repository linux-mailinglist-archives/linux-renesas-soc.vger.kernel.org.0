Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063361E1194
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 17:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404101AbgEYPXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 11:23:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47234 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404050AbgEYPXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 11:23:02 -0400
X-IronPort-AV: E=Sophos;i="5.73,433,1583161200"; 
   d="scan'208";a="47971335"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 May 2020 00:23:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDCD24006C61;
        Tue, 26 May 2020 00:22:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable scifb2 node
Date:   Mon, 25 May 2020 16:22:06 +0100
Message-Id: <1590420129-7531-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1590420129-7531-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable scifb2 interface on iWave RZ/G1H carrier board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
index 1f5c35c..e154e3a 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
@@ -14,6 +14,7 @@
 
 	aliases {
 		serial2 = &scifa2;
+		serial4 = &scifb2;
 	};
 
 	chosen {
@@ -27,6 +28,11 @@
 		groups = "scifa2_data_c";
 		function = "scifa2";
 	};
+
+	scifb2_pins: scifb2 {
+		groups = "scifb2_data", "scifb2_ctrl";
+		function = "scifb2";
+	};
 };
 
 &scifa2 {
@@ -35,3 +41,11 @@
 
 	status = "okay";
 };
+
+&scifb2 {
+	pinctrl-0 = <&scifb2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
-- 
2.7.4

