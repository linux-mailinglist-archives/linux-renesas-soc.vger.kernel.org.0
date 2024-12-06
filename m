Return-Path: <linux-renesas-soc+bounces-10998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7359E6C33
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5E0B1888097
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449EE1FCFDE;
	Fri,  6 Dec 2024 10:24:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1BA1CCB40;
	Fri,  6 Dec 2024 10:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480641; cv=none; b=lcLy7GWsLhvsGRWr6ssRbpeSfuXQSLxDMfEy/G5fg1rTDMA4UZCnrOJwKh5zXiKjwhrEBCKsX/C2dcW/3oPCl+GN8G5q2LmMiYUyOJrOMQQsvzBd3uoUxw8fiuvb+7Tq5k7ZWcYKevpH3cO22vosrx3CXcDG2D6Xtx32VJJbMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480641; c=relaxed/simple;
	bh=xqrsPBXy51NaaddoSgIrFswboCgqHFciFtNtH1O+gpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOexpynmzHdLvlFM4+y8P87wvOF/ZjbZsaRaqQNtxMY/ziwI9FYii+hLYVVqK0Z+D7vOe840WJR0FPxCsoF+mNscM2oz/K0FBKeuLnTMEFTfhTN+C+yfHpTJrDXJifhK0M0KNcLKIUvzIfQJNMlS5mLGwdV2NMQychkggf7gs0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ISoi+MTRQWyNEhqk7ewE7Q==
X-CSE-MsgGUID: +DDuXu8+RxqMa5RYjqarOA==
X-IronPort-AV: E=Sophos;i="6.12,213,1728918000"; 
   d="scan'208";a="227116254"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2024 19:23:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3FD704003FB9;
	Fri,  6 Dec 2024 19:23:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047: Add scif pincontrol
Date: Fri,  6 Dec 2024 10:23:09 +0000
Message-ID: <20241206102327.8737-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device node for scif pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index d4d61bd03969..e33e1e80c6d5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
@@ -16,3 +17,15 @@ / {
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
 };
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0


