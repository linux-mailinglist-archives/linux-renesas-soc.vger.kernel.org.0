Return-Path: <linux-renesas-soc+bounces-7507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4093BF70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 11:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607511C20D7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651CF172BD8;
	Thu, 25 Jul 2024 09:56:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCC6AD7;
	Thu, 25 Jul 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901367; cv=none; b=V0WMrBl/FvVcJLoRwkT7barF387jiEz2xOEHvh6MCTXNctLixRo6brUzeW3XtvBPJiLqNpIH5meJh9EElFmEPao2PtE5gRJVGR35qVR1UP6dH3quLoFqrsNrx1mgivf9Z215PYcf8TwnMFDUx+HS05pWCnxca//BIAtVR8kNezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901367; c=relaxed/simple;
	bh=xh8qRvF6u/V/qmc69k99A3+4C6a7mv//aeWumU1Z5lI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TSvUldsj8L08IvUJd4fUFBUM/hhyrKvRK7Pf3IFvv9Cal9vb2dT/K3gHVRIc7/jbJ+/aiiV9/meNNXh7aE3WvW4jF27j+Q+nLLShQIe8pSpNIN3STVGpjHfGRJmksHssbx1pZzNv3tJuXEllN59EhJfOvcQrwBxOpmor756HVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212749161"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 18:56:04 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 214DF4007F33;
	Thu, 25 Jul 2024 18:55:59 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module
Date: Thu, 25 Jul 2024 10:55:28 +0100
Message-Id: <20240725095530.5199-5-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
References: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
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
v1 resend->v2:
* No change.
v1->v1 resend:
* Fixed the commit header.
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


