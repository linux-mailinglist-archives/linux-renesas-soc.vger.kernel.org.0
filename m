Return-Path: <linux-renesas-soc+bounces-7446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4657939F68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 13:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796911F2308E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 11:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1039F14F132;
	Tue, 23 Jul 2024 11:08:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E3F14D29C;
	Tue, 23 Jul 2024 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732885; cv=none; b=GZs5w6GmaSSdy3zJHWUCwV7iu87YHxdrTfJQMP0x214rzCzB8bPbDhaZGzO/niloixYowBRRtKF/3+qjTjRLcjRpW4O1C4PnSDBtVL8WdzNsXI1B5+pAAiC3kpnsAvk73QuZssuMN33TqqosCMbHwobyH2Yoe+demTpG2cG4HMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732885; c=relaxed/simple;
	bh=lxlqGX1vj2bh192s99+zh0KaN5T5g0e139+ZnUzSEqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tISiWO5khNGxcu8pgCmUSyob88j1dRKXbiBnzVUv1xW9/3SHg8wZylgsThJUd9TEck69TZjpiCpJnpbazrgeXgzGb0qIiBTfR5DP8Wq5e7qVgoHmJk8x5/iJ9N2ID/G0oFotq3ZJ65B6QsQUO7Y7OtS+ST9NhJfWRgtwh4gQcmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="216331953"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2024 20:08:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E5CB542F3F0C;
	Tue, 23 Jul 2024 20:07:57 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 resend 3/6] dt-bindings: clock: renesas: Document RZ/G2M v3.0 (r8a774a3) clock
Date: Tue, 23 Jul 2024 12:07:30 +0100
Message-Id: <20240723110733.10988-4-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
Pulse Generator driver.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v1->v1 resend:
* No change.
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 084259d30232..77ce3615c65a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -31,6 +31,7 @@ properties:
       - renesas,r8a7745-cpg-mssr  # RZ/G1E
       - renesas,r8a77470-cpg-mssr # RZ/G1C
       - renesas,r8a774a1-cpg-mssr # RZ/G2M
+      - renesas,r8a774a3-cpg-mssr # RZ/G2M v3.0
       - renesas,r8a774b1-cpg-mssr # RZ/G2N
       - renesas,r8a774c0-cpg-mssr # RZ/G2E
       - renesas,r8a774e1-cpg-mssr # RZ/G2H
-- 
2.34.1


