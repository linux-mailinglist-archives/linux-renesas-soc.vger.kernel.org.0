Return-Path: <linux-renesas-soc+bounces-18206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF64AD7583
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 17:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C71F4188485C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822842989B2;
	Thu, 12 Jun 2025 15:17:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD92989A7;
	Thu, 12 Jun 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741464; cv=none; b=sNVtGKAF1LlojlX9RmzILSdXHgFvwv0AaxUw9ha3UXK+ueHGHAftAis7+prkRKQx3+faw8tsPVJbGEg3zTujOa/4qB0tUaaCjvJxLINIz177Mo5wX2zdwWTCb2RrYJe/U/9TaH24TVWx8XwuL8g6n/6ZHkeWHQ1NJNdS/JE/Ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741464; c=relaxed/simple;
	bh=OwoiUrbUj24GA0EAHgpIdS9FlUr+CArNxy/uydoUu60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RwiLx0wTAvT2uf91vYSoBIGL0RcyMZBCLbEohGuO/Be2+OJHgl9QJ0cM2B64hlW+MvEnlj70pFfgYZkLTh/FXlaeW8Sn9IzRVxGFJ5ShB+HXdxeQQaVAjIgGz9bwPnog2kRJZCJy5Ay2rSjmBii/AOoWYijqkofIrTl7oyoF/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3225AC4CEEA;
	Thu, 12 Jun 2025 15:17:42 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number
Date: Thu, 12 Jun 2025 17:17:35 +0200
Message-ID: <0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.17.

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index aac7af605de24f99..c25f12642061b6eb 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -595,7 +595,7 @@ properties:
       - description: RZ/T2H (R9A09G077)
         items:
           - enum:
-              - renesas,rzt2h-evk # RZ/T2H Evaluation Board
+              - renesas,rzt2h-evk # RZ/T2H Evaluation Board (RTK9RZT2H0S00000BJ)
           - enum:
               - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
               - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
-- 
2.43.0


