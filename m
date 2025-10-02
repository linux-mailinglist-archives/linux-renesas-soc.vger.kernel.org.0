Return-Path: <linux-renesas-soc+bounces-22588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 612B1BB4291
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A93B1C71F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF4C2C027F;
	Thu,  2 Oct 2025 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cjz2K0Nr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98712311C1F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759415212; cv=none; b=I/Jz3rALaqLwhtxvE58Dyqpkq3X5R//hPGpM8P/Mot8lsdrJZ7rZTyuD3rtQcAWNuO6+OxBPik3CFMZHLALfCcFMRW/3eq25QkvKEjxYn3mWiOVDPvBcjYuCxpKhJ5Y3jvm8ZW63J/VkXa3rGuWYhpeXKhNYXZMMZwAi/zttj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759415212; c=relaxed/simple;
	bh=KSZxk61Nw6d08b48cvYnYIxGwNHKkM8FCkULX1VqREg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXZounYg9Rz/eHG5c3MewTZtax7z7U8S7Sc2PUEo9OSTMxTeN3/565MdqCBPgIv4k5SZryrIpmXsJluRFqG4aOq2HptjYuXjtO2KvKqydHVFQ+wprKUUKpFXyDJAHK+pF8lJ9oRLfvXbbHK2eN7gFMHG1GCpJCX6AMabZLOjCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cjz2K0Nr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Kq2DhKQo8ptLIX
	roc27s3A+iNop2714/WUHopXrdZZI=; b=cjz2K0Nr2FCoG0OMRwodk9VwnIWnPV
	P6SiLaJ++JhWSVDFXX0TfIQLalwADdM8sKBMHnqamXIbrRDgAlAbcOAbnrL2GUdz
	2MXYT8LBkIYFjdMzHsd42VzzRnozb+9mYWbbVOBFPKkhI0ei9G2Ibo7M20G4lpd8
	I7U/yY/KfDFC74m8GI8V6d9fiCi+N0iZQqeB4CrVpPd6JJXP7j8uQCIUE+5ytMu4
	QHug3hBKATPoGbbjJaekpqZ3u+z6mUBrhqJdXrMgYsGYjAaoFlcpqiFla7tT1fz9
	DBy0o2o4S1QKzktiCv3M+cOmpdloIVFzhiBifvYcT838JiIL7IthgNzw==
Received: (qmail 302230 invoked from network); 2 Oct 2025 16:26:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 16:26:48 +0200
X-UD-Smtp-Session: l3s3148p1@iiN+xi1AGrogAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
Date: Thu,  2 Oct 2025 16:23:11 +0200
Message-ID: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
physmap: Add minimal Runtime PM support"), so support it also when used
in DT configurations.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested with a Renesas Genmai board (RZ/A1). Passes 'dt_binding_check'
and 'dtbs_check'. Supersedes my original approach "[RFC PATCH 0/4] ARM:
dts: renesas: mtd-rom has no clock and power domain":

https://lore.kernel.org/r/20250930101656.33435-6-wsa+renesas@sang-engineering.com

 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 1b375dee83b0..a9ec3ca002c7 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -69,6 +69,16 @@ properties:
     minItems: 1
     maxItems: 8
 
+  clocks:
+    description: |
+      Chips may need clocks to be enabled for themselves or for transparent
+      bridges.
+
+  power-domains:
+    description: |
+      Chips may need power domains to be enabled for themselves or for
+      transparent bridges.
+
   bank-width:
     description: Width (in bytes) of the bank.  Equal to the device width times
       the number of interleaved chips.
-- 
2.47.2


