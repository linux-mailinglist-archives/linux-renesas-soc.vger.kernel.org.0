Return-Path: <linux-renesas-soc+bounces-29160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCkXKmeNsGkukgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3742584CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A59A0305B5C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE233EE1CB;
	Tue, 10 Mar 2026 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvCZ3hyT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D13ECBF7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178192; cv=none; b=H9+6GgMUMMmJp2xKeGxJu29Jo5LbxSODkGk9x4uBQTGAJKo6Juo9hYRHRjFZuTrLEI/f2bA9U/4pFdupuq/DFtB73agOGClm/kv1M+pnKHOTMQOLxwZZ7vsmxPJ64AfdHx4m/ls6qbJprEvoN5HqJwOW5rVFErDwz4yYd3kKr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178192; c=relaxed/simple;
	bh=gFnXvymCEzoOcbtohhO71PytBlzyoyx7Ut5b833dFLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhiwJupFRqgMljxCQMCs7dHT4GEBH0RQVLqKjelDIbgODnOcJtU5u+G6K9itp6xApqI7QXHfVKNMXvXvQXLYLCD7dW9hbn8eM8NIM3CZu+4MNdIXMHuU+BdFnBKZ9/hxuigVr60bFGqTmnRQVjnSS4XGy8X7tCGrLPUF5HA9kXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvCZ3hyT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so6501787f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 14:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773178187; x=1773782987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgRXvl1sY8HiSSfFUcnoj1jeHlznucddaU4Ukjd4GSs=;
        b=FvCZ3hyT9APC0W5oextcULrI0x+lb1AJrprQtYM+Y+xlNp1d/q9esYxmwqzh0UOpfR
         r+8r5yXEc4zyQIenDr+QkqSjwvNjCMPlKHeL0Xw+zWVwsISdwjr+t85akmWVdx9rXHiE
         e3KxM1/rv0Qa+PTjD6sC6M8SxETD7Yhty+Tl+h9dZtowZT6iFK1rRE2XbGqs/Ia/K4nO
         SOjBoVZy4RrpzRsPeoX3vi8FAGQiV1MZG+1y97oBxqhzpenF2ExJrQGjakfq42WNAFKZ
         JTDhvgQqoPgCGisVv35EV6dI3D/7y07Iap9p9x/SrY57Q4xi/9FAhllaiDLyfEKHNIje
         UL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773178187; x=1773782987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgRXvl1sY8HiSSfFUcnoj1jeHlznucddaU4Ukjd4GSs=;
        b=jm5PZgKa5ZJaNw2Id0duGLKawfc07vxa6ieXRgUKYc3xznh7TsTQAeC3mCRx7h0hR+
         IIhazqsiBq+j7xwPC4Jpk4oJTIjKO1QYEA1Nww4jCcXoHiPe0OyxYS6b2sGTKfzbQpNH
         N+ejgs9bQsPpZR4TZ7tcpLeEeEMd5fm34xlsllKnymmOtlRn7z9wW7f1xelSkiWqd/50
         ITdOvFn+xVhk1mf3wBYD5Wvsc0xJKZQTGGJuusobvmxTc5DjL3pWEvAUdj5HV/aMck56
         7hDeOg94IQbVrBdkb+Y/x+rD4xdCHOkifz2r14Fovd19zHJTwuyncUjA++5DaaOQfG3X
         LOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTwA0C9By1Rky4v7IkO2/Iv4CliU842AojQEuZxhl7ZYysNpo8YCO2PzXumOEe2Nw/RnE2v9/cwtpM9qnRMmKm2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YytzFEo4AJ4zV+MP0WvQwbkCjyE7siUIj+27f6KAPqP+On+6LWn
	0xeFLzg5FshO8nYFfk1rqRAbGpxS7z+jnru5/Irnx1HmOZhCn+rqoDgJ
X-Gm-Gg: ATEYQzzrDzN41UIEqmXCL9qE7MRsMXLz6hi8AdfVe9YfvHrcnJ5xTnPhGJqgtxHyuYs
	t8K5rxvdZ9lZw/kEaSNnQormVTDUvF9vXV9xY2a6kaxV/4FtOoCl+Y/NhXCDuvsjfi80aKboCUG
	FzvBRO6F0f+np4ilu5wE9ScVE17Kfil6jtuAfhhyTxVF7jp28ERGk13DMGK6VrX/xpFi3t8YI1a
	CwUApwPZlcfGTOuz45A6hhBwrvSyUg4jmaBhqgaMHCSOY+l9U0MOFWnMbUKlvpIC+oelxnqoW+u
	1zHCAefAI1SXgu+zwj2pecCIlml1DsGnD2+JUzmK5+RUr1AYKIB1OAe5YRTnQu82PG2QH0JFIfI
	S04hs7qeFhZTsmuF2caYfJ71cxYWgZOynHLQDrmLjk9dmHtdG/YJ7l39IiB3Q8cs0uhb3bbVhDf
	stNPEri9wLLmrP4CicBgYfKpxQqTH0DcGon3oJXngiggSDoBfHo2AROi+B2k68YEBDQAfCpwhts
	uU3B2l0n4DeVNJczdArvKyDK4rKX4DywlJUFg==
X-Received: by 2002:a05:6000:310c:b0:439:c4bf:d9cb with SMTP id ffacd0b85a97d-439f8434fc1mr726372f8f.43.1773178186814;
        Tue, 10 Mar 2026 14:29:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:82df:eef6:d0c5:70a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm1247104f8f.6.2026.03.10.14.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 14:29:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Tue, 10 Mar 2026 21:29:25 +0000
Message-ID: <20260310212927.3372410-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C3742584CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29160-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the xSPI Interface on Renesas
RZ/T2H and RZ/N2H SoCs. The xSPI IP on these SoCs is closely related
to that found on the RZ/G3E SoC with some register bit differences
in the configuration registers.

The RZ/T2H variant has a reduced clock configuration, requiring only
the AHB and SPI clocks (without the AXI and spix2 clocks). It also
requires only the hardware reset (hresetn), without the AXI reset
(aresetn).

The RZ/N2H variant is compatible with RZ/T2H and uses the same clock
and reset configuration.

Update the binding schema to accommodate these differences using
conditional constraints based on the compatible string, while
maintaining backward compatibility with existing RZ/G3E and RZ/V2H(P)
implementations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..bf50d90051c9 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -24,7 +24,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: renesas,r9a09g047-xspi  # RZ/G3E
+      - enum:
+          - renesas,r9a09g047-xspi  # RZ/G3E
+          - renesas,r9a09g077-xspi  # RZ/T2H
 
       - items:
           - enum:
@@ -32,6 +34,10 @@ properties:
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
           - const: renesas,r9a09g047-xspi
 
+      - items:
+          - const: renesas,r9a09g087-xspi # RZ/N2H
+          - const: renesas,r9a09g077-xspi
+
   reg:
     items:
       - description: xSPI registers
@@ -53,28 +59,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +125,28 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,r9a09g077-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    resets-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


