Return-Path: <linux-renesas-soc+bounces-10784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AED9E0AF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 19:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56836B36D2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A923B12E7F;
	Mon,  2 Dec 2024 16:38:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94610126C13
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157500; cv=none; b=TR+E4GTaGS2DdyqmQ5ksXrqlDI2zujOUiuCeQj4fgMvotrpWXntkt0efDkUxlnsy7Fz5XNIvVKqKu3iZws3ZZT4UVkrBXEVbpKUX4YCUL1Xx3MMyEOnuZDaCVp2A5eeSuKdeVB/F++mDjqooEmq7hirhvzy8+f7NeQz56JAXS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157500; c=relaxed/simple;
	bh=Lez2g9uLCxAsVCIfMqm4W3OGs1nFWxwmVadcE8DZCh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gL8IGATsLKxWezIxQBrnmJqtt4IcPecNO06Y2R1JR8GkogE20Zhaapt13OE9vPUToXhiEiRj9SGGD292w01qz7aEHG1vcA2jInAL/B025zuptkZA+raF630TYR2/yQpaSnY9i+yGCXFlnwSOA2i+RPECAzjTtGSECc0by4gKdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Y28Qk37kMz4x6qX
	for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 17:30:22 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by albert.telenet-ops.be with cmsmtp
	id jsWE2D00d1yjZj406sWEyJ; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uE-Mt;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnS-Ke;
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
Subject: [PATCH 2/5] dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
Date: Mon,  2 Dec 2024 17:30:08 +0100
Message-Id: <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>
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

Document the compatible value for the Renesas R-Car V4H ES3.0
(R8A779G3) SoC, as used on the Renesas White Hawk Single board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index dab6667970325dcd..0f3fa341fd87924b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -366,11 +366,13 @@ properties:
           - const: renesas,white-hawk-cpu
           - const: renesas,r8a779g0
 
-      - description: R-Car V4H (R8A779G2)
+      - description: R-Car V4H (R8A779G[23])
         items:
           - enum:
-              - renesas,white-hawk-single # White Hawk Single board (RTP8A779G2ASKB0F10SA001)
-          - const: renesas,r8a779g2
+              - renesas,white-hawk-single # White Hawk Single board (RTP8A779G[23]ASKB0F10SA001)
+          - enum:
+              - renesas,r8a779g2
+              - renesas,r8a779g3
           - const: renesas,r8a779g0
 
       - description: R-Car V4M (R8A779H0)
-- 
2.34.1


