Return-Path: <linux-renesas-soc+bounces-7513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363D93BFA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 12:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857EA1C2037C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D59198A01;
	Thu, 25 Jul 2024 10:06:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF02198A10;
	Thu, 25 Jul 2024 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901966; cv=none; b=c2AsrUqm7GjdRFEPIl52xG5qaDr0JvMUrNKTxnKS1fVaCR71X+M57JlpckwdKAcneKxDzGFmN8oYcOCnN4qBdiymX+c76vwcG5ltHO1D9Sqd3tghKJ4RztdqZRheBGz8SiEvK4NnYhGS95CHDSJcghhKi2R/dHxkOz7NVQ9xDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901966; c=relaxed/simple;
	bh=aE5qboIhoA622hMP1lNkLNFcI34wq3KRqsnK+UblE6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Exdf6zt+C4Mr3kCkzSs3W7aEhbw7IdJ16isje3lsWgc7jog6ovRBUYV3rhfhH3nARPck25CSkTgzZe0Z4MTuzjEYZ39Bxa0or+7qciwsxS9e6hxFjx2fsyvwUCp6f25Jss9VW2tZDIdXDFcPIdvX1CS2yj/Lha4QbAKbAijj61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216709312"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 19:06:03 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9AED141F581D;
	Thu, 25 Jul 2024 19:05:57 +0900 (JST)
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
Subject: [PATCH V2 3/6] dt-bindings: clock: renesas: Document RZ/G2M v3.0 (r8a774a3) clock
Date: Thu, 25 Jul 2024 11:05:31 +0100
Message-Id: <20240725100534.5374-4-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
Pulse Generator driver. The r8a774a3 cpg is similar to the r8a774a1 cpg
however, it lacks some modules such as the FCPCI.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v2->v2 resend:
* Updated the patch description.
v1 resend->v2:
* Updated the commit description detailing the difference between the
  r8a774a3 cpg and the r8a774a1 cpg.
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


