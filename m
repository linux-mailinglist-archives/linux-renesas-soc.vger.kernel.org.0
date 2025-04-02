Return-Path: <linux-renesas-soc+bounces-15286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB4A78B19
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 11:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8341118937BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 09:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751B82343D2;
	Wed,  2 Apr 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iH4PrTot"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC81E8358
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Apr 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586232; cv=none; b=PDI/2nnjqRpLBwPoOHXLV07g+nB9TjqmE82Z24n5ovYv2/Cn0n9bdRC1/4xQl2V1gKJbrwC4yBZ7ccO5GIncBsnsjmAxiUVSldkVMbiWrxr6raQ4FEww2NT+sYzhF3JpGltQsh+1sHlsxSMGKqxj1Bcf0tL8/cmRbfpMfAYGGvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586232; c=relaxed/simple;
	bh=WbTPhVWxedKKlDRpHSVKR9pRf9IMYDDsbtLr2wksW6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fLOYPg2ABkt6moZA8zaJ5Bvv8iQQ+KvzHBvwvWD3tfJ0fQVOHmwSPcNTkjsaPhUSbDcBaZbkj24/NcApDFDW+k5oCCc4hG2WkM/fQVKx+jOkitRxjhYGUMq0AZE4bd+ptceGzxfDNjYBM+LD+iW/ENgiYVMzc8ZD0y71oBDy41A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iH4PrTot; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=NJPez+zmY357+7
	Cd+pSr7cOgjkhvf3BWFFdubDXobkw=; b=iH4PrToty3DXG+KNlTG4m/rbjX7Fpt
	3tnvaWHfsNuXeBZGM0/DnuIeRu8VEe96DXBxnhBDBBEooyGCexGtEpPio2UTTfyf
	d5SLHzCvaa7/lZ72lw2saUIonbcQpbj2EE2bnaueeARD2xzSgvlxvaS70Ilc8Gtc
	XQ3a6iksVi7hmtmHvKM73Gs/o3Ql+RF4F4XSNwF7tHLeOMVOp1NDIMAWNHK4cZwJ
	vNQ4JFnlSV16uYr0wWn+t4KkMblY3y7dL0+suWJfWILmjS0tGWk0F8uNyMwojTMO
	bIeICRDQmnyU4HFbVvwFQwTTttAAo/ifyTkIG/LRZuKTsaE5J5dUYYFg==
Received: (qmail 1923461 invoked from network); 2 Apr 2025 11:30:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 11:30:25 +0200
X-UD-Smtp-Session: l3s3148p1@B+SaTcgxqM4gAwDPXwtPACMWXeF3DZvE
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Date: Wed,  2 Apr 2025 11:27:50 +0200
Message-ID: <20250402093019.5639-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This instance has a wakeup irq defined. It is currently not used by the
driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* dropped superfluous 'maxItems'
* now checked also against 'dt_binding_check'
  (Sorry, forgot this target in my scripts)

 .../devicetree/bindings/mmc/arasan,sdhci.yaml | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
index 9075add020bf..d4605bbc7a57 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
@@ -38,6 +38,15 @@ allOf:
             - items:
                 - const: clk_out_sd1
                 - const: clk_in_sd1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzn1-sdhci
+    then:
+      properties:
+        interrupts:
+          minItems: 2
 
 properties:
   compatible:
@@ -45,6 +54,10 @@ properties:
       - const: arasan,sdhci-8.9a                # generic Arasan SDHCI 8.9a PHY
       - const: arasan,sdhci-4.9a                # generic Arasan SDHCI 4.9a PHY
       - const: arasan,sdhci-5.1                 # generic Arasan SDHCI 5.1 PHY
+      - items:
+          - const: renesas,r9a06g032-sdhci      # Renesas RZ/N1D SoC
+          - const: renesas,rzn1-sdhci           # Renesas RZ/N1 family
+          - const: arasan,sdhci-8.9a
       - items:
           - const: rockchip,rk3399-sdhci-5.1    # rk3399 eMMC PHY
           - const: arasan,sdhci-5.1
@@ -109,7 +122,14 @@ properties:
       - const: gate
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: int
+      - const: wkup
 
   phys:
     maxItems: 1
-- 
2.47.2


