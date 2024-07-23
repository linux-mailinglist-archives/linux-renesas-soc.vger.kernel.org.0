Return-Path: <linux-renesas-soc+bounces-7447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE49939F6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 13:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0172E1F2300A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C97514F130;
	Tue, 23 Jul 2024 11:08:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D133614D29C;
	Tue, 23 Jul 2024 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732890; cv=none; b=pDg36W5jktquahMp3/vXiZ1o9RBMrYbc3jc8F/pAXmzMIfcAmMhOENF977zY7WOsBxZyDJYUzY5g9wOCGyUUbacFDB+Tba7dCS8+qenVkHcboz3hKBtdb1NFu7uWPniiJRbIBJgQ6dPgLJ7BG4VLLdlILRjGAGyJXATy+tCWBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732890; c=relaxed/simple;
	bh=Xhf7MjdBG6j16/BzyNSVwDWbt2iyjfdXiFBeIjNkcSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jgD9ARTvfrXsqll2b8fkoGHPJveVg9nE58LBlcQq1rMhaBknYNAKZ6y8rZjS40NCI0JkG55btU85x8F7BJ9D4KnWcHGkS90/5Hcs2FSrtECSvnedwfkqIxsKypuEX14LIGLgb7gnU2lYtON4C84jAU7O9qZs1dEfyYNwERRP17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="216331965"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2024 20:08:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C013542F3F16;
	Tue, 23 Jul 2024 20:08:03 +0900 (JST)
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
Subject: [PATCH V1 resend 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module
Date: Tue, 23 Jul 2024 12:07:31 +0100
Message-Id: <20240723110733.10988-5-oliver.rhodes.aj@renesas.com>
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

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) reset
module.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
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


