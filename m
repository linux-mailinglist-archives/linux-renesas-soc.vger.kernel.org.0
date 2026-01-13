Return-Path: <linux-renesas-soc+bounces-26650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B9D1720B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 08:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D4ED30617F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 07:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4222029BD80;
	Tue, 13 Jan 2026 07:52:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C61BC08F;
	Tue, 13 Jan 2026 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290771; cv=none; b=h+zn35uEIbSQ4W5FnRQzyN7+/DaerXsrt4jUd1eIUkeuIMAe9IOLexfkQGWDaEBlvVjmKmOehUqR8ueZ08J6SVH5k6W4e+SoeyTf89e7wnkUkiKdLydO9/lw5ifhu/UTomB/PZALBkJ0fJ/DaWO8E/z6wC3PRl3661gHKSukink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290771; c=relaxed/simple;
	bh=3JpeBSB0IMPhuyzWx+hHmeBvt+6wXOXiEIL6tJrQPmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRnTVYFLk6d/aS1GEntFCh5a8IJKqoWMrmkujyDXd0ffgRcovL49XuXlYWYv+IywFLbIPwp0eFMsHJNKbHZ8sL8pp2ebYuFMFDxWcCVjCatO2aFxChWODBYTQKPe5RZm2d4mqgQUSf8au7WJBo7Nvp2ES4yxCeRlc2erHd9Gi7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55671C116C6;
	Tue, 13 Jan 2026 07:52:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH dt-schema] schemas: cache: Add missing clocks
Date: Tue, 13 Jan 2026 08:52:43 +0100
Message-ID: <20260113075243.1192477-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a cache controller is part of a Clock Domain, it needs to specify
both clocks and power-domains.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This fixes Linux "make dtbs_check":

    arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: cache-controller-0 (cache): Unevaluated properties are not allowed ('clocks' was unexpected)
	    from schema $id: http://devicetree.org/schemas/cache.yaml
---
 dtschema/schemas/cache.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dtschema/schemas/cache.yaml b/dtschema/schemas/cache.yaml
index 73d345fb7685fdd5..dee1cd54c2f5ceff 100644
--- a/dtschema/schemas/cache.yaml
+++ b/dtschema/schemas/cache.yaml
@@ -33,6 +33,9 @@ properties:
   compatible:
     const: cache
 
+  clocks:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.43.0


