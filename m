Return-Path: <linux-renesas-soc+bounces-11316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 859739F1403
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 18:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FF81665E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E251E5702;
	Fri, 13 Dec 2024 17:39:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA9F17B505;
	Fri, 13 Dec 2024 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111582; cv=none; b=Pp/3LbpV+B7hUUrGVWdRNN5ep6/Uzs+WYYnBFpu48AQafW3kisRm3/6jtyZiEa78SAsdS6lmm5G3F2LKek4XSW9IzlytSmtUQRGlj3Kq0SvVxmvKTDTFdouEupw/4BRvS8uUaoI+L4vcuxyWKCYG39wSCJWk1d6jKQnN9dBFGiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111582; c=relaxed/simple;
	bh=q3Kjt5+AQFkXshyqGkJMlt2HCcswIEexmWXNmMysYuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw13VqC9RwCkPQilD7HidC0YItq0z8i1dnjaW/e1wo1yWwkZE4NTQx/MtqHbTnYlV4x+4EPno6ODOHvp9LHav2aY8wQS3RceqGldjOj7k2qhHxVJPf0ctJVzcBn1xxhp1DCc0X3G18bWxmCHMrmM6TC1yeoa5MZAbfG+uIBPZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 2AF/s2PjScmK6aHVfAoVbA==
X-CSE-MsgGUID: YLfpzA6NTC+CO9WLmNQq8Q==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231774204"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E4614009F63;
	Sat, 14 Dec 2024 02:39:28 +0900 (JST)
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
Subject: [PATCH v3 7/7] arm64: dts: renesas: r9a09g047: Add scif pincontrol
Date: Fri, 13 Dec 2024 17:38:53 +0000
Message-ID: <20241213173901.599226-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device node for scif pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Rb tag from Geert.
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


