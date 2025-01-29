Return-Path: <linux-renesas-soc+bounces-12708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7517A22238
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C605160B96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8FE1DFE39;
	Wed, 29 Jan 2025 16:52:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A47D1DFD9D;
	Wed, 29 Jan 2025 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169535; cv=none; b=KGTFS5PL3UQP+ZspkxfGilzpvZQaH57ZM0OV4ik8IzXky+VIYnJfYDEhyBcpAjHyIBajdbwH7ajNPIJFhRRk7R+B0ZPJmEKNsXngW3DdGQiDuXAlYC68eNID2FSby7caFUyzYvRJZq6VXklYETMSW4G1PB3Z+3vQse9nDsto4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169535; c=relaxed/simple;
	bh=PciLRxlqOAQOhDRRebMPFJhjUC7nYaS41DSDwIYNE6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8jmvtE/v0xhowLTo/X81iSw121lprAWL+E5TPqgLJ13X7OlpXxCsaSQRjeJGXGv4eKm0XXaU5EZZv3BnSzDo6q3drmRiVilXAyivHB12GLmNPQOiagYiFTZfJsqHYzuERhkkMoyVlZZmqbkIfBnCV5AKMDrSNDZpW4DV2rBYeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ACh6jKLUSzS6w8fYzSYjNQ==
X-CSE-MsgGUID: VJZKxVavRAutuoqbQz9xjQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2025 01:52:07 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 166E8402F520;
	Thu, 30 Jan 2025 01:51:53 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] dt-bindings: soc: Document the Renesas RZ/T2H Evaluation board for the R9A09G077 SoC
Date: Wed, 29 Jan 2025 16:37:39 +0000
Message-ID: <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RZ/T2H Evaluation board (r9a9g077m44-dev) in documentation.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 33f9e37a3d3d..331a007dbe35 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -537,6 +537,8 @@ properties:
 
       - description: RZ/T2H (R9A09G077)
         items:
+          - enum:
+            - renesas,r9a9g077m44-dev # RZ/T2H Evaluation Board
           - enum:
             - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
             - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
-- 
2.43.0


