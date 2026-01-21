Return-Path: <linux-renesas-soc+bounces-27246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAuBEktccWnLGAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:07:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 247065F408
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62E79508D7D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29E429825;
	Wed, 21 Jan 2026 23:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vUrBMeDE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L+bP8IGZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664423AA1A9;
	Wed, 21 Jan 2026 23:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036869; cv=none; b=mjtaCtMvToH1rnJuk/IaPQzzpdSjs5NShsRL7Lq8X7ubd+utv1Qsq1pm1+epfQoIU82pjqlL1qr5K8JWgQbYGR+DZN5l5x8P6S0va8HnrFIuufkM1euladv8BNyce9QV5w1L/pc5os2kd4ve40zqSNAJGepREj4dvFwWCg686MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036869; c=relaxed/simple;
	bh=Vm4Ozq5+meOfzBkgv+jNFGR1TzVnFA7DpPXN0p31x1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cu6RnXOCgSN7U6tOS0M2gRoTYJwNIegYzgrIWHBogaR0BFf47tvAMzNykBAgFTLxvoj8kSM1+8B29SXACDiwmuatzsU9L8SwLmlAscLLzPMCiX2EqMdkQFSDKWkReeH02uoYV25OcjaOTxWCCmLc8oiWwvmHS7qYMj5S1GWpdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vUrBMeDE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L+bP8IGZ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dxKbj3njYz9ssJ;
	Thu, 22 Jan 2026 00:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769036865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFtTw2Lj+ydrnxXlwBiZyYcuhAwEombhoyIt9YmSgWE=;
	b=vUrBMeDEhAqPl1pE+FLeq97nVPmUcL0jseZ1Q8gjt+prAPCfDVSBAnIFz2R5+8z9OXoJ4B
	33YKl3MNEPuTaHCtauJmX9mRpBHf8k2PBs+9WP8Wi1Qd2uOgP+CFf77PEV6jLzk5hkrr95
	QnxiOS2FIhunKJbIysvfjoiob2day7G+nypIkKtf0cwJpYWbaLlDaMxOZwMFc8UFn85X6F
	2e6+9TPX/zmhOPz1blLWP1KprBKHC5PpBUA09CjCVLcPeukBVr0zZ01JMHt1ZKD5VxE/79
	zF/Cf5MGjdZJFV1s7pXPjUb7FAQX1lQpq5jrKY9jeKDCoPpvheWDOa6ztqvtLA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L+bP8IGZ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769036863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFtTw2Lj+ydrnxXlwBiZyYcuhAwEombhoyIt9YmSgWE=;
	b=L+bP8IGZSSkxTYnHdDPs4CQ4OLIQxunFMWhW6l1vENhJR1Ouz19BMppEVZv2Bfin9x7M83
	McKqqDwRRp5wdP2wjG/TK7cC68bf79icip0XlGofkjEh0WrKphV9rg29tUctyXNOgYOzvy
	UbaDekg+p8RLCS+bZsaqicXwwJuZPWJAVQ3oEfXYonTlY2vSwy1tnGYYWlD7dHPweNgMvk
	bhQge8UMOEfrGFqk0ooOgTCqAeN1yfDsabIql1uwSrBLy9ApJtn1FHmKJHRJUBFbIQpqBa
	k8m3MMQtv0yURGIfQ3GNoLisodwCH9ISDk5WvXRV/rLtgq/BZEEyM8XAb6u7WA==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: touchscreen: trivial-touch: Drop 'interrupts' requirement for old Ilitek
Date: Thu, 22 Jan 2026 00:06:46 +0100
Message-ID: <20260121230736.114623-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: mzo4zbsrp4ussppnjqqd6ypmkq8so3sr
X-MBO-RS-ID: 7a40b60b0c65bc60aac
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27246-lists,linux-renesas-soc=lfdr.de,renesas];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,nxp.com,oss.qualcomm.com,kernel.org,gmail.com,noorman.info,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.41:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 247065F408
X-Rspamd-Action: no action

The old Ilitek touch controllers V3 and V6 can operate without
interrupt line, in polling mode. Drop the 'interrupts' property
requirement for those four controllers. To avoid overloading the
trivial-touch, fork the old Ilitek V3/V6 touch controller binding
into separate document.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Fork the Ilitek V3/V6 bindings into separate document
V3: Add RB from Frank
V4: No change
V5: - Move allOf: after required:
    - Add RB from Krzysztof
---
 .../input/touchscreen/ilitek,ili210x.yaml     | 51 +++++++++++++++++++
 .../input/touchscreen/trivial-touch.yaml      |  4 --
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
new file mode 100644
index 0000000000000..c47d7752a194c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek,ili210x.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ilitek,ili210x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI21xx/ILI251x V3/V6 touch screen controller with i2c interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+properties:
+  compatible:
+    enum:
+      - ilitek,ili210x
+      - ilitek,ili2117
+      - ilitek,ili2120
+      - ilitek,ili251x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: touchscreen.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@41 {
+            compatible = "ilitek,ili2120";
+            reg = <0x41>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index fa27c6754ca4e..6441d21223caf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -23,9 +23,6 @@ properties:
       # Hynitron cstxxx series touchscreen controller
       - hynitron,cst340
       # Ilitek I2C Touchscreen Controller
-      - ilitek,ili210x
-      - ilitek,ili2117
-      - ilitek,ili2120
       - ilitek,ili2130
       - ilitek,ili2131
       - ilitek,ili2132
@@ -33,7 +30,6 @@ properties:
       - ilitek,ili2322
       - ilitek,ili2323
       - ilitek,ili2326
-      - ilitek,ili251x
       - ilitek,ili2520
       - ilitek,ili2521
       # MAXI MAX11801 Resistive touch screen controller with i2c interface
-- 
2.51.0


