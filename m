Return-Path: <linux-renesas-soc+bounces-10972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C349E5E08
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 19:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9D6280E0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 18:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C2C227B9A;
	Thu,  5 Dec 2024 18:09:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8AE1922FB;
	Thu,  5 Dec 2024 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422193; cv=none; b=nEL/Yn7nKTXsHfIMYBtTtL6H+mwnY9lk/KM5uZCjxYkP1i+KVDYh/v1xORy78ADfhkR+rwCgVmJOZeQ8riWKwqGWS5V2a5snOatPOzdpAxbkmXFeW8gSZNUhXNawScPsYZBK09L3CVfJib6OV6FSZo0T53qRe7vrwhyRU+4F7To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422193; c=relaxed/simple;
	bh=ig6F86DsjcQ8AFljnBVWFurQn6MsqBZPnhSRWD7eb14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWeW9WLlzkXusvbyc9IBjvppU2Zj9Vn/VkTaNi2ubvLMp6LRgR5pNF4RhVIBZoK0LJlz/MugsXHpA9lZXP60Wxc4tT2WbwUFDNO19dYZ76syL+Qhk/7cTjLYoL8Ldlcb6R5JgMcZdn6GuLCHU2iy32wRozHTNCIT12WwrKFlnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JHJ6ujxyQ/e1frc5CPrlzA==
X-CSE-MsgGUID: c/OeFTFbQ3exJm4jQHmA5A==
X-IronPort-AV: E=Sophos;i="6.12,211,1728918000"; 
   d="scan'208";a="231007749"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2024 03:09:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.141])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E43AD4049DBA;
	Fri,  6 Dec 2024 03:09:40 +0900 (JST)
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
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g047: Add scif pincontrol
Date: Thu,  5 Dec 2024 18:09:20 +0000
Message-ID: <20241205180924.154715-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
References: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
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


