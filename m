Return-Path: <linux-renesas-soc+bounces-10783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35219E08C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 17:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761E9280DB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B0A19D088;
	Mon,  2 Dec 2024 16:38:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D13C6BA
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157499; cv=none; b=g0lR7YiWiXCaaDyCBzvvXeQhrBDWUZvDHK8qsj7HrrJRyT4QTgezg5BlQRWR4XynLgEow3LQq+owzVF7ltw7Ghg9mTX94MEGp/4/jTlH3GGoLIcEsRhJCEhoJGBq3rGvo9Hws87OWEq4vSkXzL8teTRj+39WqJlPP3yIa6SSOSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157499; c=relaxed/simple;
	bh=8hQjpiRxrY2RwgnJAWl8oZ7Q5rlWydofxkcc7yQXHSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f53jTK+GY/M8ucCFIUfV2G/qSaMBLr2fDglkqwhhaFaC23U3WwMvy9kxALBMUQIOmUcBT0FT7FuKjuGIvhAJJYXhQTVEqlZxHYkl2FOajM04KM4t/BIBVI80AdBBYRIQY+hX6SNjfx+1PwKgYUr1HFSZ0OnpbZSwDxcixmv+PTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Y28Qm3B6hz4x4qw
	for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 17:30:24 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by laurent.telenet-ops.be with cmsmtp
	id jsWE2D00j1yjZj401sWEem; Mon, 02 Dec 2024 17:30:16 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uA-Ls;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnO-JV;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
Date: Mon,  2 Dec 2024 17:30:07 +0100
Message-Id: <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the R8A779G0-only White Hawk board stack section up, just below the
R8A779G0-only White Hawk CPU section, to improve sort order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd2a38..dab6667970325dcd 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -360,6 +360,12 @@ properties:
               - renesas,white-hawk-cpu # White Hawk CPU board (RTP8A779G0ASKB0FC0SA000)
           - const: renesas,r8a779g0
 
+      - items:
+          - enum:
+              - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
+          - const: renesas,white-hawk-cpu
+          - const: renesas,r8a779g0
+
       - description: R-Car V4H (R8A779G2)
         items:
           - enum:
@@ -367,12 +373,6 @@ properties:
           - const: renesas,r8a779g2
           - const: renesas,r8a779g0
 
-      - items:
-          - enum:
-              - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
-          - const: renesas,white-hawk-cpu
-          - const: renesas,r8a779g0
-
       - description: R-Car V4M (R8A779H0)
         items:
           - enum:
-- 
2.34.1


