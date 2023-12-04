Return-Path: <linux-renesas-soc+bounces-657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B25803B67
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 18:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2B11C20B0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 17:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E47E2E82D;
	Mon,  4 Dec 2023 17:25:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC468A9;
	Mon,  4 Dec 2023 09:25:32 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,250,1695654000"; 
   d="scan'208";a="185273256"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2023 02:25:32 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 068714031BE0;
	Tue,  5 Dec 2023 02:25:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3.1 3/8] dt-bindings: watchdog: dlg,da9062-watchdog: Document DA9063 watchdog
Date: Mon,  4 Dec 2023 17:25:05 +0000
Message-Id: <20231204172510.35041-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document DA9063 watchdog device as it is similar to DA9062 watchdog.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v3.1:
 * Added Ack from Conor Dooley.
 * Updated title DA9062/61->DA906{1,2,3} as it supports DA9063.
 * Retained Rb tag since the changes are trivial.
v2->v3:
 * No change
v2:
 * New patch
---
 .../devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
index 7c63b99dac85..d2088e308b45 100644
--- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/dlg,da9062-watchdog.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Dialog Semiconductor DA9062/61 Watchdog Timer
+title: Dialog Semiconductor DA906{1,2,3} Watchdog Timer
 
 maintainers:
   - Steve Twiss <stwiss.opensource@diasemi.com>
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - dlg,da9062-watchdog
+              - dlg,da9063-watchdog
       - items:
           - const: dlg,da9061-watchdog
           - const: dlg,da9062-watchdog
-- 
2.39.2


