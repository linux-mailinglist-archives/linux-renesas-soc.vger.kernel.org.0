Return-Path: <linux-renesas-soc+bounces-25979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE98CD623D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6321C30A5845
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0B03090CB;
	Mon, 22 Dec 2025 13:13:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861D2C21D0;
	Mon, 22 Dec 2025 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409190; cv=none; b=Qc8U1ftQ1B7QItXZ2N1V7uOWuXTZrqoebY2gs9xIRY/wbmrkSCZ05HsPI+5cYk3xGenLOnrzwfK5hHip5/ehHCOuJ9nKAnICSDxS/04fI3XQ6CwRV6q2rJHbZ4ZeXyXmuIrOqY7dN8nturMwTxEA6bAcvYhjA1pOdLkuZ/GJH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409190; c=relaxed/simple;
	bh=IKLEpW6ylmBnD1/O3t+GOWAuslPBlPBzM+ODmq/JA/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/6eJaAugsEn0Q/c/1AMPLRUqD+a5itTUtg3sYKIx1bcouxv+tjV0giGvvA6bVxOY1jf77WXPsNAjoLdLQL2JEx2N9v/zVhuqlZji0UkwuRqopwlFbFWy27yAm8L5EUENUbQceQxRq9UGnvNOnphOrXjrwvYbwe92XpA8KdBAk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB114C4CEF1;
	Mon, 22 Dec 2025 13:13:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: interrupt-controller: renesas,r9a09g077-icu: Fix reg size in example
Date: Mon, 22 Dec 2025 14:12:54 +0100
Message-ID: <04fde8ed8301126e1781cf21bf10302b274dd582.1766409087.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Figure 5.1 ("Unified memory map"), the safety register
block is 64 KiB large, just like the non-safety register block.

Fixes: a6568d82091d279c ("dt-bindings: interrupt-controller: Document RZ/{T2H,N2H} ICU")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/interrupt-controller/renesas,r9a09g077-icu.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
index 78c01d14e765721b..a809bc4f75159c60 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
@@ -165,7 +165,7 @@ examples:
     icu: interrupt-controller@802a0000 {
       compatible = "renesas,r9a09g077-icu";
       reg = <0x802a0000 0x10000>,
-            <0x812a0000 0x50>;
+            <0x812a0000 0x10000>;
       #interrupt-cells = <2>;
       #address-cells = <0>;
       interrupt-controller;
-- 
2.43.0


