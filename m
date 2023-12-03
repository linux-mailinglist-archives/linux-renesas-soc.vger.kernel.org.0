Return-Path: <linux-renesas-soc+bounces-567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD480231E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65B6A1C2042A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 11:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9F9947F;
	Sun,  3 Dec 2023 11:32:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8313CB;
	Sun,  3 Dec 2023 03:32:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,247,1695654000"; 
   d="scan'208";a="188990145"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2023 20:32:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A2DA941CD969;
	Sun,  3 Dec 2023 20:32:42 +0900 (JST)
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
Subject: [PATCH v3 08/11] dt-bindings: mfd: da9062: Update watchdog description
Date: Sun,  3 Dec 2023 11:31:56 +0000
Message-Id: <20231203113159.92316-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
References: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog description by referring to dlg,da9062-watchdog binding
file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v2:
 * New patch
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index e4eedd3bd233..020106322b08 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -86,7 +86,7 @@ Sub-nodes:
 
 - onkey : See ../input/da9062-onkey.txt
 
-- watchdog: See ../watchdog/da9062-wdt.txt
+- watchdog: See ../watchdog/da9062-watchdog.yaml
 
 - thermal : See ../thermal/da9062-thermal.txt
 
-- 
2.39.2


