Return-Path: <linux-renesas-soc+bounces-7501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9914293BE21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB10C1C21299
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 08:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1969B18FDA7;
	Thu, 25 Jul 2024 08:46:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC0118F2FA;
	Thu, 25 Jul 2024 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897180; cv=none; b=DurULL5dztDrzKbwlYe/rTdONxm+oqjHEC6T2i8LZDG9PHtnIEB1mhVQJwXEBCvEpGaMUEFc7YsC4NPS+OAnJ5lpAoqDHtwiEURAOMtP/ov5NHC9NxX9uYWqVo+Ohgrz+F4gAUZDWxiWMXgIQMQbScdBP70Oq+qp9RKjQ8yOPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897180; c=relaxed/simple;
	bh=+l8vR9sFf+0zlEZ7KiHK/VU64V35gF2wSeir7GCvcDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLaDLToj1cm5hbBel69DIoiOOdWpp8dLI9Fl+IJUT5l/p6rcTFXokqTpSQdx5QJ8iVrT0u+eWo57B++0m3MMip5aHcM8RzL+Ymr67RBNjcka7bc/BeTrokPEXn+KuWVcclLRbZlRjjcrcPYf+kVPF8t0bNQWH04MhosZuMa0Y6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212736790"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 17:46:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B6B004010093;
	Thu, 25 Jul 2024 17:46:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: renesas,rz-ssi: Document port property
Date: Thu, 25 Jul 2024 09:45:54 +0100
Message-ID: <20240725084559.13127-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document optional port property that connects to I2S signals.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 8b9695f5decc..f4610eaed1e1 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -87,6 +87,10 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  port:
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    description: Connection to controller providing I2S signals
+
 required:
   - compatible
   - reg
-- 
2.43.0


