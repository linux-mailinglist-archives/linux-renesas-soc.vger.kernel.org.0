Return-Path: <linux-renesas-soc+bounces-3904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FE880139
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 923301C22988
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93310657C3;
	Tue, 19 Mar 2024 15:55:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0765657BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710863715; cv=none; b=LUFNJmBqRhU4G8nxLuSJ74P1neGmYN+U2KMMBwum39qndGNFwJIVZq6UTwzlme79genwRJWjDNrWUB2kyUzqH1V+44tgkNhY6Io9yGAX9EEwQI2oPlPvmU1+4XvecwNWCPxIrAHUBWPi0Nxuqu8Aie5ecCcDss6b6igWyub74iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710863715; c=relaxed/simple;
	bh=idyn9pxC0Yq94AhE8IsXjpuWnDxrKpAXO5lMswt/S9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSrbh/TVgKX+FKQvu6/mE0bIjKtMcYluJdSCx9xkqW8jcDQYQOz7MXMO2DCSUvB6j8U4YwxdK43rvhYbYoD/IlEc5aBYrgq1mLuspr6VPEAaXZBKqTJxIyr9aX80lY7bYJ0zaXPCSKW1rCVNq3OVvX2zBPhixpl4eytPyfwUz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Tzbfx2KwFz4wxrs
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:46:17 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 0fm82C00H0SSLxL01fm8mn; Tue, 19 Mar 2024 16:46:10 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmbev-00468o-GC;
	Tue, 19 Mar 2024 16:46:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmbfE-000pFd-Dd;
	Tue, 19 Mar 2024 16:46:08 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support
Date: Tue, 19 Mar 2024 16:46:05 +0100
Message-Id: <dd77275fef23ef3dc335a43ffa9aeca0ff7c41c6.1710862701.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710862701.git.geert+renesas@glider.be>
References: <cover.1710862701.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Timer Unit (TMU) on R-Car Gen2 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index 7670ec74eabdf4c3..50b5225ceb10b64c 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -34,6 +34,11 @@ properties:
           - renesas,tmu-r8a774e1 # RZ/G2H
           - renesas,tmu-r8a7778  # R-Car M1A
           - renesas,tmu-r8a7779  # R-Car H1
+          - renesas,tmu-r8a7790  # R-Car H2
+          - renesas,tmu-r8a7791  # R-Car M2-W
+          - renesas,tmu-r8a7792  # R-Car V2H
+          - renesas,tmu-r8a7793  # R-Car M2-N
+          - renesas,tmu-r8a7794  # R-Car E2
           - renesas,tmu-r8a7795  # R-Car H3
           - renesas,tmu-r8a7796  # R-Car M3-W
           - renesas,tmu-r8a77961 # R-Car M3-W+
-- 
2.34.1


