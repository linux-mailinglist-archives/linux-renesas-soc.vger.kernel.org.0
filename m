Return-Path: <linux-renesas-soc+bounces-22850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF3BCA945
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73F624267F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1BD228CA9;
	Thu,  9 Oct 2025 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GCfzl4nx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28C91C2334
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034996; cv=none; b=i0zbuMTNVuWz4cfo9mk52eAIBUZqIXlA8E1SPN/vqDfUYDu3Yx9m0xaF6yg0dZtFv/0MzVe22KIKmACqGfBhcY9t6VOpnvvhape3n86UFXYhFe0s9V/N28tJaOksAPzGUffGr+zXEUu8YVNEWWTOExYOGCiv3wmKvM6uQrlJsX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034996; c=relaxed/simple;
	bh=HqadQXdanIezbomm44Xinsyx0jad8e4fIOrtGZFoNXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tF+Zl1Ekhq8sEdXkZ35IVs3VEuxySeAIzMTwgGunOCWwLGB9tq7MdXPSu/5LubQzwXmHsyVuif/fYaXzQPa9cEAEeBN7Zf48NIfQ1z5qTiREWNnSX7lrwtHg2V5kOTb2SiOfGhXhm4XedxfK4Ej9GA7Wx7zp77SLx7jl0xrmw98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GCfzl4nx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=QHws+1VY8IKgae
	7go6lE/ug1TAao0rrlG6fRhYIYR6w=; b=GCfzl4nxbh+gKyUdmAcKt5jL9gpZUT
	jTpYf3g3I/E93kiz30x1u5u9oe7LeyZ+IxeMtAwVAFg0K/r7SNmTgjAnt3TPNgVA
	qYmb2YwFn9zI/LicOPAaIXyfdqYq59YoIWd1UqXUxPf3iS+z/dpnmBvalZPbVVn0
	eWGzr60kpeNREeaA6SNagosRPajU/WLp7URnN8Qg1AjmQ/9gWUl8HEgVlfBV8omy
	AeW3NxJZETiu6EMBHMdOaH+n5lWDhRlbXFEavL+ytry1WM7R1DO2ZDQj/6GtbN2x
	y+tcTlekMEVlmlaubQ42/uf0/mhYASc0E9qDXWwA6NiYuRCA8hlZ1GyQ==
Received: (qmail 1185710 invoked from network); 9 Oct 2025 20:36:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:36:32 +0200
X-UD-Smtp-Session: l3s3148p1@uziIFL5Abpoujnv2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional properties
Date: Thu,  9 Oct 2025 20:34:53 +0200
Message-ID: <20251009183630.5451-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow additional properties to enable devices attached to the bus.
Fixes warnings like these:

arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: bus@fec10000 (renesas,bsc-r8a73a4): Unevaluated properties are not allowed ('ethernet@8000000', 'flash@0' were unexpected)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* added tag from Geert, thanks!
* dropped superfluous '^.*' from the regex

 .../devicetree/bindings/bus/renesas,bsc.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
index f53a37785413..ff3c78317d28 100644
--- a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
+++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
@@ -41,6 +41,18 @@ properties:
   interrupts:
     maxItems: 1
 
+patternProperties:
+  # All other properties should be child nodes with unit-address and 'reg'
+  "@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
 required:
   - reg
 
-- 
2.47.2


