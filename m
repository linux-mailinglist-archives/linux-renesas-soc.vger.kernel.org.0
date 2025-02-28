Return-Path: <linux-renesas-soc+bounces-13802-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9F5A499C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 13:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D1247A4598
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 12:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0B12620C8;
	Fri, 28 Feb 2025 12:47:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FCC26A1CB;
	Fri, 28 Feb 2025 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746853; cv=none; b=uJCUPi7oZjkeCS90WVSaBx/ZeGV+rZt+z1ZsZI/5kwqDzJm8/lADcXU3/HfW6AbDknclN2x1HFp4/kajmgKcs5AMRLjUX18GOfp+s9h1832k6ZyL+bsEsiUybJXbp1m5Gejucq+IOLHEWjusiPwDmxaZYGKJOzGXR8SL4FmaUUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746853; c=relaxed/simple;
	bh=Vw4Ryn3NUtaNCwc4zw+L8qvGyjPKLKtqJMTz8JwVZMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPey2MqEcC1J8ef15wN4IF7Fl4zzMBf9GvARPo3Eg7u7IVOnopZaZbUTtUO1AAyV/AA5CPnUTrN9Xd0RDWnIuDNAJEQ6+ZWrKg4Th+Ru4Vme1GSml6tfSgX5Er6ngww2gP9Fif3Ax/EV9EV1bA7iEvtDdAq++OYJ5+/gpBjM3hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jJxE9fSVSImFZ40xCa2N7Q==
X-CSE-MsgGUID: j6J5B/wjSdunMkZdMChjsQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Feb 2025 21:47:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.94])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D57C5402A422;
	Fri, 28 Feb 2025 21:47:19 +0900 (JST)
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
Subject: [PATCH v4 1/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E support
Date: Fri, 28 Feb 2025 12:47:08 +0000
Message-ID: <20250228124713.153979-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
References: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
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
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


