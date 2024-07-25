Return-Path: <linux-renesas-soc+bounces-7508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B54193BF75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 11:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E2D2840C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 09:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9AB198A35;
	Thu, 25 Jul 2024 09:56:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAA1172BD8;
	Thu, 25 Jul 2024 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901373; cv=none; b=upzm18EtlurYWVck/EEwKEbWe6DgXYf6GqMVjee7nH9h3k7g+9gTEvpxkD79gL9g+sGxiIhplbFM0JbLbdrw3K3ZeJl1NRu10j/TvpVGtdhJhlPF6WXXzjYxr+cjpsvX9e/ub7p/FYLydbEtdN5nnVONj4ltQ/4Bg2XSjU7LdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901373; c=relaxed/simple;
	bh=ld7YV0ZzsWjaVRjR4PCAEpucgMMLGMheA2aUKAIiT4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOfOZ+ulydbbXO8uv8QtglpDT6odiUKWLwCqvz3R2swg8kBBZPo6Eg4lCxxqLzaG8UG0+GXNSsbZQmLh0iB7JPC6JeTDT9r04kTi2xjn+dBWNyn55fn3DjQlDII0B6SZPEZmzqauxRPg472azbHne2ZzG2JguVhfeE2CoMvhPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216707632"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 18:56:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1C8F140104D0;
	Thu, 25 Jul 2024 18:56:04 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 5/6] dt-bindings: serial: renesas: Document RZ/G2M v3.0 (r8a774a3) scif
Date: Thu, 25 Jul 2024 10:55:29 +0100
Message-Id: <20240725095530.5199-6-oliver.rhodes.aj@renesas.com>
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

Document scif bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
v1 resend->v2:
* No change.
v1->v1 resend:
* No change.
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index afc7c05898a1..51d9fb0f4763 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -46,6 +46,7 @@ properties:
       - items:
           - enum:
               - renesas,scif-r8a774a1     # RZ/G2M
+              - renesas,scif-r8a774a3     # RZ/G2M v3.0
               - renesas,scif-r8a774b1     # RZ/G2N
               - renesas,scif-r8a774c0     # RZ/G2E
               - renesas,scif-r8a774e1     # RZ/G2H
-- 
2.34.1


