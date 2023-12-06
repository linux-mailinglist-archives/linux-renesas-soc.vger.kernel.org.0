Return-Path: <linux-renesas-soc+bounces-782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A280741C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 16:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B081F2142F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 15:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9953E45C03;
	Wed,  6 Dec 2023 15:57:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 116231A5;
	Wed,  6 Dec 2023 07:57:52 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,255,1695654000"; 
   d="scan'208";a="185541316"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2023 00:57:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.248])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4CC45400F7D4;
	Thu,  7 Dec 2023 00:57:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/8] dt-bindings: mfd: da9062: Update watchdog description
Date: Wed,  6 Dec 2023 15:57:33 +0000
Message-Id: <20231206155740.5278-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
References: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog description by referring to dlg,da9062-watchdog binding
file.

Update MAINTAINERS entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 Merged with patch#8 from v2.
v3:
 New patch
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
 MAINTAINERS                                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index e4eedd3bd233..18463b7fbb42 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -86,7 +86,7 @@ Sub-nodes:
 
 - onkey : See ../input/da9062-onkey.txt
 
-- watchdog: See ../watchdog/da9062-wdt.txt
+- watchdog: See ../watchdog/dlg,da9062-watchdog.yaml
 
 - thermal : See ../thermal/da9062-thermal.txt
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 2f1cbb9917ec..fa3965f1bf0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6119,7 +6119,7 @@ F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
-F:	Documentation/devicetree/bindings/watchdog/da90??-wdt.txt
+F:	Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
 F:	drivers/hwmon/da90??-hwmon.c
-- 
2.39.2


