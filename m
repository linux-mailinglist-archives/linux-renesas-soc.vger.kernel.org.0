Return-Path: <linux-renesas-soc+bounces-15418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D0A7CB07
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Apr 2025 19:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5DD174553
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Apr 2025 17:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E48157A67;
	Sat,  5 Apr 2025 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XRrk0BsU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F374086A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Apr 2025 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874602; cv=none; b=nl82ZlXWvE65N321t8OQjtKCw/IHxtjxddOHqExUL54OISKzQLmJ9g/Jbzrm7qhm0Fk1j6o8zX9JlxPwv6zOvyWmAVvNjknw5652Z213sRPAVffJy49FBmhZ8RP0iwQXzXYq8UkXog53i1Vtcic+ak16mP6gASU/7wLQ11J67eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874602; c=relaxed/simple;
	bh=vEAoq2T2fJQp8m2YJmOHzCbyBaFJJBwifIRCuEC/i3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjQPMFO9dzoU7Xg7woGwFrElsSa9aOINO9nM1+0Zcb+cTxbXurVc4+68yfyxQC+WLa8QbAEZNeDcg3zFZ+/bE4Nb/4KkVxj6egWW9hLjr1iMvdqiw9qg75LtdAUImh7eBQwRyfI0oiFINeVApfnLWLiW3h5LIjxdmFH58E3bCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XRrk0BsU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=BTQQMb/KP+zrdi
	aaqHum0LzLllxez88OWqkbhNhomL8=; b=XRrk0BsUE3CMMcEFSnSSSfTMpYCwby
	aO5uCW2adW7fGIVDfJgifSKktN4OwXG9G4atbas35do+62gShjbtF0JJw32k2Qat
	mit2ORJCxUPQMciuPBwqqBn+OE/Ln0dYsMtqouA5/EQOTSQnY13gcjuVuDge+nBj
	JpPboZzeYflxCpVncCMkNq5lOPUeeiJlPrbUhLd2Gv99YRjUVDUH58fTbeeqNo3u
	koD64n3iZuxj1jqZcViCnFsP5JfpsYXMhmpjvcZvtJCkuqVh12Usd5yFjKnNu2tW
	tSZqH2pyNE5oL14okhgFyy5OxETBSjEkP123AJMYPIji844TNwzbt7xQ==
Received: (qmail 3192636 invoked from network); 5 Apr 2025 19:36:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2025 19:36:37 +0200
X-UD-Smtp-Session: l3s3148p1@RyrrcQsyoIYujnsA
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
Subject: [PATCH v3] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Date: Sat,  5 Apr 2025 19:35:26 +0200
Message-ID: <20250405173631.13564-2-wsa+renesas@sang-engineering.com>
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

Change since v2: - rename "wkup" to "wakeup"

 .../devicetree/bindings/mmc/arasan,sdhci.yaml | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
index 9075add020bf..8e79de97b242 100644
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
+      - const: wakeup
 
   phys:
     maxItems: 1
-- 
2.47.2


