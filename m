Return-Path: <linux-renesas-soc+bounces-2124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89031843C8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A33A1F30C89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE116EB50;
	Wed, 31 Jan 2024 10:27:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7378C6E2C1;
	Wed, 31 Jan 2024 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696833; cv=none; b=NJ/UzgkRxmtgL/eLxFYIblYXlbqXq9OhMevLjGIPBVKYFTs0Q4CCYIzKK3kZ1uJ6LdeSdstajObaG8eTlAbvIlEjDGl3MFyLqBBMN+4nVPoptcVma8Kb+ZV/jVpIHWc0juHSD/y/tmZK8WG95UsKwSRj/AZAec4nJhp5gxgsU2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696833; c=relaxed/simple;
	bh=QHGdOeoUFYr1Db0dJJ+ppw+UWVgrS8GVcbIkeAklVVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=npLw1i3h0CxKGh5NeJj0bB6DDTTTaB3v8kbC6wpGEP2+qQ8iDFAPeWvTQRqumYb8baUHTvuCAVlfLLumpQzsfgiseYPRGlqr+3AlwxXcsBvy8fdTMB+aQv8f7EfC84K3mIAzMNFzF/xe2LYCA8ZiCC4beVsMRZ5isJFI3Mi7kGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="192377768"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2024 19:27:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C9F8641DF0DA;
	Wed, 31 Jan 2024 19:27:06 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 RESEND 1/6] dt-bindings: mfd: da9062: Update watchdog description
Date: Wed, 31 Jan 2024 10:26:51 +0000
Message-Id: <20240131102656.3379-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
References: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
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

Fixes: bd888a4377ae ("dt-bindings: watchdog: da9062-wdt: convert txt to yaml")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---
v6->v6 resend:
 * Added Ack from Lee Jones.
 * Fixed merge conflict on MAINTAINERS file.
v5->v6:
 * No change.
v4->v5:
 * Added fixes tag
 * Added Rb tags from Geert and Krzysztof
 * Added Ack from Conor
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
index 402e3de96adc..e0091af90973 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6172,7 +6172,7 @@ F:	Documentation/devicetree/bindings/regulator/dlg,da9*.yaml
 F:	Documentation/devicetree/bindings/regulator/dlg,slg51000.yaml
 F:	Documentation/devicetree/bindings/sound/da[79]*.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
-F:	Documentation/devicetree/bindings/watchdog/dlg,da90??-watchdog.yaml
+F:	Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
 F:	Documentation/hwmon/da90??.rst
 F:	drivers/gpio/gpio-da90??.c
 F:	drivers/hwmon/da90??-hwmon.c
-- 
2.39.2


