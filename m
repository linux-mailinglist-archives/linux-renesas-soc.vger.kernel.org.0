Return-Path: <linux-renesas-soc+bounces-12324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B61A18FF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E16188412D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D921147A;
	Wed, 22 Jan 2025 10:40:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F0221128F;
	Wed, 22 Jan 2025 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542409; cv=none; b=GmM2A2WtlEGpfdV75n+lx2IDOBoO4iV2jEdacvgOjFnoOfZ8Xdodh8tEwcvSkvQEuf0nsHqlcRnh180aaWWaMtL6swbviDLs+zg6g4mKZagO8uXJROUgfriOJNxSUSVsVO84mpjUtp4ebK7v5nj9Y6QVhymSyAqljmYe8+9SklA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542409; c=relaxed/simple;
	bh=iENY3MbQsBw4Hyy5P3nXW+QJZiCQx1GWQNQ4pvgrUAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WE8NpxJ1PUOPrEARAkt5N9ciz8YGs0edUO4Xx7VSqqipNGjphZhsmjw5FynjDNGNua0987+1IF4fnPu6iSc2wcnNsMzQAQESDaiVKuFoWWBdHU8Es/NISOLlo6JCoefQA9q9omnKMgy+OZgSSyr3vzlKw7eXUUTf1DDW///U48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QnWRQFIIQJuv7i4GN2S9dg==
X-CSE-MsgGUID: 9+WaJO4rQNy/PjGYSjgD+g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jan 2025 19:39:59 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 498F540065B9;
	Wed, 22 Jan 2025 19:39:53 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	robh@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Subject: [PATCH v3 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding
Date: Wed, 22 Jan 2025 11:39:04 +0100
Message-ID: <20250122103911.517484-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System
Controller (SYS) binding as both IPs are compatible.

They however have different SoC IDs, RZ/G3E has has VSP control Register
compared to RZ/V2H SYS IP. Hence a new compatible string renesas,r9a09g047-sys
introduced to handle these differences.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index ebbf0c9109ce..e0f7503a9f35 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -22,7 +22,10 @@ description: |
 
 properties:
   compatible:
-    const: renesas,r9a09g057-sys
+    items:
+      - enum:
+          - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
     maxItems: 1
-- 
2.25.1


