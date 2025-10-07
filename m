Return-Path: <linux-renesas-soc+bounces-22726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD83BC0156
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 05:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8F8F4E02C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 03:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FC4209F43;
	Tue,  7 Oct 2025 03:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UX25niyS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD65CDF1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 03:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759807344; cv=none; b=OsnMv2XZ2c1ELWZiAybC/QBz6ASpyTqjWb+685a1pz2H8egstbCKHXDV2szzjYynDe31weEhGY0XP79OjnBQHij8gT0DmB2AggQl9Nt2Val5cB7/FGzmF1WaLTVbiWHRhfRM3TvDWuz19EyqyDk7IkAKaSMr3BwANCssKWScbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759807344; c=relaxed/simple;
	bh=iMlhBkZnfNgPHleNmXkIgTXUdbd0SohpN8lWmooInBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uBHNMplsBdDQGnCbSpbHM1zE5ngq47r26xaoxVCwdAWXK+9MmXn6aRHfCXv9zg2yuqg7R4b7tNzyjGjeSqAenYfcXxhX1G5advnWKpAKg4NOerk9rBHuBqsPKd3oXoOBe+yMD6J9SgBmgAGXMzqIpeJYdI2+N6uiNjzgMyB5y40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UX25niyS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=n0Y4rlmuWxVmzL
	/bS7lbB8hNkPOMags9RfrGuxE3ZZQ=; b=UX25niyS1StK87Yah66yEJRDs6vw1K
	b8VYG+P82+A7HL+KZvBHufBJINkWTXtKN3r3VNoKdqZYYON6D2ipuw4Vb5yWXJl/
	bbSJr+xxrU9HpgFE12fKxbl6X1YWpJ6CUTcGfh+NRu9f+zD3PHaJUIiqMflbRkaJ
	iUafIhTxzAieW9e8bci8A0Y19kEWQDQ3yEDQJnVMO+yb8+aXe8TsXr4zHTOhNjMq
	t2YyJSV6/hYJocBMIr+SrLfNlW5JY7jsFoIKOqiRCg9Re6K9Tj4Tg8TwgF+WIluz
	MHSYpFmdGKsF9/I7KOUajPIkaJ76O5GW1ny7GEgAfL70w7qELZHULSQA==
Received: (qmail 108038 invoked from network); 7 Oct 2025 05:22:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 05:22:17 +0200
X-UD-Smtp-Session: l3s3148p1@DT8yE4lAxLgujntU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: bus: renesas-bsc: allow additional properties
Date: Tue,  7 Oct 2025 05:18:52 +0200
Message-ID: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
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

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Copied this from 'bus/allwinner,sun50i-a64-de2.yaml' which seemed to me
like the most specific patternProperties for a bus.

Passes dt_binding_check and fixes the above warnings without regressing.

 .../devicetree/bindings/bus/renesas,bsc.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
index f53a37785413..24732c5e24e1 100644
--- a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
+++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
@@ -41,6 +41,18 @@ properties:
   interrupts:
     maxItems: 1
 
+patternProperties:
+  # All other properties should be child nodes with unit-address and 'reg'
+  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
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


