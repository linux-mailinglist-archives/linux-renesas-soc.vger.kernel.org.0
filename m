Return-Path: <linux-renesas-soc+bounces-10666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79519D5F20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46681B28FFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C44A1DC05D;
	Fri, 22 Nov 2024 12:46:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789FD1E492;
	Fri, 22 Nov 2024 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279592; cv=none; b=o/yH/FpG25ncV3WvB0gKs4MgI3bjdB/JhTu6Rfpr4AX2mtj++94Gzg0jz86BmoLLqASUKWPlnAbYgcJgpG9Ti1Z1irELyZfGBAWS6Dl9Rsjo88nwL1m0oBYzCQSl0tPym3XYkSe2MutpWvm2SybyubsYOWMp2wwhYT4WhJHiZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279592; c=relaxed/simple;
	bh=NqB86yVHpS7ViSporg10rNhJUMBVXQfrVM79d7WjwVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLA6dylt/YsRLkCHoGO/krXV2PmIfM6xAYtbNcHxeeoYs+k1CX7LQicixTma5JYpzZfqrx121ceBIweu0Upq7jjAc+w1S8ZCFtQo42dv6s705+uo+m743/PAIjZUyQgvD8QbxncgjZ4DeoT7VhI8G8BD/9AeHZ01MQLVofHY6xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Ok+OWa3nSX+OkrnVPlPOBQ==
X-CSE-MsgGUID: emUSTHaCRTKI1oRnk5ejvQ==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="229765861"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0FFAB423A752;
	Fri, 22 Nov 2024 21:46:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
Date: Fri, 22 Nov 2024 12:45:39 +0000
Message-ID: <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
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

Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
The SoM module sits on top of the carrier board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 7cc2bb97db13..1785142fc8da 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -527,6 +527,10 @@ properties:
 
       - description: RZ/G3E (R9A09G047)
         items:
+          - enum:
+              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
+          - enum:
+              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
           - enum:
               - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
               - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (15mm BGA)
-- 
2.43.0


