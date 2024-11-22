Return-Path: <linux-renesas-soc+bounces-10665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914079D5F1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4C50B2901F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267E81DF27B;
	Fri, 22 Nov 2024 12:46:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE611DF275;
	Fri, 22 Nov 2024 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279586; cv=none; b=kvRP5tOGqHUkhnYs6Mvflol4/8TECnCWiVvFXtpHdmTVGtssyQWc7mggw7ZNHO/zIlFDTeFFY81+X/dErTg8fUBXq0nXsqhZcUTgr8uFS0hnyUAgq5b2Uk7rtIpm459cNxKTYzVUfJ0jwKSq4cMXnnDS7uBdXQzeMKlCzZmyou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279586; c=relaxed/simple;
	bh=jZXhJSMWje1pFWNNQHi5cCGuKwf1KxSZ2RTrqW/+wGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdR56yglH1+MPE/8MYmWW/mxPWP43OV0Vo8lJXs7Q0arrLEhdugwTsEPpRbzyeIHpMz+NBtO8sfET94oQrGZq2BF5e7ihbtbwyMU8qjgZ1uCmdVFZOMiAeNK4y7kbKFi4fk4oUfeXlSMCZgNhwtQqdzn8hIHtlGXw+LIP7aB93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ozfFfWaPSNe0a/5h8TFb0g==
X-CSE-MsgGUID: MPxQHihyQ6iB8nvHLamOtw==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="225786434"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 67965423A74B;
	Fri, 22 Nov 2024 21:46:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/12] dt-bindings: serial: renesas: Document RZ/G3E (r9a09g047) scif
Date: Fri, 22 Nov 2024 12:45:37 +0000
Message-ID: <20241122124558.149827-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document scif bindings for the Renesas RZ/G3E (a.k.a r9a09g047) SoC.
SCIF interface in Renesas RZ/G3E is similar to the one available in
RZ/V2H.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 51d9fb0f4763..8e82999e6acb 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -83,6 +83,11 @@ properties:
 
       - const: renesas,scif-r9a09g057       # RZ/V2H(P)
 
+      - items:
+          - enum:
+              - renesas,scif-r9a09g047      # RZ/G3E
+          - const: renesas,scif-r9a09g057   # RZ/V2H fallback
+
   reg:
     maxItems: 1
 
-- 
2.43.0


