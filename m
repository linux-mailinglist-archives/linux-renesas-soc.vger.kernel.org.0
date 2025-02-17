Return-Path: <linux-renesas-soc+bounces-13208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8832A380F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B0DC7A5BC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8144E2165E2;
	Mon, 17 Feb 2025 10:59:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F341212B3E;
	Mon, 17 Feb 2025 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789967; cv=none; b=bB88HKUXhzpmRaNdWSOlt7xmRjlKcWkmOW4mAtfeCMWXJTfMOY48aahz1xGqXaKBjUg4hov98Nwh3+U0bMcDbGtjuFdIVJQytYhTsOAePk/I74jEyhGAJ49pdVVxUlAf7TDxUP0KZs+rDDaRm0n7hB8TcgsRkpn6Vy1ck+m00SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789967; c=relaxed/simple;
	bh=k8bLKfkDeB4mNR9z24Lp92E8kKCRHmDcVKFALmu6mtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNqszHpkLQVodteDhSLl6OyIIFA1MmVY4WHJYAZnijR6Mz7830x31X57kruP/6jnat/cAR0vyRuglFTeVxPbB69XWjwN+xx407yBibpNCSz/sJsXqx/71Jr2g73cHdBlHkNu47FRqUWs78xAg0+TGQG8YyN6RUC0A5dI4EV6pN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 9p2wZoP9SF6TTqSjzKmZDQ==
X-CSE-MsgGUID: i+pL8HEEQuWIHJK6zlmaJA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:22 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8BD1A4280557;
	Mon, 17 Feb 2025 19:54:19 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
Date: Mon, 17 Feb 2025 11:52:02 +0100
Message-ID: <20250217105354.551788-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
documentation.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd..c1f5e0fa3c40 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -535,6 +535,16 @@ properties:
               - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
           - const: renesas,r9a09g057
 
+      - description: RZ/T2H (R9A09G077)
+        items:
+          - enum:
+              - renesas,r9a9g077m44-rzt2h-evk # RZ/T2H Evaluation Board
+          - enum:
+              - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
+              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
+
 additionalProperties: true
 
 ...
-- 
2.43.0


