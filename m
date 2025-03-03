Return-Path: <linux-renesas-soc+bounces-13902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A6A4BF1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4C763B6F9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1411C200119;
	Mon,  3 Mar 2025 11:38:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5791FFC6C;
	Mon,  3 Mar 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001906; cv=none; b=hT9OdJspwamOcWI3riaoX7g3gkDNBmwvhE0fVAF1ls1EekjLpPy6jvlHavK8XJuA/LWUs56UPa/cnHwQh3k6RF/eqcp4rqY+28RE4lqpMHu5L/pJsvg513Uc2ptoWUR5vxE3MQwvb4eXsiM6zvKQkittprxDayT9VA4mjrsbgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001906; c=relaxed/simple;
	bh=ShWK3e7Pv6ALizx3eA571JPgPbbC+Yrmp/ApSiAz4ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfsrJ5eyPdtKqUSdQRSGUhDe9ou3nQIFMaupdWl/Uh6I/FwwbGzGTDPw9s6+n/Q/uOx+2SZGcLx9UhaLK8V5/mNUnA5ro9OCiQShzuLLQT86cz0OSotCy9Kynwyu8etV7IDVT77wQ8b7uukv/bEpMx8tuVKYw2BK/7q4Pr5KL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qm/8JgYtTCG+QZTEL8a6Iw==
X-CSE-MsgGUID: xpSHkpAhRryW+61PHk3u0w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2025 20:38:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.114])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8156D426ADE3;
	Mon,  3 Mar 2025 20:38:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
Date: Mon,  3 Mar 2025 11:38:07 +0000
Message-ID: <20250303113812.88014-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303113812.88014-1-biju.das.jz@bp.renesas.com>
References: <20250303113812.88014-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
use SD_STATUS register to control voltage and power enable (internal
regulator), for non-fixed voltage (SD) MMC interface. However, it is
optional for fixed voltage MMC interface (eMMC).

For SD1 and SD2 channels, we can either use gpio regulator or internal
regulator (using SD_STATUS register) for voltage switching.

Document RZ/G3E SDHI IP support with optional internal regulator for
both RZ/G3E and RZ/V2H SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Collected tag from Wolfram Sang.
v3->v4:
 * No change.
v2->v3:
 * Collected tags.
v1->v2:
 * Dropped tags.
 * Documented internal regulator as optional property for both RZ/G3E and
   RZ/V2H SoCs.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index af378b9ff3f4..773baa6c2656 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -68,6 +68,9 @@ properties:
               - renesas,sdhi-r9a08g045 # RZ/G3S
               - renesas,sdhi-r9a09g011 # RZ/V2M
           - const: renesas,rzg2l-sdhi
+      - items:
+          - const: renesas,sdhi-r9a09g047 # RZ/G3E
+          - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -211,6 +214,19 @@ allOf:
         sectioned off to be run by a separate second clock source to allow
         the main core clock to be turned off to save power.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-r9a09g057
+    then:
+      properties:
+        vqmmc-regulator:
+          type: object
+          description: VQMMC SD regulator
+          $ref: /schemas/regulator/regulator.yaml#
+          unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.43.0


