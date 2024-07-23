Return-Path: <linux-renesas-soc+bounces-7440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6E939EE7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 12:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276701C22059
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 10:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C1314EC57;
	Tue, 23 Jul 2024 10:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C9114F12C;
	Tue, 23 Jul 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731352; cv=none; b=WR/tO09+kiHZYCrLBjq7RAwoztvTVs473Tx1XD6kb0RYY5N2clgwdTDUKmMcH4wEUVhXsRykq80k9lcfeT42X6IlI0SlLcJOpVSaoJzeF5AxtaIdnSFCp4TveFYXuSVcCejCw3Z1dAlL0tGHeOZUrh31Jwa0UzvOuYAo7G6VyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731352; c=relaxed/simple;
	bh=QyVDJVt6tcXR+T2VhsE1LY8KVa5f9eHOJgdojTAIHa4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNU9vHPp6CvQjsyX6czo5vZG6d0D7rUdWTcOoxD6y+tuWUXNUaw51J+WDCwwDsrOJjYvNwuPnQ8WyWV+wo1TpAweV8lA8e/Z+PCzaVy7AOY5A5oTbuijooF4cwEn5EwcAuataxwbj37WESiPf9Y7RzbCcMtJXcCmVeGDjhc+gVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="212369751"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2024 19:37:27 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7F9C64005B47;
	Tue, 23 Jul 2024 19:37:25 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: 
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 23 Jul 2024 11:37:03 +0100
Message-Id: <20240723103705.9774-5-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
References: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) reset
module.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
 Documentation/devicetree/bindings/reset/renesas,rst.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
index 58b4a45d3380..7a81491379b0 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -29,6 +29,7 @@ properties:
       - renesas,r8a7745-rst       # RZ/G1E
       - renesas,r8a77470-rst      # RZ/G1C
       - renesas,r8a774a1-rst      # RZ/G2M
+      - renesas,r8a774a3-rst      # RZ/G2M v3.0
       - renesas,r8a774b1-rst      # RZ/G2N
       - renesas,r8a774c0-rst      # RZ/G2E
       - renesas,r8a774e1-rst      # RZ/G2H
-- 
2.34.1


