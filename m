Return-Path: <linux-renesas-soc+bounces-16443-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E71AA056E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 10:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A60CE7AA1C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DF628B51F;
	Tue, 29 Apr 2025 08:20:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD9D2459F2;
	Tue, 29 Apr 2025 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914819; cv=none; b=KP9N8uk0RkKq0QpIlP/Jo5K0rHBkFazyRz3x1NZz9UXhBP/sz5C72cJvNZ0qSNxQm78GpTGWNPL75xV47gk3HHHO86rapQM2fJVfX4OEynTMI+qI19tgoWxAVFgRr2t/5zT8dEe6BmdS/wxV6SSr1wGM2XBkujSgjh8JsmAK7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914819; c=relaxed/simple;
	bh=rq6XUiD0x1vbnfZwdjp0eBymxTxf00kcQeVirhyW1qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfqhcJNCwIVDmo69mkDERZRtCFJi4d7UKpOyu+2ckN26zkclNar93qa4BvnN28fh5HPHid+pOA5y/8TC0qOLLjssj8SbCpat0H3jC2IYfFl96lHFNTBwzQmBXnTk7WjRdHT28uoWsnPOqfSTgA/kv5AISR3mG9bUsnqwOlGeJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 6MZIIfrZTASaWecKUAZvHg==
X-CSE-MsgGUID: aXgAUH98Q4eTKPfPsmisow==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Apr 2025 17:20:10 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 445AE4000C60;
	Tue, 29 Apr 2025 17:20:06 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 02/11] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
Date: Tue, 29 Apr 2025 10:19:44 +0200
Message-ID: <20250429081956.3804621-3-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
documentation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 51a4c48eea6d..6874f425bf1f 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -570,6 +570,16 @@ properties:
           - const: renesas,r9a09g057h48
           - const: renesas,r9a09g057
 
+      - description: RZ/T2H (R9A09G077)
+        items:
+          - enum:
+              - renesas,rzt2h-evk # RZ/T2H Evaluation Board
+          - enum:
+              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
+          - const: renesas,r9a09g077
+
 additionalProperties: true
 
 ...
-- 
2.43.0


