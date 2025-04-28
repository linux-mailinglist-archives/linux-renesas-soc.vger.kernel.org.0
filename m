Return-Path: <linux-renesas-soc+bounces-16413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B625CA9F300
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C55F1A8360C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E807626A0B7;
	Mon, 28 Apr 2025 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hAWdxv54";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UJbPZw/E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3F26C3A7;
	Mon, 28 Apr 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745848769; cv=none; b=NenJ0ykOD8deUUaf+G8iOMNiPlrbRU9HyOsD0QKi8nnVfakePNL2sfiEvNL/N8Icclt/6vMoep3SH8kJq9v2ZHFTzojVg6Rfit6VHCqKF1Je127ESskX6ByWcxv8UI6L4l8FgWyzUAzVvQx5p1YtSC8TKv/oukHAP/CMjZSgNrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745848769; c=relaxed/simple;
	bh=Bj+QlsNEcLPsV28ssPYh/TsN21FF8vVG981eLOGY/Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BLVeVONRmT2ovoLkcJQvlW9wVpyCnUafEMdww5VH6Mx/2eevGO6ENFITJAKit6mXSl2OqP4/9APeD3GyirHZaNfBdPOgMwI3UcpBey0eGpy4jUwEjBFzJvNgKynR+MeOQ41HOx/RYvbckXYPDmj8M+k5EiTJPiacTK+7EsR9Igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hAWdxv54; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UJbPZw/E reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745848766; x=1777384766;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WKpFz0sFR5mCvXUjLxoDEJGO4+bSqpZN4lZyQeOmWkQ=;
  b=hAWdxv54aF/AyNfu/5thP/kioGmIFK2YVnQzXq9JwpdCqGSriS02dKJ7
   aJ8k3zWrWbVmfhYH5TpD5Ut+w2KzMKtw3rgocCvFR/MptyaiMlBGRZvlL
   ZzpfX6YOjEKzmw7UTif9VncyPkMWUbCP/jI896Q4CXLNI7T0W+2kKQdcw
   dGvMTjpxRCAXod6vlEd5P4DnSiiBJSOTcCvimLZOt0UCNnLmN+GL+MdOZ
   X/f5xg09AQeawPiY3ZEs6zE6jkNn91/gEj/dMzQgxl18rbvXCVUWM5vhW
   njulTqBPail+oPbk/vqQYKHMnMH3gKiRsSewFi6h9RiJA72YJ3Ob5h5Vn
   A==;
X-CSE-ConnectionGUID: 9CeSALBcSamhBdAtN/0Uaw==
X-CSE-MsgGUID: 1lcsG385T/uI+2rHjKtZmg==
X-IronPort-AV: E=Sophos;i="6.15,246,1739833200"; 
   d="scan'208";a="43759129"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Apr 2025 15:59:23 +0200
X-CheckPoint: {680F89BA-26-2417938-F0170C2B}
X-MAIL-CPID: ED23F6D0B04F11E4999A0A2C1B96DE42_2
X-Control-Analysis: str=0001.0A006396.680F89B9.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A111615E0;
	Mon, 28 Apr 2025 15:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745848758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WKpFz0sFR5mCvXUjLxoDEJGO4+bSqpZN4lZyQeOmWkQ=;
	b=UJbPZw/EeB14ZfS1ldzTzTFLeJF7p0m/+I5DS+PogBIKzwX9ySrbfmPO+qon4qkcnVWAGX
	d5zGmfOae2tq9xt2KCQmHm5I9Qoxb7zIKkTe/ezD7vjz9V6Gjk+Qi3VDffo8eQuV3KLGHC
	bhw3Evp1LuwWkZKuEFRU/rHOubaZ8mOx3C/cYljCbrtURicoUXkYt/xc6oU0TtU+9kdaqm
	R/m2Glz1ARWF80VyorozyfBCTwm+o3cDpB4vq9priXL0Uhxl5eoZApV7oKH2+sCwOKJoJ0
	mhTQfy7fcBiEFha0afAjdTkBZZ7Si9Nrj9oB0hIS/eNHJKi6NIxF8vEjnf5Tdg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Date: Mon, 28 Apr 2025 15:59:08 +0200
Message-ID: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 447054b52ea39..a6cf65e10d43f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1419,6 +1419,16 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
+          It has the SMARC form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        items:
+          - enum:
+              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM on MB-SMARC-2
+          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM
+          - const: fsl,imx95
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.43.0


