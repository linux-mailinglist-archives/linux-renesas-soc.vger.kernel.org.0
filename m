Return-Path: <linux-renesas-soc+bounces-22765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96052BC1E87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 17:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970583E1C39
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6412E5402;
	Tue,  7 Oct 2025 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l/GGpKz0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888C2E5B09
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850440; cv=none; b=pF0DxM8xpQn43izAOCsFTFs99kuktRPqmHE4LtIdtm24p7QOrIiAVI6theiWrWzOQV96COiQIjJTN8bO82ll+e6nqAn9nLdN/pG+TBowLa4W0wD6rSE9MhTYDp/gr5jmzaaAztEhLJx1rGBQKP/7Q0jW2qxk1mS0BkFuvvDbkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850440; c=relaxed/simple;
	bh=BgwwSl/hepHiJgPpfgIXNomwGBdszEML1lv0R9kMsUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC7I4gmfN6hNHlutFu+CmJ5l3QTJHe6FlTV7AmdVUBtp8oP5HTK++ADyPthnAnNrbN+8gjS9nFAZPqUncuLTTDkRkSzUQFZ3F8rPRwWengPOy/rTS1xcl8cj5Qu5eavLn0XXsmG2izVFI7EqWFonTmm+7Ik/vUyT9G9QO6DZt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l/GGpKz0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iAbucSu/G3WyJUeUgz7N5f/QArJQuqb1LSIGIwTteqo=; b=l/GGpK
	z0t71UwA8YbRF5LeeNm/CzV6uatQydpSYrSj9oHsa5jrhLFCgsYnj2vgKAslKXq5
	tw3WSOdqyzXLY2vkE8kVftU7eJlT0Q4+/CTRH72epd78wUk5DV7LOEEE03XD28pd
	xc4UQ7+cjw5mZLbvR7B+LMRYaI17wvhwtJivFEjRB4IwJrJN3uBLJFeQI74/4/sn
	YwC/hOO/RbOk8Y4tsJbCR+/a87bfp8e5n458dd+r6GxqjVw4O594ow/czNpYN+at
	RZCj290yky7EOHq/r+/tyaRBl7eYaG3GrLyZ7QZYKfvXqRJefAhELfiGOHoK+AQ8
	AsvEW3xcVGWrqDtw==
Received: (qmail 313289 invoked from network); 7 Oct 2025 17:20:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 17:20:31 +0200
X-UD-Smtp-Session: l3s3148p1@bTTKG5NAgp0ujntU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT exception for V3H
Date: Tue,  7 Oct 2025 17:20:10 +0200
Message-ID: <20251007152007.14508-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Normally, RWDT and SWDT can share the same binding. But on R-Car V3H,
SWDT misses the reset bit. Add this exception.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* new patch

 .../devicetree/bindings/watchdog/renesas,wdt.yaml  | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 08ba128bf442..727f034e7f92 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -39,6 +39,7 @@ properties:
               - renesas,r8a77965-wdt     # R-Car M3-N
               - renesas,r8a77970-wdt     # R-Car V3M
               - renesas,r8a77980-wdt     # R-Car V3H
+              - renesas,r8a77980-swdt    # R-Car V3H SWDT (no reset)
               - renesas,r8a77990-wdt     # R-Car E3
               - renesas,r8a77995-wdt     # R-Car D3
           - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
@@ -74,11 +75,22 @@ required:
   - clocks
   - interrupts
   - power-domains
-  - resets
 
 allOf:
   - $ref: watchdog.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a77980-swdt
+    then:
+      properties:
+        resets: false
+    else:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
-- 
2.47.2


