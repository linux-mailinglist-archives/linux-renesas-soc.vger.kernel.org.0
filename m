Return-Path: <linux-renesas-soc+bounces-10819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43A9E19D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736A02861A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E981E25EE;
	Tue,  3 Dec 2024 10:50:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50261DDA37;
	Tue,  3 Dec 2024 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223042; cv=none; b=rSAzAdPfieu18j9c3WfgFfSmw/JKnqAqsLGEKHcN/uT6LdVFfBmWAl4HJrr3O7FyS7vmpuhttkv274s078Qh7QaTWuQsntMkVHtD1nBZmljx5zkIyIxMncoouocaohZ0ojxXlRCfdCvqC/CiuNe2rfIqlP/CaRXdqAuV7OCHqFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223042; c=relaxed/simple;
	bh=H+aZeWO1C99Vy3dMeHF6AwCee+MLij92uMHaEAwmYf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGKOSiFiNlfXhVLWWFp78t3kMIs8zVDSXXE5VCgnBw2NlXIobbrHDzIRlJhGUUwF7zQZNiHDOZtSXLni9LlojyJPc3lTqYkvjTsOCHjZsrWKxxka++LEE0PysQoa63DkyQICHhUsIa+bCvojvgEpgHi0qU9KPJ+ztFek+5ONM1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: elaYuPkqQ0+qL09p5QgKYQ==
X-CSE-MsgGUID: WyWNG/DvSy6bgv8uZrIbGA==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754406"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0808D4003FA5;
	Tue,  3 Dec 2024 19:50:12 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/13] dt-bindings: serial: renesas: Document RZ/G3E (r9a09g047) scif
Date: Tue,  3 Dec 2024 10:49:28 +0000
Message-ID: <20241203105005.103927-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected Ack from Conor Dooley.
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


